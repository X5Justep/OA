import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.naming.NamingException;

import org.antlr.analysis.SemanticContext.AND;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;

import com.justep.model.ModelUtils;
import com.justep.system.action.ActionUtils;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.data.TableUtils;

/**
 * 
 * @author Administrator
 * @build 2010.11.23测试通过 测试数据 查询2010.11.16数据
 * 
 */
public class StaffState {
	enum Week {
		monday, tuesday, wednesday, thursday, friday, saturday, sunday
	};

	enum State {
		evec, leave, inBjschedule, outBjschedule
	};

	private static final String seperate = "_justep_";
	private static final String seperate1 = "_lt_";

	public static Document query(String begin, String end, String searchPersonName, String searchOrgName) {
		try {
			Connection conn = ActionUtils.getRequestContext().getTransaction().getConnection(ModelUtils.getModel(("/OA")));
			String strDatabaseType = conn.getMetaData().getDatabaseProductName();
			System.out.println("strDatabaseType="+strDatabaseType);
			if (strDatabaseType.equalsIgnoreCase("Oracle")) {
				return queryOracle(conn, begin, end, searchPersonName, searchOrgName);
			} else if (strDatabaseType.equalsIgnoreCase("Microsoft SQL Server")) {
				return querySQLServer(conn, begin, end, searchPersonName, searchOrgName);
			}else if (strDatabaseType.equalsIgnoreCase("MySQL")) {
				return queryMySQLServer(conn, begin, end, searchPersonName, searchOrgName);
			}

		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static Document querySQLServer(Connection pp, String begin, String end, String searchPersonName, String searchOrgName) {
		Date dateBegin = new Date(begin);
		Date dateEnd = new Date(end);
		begin = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(dateBegin);

		end = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(dateEnd);

		//	System.out.println(begin + "------" + end);

		Calendar cal = Calendar.getInstance();
		Map<Week, Date> weekMap = new HashMap<Week, Date>();
		cal.setTime(dateBegin);

		for (Week w : Week.values()) {
			cal.add(Calendar.DAY_OF_MONTH, 1);
			weekMap.put(w, cal.getTime());
		}

		// 查询人员信息
		String personInfo = "select sid,sName,ssequence,sMainOrgFID,sMainOrgFName,sMainSequence from v_sa_opperson where sValidState= 1 and sMainOrgID in (select sID from v_sa_oporg where sValidState = 1)";

		// 查询出差申请信息
		String evecApplyInfo = "select e.fPersonID,m.fPERSONNEL,m.fFACTSTARTTIME as fSTARTTIME,m.fFACTENDTIME as fENDTIME,m.fREASON from OA_WM_OtherApply m,OA_WM_eveMember e where m.fid=e.fmasterid and (m.fFACTSTARTTIME <= '" + end
				+ "'  and  m.fFACTENDTIME >= '" + begin + "') and m.ftype ='出差申请' and m.FBIZSTATE='bsFinished'";
		// 查询请假申请信息
		String queryLeaveInfo = "select fApplyPersonID,fApplyPersonName," + "fFACTSTARTTIME as fStartTime,fFACTENDTIME as fEndTime, " + "fLeaveReason"
				+ " from OA_WM_LeaveApply where fFACTSTARTTIME <= '" + end + "' and fFACTENDTIME >= '" + begin + "' and FBIZSTATE='bsFinished'";
		// 查询日程记录信息
		String queryScheduleInfo = "select t.fEXECUTORID,t.fEXECUTORName,s.FBEGINTIME,s.FENDTIME,s.fIsOutSide,t.fRemark,s.fContent from OA_SD_Executor t join OA_SD_Schedule s on t.fMasterID  =  s.FID where s.FBEGINTIME <='"
				+ end + "' and s.FENDTIME >='" + begin + "'";

		// 根据机构过滤人员
		if (!(searchOrgName.equals("undefined")) && (searchOrgName != null) && (searchOrgName != "")) {
			personInfo = personInfo + " and sMainOrgFName like '%" + searchOrgName + "%'";
		}
		personInfo = personInfo + " order by sMainSequence ";

		Connection personConn = pp;
		Statement personStat = null;
		ResultSet personRs = null;

		Connection conn = pp;
		Statement evecStat = null;
		Statement leaveStat = null;
		Statement scheduleStat = null;

		ResultSet evecRs = null;
		ResultSet leaveRs = null;
		ResultSet scheduleRs = null;

		/**
		 * 最外层map key 人员名称 value 是个map ： 这个map的key 是星期几 value是个map 这个map的key
		 * 是外出的状态 value是是由
		 * 
		 */

		/*
		 * Map<String, Map<Week, Map<State, String>>> personStateMap = new
		 * HashMap<String, Map<Week, Map<State, String>>>();
		 * 
		 * Map<String, String> personSequenceMap = new HashMap<String,
		 * String>(); Map<String, String> personRecNOMap = new HashMap<String,
		 * String>(); Map<String, String> personURLMap = new HashMap<String,
		 * String>();
		 */

		StaffStateUtil ssu = StaffStateUtil.getStaffStateUtil();
		Map<Week, Map<State, String>> signelStateMap;
		String personID = "";
		try {
			// 查询人员信息
			personStat = personConn.createStatement();
			//System.out.println("人员信息:" + personInfo);
			personRs = personStat.executeQuery(personInfo);

			// 根据存在的人员构造空内容的不规则数据结构
			int rec = 0;

			while (personRs.next()) {
				String personName = personRs.getString("sName");
				personID = personRs.getString("sid");
				if (!personName.toUpperCase().equals("SYSTEM")) {
					String sequence = personRs.getString("sMainSequence");
					if (sequence == null || sequence.equals("")) {
						sequence = "0";
					}
					rec += 1;

					String mainOrgFName = personRs.getString("sMainOrgFName");
					if (mainOrgFName != null && !"".equals(mainOrgFName)) {
						mainOrgFName = mainOrgFName.substring(mainOrgFName.indexOf("/")+1, mainOrgFName.length());
					}
					if (mainOrgFName == null) {
						mainOrgFName = "";
					}

					signelStateMap = new HashMap<Week, Map<State, String>>();
					for (Week w : Week.values()) {

						Map<State, String> stateMap = new HashMap<State, String>();

						for (State s : State.values()) {
							stateMap.put(s, "");
						}
						signelStateMap.put(w, stateMap);
					}
					ssu.addItem(personName, mainOrgFName, sequence, signelStateMap, personID);
				}
			}
			// 查询人员的状态信息
;
			// 出差数据填充
			evecStat = conn.createStatement();
			//System.out.println("出差信息：" + evecApplyInfo);
			evecRs = evecStat.executeQuery(evecApplyInfo);

			while (evecRs.next()) {
				String personName = evecRs.getString("fPERSONNEL");
				Date fSTARTTIME = evecRs.getDate("fSTARTTIME");
				Date fENDTIME = evecRs.getDate("fENDTIME");
				String fREASON = evecRs.getString("fREASON");
				personID = evecRs.getString("fPersonID");
				if (personID != null && (!"".equals(personID))) {
					String[] personList = personID.split(",");
					String itemName = "";
					for (int i = 0; i < personList.length; i++) {
						itemName = personList[i].trim();

						Date lastDay = dateBegin;
						for (Week w : Week.values()) {
							if (!((fENDTIME.compareTo(lastDay) < 0) || (fSTARTTIME.compareTo(weekMap.get(w)) >= 0))) {
								// 去掉已经删除的人员的信息
								signelStateMap = (Map<Week, Map<State, String>>) ssu.getDataMap(itemName);
								if (signelStateMap != null && signelStateMap.get(w) != null) {
									if (fREASON == null) {
										fREASON = "没有填写原因";
									}
									signelStateMap.get(w).put(State.evec, "(" + fSTARTTIME + "至" + fENDTIME + ")" + seperate1 + fREASON);
								}

							}
							lastDay = weekMap.get(w);
						}
					}

				}
			}
			// 请假数据填充
			leaveStat = conn.createStatement();
			leaveRs = leaveStat.executeQuery(queryLeaveInfo);
			//System.out.println("请假信息：" + queryLeaveInfo);
			while (leaveRs.next()) {

				String personName = leaveRs.getString("fApplyPersonName");
				Date fSTARTTIME = leaveRs.getDate("fStartTime");
				Date fENDTIME = leaveRs.getDate("fEndTime");
				String fREASON = leaveRs.getString("fLeaveReason");
				personID = leaveRs.getString("fApplyPersonID");
				Date lastDay = dateBegin;

				for (Week w : Week.values()) {
					if (!((fENDTIME.compareTo(lastDay) < 0) || (fSTARTTIME.compareTo(weekMap.get(w)) >= 0))) {
						signelStateMap = (Map<Week, Map<State, String>>) ssu.getDataMap(personID);
						if (signelStateMap != null && signelStateMap.get(w) != null) {
							if (fREASON == null) {
								fREASON = "没有填写原因";
							}
							signelStateMap.get(w).put(State.leave, "(" + fSTARTTIME + "至" + fENDTIME + ")" + seperate1 + fREASON);

						}
					}
					lastDay = weekMap.get(w);
				}

			}
			// 日程数据填充

			scheduleStat = conn.createStatement();
			scheduleRs = scheduleStat.executeQuery(queryScheduleInfo);
			//System.out.print("日程数据：" + queryScheduleInfo);
			while (scheduleRs.next()) {
				String personName = scheduleRs.getString("fEXECUTORName");
				Date fSTARTTIME = scheduleRs.getDate("FBEGINTIME");
				Date fENDTIME = scheduleRs.getDate("FENDTIME");
				String fIsOutSide = scheduleRs.getString("fIsOutSide");
				String fREASON = scheduleRs.getString("fContent");
				personID = scheduleRs.getString("fEXECUTORID");
				if (personID != null && (!"".equals(personID))) {
					String[] personList = personID.split(",");
					String itemName = "";
					for (int i = 0; i < personList.length; i++) {

						itemName = personList[i].trim();
						Date lastDay = dateBegin;
						for (Week w : Week.values()) {
							if (!((fENDTIME.compareTo(lastDay) < 0) || (fSTARTTIME.compareTo(weekMap.get(w)) >= 0))) {
								// 去掉已经删除的人员的信息
								signelStateMap = (Map<Week, Map<State, String>>) ssu.getDataMap(itemName);
								if (signelStateMap != null && signelStateMap.get(w) != null) {
									if (fREASON == null) {
										fREASON = "没有填写原因";
									}
									String temp = signelStateMap.get(w).get(("是").equals(fIsOutSide) ? State.outBjschedule : State.inBjschedule);
									if (temp != null && (!"".equals(temp))) {
										signelStateMap.get(w).put(("是").equals(fIsOutSide) ? State.outBjschedule : State.inBjschedule,
												temp + ";" + fREASON);
									} else {
										signelStateMap.get(w).put(("是").equals(fIsOutSide) ? State.outBjschedule : State.inBjschedule,
												"(" + fSTARTTIME + "至" + fENDTIME + ")" + seperate1 + fREASON);
									}

								}

							}
							lastDay = weekMap.get(w);
						}
					}

				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (personRs != null) {
					personRs.close();
				}
				if (personStat != null) {
					personStat.close();
				}
				if (personConn != null) {
					personConn.close();
				}
				if (evecRs != null) {
					evecRs.close();
				}
				if (leaveRs != null) {
					leaveRs.close();
				}
				if (scheduleRs != null) {
					scheduleRs.close();
				}
				if (evecStat != null) {
					evecStat.close();
				}
				if (leaveStat != null) {
					leaveStat.close();
				}
				if (scheduleStat != null) {
					scheduleStat.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		// 序列化数据成xml发送给UIServer
		// Map<String,Map<Week,Map<State,String>>> personStateMap=new
		// HashMap<String,Map<Week,Map<State,String>>>();

		StringBuilder sb = new StringBuilder("<?xml version=\"1.0\"?><rows");
		String title = "排序,组织路径,姓名,";
		//String title = "组织路径,姓名,";
		Calendar call = Calendar.getInstance();
		call.setTime(dateBegin);
		for (int j = 0; j < 7; j++) {

			int i = call.get(java.util.Calendar.DAY_OF_WEEK) - 1 + j;
			if (i >= 7) {
				i -= 7;
			}
			switch (i) {
			case 0:
				title += "星期日,";
				break;
			case 1:
				title += "星期一,";
				break;

			case 2:
				title += "星期二,";
				break;
			case 3:
				title += "星期三,";
				break;
			case 4:
				title += "星期四,";
				break;

			case 5:
				title += "星期五,";
				break;
			case 6:
				title += "星期六,";
				break;
			}
		}
		sb.append(" title='" + title + "'>");
		ArrayList ar = ssu.getIndexList();

		String personName = "";
		String tSequence = "";
		String tOrgName = "";

		for (int i = 0; i < ar.size(); i++) {
			// TODO 人员过滤
			personName = (String) ((ArrayList) ar.get(i)).get(0);
			tSequence = (String) ((ArrayList) ar.get(i)).get(2);
			tOrgName = (String) ((ArrayList) ar.get(i)).get(1);
			signelStateMap = (Map<Week, Map<State, String>>) ((ArrayList) ar.get(i)).get(3);

			if (!(searchPersonName.equals("undefined")) && (searchPersonName != null) && (searchPersonName != "")) {
				if (!personName.equals(searchPersonName.toString().trim()))
					continue;
			}
			//sb.append("<row><cell>" + (i + 1) + "</cell><cell>" + tSequence + "</cell><cell>" + tOrgName + "</cell><cell>" + personName + "</cell>");
			sb.append("<row><cell>" + (i + 1) + "</cell><cell>" + tOrgName + "</cell><cell>" + personName + "</cell>");
			for (Week w : Week.values()) {
				sb.append("<cell>");
				Map<State, String> stateMap = signelStateMap.get(w);

				for (State s : State.values()) {
					// 分割操作符号_justep_
					if (stateMap.get(s) == null) {
					} else if (!stateMap.get(s).equals("")) {
						if (s.equals(State.evec)) {
							sb.append("出差");
							sb.append("|" + stateMap.get(s) + seperate);
						} else if (s.equals(State.leave)) {
							sb.append("请假");
							sb.append("|" + stateMap.get(s) + seperate);
						} else if (s.equals(State.inBjschedule)) {
							sb.append("京内");
							sb.append("|" + stateMap.get(s) + seperate);
						} else if (s.equals(State.outBjschedule)) {
							sb.append("京外");
							sb.append("|" + stateMap.get(s) + seperate);
						}
					}
				}
				sb.append("</cell>");
			}
			sb.append("</row>");
		}

		sb.append("</rows>");
		Document doc = null;
		try {
			doc = DocumentHelper.parseText(sb.toString());
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		System.out.println("doc="+doc.asXML());
		return doc;
	}

	public static Document queryOracle(Connection pp, String begin, String end, String searchPersonName, String searchOrgName) {
		Date dateBegin = new Date(begin);
		Date dateEnd = new Date(end);
		begin = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(dateBegin);

		end = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(dateEnd);

		Calendar cal = Calendar.getInstance();
		Map<Week, Date> weekMap = new HashMap<Week, Date>();
		cal.setTime(dateBegin);

		for (Week w : Week.values()) {
			cal.add(Calendar.DAY_OF_MONTH, 1);
			weekMap.put(w, cal.getTime());
		}

		// 查询人员信息
		String personInfo = "select sid,sName,ssequence,sMainOrgFID,sMainOrgFName,sMainSequence from v_sa_opperson where sValidState= 1 and sMainOrgID in (select sID from v_sa_oporg where sValidState = 1)";

		// 查询出差申请信息
		String evecApplyInfo = "select e.fPersonID,m.fPERSONNEL,m.fFACTSTARTTIME as fSTARTTIME,m.fFACTENDTIME as fENDTIME,m.fREASON from OA_WM_OtherApply  m,OA_WM_eveMember e where m.fid=e.fmasterid and m.fFACTSTARTTIME <= " + "TO_DATE('"
				+ end + "','YYYY-MM-DD HH24:mi:ss') " + " and  m.fFACTENDTIME >= " + "TO_DATE('" + begin + "','YYYY-MM-DD HH24:mi:ss') "
				+ " and m.ftype ='出差申请' and m.FBIZSTATE='bsFinished'";
		// 查询请假申请信息
		String queryLeaveInfo = "select fApplyPersonID,fApplyPersonName," + "fFACTSTARTTIME fStartTime,fFACTENDTIME fEndTime, " + "fLeaveReason"
				+ " from OA_WM_LeaveApply where fFACTSTARTTIME <= " + "TO_DATE('" + end + "','YYYY-MM-DD HH24:mi:ss') " + " and fFACTENDTIME >= "
				+ "TO_DATE('" + begin + "','YYYY-MM-DD HH24:mi:ss') " + " and FBIZSTATE='bsFinished'";
		// 查询日程记录信息
		String queryScheduleInfo = "select t.fEXECUTORID,t.fEXECUTORName,s.FBEGINTIME,s.FENDTIME,s.fIsOutSide,t.fRemark,s.fContent from OA_SD_Executor t join OA_SD_Schedule s on t.fMasterID  =  s.FID where s.FBEGINTIME <="
				+ "TO_DATE('" + end + "','YYYY-MM-DD HH24:mi:ss') " + " and s.FENDTIME >=" + "TO_DATE('" + begin + "','YYYY-MM-DD HH24:mi:ss') " + "";

		// 根据机构过滤人员
		if (!(searchOrgName.equals("undefined")) && (searchOrgName != null) && (searchOrgName != "")) {
			personInfo = personInfo + " and sMainOrgFName like '%" + searchOrgName + "%'";
		}
		personInfo = personInfo + " order by sMainSequence ";

		Connection personConn = pp;
		Statement personStat = null;
		ResultSet personRs = null;

		Connection conn = pp;
		Statement evecStat = null;
		Statement leaveStat = null;
		Statement scheduleStat = null;

		ResultSet evecRs = null;
		ResultSet leaveRs = null;
		ResultSet scheduleRs = null;

		/**
		 * 最外层map key 人员名称 value 是个map ： 这个map的key 是星期几 value是个map 这个map的key
		 * 是外出的状态 value是是由
		 * 
		 */


		StaffStateUtil ssu = StaffStateUtil.getStaffStateUtil();
		Map<Week, Map<State, String>> signelStateMap;
		String personID = "";
		try {
			// 查询人员信息
			personStat = personConn.createStatement();
			//System.out.println("人员信息:" + personInfo);
			personRs = personStat.executeQuery(personInfo);

			// 根据存在的人员构造空内容的不规则数据结构
			int rec = 0;

			while (personRs.next()) {
				String personName = personRs.getString("sName");
				personID = personRs.getString("sid");
					String sequence = personRs.getString("sMainSequence");
					if (sequence == null || sequence.equals("")) {
						sequence = "0";
					}
					rec += 1;

					String mainOrgFName = personRs.getString("sMainOrgFName");
					if (mainOrgFName != null && !"".equals(mainOrgFName)) {
						mainOrgFName = mainOrgFName.substring(mainOrgFName.indexOf("/")+1, mainOrgFName.length());
					}
					if (mainOrgFName == null) {
						mainOrgFName = "";
					}

					signelStateMap = new HashMap<Week, Map<State, String>>();
					for (Week w : Week.values()) {

						Map<State, String> stateMap = new HashMap<State, String>();

						for (State s : State.values()) {
							stateMap.put(s, "");
						}
						signelStateMap.put(w, stateMap);
					}
					ssu.addItem(personName, mainOrgFName, sequence, signelStateMap, personID);

			}
			// 查询人员的状态信息
			
			// 出差数据填充
			evecStat = conn.createStatement();
			//System.out.println("出差信息：" + evecApplyInfo);
			evecRs = evecStat.executeQuery(evecApplyInfo);

			while (evecRs.next()) {
				String personName = evecRs.getString("fPERSONNEL");
				Date fSTARTTIME = evecRs.getDate("fSTARTTIME");
				Date fENDTIME = evecRs.getDate("fENDTIME");
				String fREASON = evecRs.getString("fREASON");
				personID = evecRs.getString("fPersonID");
				if (personID != null && (!"".equals(personID))) {
					String[] personList = personID.split(",");
					String itemName = "";
					for (int i = 0; i < personList.length; i++) {
						itemName = personList[i].trim();

						Date lastDay = dateBegin;
						for (Week w : Week.values()) {
							if (!((fENDTIME.compareTo(lastDay) < 0) || (fSTARTTIME.compareTo(weekMap.get(w)) >= 0))) {
								// 去掉已经删除的人员的信息
								signelStateMap = (Map<Week, Map<State, String>>) ssu.getDataMap(itemName);
								if (signelStateMap != null && signelStateMap.get(w) != null) {
									if (fREASON == null) {
										fREASON = "没有填写原因";
									}
									signelStateMap.get(w).put(State.evec, "(" + fSTARTTIME + "至" + fENDTIME + ")" + seperate1 + fREASON);
								}

							}
							lastDay = weekMap.get(w);
						}
					}

				}
			}
			// 请假数据填充
			leaveStat = conn.createStatement();
			leaveRs = leaveStat.executeQuery(queryLeaveInfo);
			//System.out.println("请假信息：" + queryLeaveInfo);
			while (leaveRs.next()) {
				String personName = leaveRs.getString("fApplyPersonName");
				Date fSTARTTIME = leaveRs.getDate("fStartTime");
				Date fENDTIME = leaveRs.getDate("fEndTime");
				String fREASON = leaveRs.getString("fLeaveReason");
				personID = leaveRs.getString("fApplyPersonID");
				Date lastDay = dateBegin;

				for (Week w : Week.values()) {
					if (!((fENDTIME.compareTo(lastDay) < 0) || (fSTARTTIME.compareTo(weekMap.get(w)) >= 0))) {
						signelStateMap = (Map<Week, Map<State, String>>) ssu.getDataMap(personID);
						if (signelStateMap != null && signelStateMap.get(w) != null) {
							if (fREASON == null) {
								fREASON = "没有填写原因";
							}
							signelStateMap.get(w).put(State.leave, "(" + fSTARTTIME + "至" + fENDTIME + ")" + seperate1 + fREASON);

						}
					}
					lastDay = weekMap.get(w);
				}

			}
			// 日程数据填充

			scheduleStat = conn.createStatement();
			//System.out.println("日程数据：" + queryScheduleInfo);
			scheduleRs = scheduleStat.executeQuery(queryScheduleInfo);

			while (scheduleRs.next()) {
				String personName = scheduleRs.getString("fEXECUTORName");
				Date fSTARTTIME = scheduleRs.getDate("FBEGINTIME");
				Date fENDTIME = scheduleRs.getDate("FENDTIME");
				String fIsOutSide = scheduleRs.getString("fIsOutSide");
				String fREASON = scheduleRs.getString("fContent");
				personID = scheduleRs.getString("fEXECUTORID");
				/**
				 * 
				 */
				if (personID != null && (!"".equals(personID))) {
					String[] personList = personID.split(",");
					String itemName = "";
					for (int i = 0; i < personList.length; i++) {

						itemName = personList[i].trim();
						Date lastDay = dateBegin;
						for (Week w : Week.values()) {
							if (!((fENDTIME.compareTo(lastDay) < 0) || (fSTARTTIME.compareTo(weekMap.get(w)) >= 0))) {
								// 去掉已经删除的人员的信息
								signelStateMap = (Map<Week, Map<State, String>>) ssu.getDataMap(itemName);
								if (signelStateMap != null && signelStateMap.get(w) != null) {
									if (fREASON == null) {
										fREASON = "没有填写原因";
									}
									String temp = signelStateMap.get(w).get(("是").equals(fIsOutSide) ? State.outBjschedule : State.inBjschedule);
									if (temp != null && (!"".equals(temp))) {
										signelStateMap.get(w).put(("是").equals(fIsOutSide) ? State.outBjschedule : State.inBjschedule,
												temp + ";" + fREASON);
									} else {
										signelStateMap.get(w).put(("是").equals(fIsOutSide) ? State.outBjschedule : State.inBjschedule,
												"(" + fSTARTTIME + "至" + fENDTIME + ")" + seperate1 + fREASON);
									}

								}

							}
							lastDay = weekMap.get(w);
						}
					}

				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (personRs != null) {
					personRs.close();
				}
				if (personStat != null) {
					personStat.close();
				}
				if (personConn != null) {
					personConn.close();
				}
				if (evecRs != null) {
					evecRs.close();
				}
				if (leaveRs != null) {
					leaveRs.close();
				}
				if (scheduleRs != null) {
					scheduleRs.close();
				}
				if (evecStat != null) {
					evecStat.close();
				}
				if (leaveStat != null) {
					leaveStat.close();
				}
				if (scheduleStat != null) {
					scheduleStat.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		// 序列化数据成xml发送给UIServer
		// Map<String,Map<Week,Map<State,String>>> personStateMap=new
		// HashMap<String,Map<Week,Map<State,String>>>();

		StringBuilder sb = new StringBuilder("<?xml version=\"1.0\"?><rows");
		String title = "排序,组织路径,姓名,";

		Calendar call = Calendar.getInstance();
		call.setTime(dateBegin);
		for (int j = 0; j < 7; j++) {

			int i = call.get(java.util.Calendar.DAY_OF_WEEK) - 1 + j;
			if (i >= 7) {
				i -= 7;
			}
			switch (i) {
			case 0:
				title += "星期日,";
				break;
			case 1:
				title += "星期一,";
				break;

			case 2:
				title += "星期二,";
				break;
			case 3:
				title += "星期三,";
				break;
			case 4:
				title += "星期四,";
				break;

			case 5:
				title += "星期五,";
				break;
			case 6:
				title += "星期六,";
				break;
			}
		}
		sb.append(" title='" + title + "'>");
		ArrayList ar = ssu.getIndexList();

		String personName = "";
		String tSequence = "";
		String tOrgName = "";

		for (int i = 0; i < ar.size(); i++) {
			// TODO 人员过滤
			personName = (String) ((ArrayList) ar.get(i)).get(0);
			tSequence = (String) ((ArrayList) ar.get(i)).get(2);
			tOrgName = (String) ((ArrayList) ar.get(i)).get(1);
			signelStateMap = (Map<Week, Map<State, String>>) ((ArrayList) ar.get(i)).get(3);
			if (!(searchPersonName.equals("undefined")) && (searchPersonName != null) && (searchPersonName != "")) {
				if (!personName.equals(searchPersonName.toString().trim()))
					continue;
			}
			//sb.append("<row><cell>" + (i + 1) + "</cell><cell>" + tSequence + "</cell><cell>" + tOrgName + "</cell><cell>" + personName + "</cell>");
			sb.append("<row><cell>" + (i + 1) + "</cell><cell>" + tOrgName + "</cell><cell>" + personName + "</cell>");
			for (Week w : Week.values()) {
				sb.append("<cell>");
				Map<State, String> stateMap = signelStateMap.get(w);

				for (State s : State.values()) {
					// 分割操作符号_justep_
					if (stateMap.get(s) == null) {
					} else if (!stateMap.get(s).equals("")) {
						if (s.equals(State.evec)) {
							sb.append("出差");
							sb.append("|" + stateMap.get(s) + seperate);
						} else if (s.equals(State.leave)) {
							sb.append("请假");
							sb.append("|" + stateMap.get(s) + seperate);
						} else if (s.equals(State.inBjschedule)) {
							sb.append("京内");
							sb.append("|" + stateMap.get(s) + seperate);
						} else if (s.equals(State.outBjschedule)) {
							sb.append("京外");
							sb.append("|" + stateMap.get(s) + seperate);
						}
					}
				}
				sb.append("</cell>");
			}
			sb.append("</row>");
		}

		sb.append("</rows>");
		Document doc = null;
		try {
			doc = DocumentHelper.parseText(sb.toString());
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		//System.out.println("doc:" + doc.asXML());
		return doc;
	}
	public static Document queryMySQLServer(Connection pp, String begin, String end, String searchPersonName, String searchOrgName) {
		Date dateBegin = new Date(begin);
		Date dateEnd = new Date(end);
		begin = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(dateBegin);
		
		end = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(dateEnd);

		Calendar cal = Calendar.getInstance();
		Map<Week, Date> weekMap = new HashMap<Week, Date>();
		cal.setTime(dateBegin);
		
		for (Week w : Week.values()) {
			cal.add(Calendar.DAY_OF_MONTH, 1);
			weekMap.put(w, cal.getTime());
		}
		
		// 查询人员信息
		String personInfo = "select sid,sName,ssequence,sMainOrgFID,sMainOrgFName,sMainSequence from v_sa_opperson where sValidState= 1 and sMainOrgID in (select sID from v_sa_oporg where sValidState = 1)";
		
		// 查询出差申请信息
		String evecApplyInfo = "select e.fPersonID,m.fPERSONNEL,m.fFACTSTARTTIME as fSTARTTIME,m.fFACTENDTIME as fENDTIME,m.fREASON from OA_WM_OtherApply  m,OA_WM_eveMember e where m.fid=e.fmasterid and m.fFACTSTARTTIME <= " + "str_to_date('"
		+ end + "','%Y-%m-%d %T') " + " and  m.fFACTENDTIME >= " + "str_to_date('" + begin + "','%Y-%m-%d %T') "
		+ " and m.ftype ='出差申请' and m.FBIZSTATE='bsFinished'";
		// 查询请假申请信息
		String queryLeaveInfo = "select fApplyPersonID,fApplyPersonName," + "fFACTSTARTTIME fStartTime,fFACTENDTIME fEndTime, " + "fLeaveReason"
		+ " from OA_WM_LeaveApply where fFACTSTARTTIME <= " + "str_to_date('" + end + "','%Y-%m-%d %T') " + " and fFACTENDTIME >= "
		+ "str_to_date('" + begin + "','%Y-%m-%d %T') " + " and FBIZSTATE='bsFinished'";
		// 查询日程记录信息
		String queryScheduleInfo = "select t.fEXECUTORID,t.fEXECUTORName,s.FBEGINTIME,s.FENDTIME,s.fIsOutSide,t.fRemark,s.fContent from OA_SD_Executor t join OA_SD_Schedule s on t.fMasterID  =  s.FID where s.FBEGINTIME <="
			+ "str_to_date('" + end + "','%Y-%m-%d %T') " + " and s.FENDTIME >=" + "str_to_date('" + begin + "','%Y-%m-%d %T') " + "";
		
		// 根据机构过滤人员
		if (!(searchOrgName.equals("undefined")) && (searchOrgName != null) && (searchOrgName != "")) {
			personInfo = personInfo + " and sMainOrgFName like '%" + searchOrgName + "%'";
		}
		personInfo = personInfo + " order by sMainSequence ";
		
		Connection personConn = pp;
		Statement personStat = null;
		ResultSet personRs = null;
		
		Connection conn = pp;
		Statement evecStat = null;
		Statement leaveStat = null;
		Statement scheduleStat = null;
		
		ResultSet evecRs = null;
		ResultSet leaveRs = null;
		ResultSet scheduleRs = null;
		
		/**
		 * 最外层map key 人员名称 value 是个map ： 这个map的key 是星期几 value是个map 这个map的key
		 * 是外出的状态 value是是由
		 * 
		 */
		
		StaffStateUtil ssu = StaffStateUtil.getStaffStateUtil();
		Map<Week, Map<State, String>> signelStateMap;
		String personID = "";
		try {
			// 查询人员信息
			personStat = personConn.createStatement();
			System.out.println("人员信息:" + personInfo);
			personRs = personStat.executeQuery(personInfo);
			
			// 根据存在的人员构造空内容的不规则数据结构
			int rec = 0;
			
			while (personRs.next()) {
				String personName = personRs.getString("sName");
				personID = personRs.getString("sid");
				String sequence = personRs.getString("sMainSequence");
				if (sequence == null || sequence.equals("")) {
					sequence = "0";
				}
				rec += 1;
				
				String mainOrgFName = personRs.getString("sMainOrgFName");
				if (mainOrgFName != null && !"".equals(mainOrgFName)) {
					mainOrgFName = mainOrgFName.substring(mainOrgFName.indexOf("/")+1, mainOrgFName.length());
				}
				if (mainOrgFName == null) {
					mainOrgFName = "";
				}
				
				signelStateMap = new HashMap<Week, Map<State, String>>();
				for (Week w : Week.values()) {
					
					Map<State, String> stateMap = new HashMap<State, String>();
					
					for (State s : State.values()) {
						stateMap.put(s, "");
					}
					signelStateMap.put(w, stateMap);
				}
				ssu.addItem(personName, mainOrgFName, sequence, signelStateMap, personID);
				
				//}
			}
			// 查询人员的状态信息
			
			// 出差数据填充
			evecStat = conn.createStatement();
			//System.out.println("出差信息：" + evecApplyInfo);
			evecRs = evecStat.executeQuery(evecApplyInfo);
			
			while (evecRs.next()) {
				String personName = evecRs.getString("fPERSONNEL");
				Date fSTARTTIME = evecRs.getDate("fSTARTTIME");
				Date fENDTIME = evecRs.getDate("fENDTIME");
				String fREASON = evecRs.getString("fREASON");
				personID = evecRs.getString("fPersonID");
				if (personID != null && (!"".equals(personID))) {
					String[] personList = personID.split(",");
					String itemName = "";
					for (int i = 0; i < personList.length; i++) {
						itemName = personList[i].trim();
						
						Date lastDay = dateBegin;
						for (Week w : Week.values()) {
							if (!((fENDTIME.compareTo(lastDay) < 0) || (fSTARTTIME.compareTo(weekMap.get(w)) >= 0))) {
								// 去掉已经删除的人员的信息
								signelStateMap = (Map<Week, Map<State, String>>) ssu.getDataMap(itemName);
								if (signelStateMap != null && signelStateMap.get(w) != null) {
									if (fREASON == null) {
										fREASON = "没有填写原因";
									}
									signelStateMap.get(w).put(State.evec, "(" + fSTARTTIME + "至" + fENDTIME + ")" + seperate1 + fREASON);
								}
								
							}
							lastDay = weekMap.get(w);
						}
					}
					
				}
			}
			// 请假数据填充
			leaveStat = conn.createStatement();
			leaveRs = leaveStat.executeQuery(queryLeaveInfo);
			//System.out.println("请假信息：" + queryLeaveInfo);
			while (leaveRs.next()) {
				String personName = leaveRs.getString("fApplyPersonName");
				Date fSTARTTIME = leaveRs.getDate("fStartTime");
				Date fENDTIME = leaveRs.getDate("fEndTime");
				String fREASON = leaveRs.getString("fLeaveReason");
				personID = leaveRs.getString("fApplyPersonID");
				Date lastDay = dateBegin;
				
				for (Week w : Week.values()) {
					if (!((fENDTIME.compareTo(lastDay) < 0) || (fSTARTTIME.compareTo(weekMap.get(w)) >= 0))) {
						signelStateMap = (Map<Week, Map<State, String>>) ssu.getDataMap(personID);
						if (signelStateMap != null && signelStateMap.get(w) != null) {
							if (fREASON == null) {
								fREASON = "没有填写原因";
							}
							signelStateMap.get(w).put(State.leave, "(" + fSTARTTIME + "至" + fENDTIME + ")" + seperate1 + fREASON);
							
						}
					}
					lastDay = weekMap.get(w);
				}
				
			}
			// 日程数据填充
			
			scheduleStat = conn.createStatement();
			//System.out.println("日程数据：" + queryScheduleInfo);
			scheduleRs = scheduleStat.executeQuery(queryScheduleInfo);
			
			while (scheduleRs.next()) {
				String personName = scheduleRs.getString("fEXECUTORName");
				Date fSTARTTIME = scheduleRs.getDate("FBEGINTIME");
				Date fENDTIME = scheduleRs.getDate("FENDTIME");
				String fIsOutSide = scheduleRs.getString("fIsOutSide");
				String fREASON = scheduleRs.getString("fContent");
				personID = scheduleRs.getString("fEXECUTORID");
				/**
				 * 
				 */
				if (personID != null && (!"".equals(personID))) {
					String[] personList = personID.split(",");
					String itemName = "";
					for (int i = 0; i < personList.length; i++) {
						
						itemName = personList[i].trim();
						Date lastDay = dateBegin;
						for (Week w : Week.values()) {
							if (!((fENDTIME.compareTo(lastDay) < 0) || (fSTARTTIME.compareTo(weekMap.get(w)) >= 0))) {
								// 去掉已经删除的人员的信息
								signelStateMap = (Map<Week, Map<State, String>>) ssu.getDataMap(itemName);
								if (signelStateMap != null && signelStateMap.get(w) != null) {
									if (fREASON == null) {
										fREASON = "没有填写原因";
									}
									String temp = signelStateMap.get(w).get(("是").equals(fIsOutSide) ? State.outBjschedule : State.inBjschedule);
									if (temp != null && (!"".equals(temp))) {
										signelStateMap.get(w).put(("是").equals(fIsOutSide) ? State.outBjschedule : State.inBjschedule,
												temp + ";" + fREASON);
									} else {
										signelStateMap.get(w).put(("是").equals(fIsOutSide) ? State.outBjschedule : State.inBjschedule,
												"(" + fSTARTTIME + "至" + fENDTIME + ")" + seperate1 + fREASON);
									}
									
								}
								
							}
							lastDay = weekMap.get(w);
						}
					}
					
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (personRs != null) {
					personRs.close();
				}
				if (personStat != null) {
					personStat.close();
				}
				if (personConn != null) {
					personConn.close();
				}
				if (evecRs != null) {
					evecRs.close();
				}
				if (leaveRs != null) {
					leaveRs.close();
				}
				if (scheduleRs != null) {
					scheduleRs.close();
				}
				if (evecStat != null) {
					evecStat.close();
				}
				if (leaveStat != null) {
					leaveStat.close();
				}
				if (scheduleStat != null) {
					scheduleStat.close();
				}
				
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		// 序列化数据成xml发送给UIServer
		// Map<String,Map<Week,Map<State,String>>> personStateMap=new
		// HashMap<String,Map<Week,Map<State,String>>>();
		
		StringBuilder sb = new StringBuilder("<?xml version=\"1.0\"?><rows");
		String title = "排序,组织路径,姓名,";
		
		Calendar call = Calendar.getInstance();
		call.setTime(dateBegin);
		for (int j = 0; j < 7; j++) {
			
			int i = call.get(java.util.Calendar.DAY_OF_WEEK) - 1 + j;
			if (i >= 7) {
				i -= 7;
			}
			switch (i) {
			case 0:
				title += "星期日,";
				break;
			case 1:
				title += "星期一,";
				break;
				
			case 2:
				title += "星期二,";
				break;
			case 3:
				title += "星期三,";
				break;
			case 4:
				title += "星期四,";
				break;
				
			case 5:
				title += "星期五,";
				break;
			case 6:
				title += "星期六,";
				break;
			}
		}
		sb.append(" title='" + title + "'>");
		ArrayList ar = ssu.getIndexList();
		
		String personName = "";
		String tSequence = "";
		String tOrgName = "";

		for (int i = 0; i < ar.size(); i++) {
			// TODO 人员过滤
			personName = (String) ((ArrayList) ar.get(i)).get(0);
			tSequence = (String) ((ArrayList) ar.get(i)).get(2);
			tOrgName = (String) ((ArrayList) ar.get(i)).get(1);
			signelStateMap = (Map<Week, Map<State, String>>) ((ArrayList) ar.get(i)).get(3);
			if (!(searchPersonName.equals("undefined")) && (searchPersonName != null) && (searchPersonName != "")) {
				if (!personName.equals(searchPersonName.toString().trim()))
					continue;
			}
			//sb.append("<row><cell>" + (i + 1) + "</cell><cell>" + tSequence + "</cell><cell>" + tOrgName + "</cell><cell>" + personName + "</cell>");
			sb.append("<row><cell>" + (i + 1) + "</cell><cell>" + tOrgName + "</cell><cell>" + personName + "</cell>");
			for (Week w : Week.values()) {
				sb.append("<cell>");
				Map<State, String> stateMap = signelStateMap.get(w);
				
				for (State s : State.values()) {
					// 分割操作符号_justep_
					if (stateMap.get(s) == null) {
					} else if (!stateMap.get(s).equals("")) {
						if (s.equals(State.evec)) {
							sb.append("出差");
							sb.append("|" + stateMap.get(s) + seperate);
						} else if (s.equals(State.leave)) {
							sb.append("请假");
							sb.append("|" + stateMap.get(s) + seperate);
						} else if (s.equals(State.inBjschedule)) {
							sb.append("京内");
							sb.append("|" + stateMap.get(s) + seperate);
						} else if (s.equals(State.outBjschedule)) {
							sb.append("京外");
							sb.append("|" + stateMap.get(s) + seperate);
						}
					}
				}
				sb.append("</cell>");
			}
			sb.append("</row>");
		}

		sb.append("</rows>");
		System.out.println("sb---"+sb);
		Document doc = null;
		try {
			doc = DocumentHelper.parseText(sb.toString());
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		//System.out.println("doc:" + doc.asXML());
		return doc;
	}

	public static Table getStaffState() throws Exception {
		String ksql = "select a.ct as act,"
				+ "        b.ct as bct,"
				+ "       c.ct as cct,"
				+ "       d.ct as dct,"
				+ "       e.ct as ect,"
				+ "       f.ct as fct,"
				+ "       g.ct as gct,"
				+ "       h.ct as hct,"
				+ "       i.ct as ict"
				+ "  from (select COUNT(V_SA_OPPerson) as ct from V_SA_OPPerson V_SA_OPPerson where V_SA_OPPerson.sValidState = '1') a"
				+ "  join"
				+ " (select COUNT(V_SA_OPPerson) as ct"
				+ "    from V_SA_OPPerson V_SA_OPPerson"
				+ "   where V_SA_OPPerson.sValidState = '1'"
				+ "     and V_SA_OPPerson.sMainOrgFID like '/ORG01.ogn/6E6AF4E38C4143D798399DDC50F16E8B.pos%') b on 1 = 1"
				+ "  join"
				+ " (select COUNT(V_SA_OPPerson) as ct"
				+ "    from V_SA_OPPerson V_SA_OPPerson"
				+ "   where V_SA_OPPerson.sValidState = '1'"
				+ "     and V_SA_OPPerson.sMainOrgFID like"
				+ "         '/ORG01.ogn/B2F7522BBBC24A2CB1759365A7DB2752.ogn%') c on 1 = 1"
				+ "  join"
				+ " (select COUNT(V_SA_OPPerson) as ct"
				+ "    from V_SA_OPPerson V_SA_OPPerson"
				+ "   where V_SA_OPPerson.sValidState = '1'"
				+ "     and V_SA_OPPerson.sMainOrgFID like"
				+ "         '/ORG01.ogn/B2F7522BBBC24A2CB1759365A7DB2752.ogn/F19976413DC0483AB5FC453A54FFBF27.dpt%') d on 1 = 1"
				+ "  join"
				+ " (select COUNT(V_SA_OPPerson) as ct"
				+ "    from V_SA_OPPerson V_SA_OPPerson"
				+ "   where V_SA_OPPerson.sValidState = '1'"
				+ "     and V_SA_OPPerson.sMainOrgFID like"
				+ "         '/ORG01.ogn/B2F7522BBBC24A2CB1759365A7DB2752.ogn/F3BF05C5E2CD4D0DB36EA1514CA96467.dpt%') e on 1 = 1"
				+ "  join"
				+ " (select COUNT(V_SA_OPPerson) as ct"
				+ "    from V_SA_OPPerson V_SA_OPPerson"
				+ "   where V_SA_OPPerson.sValidState = '1'"
				+ "     and V_SA_OPPerson.sMainOrgFID like"
				+ "         '/ORG01.ogn/B2F7522BBBC24A2CB1759365A7DB2752.ogn/F61CFBF212C04A76A25BFE8C68AEC3D8.dpt%') f on 1 = 1"
				+ "  join"
				+ " (select COUNT(V_SA_OPPerson) as ct"
				+ "    from V_SA_OPPerson V_SA_OPPerson"
				+ "   where V_SA_OPPerson.sValidState = '1'"
				+ "     and V_SA_OPPerson.sMainOrgFID like"
				+ "         '/ORG01.ogn/B2F7522BBBC24A2CB1759365A7DB2752.ogn/9D6E9F317E7D4B48826AF791709EDAEC.dpt%') g on 1 = 1"
				+ "  join"
				+ " (select COUNT(OA_SD_Schedule) as ct from OA_SD_Schedule OA_SD_Schedule where OA_SD_Schedule.fIsOutSide = '是' and OA_SD_Schedule.fBeginDatePart <= :currentDate() and OA_SD_Schedule.fEndDatePart >= :currentDate()) h on 1 = 1"
				+ "  join"
				+ " (select COUNT(OA_WM_LeaveApply) as ct from OA_WM_LeaveApply OA_WM_LeaveApply where OA_WM_LeaveApply.fBizState = 'bsFinished' and DateTimeToDate(OA_WM_LeaveApply.fFACTSTARTTIME) <= :currentDate() and DateTimeToDate(OA_WM_LeaveApply.fFACTENDTIME) >= :currentDate()) i on 1 = 1";

		Table result = KSQL.select(ksql, null, "/OA", null);
		return result;
	}

	public static Table getStaffStateByDept(String deptNames) throws Exception {
		String[] names = deptNames.split(",");
		String ksql = "";
		List<String> columnNames = new ArrayList<String>();
		columnNames.add("orgFName");
		columnNames.add("totalNumber");
		columnNames.add("reignNumber");
		columnNames.add("leavingBjNumber");
		columnNames.add("leaveNumber");
		List<String> columnTypes = new ArrayList<String>();
		columnTypes.add("String");
		columnTypes.add("Integer");
		columnTypes.add("Integer");
		columnTypes.add("Integer");
		columnTypes.add("Integer");

		Table result = TableUtils.createTable(null, columnNames, columnTypes);

		if (deptNames.equals("undefined") || deptNames == "" || deptNames == null)
			return result;

		String outPersons = getOutPersons();
		for (int i = 0; i < names.length; i++) {
			ksql = "select "
					+ "a.count as totalNumber,"
					+ "c.count as leavingBjNumber,"
					+ "d.count as leaveNumber,"
					+ "(a.count-d.count) as reignNumber"
					+ " from "
					+ "(select count(V_SA_OPPerson) as count from V_SA_OPPerson V_SA_OPPerson where V_SA_OPPerson.sValidState = '1' and V_SA_OPPerson.sMainOrgFName like '"
					+ names[i]
					+ "%') a"

					+ " join "
					+ " (select count(V_SA_OPPerson) as count from V_SA_OPPerson V_SA_OPPerson where V_SA_OPPerson.sValidState = '1' and V_SA_OPPerson.sMainOrgFName like '"
					+ names[i]
					+ "%' and V_SA_OPPerson.sName in ("
					+ outPersons
					+ ")) c on 1 = 1"
					+ " join "
					+ " (select COUNT(OA_WM_LeaveApply) as count from OA_WM_LeaveApply OA_WM_LeaveApply where OA_WM_LeaveApply.fBizState = 'bsFinished' and DateTimeToDate(OA_WM_LeaveApply.fFACTSTARTTIME) <= :currentDate() and DateTimeToDate(OA_WM_LeaveApply.fFACTENDTIME) >= :currentDate()) d on 1 = 1";
			Table table = KSQL.select(ksql, null, "/OA", null);
			Iterator<Row> rows = table.iterator();
			Row row = rows.next();

			Row newRow = result.appendRow();
			newRow.setString("orgFName", names[i]);
			newRow.setInteger("totalNumber", row.getInteger("totalNumber"));
			newRow.setInteger("reignNumber", row.getInteger("reignNumber"));
			newRow.setInteger("leavingBjNumber", row.getInteger("leavingBjNumber"));
			newRow.setInteger("leaveNumber", row.getInteger("leaveNumber"));
		}
		return result;
	}

	/*
	 * 出差人员统计
	 */
	public static String getEvacPersons() throws Exception {
		Calendar cal = Calendar.getInstance();
		Date curTime = cal.getTime();
		String curStr = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(curTime);
		Connection conn = null;
		conn = ActionUtils.getRequestContext().getTransaction().getConnection(ModelUtils.getModel(("/OA")));

		String strDatabaseType = conn.getMetaData().getDatabaseProductName();
		if (strDatabaseType.equalsIgnoreCase("Oracle")) {
			curStr = "TO_DATE('" + curStr + "','yyyy-MM-dd HH24:mi:ss') ";
		} else {
			curStr = "'" + curStr + "'";
		}

		String strSQL = "select m.FPERSONNEL,e.fPersonID from OA_WM_OtherApply m,OA_WM_eveMember e where m.fid=e.fmasterid and (m.fFACTSTARTTIME <= " + curStr + "  and  m.fFACTENDTIME >= " + curStr
				+ " and m.ftype ='出差申请' and m.FBIZSTATE='bsFinished')";

		Statement st = null;
		ResultSet rs = null;
		String evacPerson = "";
		String personIDs = "";

		st = conn.createStatement();
		rs = st.executeQuery(strSQL);

		while (rs.next()) {
			String fExecutors = rs.getString("FPERSONNEL");
			String fExecutorIDs = rs.getString("fPersonID");
			if (fExecutors != null && !"".equals(fExecutors)) {
				String[] evacList = fExecutors.split(",");
				String[] evacIDList = fExecutorIDs.split(",");
				for (String q : evacIDList) {
					if (personIDs == "") {
						personIDs += q.trim();
					} else {
						personIDs = personIDs + "','" + q.trim();
					}
				}
			}
		}
		personIDs = "'" + personIDs + "'";
		if (evacPerson == "") {
			evacPerson = "没有出差人员XXX";
		}
		if (rs != null) {
			rs.close();
		}
		if (st != null) {
			st.close();
		}
		if (conn != null) {
			conn.close();
		}
		return personIDs;
	}

	/*
	 * 请假人员统计
	 */
	public static String getLeavePersons() throws Exception {
		Calendar cal = Calendar.getInstance();
		Date curTime = cal.getTime();
		String curStr = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(curTime);
		Connection conn = null;
		conn = ActionUtils.getRequestContext().getTransaction().getConnection(ModelUtils.getModel(("/OA")));
		String strDatabaseType = conn.getMetaData().getDatabaseProductName();
		if (strDatabaseType.equalsIgnoreCase("Oracle")) {
			curStr = "TO_DATE('" + curStr + "','yyyy-MM-dd HH24:mi:ss') ";
		} else {
			curStr = "'" + curStr + "'";
		}

		String strSQL = "select OA_WM_LeaveApply.fApplyPersonID as fExecutors from OA_WM_LeaveApply OA_WM_LeaveApply"
				+ " where OA_WM_LeaveApply.FBIZSTATE = 'bsFinished' " + "and OA_WM_LeaveApply.FFACTSTARTTIME <= " + curStr
				+ " and OA_WM_LeaveApply.fFACTEndTime >= " + curStr;

		Statement st = null;
		ResultSet rs = null;

		st = conn.createStatement();
		rs = st.executeQuery(strSQL);
		String leavePerson = "";
		while (rs.next()) {
			String fExecutors = rs.getString("fExecutors");
			if (fExecutors != null && !"".equals(fExecutors)) {
				if (leavePerson == "") {
					leavePerson += fExecutors.trim();
				} else {
					leavePerson = leavePerson + "','" + fExecutors.trim();
				}
			}
		}
		leavePerson = "'" + leavePerson + "'";
		if (leavePerson == "") {
			leavePerson = "没有请假人员XXX";
		}
		if (rs != null) {
			rs.close();
		}
		if (st != null) {
			st.close();
		}
		if (conn != null) {
			conn.close();
		}

		return leavePerson;

	}

	/*
	 * 外出人员统计
	 */
	public static String getOutPersons() throws Exception {
		Calendar cal = Calendar.getInstance();
		Date curTime = cal.getTime();
		String curStr = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(curTime);
		Connection conn = null;
		conn = ActionUtils.getRequestContext().getTransaction().getConnection(ModelUtils.getModel(("/OA/schedule/data")));

		String strDatabaseType = conn.getMetaData().getDatabaseProductName();
		if (strDatabaseType.equalsIgnoreCase("Oracle")) {
			curStr = "TO_DATE('" + curStr + "','yyyy-MM-dd HH24:mi:ss') ";
		} else {
			curStr = "'" + curStr + "'";
		}

		String strSQL = "select fEXECUTORID from OA_SD_Executor "
				+ "join OA_SD_Schedule on OA_SD_Executor.fMasterID  =  OA_SD_Schedule.FID where FBEGINDATEPART <=" + curStr + " and FENDDATEPART >="
				+ curStr + " and OA_SD_Schedule.fIsOutSide = '是'";

		Statement st = null;
		ResultSet rs = null;

		st = conn.createStatement();
		rs = st.executeQuery(strSQL);
		String outPersons = "";
		while (rs.next()) {
			String fExecutors = rs.getString("fEXECUTORID");
			if (fExecutors != null && !"".equals(fExecutors)) {
				if (outPersons == "") {
					outPersons += fExecutors.trim();
				} else {
					outPersons = outPersons + "','" + fExecutors.trim();
				}
			}
		}
		outPersons = "'" + outPersons + "'";
		if (outPersons == "") {
			outPersons = "没有外出人员XXX";
		}
		if (rs != null) {
			rs.close();
		}
		if (st != null) {
			st.close();
		}
		if (conn != null) {
			conn.close();
		}

		return outPersons;

	}

	/**
	 * 获取直属部门主官
	 * 
	 * @return
	 * @throws Exception
	 */
	public static String getDirectlyOgnName() throws Exception {
		String deptSql = "select distinct org.sFID, org.sFName from V_SA_OPOrg org where org.sFName like '/科订部/直属单位/%' and org.sOrgKindID = 'dpt'"; 
		Table deptTable = KSQL.select(deptSql, null, "/OA", null);
		int count = deptTable.size();
		Iterator<Row> rows = deptTable.iterator();
		String directlyOgnName = "";
		for (int i = 0; i < count; i++) {
			Row row = rows.next();
			String value = row.getString("sFName").trim();
			if (directlyOgnName == "")
				directlyOgnName += value;
											
			else
				directlyOgnName += "," + value;
												
		}
		return directlyOgnName;
	}

	/**
	 * 获取部门主官人员状态
	 * 
	 * @return
	 * @throws Exception
	 */
	public static Table getStaffStateOfDirectlyOgn() throws Exception {
		Table table = null;
		try {
			String directlyOgnStr = getDirectlyOgnName();
			table = getStaffStateByDept(directlyOgnStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return table;
	}

	/**
	 * 获取部首长和局中人员状态
	 * 
	 * @return
	 * @throws Exception
	 */
	public static Table getStaffStateOfDept() throws Exception {
		List<String> columnNames = new ArrayList<String>();
		columnNames.add("deptName");
		columnNames.add("deptFName");
		columnNames.add("leavingNumber");
		columnNames.add("onSeatNumber");
		columnNames.add("ltLeavingNum");
		List<String> columnTypes = new ArrayList<String>();
		columnTypes.add("String");
		columnTypes.add("String");
		columnTypes.add("Integer");
		columnTypes.add("Integer");
		columnTypes.add("Integer");
		Table result = TableUtils.createTable(null, columnNames, columnTypes);

		String deptKsql = "select SA_OPOrg as orgID,SA_OPOrg.sName as orgName,SA_OPOrg.sFID as orgFID,SA_OPOrg.sFName as orgFName from SA_OPOrg SA_OPOrg where SA_OPOrg.sValidState = 1 and (SA_OPOrg.sDescription='0' or SA_OPOrg.sDescription='1') and (SA_OPOrg.sOrgKindID <> 'pos' and SA_OPOrg.sOrgKindID <> 'psm') and SA_OPOrg.sParent in (select org from SA_OPOrg org where org.sParent is null and org.sValidState = 1) order by SA_OPOrg.sSequence asc";
		Table deptTable = KSQL.select(deptKsql, null, "/system/data", null);

		String outPersons = getOutPersons();
		String leavePersons = getLeavePersons();
		String evacPersons = getEvacPersons();

		for (Iterator<Row> rows = deptTable.iterator(); rows.hasNext();) {
			Row row = rows.next();
			String deptID = row.getString("orgID");
			String deptName = row.getString("orgName");
			String deptFID = row.getString("orgFID");
			String deptFName = row.getString("orgFName");

			int leavingNumber = 0, onSeatNumber = 0, ltLeavingNum = 0;
			Table psnNumTable = null;

			String psnNumKsql = "select a.count as leavingNumber, b.count as onSeatNumber,c.count as ltLeavingNum from "
					+ "(select count(SA_OPOrg) as count from SA_OPOrg SA_OPOrg where SA_OPOrg.sValidState = '1' and SA_OPOrg.sOrgKindID = 'psm' and SA_OPOrg.sFID like '"
					+ deptFID
					+ "/%' and SA_OPOrg.sPersonID in ("
					+ outPersons
					+ ")) a "
					+ " join "
					+ "(select count(SA_OPOrg) as count from SA_OPOrg SA_OPOrg where SA_OPOrg.sValidState = '1' and SA_OPOrg.sOrgKindID = 'psm' and SA_OPOrg.sFID like '"
					+ deptFID
					+ "/%' and not (SA_OPOrg.sPersonID in ("
					+ outPersons
					+ ","
					+ evacPersons
					+ ","
					+ leavePersons
					+ "))) b on 1 = 1 join (select count(SA_OPOrg) as count from SA_OPOrg SA_OPOrg where SA_OPOrg.sValidState = '1' and SA_OPOrg.sOrgKindID = 'psm' and "
					+ "SA_OPOrg.sFID like '"
					+ deptFID
					+ "/%'and SA_OPOrg.sPersonID in("
					+ outPersons
					+ ","
					+ evacPersons
					+ ","
					+ leavePersons
					+ "))c on 1=1";
			psnNumTable = KSQL.select(psnNumKsql, null, "/system/data", null);


			for (Iterator<Row> numRows = psnNumTable.iterator(); numRows.hasNext();) {
				Row numRow = numRows.next();
				leavingNumber = numRow.getInt("leavingNumber");
				onSeatNumber = numRow.getInt("onSeatNumber");
				ltLeavingNum = numRow.getInt("ltLeavingNum");
			}
			Row newRow = result.appendRow();
			newRow.setString("deptName", deptName);
			newRow.setString("deptFName", deptFName);
			newRow.setInteger("leavingNumber", (Integer) (leavingNumber));
			newRow.setInteger("onSeatNumber", (Integer) (onSeatNumber));
			newRow.setInteger("ltLeavingNum", (Integer) (ltLeavingNum));
		}
		return result;
	}

	/**
	 * 获取直属单位中人员的状态
	 * 
	 * @return
	 * @throws Exception
	 */
	public static Table getStaffStateOfDirectDept() throws Exception {
		List<String> columnNames = new ArrayList<String>();
		columnNames.add("deptName");
		columnNames.add("deptFName");
		columnNames.add("leavingNumber");
		columnNames.add("onSeatNumber");
		columnNames.add("ltLeavingNum");
		List<String> columnTypes = new ArrayList<String>();
		columnTypes.add("String");
		columnTypes.add("String");
		columnTypes.add("Integer");
		columnTypes.add("Integer");
		columnTypes.add("Integer");
		Table result = TableUtils.createTable(null, columnNames, columnTypes);

		String deptKsql = "select SA_OPOrg as orgID,SA_OPOrg.sName as orgName,SA_OPOrg.sFID as orgFID,SA_OPOrg.sFName as orgFName from SA_OPOrg SA_OPOrg where SA_OPOrg.sValidState = 1 and SA_OPOrg.sDescription is null and (SA_OPOrg.sOrgKindID <> 'pos' and SA_OPOrg.sOrgKindID <> 'psm') and SA_OPOrg.sParent in (select org from SA_OPOrg org where org.sParent is null and org.sValidState = 1) order by SA_OPOrg.sSequence asc";
		Table deptTable = KSQL.select(deptKsql, null, "/system/data", null);

		String outPersons = getOutPersons();
		String leavePersons = getLeavePersons();
		String evacPersons = getEvacPersons();

		for (Iterator<Row> rows = deptTable.iterator(); rows.hasNext();) {
			Row row = rows.next();
			String deptID = row.getString("orgID");
			String deptName = row.getString("orgName");
			String deptFID = row.getString("orgFID");
			String deptFName = row.getString("orgFName");

			int leavingNumber = 0, onSeatNumber = 0, ltLeavingNum = 0;
			Table psnNumTable = null;

			String psnNumKsql = "select a.count as leavingNumber, b.count as onSeatNumber,c.count as ltLeavingNum from "
					+ "(select count(SA_OPOrg) as count from SA_OPOrg SA_OPOrg where SA_OPOrg.sValidState = '1' and SA_OPOrg.sOrgKindID = 'psm' and SA_OPOrg.sFID like '"
					+ deptFID
					+ "/%' and SA_OPOrg.sPersonID in ("
					+ outPersons
					+ ")) a "
					+ " join "
					+ "(select count(SA_OPOrg) as count from SA_OPOrg SA_OPOrg where SA_OPOrg.sValidState = '1' and SA_OPOrg.sOrgKindID = 'psm' and SA_OPOrg.sFID like '"
					+ deptFID
					+ "/%' and not (SA_OPOrg.sPersonID in ("
					+ outPersons
					+ ","
					+ evacPersons
					+ ","
					+ leavePersons
					+ "))) b on 1 = 1 join (select count(SA_OPOrg) as count from SA_OPOrg SA_OPOrg where SA_OPOrg.sValidState = '1' and SA_OPOrg.sOrgKindID = 'psm' and "
					+ "SA_OPOrg.sFID like '"
					+ deptFID
					+ "/%'and SA_OPOrg.sPersonID in("
					+ outPersons
					+ ","
					+ evacPersons
					+ ","
					+ leavePersons
					+ "))c on 1=1";
			psnNumTable = KSQL.select(psnNumKsql, null, "/system/data", null);

			for (Iterator<Row> numRows = psnNumTable.iterator(); numRows.hasNext();) {
				Row numRow = numRows.next();
				leavingNumber = numRow.getInt("leavingNumber");
				onSeatNumber = numRow.getInt("onSeatNumber");
				ltLeavingNum = numRow.getInt("ltLeavingNum");
			}

			Row newRow = result.appendRow();
			newRow.setString("deptName", deptName);
			newRow.setString("deptFName", deptFName);
			newRow.setInteger("leavingNumber", (Integer) (leavingNumber));
			newRow.setInteger("onSeatNumber", (Integer) (onSeatNumber));
			newRow.setInteger("ltLeavingNum", (Integer) (ltLeavingNum));
		}
		return result;
	}

	/**
	 * 获取本局人员状态
	 * 
	 * @return
	 * @throws Exception
	 */
	public static Table getStaffStateOfOwnDept(String deptID) throws Exception {
		List<String> columnNames = new ArrayList<String>();
		columnNames.add("deptName");
		columnNames.add("deptFName");
		columnNames.add("leavingNumber");
		columnNames.add("onSeatNumber");
		columnNames.add("ltLeavingNum");
		List<String> columnTypes = new ArrayList<String>();
		columnTypes.add("String");
		columnTypes.add("String");
		columnTypes.add("Integer");
		columnTypes.add("Integer");
		columnTypes.add("Integer");
		Table result = TableUtils.createTable(null, columnNames, columnTypes);


		String deptKsql = "select SA_OPOrg as orgID,SA_OPOrg.sName as orgName,SA_OPOrg.sFID as orgFID,SA_OPOrg.sFName as orgFName from SA_OPOrg SA_OPOrg where SA_OPOrg.sValidState = 1 and SA_OPOrg.sOrgKindID <> 'psm' and SA_OPOrg.sParent='"
				+ deptID + "' order by SA_OPOrg.sSequence asc";
		Table deptTable = KSQL.select(deptKsql, null, "/system/data", null);

		String outPersons = getOutPersons();
		String leavePersons = getLeavePersons();
		String evacPersons = getEvacPersons();

		for (Iterator<Row> rows = deptTable.iterator(); rows.hasNext();) {
			Row row = rows.next();
			String orgID = row.getString("orgID");
			String deptName = row.getString("orgName");
			String deptFID = row.getString("orgFID");
			String deptFName = row.getString("orgFName");

			int leavingNumber = 0, onSeatNumber = 0, ltLeavingNum = 0;
			Table psnNumTable = null;

			String psnNumKsql = "select a.count as leavingNumber, b.count as onSeatNumber,c.count as ltLeavingNum from "
					+ "(select count(SA_OPOrg) as count from SA_OPOrg SA_OPOrg where SA_OPOrg.sValidState = '1' and SA_OPOrg.sOrgKindID = 'psm' and SA_OPOrg.sFID like '"
					+ deptFID
					+ "/%' and SA_OPOrg.sPersonID in ("
					+ outPersons
					+ ")) a "
					+ " join "
					+ "(select count(SA_OPOrg) as count from SA_OPOrg SA_OPOrg where SA_OPOrg.sValidState = '1' and SA_OPOrg.sOrgKindID = 'psm' and SA_OPOrg.sFID like '"
					+ deptFID
					+ "/%' and not (SA_OPOrg.sPersonID in ("
					+ outPersons
					+ ","
					+ evacPersons
					+ ","
					+ leavePersons
					+ "))) b on 1 = 1 join (select count(SA_OPOrg) as count from SA_OPOrg SA_OPOrg where SA_OPOrg.sValidState = '1' and SA_OPOrg.sOrgKindID = 'psm' and "
					+ "SA_OPOrg.sFID like '"
					+ deptFID
					+ "/%'and SA_OPOrg.sPersonID in("
					+ outPersons
					+ ","
					+ evacPersons
					+ ","
					+ leavePersons
					+ "))c on 1=1";
			psnNumTable = KSQL.select(psnNumKsql, null, "/system/data", null);

			for (Iterator<Row> numRows = psnNumTable.iterator(); numRows.hasNext();) {
				Row numRow = numRows.next();
				leavingNumber = numRow.getInt("leavingNumber");
				onSeatNumber = numRow.getInt("onSeatNumber");
				ltLeavingNum = numRow.getInt("ltLeavingNum");
			}
			Row newRow = result.appendRow();
			newRow.setString("deptName", deptName);
			newRow.setString("deptFName", deptFName);
			newRow.setInteger("leavingNumber", (Integer) (leavingNumber));
			newRow.setInteger("onSeatNumber", (Integer) (onSeatNumber));
			newRow.setInteger("ltLeavingNum", (Integer) (ltLeavingNum));
		}
		return result;
	}
}
