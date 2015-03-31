import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import javax.naming.NamingException;

import org.json.JSONException;
import org.json.JSONObject;

import com.justep.model.ModelUtils;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;




public class Res {
	/*过时的.以前分组在前台配置。
	 * @param String processPathJson.分组的数据比如{收文:"process1,process2,process3",审批："process4",其它：""}
	 * @rturn String .结构形如{收文："'rowid1','rowid2'"}
	 */
	public static String queryTaskGroupTypeOld(String processPathJson) {
		if (processPathJson == null || "".equals(processPathJson)) {
			return null;
		}
		String re = null;
		ResultSet rs = null;
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			JSONObject jsParam = new JSONObject(processPathJson);
			Iterator<String> it = jsParam.keys();
			String _s001 = null, _s002 = null;
			String[] _sa001 = null;
			Set<String> set = new HashSet<String>();
			while (it.hasNext()) {
				_s001 = (String) it.next();
				_s002 = jsParam.getString(_s001);
				if (_s002 != null && !"".equals(_s002.trim())) {
					_sa001 = _s002.split(",");
					for (int i = 0; i < _sa001.length; i++) {
						set.add(_sa001[i]);
					}
				}
			}
			StringBuilder sb = new StringBuilder();
			for (Iterator it1 = set.iterator(); it1.hasNext();) {
				sb.append("'");
				sb.append((String) it1.next());
				sb.append("',");
			}
			int sbLength = sb.length();
			String processFilter = null;
			if (sbLength > 0) {
				processFilter = " sProcess in (" + sb.substring(0, sbLength - 1) + ")";
			}

			conn = ModelUtils.getConnection("/system/data");
			String customFilter = TaskUtils.getCreatorCondition("SA_Task", ContextHelper.getPerson().getPersonMembers(), true);
			customFilter = "((SA_Task.sKindID='tkTask' ) "//or SA_Task.sKindID='tkNotice'通知就 
					+ " and (SA_Task.sTypeID IS NULL or SA_Task.sTypeID <> 'WORKREMIND')"
					+ " and (SA_Task.sStatusID='tesReady' or SA_Task.sStatusID='tesExecuting') " + //or t.sStatusID='tesTransmited' hcr: 将转发的认为已经完成
					" and " + customFilter + ")";

			String sql = "select sProcess,sID from SA_Task where " + customFilter;
			if (processFilter != null) {
				sql += "and " + processFilter;
			}
			ps = conn.prepareStatement(sql);
			//System.out.println(sql);
			rs = ps.executeQuery();
			Map<String, String> map001 = new HashMap<String, String>();
			String _s005 = null, _s006 = null;
			while (rs.next()) {
				_s005 = rs.getString("sProcess");
				_s006 = map001.get(_s005);
				if (_s006 == null) {
					map001.put(_s005, "'" + rs.getString("sID") + "',");
				} else {
					map001.put(_s005, _s006 + "'" + rs.getString("sID") + "',");
				}

			}
			it = jsParam.keys();
			Map<String, String> map002 = new HashMap<String, String>();
			String _s003 = null, _s004 = null;
			while (it.hasNext()) {
				_s001 = (String) it.next();
				_s002 = jsParam.getString(_s001);
				_s004 = "";
				if (_s002 != null && !"".equals(_s002.trim())) {
					_sa001 = _s002.split(",");
					for (int i = 0; i < _sa001.length; i++) {
						_s003 = map001.get(_sa001[i]);
						if (_s003 != null && !"".equals(_s003.trim())) {
							_s004 += _s003;
						}
					}
					if (_s004.length() > 0) {
						_s004 = _s004.substring(0, _s004.length() - 1);
						map002.put(_s001, _s004);
					} else {
						map002.put(_s001, "_sky_");
					}
				} else {
					map002.put(_s001, "_sky_");
				}
			}
			JSONObject reJson = new JSONObject();
			reJson.put("flag", "success");
			reJson.put("result", map002);
			re = reJson.toString();
			//System.out.println(re);
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (JSONException e) {
			e.printStackTrace();
		} finally {
			if (null != rs) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
			if (null != ps) {
				try {
					ps.close();
				} catch (SQLException e) {
				}
			}
			if (null != conn) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
		return re;
	}

	static private String _processDoc = "'/OA/doc/process/receiveDoc/receiveDocProcess', '/OA/doc/process/sendDoc/sendDocProcess',"
			+ "'/OA/doc/process/signReport/signReportProcess'";

	/*
	 * @param type 要查询的数据类型 type=｛all,re,se,sign｝
	 * @rturn String .结构形如{收文："'rowid1','rowid2'"}
	 */
	public static String queryTaskGroupType(String processPathJson) {
		if (processPathJson == null || "".equals(processPathJson)) {
			return null;
		}

		String re = null;
		ResultSet rs = null;
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ModelUtils.getConnection("/system/data");
			String customFilter = TaskUtils.getExecutorCondition("SA_Task", ContextHelper.getPerson().getPersonMembers(), true);
			customFilter = "((SA_Task.sKindID='tkTask' or SA_Task.sKindID='tkNotice') "
					+ " and (SA_Task.sTypeID IS NULL or SA_Task.sTypeID <> 'WORKREMIND')"
					+ " and (SA_Task.sStatusID='tesReady' or SA_Task.sStatusID='tesExecuting') " + //or t.sStatusID='tesTransmited' hcr: 将转发的认为已经完成
					" and " + customFilter + ")";

		/*	String sql = "select sProcess,sID,sKindID from SA_Task where " + customFilter;
         
			if ("doc".equals(processPathJson)) {
				sql += "and sProcess in(" + _processDoc + ")";
			} else {
				String[] _sr001 = _processDoc.split(",");
				if ("re".equals(processPathJson)) {
					sql += "and sProcess=" + _sr001[0];
				} else if ("se".equals(processPathJson)) {
					sql += "and sProcess=" + _sr001[1];
				} else if ("sign".equals(processPathJson)) {
					sql += "and sProcess=" + _sr001[2];
				}
			}  
		  
			ps = conn.prepareStatement(sql);
			System.out.print("=====sql"+sql);
			rs = ps.executeQuery();
			Map<String, String> map001 = new LinkedHashMap<String, String>();
			map001.put("公文", "");
			map001.put("行政审批", "");
			map001.put("其他", "");

			String _s005 = null, _s006 = null, _s007 = null;
			while (rs.next()) {
				_s007 = rs.getString("sKindID");
				if ("tkNotice".equals(_s007)) {
					_s005 = "其他";
				} else if ("tkTask".equals(_s007)) {
					if (_processDoc.indexOf(rs.getString("sProcess")) == -1) {
						_s005 = "行政审批";
					} else {
						_s005 = "公文";
					}
				}
				map001.put(_s005, map001.get(_s005) + "'" + rs.getString("sID") + "',");
			}
			
			*/
			
			String sql = "select SA_Task.sProcess,SA_Task,SA_Task.sKindID from SA_Task SA_Task where " + customFilter;
	         
			if ("doc".equals(processPathJson)) {
				sql += "and SA_Task.sProcess in(" + _processDoc + ")";
			} else {
				String[] _sr001 = _processDoc.split(",");
				if ("re".equals(processPathJson)) {
					sql += "and SA_Task.sProcess=" + _sr001[0];
				} else if ("se".equals(processPathJson)) {
					sql += "and SA_Task.sProcess=" + _sr001[1];
				} else if ("sign".equals(processPathJson)) {
					sql += "and SA_Task.sProcess=" + _sr001[2];
				}
			}  
			
			Map<String, String> map001 = new LinkedHashMap<String, String>();
			map001.put("公文", "");
			map001.put("行政审批", "");
			map001.put("其他", "");

			String _s005 = null, _s006 = null, _s007 = null;
			
			Table table = KSQL.select(sql, null,"/system/data", null);
			Iterator<Row> rows = table.iterator();
			while (rows.hasNext()) {
				Row rs1 = rows.next();
				_s007 = rs1.getString("sKindID");
				if ("tkNotice".equals(_s007)) {
					_s005 = "其他";
				} else if ("tkTask".equals(_s007)) {
					if (_processDoc.indexOf(rs1.getString("sProcess")) == -1) {
						_s005 = "行政审批";
					} else {
						_s005 = "公文";
					}
				}
				map001.put(_s005, map001.get(_s005) + "'" + rs1.getString("SA_Task") + "',");
			}

			
			Iterator it = map001.keySet().iterator();
			String key = null, value = null;
			while (it.hasNext()) {
				key = (String) it.next();
				value = map001.get(key);
				if (value != null && value.length() > 0) {
					map001.put(key, value.substring(0, value.length() - 1));
				} else {
					map001.put(key, "_sky_");
				}
			}

			JSONObject reJson = new JSONObject();
			reJson.put("flag", "success");
			reJson.put("result", map001);
			re = reJson.toString();
		 	//System.out.println(re);
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (JSONException e) {
			e.printStackTrace();
		} finally {
			if (null != rs) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
			if (null != ps) {
				try {
					ps.close();
				} catch (SQLException e) {
				}
			}
			if (null != conn) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
		System.out.print("====re "+re);
		return re;
	}
}