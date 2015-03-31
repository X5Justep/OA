package OAbar.meeting.util;

import OAbar.schedule.*;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.Node;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;

public class BoardRoomArrange {
	public static final String OADataModel ="/OA/meeting/data";
	
	public static String newMeetingArrangeByApply(String applyID, boolean addScheduleFlag) throws Exception {
		String arrangeID = "";		
		Document result = DocumentHelper.createDocument();
		Element rtRoot = result.addElement("root");
		Element arrange = rtRoot.addElement("arrange");

		String sql = "select a.fArrBoardroomID,a.fArrBoardroom,a.fBoardroom,a.fArrBeginTime,a.fArrEndTime,a.fApplyOgnID,a.fApplyOgnName,a.fApplyDeptID,a.fApplyDeptName," 
			+"a.fApplyPsnID,a.fApplyPsnName,a.fApplyPsnFID,a.fApplyPsnFName,a.fMeetName,a.fMeetPsns,a.fMeetPsnNum,a.fPhone,a.fArrOgnID,a.fArrOgnName,a.fArrDeptID,a.fArrDeptName," 
			+"a.fArrPsnID,a.fArrPsnName,a.fArrPsnFID,a.fArrPsnFName,a.fArrTime,a.fDescription,a.fArrRemark from OA_MT_UseApply a where a='"+applyID+"'";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			Row rs = rows.next();

			String checkMeetingRoomUseFlag = checkBoardroomUsed(rs.getString("fArrBoardroomID"), rs.getDateTime("fArrBeginTime").toString(),
					rs.getDateTime("fArrEndTime").toString(), "");
			if ("true".equals(checkMeetingRoomUseFlag))
				throw new Exception("会议室——" + rs.getString("fBoardroom") + "在该时段被占用：\n" + (rs.getDateTime("fArrBeginTime").toString()).substring(0, 19) + "--\n"
						+ (rs.getDateTime("fArrEndTime").toString()).substring(0, 19));
			Element fUseOgnID = arrange.addElement("fUseOgnID");
			fUseOgnID.setText(rs.getString("fApplyOgnID"));
			Element fUseOgnName = arrange.addElement("fUseOgnName");
			fUseOgnName.setText(rs.getString("fApplyOgnName"));
			Element fUseDeptID = arrange.addElement("fUseDeptID");
			fUseDeptID.setText(rs.getString("fApplyDeptID"));
			Element fUseDeptName = arrange.addElement("fUseDeptName");
			fUseDeptName.setText(rs.getString("fApplyDeptName"));
			Element fUsePsnID = arrange.addElement("fUsePsnID");
			fUsePsnID.setText(rs.getString("fApplyPsnID"));
			Element fUsePsnName = arrange.addElement("fUsePsnName");
			fUsePsnName.setText(rs.getString("fApplyPsnName"));
			Element fUsePsnFullID = arrange.addElement("fUsePsnFullID");
			fUsePsnFullID.setText(rs.getString("fApplyPsnFID"));
			Element fUsePsnFullName = arrange.addElement("fUsePsnFullName");
			fUsePsnFullName.setText(rs.getString("fApplyPsnFName"));
			Element fBoardRoomID = arrange.addElement("fBoardRoomID");
			fBoardRoomID.setText(rs.getString("fArrBoardroomID"));
			Element fBoardRoom = arrange.addElement("fBoardRoom");
			fBoardRoom.setText(rs.getString("fArrBoardroom"));
			Element fMeetName = arrange.addElement("fMeetName");
			if (rs.getString("fMeetName") == null)
				fMeetName.setText("");
			else
				fMeetName.setText(rs.getString("fMeetName"));
			Element fBeginTime = arrange.addElement("fBeginTime");
			fBeginTime.setText((rs.getDateTime("fArrBeginTime").toString()).substring(0, 19));
			Element fEndTime = arrange.addElement("fEndTime");
			fEndTime.setText((rs.getDateTime("fArrEndTime").toString()).substring(0, 19));
			Element fMeetPsns = arrange.addElement("fMeetPsns");
			if (rs.getString("fMeetPsns") == null)
				fMeetPsns.setText("");
			else
				fMeetPsns.setText(rs.getString("fMeetPsns"));
			Element fMeetPsnNum = arrange.addElement("fMeetPsnNum");
			if (rs.getInteger("fMeetPsnNum") == null)
				fMeetPsnNum.setText("0");
			else
				fMeetPsnNum.setText(rs.getInteger("fMeetPsnNum").toString());
			Element fPhone = arrange.addElement("fPhone");
			if (rs.getString("fPhone") == null)
				fPhone.setText("");
			else
				fPhone.setText(rs.getString("fPhone"));
			Element fArrOgnID = arrange.addElement("fArrOgnID");
			fArrOgnID.setText((rs.getString("fArrOgnID") == null ? "" : (rs.getString("fArrOgnID"))));
			Element fArrOgnName = arrange.addElement("fArrOgnName");
			if (rs.getString("fArrOgnName") == null)
				fArrOgnName.setText("");
			else
				fArrOgnName.setText(rs.getString("fArrOgnName"));
			Element fArrDeptID = arrange.addElement("fArrDeptID");
			fArrDeptID.setText(rs.getString("fArrDeptID"));
			Element fArrDeptName = arrange.addElement("fArrDeptName");
			fArrDeptName.setText(rs.getString("fArrDeptName"));
			Element fArrPsnID = arrange.addElement("fArrPsnID");
			fArrPsnID.setText(rs.getString("fArrPsnID"));
			Element fArrPsnName = arrange.addElement("fArrPsnName");
			fArrPsnName.setText(rs.getString("fArrPsnName"));
			Element fArrPsnFullID = arrange.addElement("fArrPsnFullID");
			fArrPsnFullID.setText(rs.getString("fArrPsnFID"));
			Element fArrPsnFullName = arrange.addElement("fArrPsnFullName");
			fArrPsnFullName.setText(rs.getString("fArrPsnFName"));
			Element fArrTime = arrange.addElement("fArrTime");
			fArrTime.setText((rs.getDateTime("fArrTime").toString()).substring(0, 19));
			Element fDescription = arrange.addElement("fDescription");
			if (rs.getString("fDescription") == null)
				fDescription.setText("");
			else
				fDescription.setText(rs.getString("fDescription"));
			Element fRemark = arrange.addElement("fRemark");
			fRemark.setText((rs.getString("fArrRemark") == null ? "" : rs.getString("fArrRemark")));
			Element fMTUseApplyID = arrange.addElement("fMTUseApplyID");
			fMTUseApplyID.setText(applyID);
		}

		Element arrangePsns = arrange.addElement("arrangePsns");
		String applyPsnSql = "select a.fPersonID,a.fPersonName from OA_MT_UseApplyPsns a where a.fMasterID='"+applyID+"'";
		Table tab = KSQL.select(applyPsnSql, null, OADataModel, null);
		Iterator<Row> tabs = tab.iterator();
		while (tabs.hasNext()) {
			Row rs1 = tabs.next();
			Element arrangePsn = arrangePsns.addElement("arrangePsn");
			Element fPersonID = arrangePsn.addElement("fPersonID");
			fPersonID.setText(rs1.getString("fPersonID"));
			Element fPersonName = arrangePsn.addElement("fPersonName");
			fPersonName.setText(rs1.getString("fPersonName"));
		}

		Element faddScheduleFlag = arrange.addElement("faddScheduleFlag");
		faddScheduleFlag.setText((addScheduleFlag == true ? "true" : "false"));
		arrangeID = newMeetingArrange(result);

		return arrangeID;
	}

	public static String newMeetingArrange(Document dom) throws Exception {
		String arrangeID = "";
		Element root = dom.getRootElement();
		Element arrangeNode = (Element) (root.selectSingleNode("arrange"));
		if (arrangeNode == null)
			throw new Exception("没有找到arrange节点");
		arrangeID = newArrangeData(arrangeNode);
		return arrangeID;
	}

	private static String newArrangeData(Element arrangeNode) throws Exception {
		String arrangerID = java.util.UUID.randomUUID().toString();
		SimpleDateFormat s = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
		String sqlDeleteArrangePsns = "delete from OA_MT_ArrangePsns a where a.fMasterID in (select r from OA_MT_RoomArrange r " 
			+"where r.fMTUseApplyID='"+arrangeNode.selectSingleNode("fMTUseApplyID").getText()+"')";
		KSQL.executeUpdate(sqlDeleteArrangePsns, null, OADataModel, null);
		
		String sqwlDeleteRoomArrange = "delete from OA_MT_RoomArrange r where r.fMTUseApplyID='"+arrangeNode.selectSingleNode("fMTUseApplyID").getText()+"'";
		KSQL.executeUpdate(sqwlDeleteRoomArrange, null, OADataModel, null);
		
		String fbeginTime = arrangeNode.selectSingleNode("fBeginTime")
		.getText();
		String fendTime = arrangeNode.selectSingleNode("fEndTime")
		.getText();
		String farrTime = arrangeNode.selectSingleNode("fArrTime")
		.getText();
		java.util.Date beginTime = s.parse(fbeginTime);
		java.util.Date endTime = s.parse(fendTime);
		java.util.Date arrTime = s.parse(farrTime);
		
		String sqlNewArrange = "insert into OA_MT_RoomArrange r("
				+ "r, r.version, r.fUseOgnId, r.fUseOrgName, r.fUseDeptID, r.fUseDeptName,"
				+ "r.fUsePsnID, r.fUsePsnName, r.fUsePsnFID, r.fUsePsnFName,"
				+ "r.fBoardroomID, r.fBoardroom, r.fMeetName,"
				+ "r.fBeginTime, r.fEndTime, "
				+ "r.fMeetPsns, r.fMeetPsnNum, r.fPhone,"
				+ "r.fArrOgnID, r.fArrOgnName, r.fArrDeptID, r.fArrDeptName,"
				+ "r.fArrPsnID, r.fArrPsnName, r.fArrPsnFID, r.fArrPsnFName,"
				+ "r.fArrTime, r.fDescription, r.fRemark, r.fEffect, r.fMTUseApplyID)"
				+ " values(:arrangerID, 0, :fUseOgnId, :fUseOrgName,:fUseDeptID, :fUseDeptName,:fUsePsnID,:fUsePsnName,:fUsePsnFID,:fUsePsnFName, :fBoardRoomID,:fBoardRoom,:fMeetName,:fBeginTime,:fEndTime,:fMeetPsns,:fMeetPsnNum,:fPhone,:fArrOgnID,:fArrOgnName,:fArrDeptID, :fArrDeptName, :fArrPsnID, :fArrPsnName, :fArrPsnFID, :fArrPsnFName, :fArrTime,:fDescription, :fRemark,:fEffect,:fMTUseApplyID)";
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("arrangerID", arrangerID);
		param.put("fUseOgnId", arrangeNode.selectSingleNode("fUseOgnID").getText());
		param.put("fUseOrgName", arrangeNode.selectSingleNode("fUseOgnName").getText());
		param.put("fUseDeptID", arrangeNode.selectSingleNode("fUseDeptID").getText());
		param.put("fUseDeptName", arrangeNode.selectSingleNode("fUseDeptName").getText());
		param.put("fUsePsnID", arrangeNode.selectSingleNode("fUsePsnID").getText());
		param.put("fUsePsnName", arrangeNode.selectSingleNode("fUsePsnName").getText());
		param.put("fUsePsnFID", arrangeNode.selectSingleNode("fUsePsnFullID").getText());
		param.put("fUsePsnFName", arrangeNode.selectSingleNode("fUsePsnFullName").getText());

		if (arrangeNode.selectSingleNode("fBoardRoomID") == null)
			param.put("fBoardRoomID", " ");
		else
			param.put("fBoardRoomID", arrangeNode.selectSingleNode("fBoardRoomID").getText());
		if (arrangeNode.selectSingleNode("fBoardRoom") == null)
			param.put("fBoardRoom", " ");
		else
			param.put("fBoardRoom", arrangeNode.selectSingleNode("fBoardRoom").getText());
		param.put("fMeetName", arrangeNode.selectSingleNode("fMeetName").getText());
		param.put("fBeginTime", new java.sql.Timestamp(beginTime.getTime()));
		param.put("fEndTime", new java.sql.Timestamp(endTime.getTime()));
		param.put("fMeetPsns", arrangeNode.selectSingleNode("fMeetPsns").getText());
		param.put("fMeetPsnNum", arrangeNode.selectSingleNode("fMeetPsnNum").getText());
		param.put("fPhone", arrangeNode.selectSingleNode("fPhone").getText());

		if (arrangeNode.selectSingleNode("fArrOgnID") == null)
				param.put("fArrOgnID", "");
		else
				param.put("fArrOgnID", arrangeNode.selectSingleNode("fArrOgnID").getText());
		if (arrangeNode.selectSingleNode("fArrOgnName") == null)
				param.put("fArrOgnName", "");
		else
				param.put("fArrOgnName", arrangeNode.selectSingleNode("fArrOgnName").getText());
			
		param.put("fArrDeptID", arrangeNode.selectSingleNode("fArrDeptID").getText());
		param.put("fArrDeptName", arrangeNode.selectSingleNode("fArrDeptName").getText());
		param.put("fArrPsnID", arrangeNode.selectSingleNode("fArrPsnID").getText());
		param.put("fArrPsnName", arrangeNode.selectSingleNode("fArrPsnName").getText());
		param.put("fArrPsnFID", arrangeNode.selectSingleNode("fArrPsnFullID").getText());
		param.put("fArrPsnFName", arrangeNode.selectSingleNode("fArrPsnFullName").getText());
		param.put("fArrTime", new java.sql.Timestamp(arrTime.getTime()));
		param.put("fDescription", arrangeNode.selectSingleNode("fDescription").getText());
			
		if (arrangeNode.selectSingleNode("fRemark") == null)
			param.put("fRemark", "");
		else
			param.put("fRemark", arrangeNode.selectSingleNode("fRemark").getText());
		param.put("fEffect", 1);
		param.put("fMTUseApplyID", arrangeNode.selectSingleNode("fMTUseApplyID").getText());

		KSQL.executeUpdate(sqlNewArrange, param, OADataModel, null);
			
		String addScheduleFlag = arrangeNode.selectSingleNode(
					"faddScheduleFlag").getText();
		Node nodeArrangePsns = arrangeNode.selectSingleNode("arrangePsns");
		if(nodeArrangePsns != null)//参会人员根节点
		{
			List<Element> arrangePsnList = (List<Element>) nodeArrangePsns.selectNodes("arrangePsn");
			if((arrangePsnList != null) && (arrangePsnList.size()>0))//有参会人员
			{
				newArrangePsns(arrangeNode, arrangerID);
			if ("true".equals(addScheduleFlag)) {
					newScheduleByApply(arrangeNode.selectSingleNode("fMTUseApplyID").getText(),arrangerID);
				}
			}
		}
		return arrangerID;
	}

	private static void newArrangePsns(Element arrangeNode,
			String arrangeID) {
		Node nodeArrangePsns = arrangeNode.selectSingleNode("arrangePsns");
		if(nodeArrangePsns == null)
			return;
		List<Element> arrangePsnList = (List<Element>) nodeArrangePsns.selectNodes("arrangePsn");
		String applyID = arrangeNode.selectSingleNode("fMTUseApplyID").getText();
		String sql = "select a.fOrgKind,a.fOrgID,a.fOrgName,a.fPersonID,a.fPersonName,a.fRangeURL,a.fRangeURLName from OA_MT_UseApplyPsns a where a.fMasterID='"+applyID+"'";

		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs = rows.next();
			String sqlNewArrangePsn = "insert into OA_MT_ArrangePsns a("
						+ "a, a.fMasterID, a.fOrgKind, a.fOrgID, a.fOrgName,"
						+ "a.fPersonID, a.fPersonName, a.fRangeURL, a.fRangeURLName, a.version)"
						+ "values(guid(),:arrangeID,:fOrgKind,:fOrgID,:fOrgName,:fPersonID,:fPersonName,:fRangeURL,:fRangeURLName, 0)";
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("arrangeID", arrangeID);
			param.put("fOrgKind", rs.getString("fOrgKind"));
			param.put("fOrgID", rs.getString("fOrgID"));
			param.put("fOrgName", rs.getString("fOrgName"));
			param.put("fPersonID",  rs.getString("fPersonID"));
			param.put("fPersonName", rs.getString("fPersonName"));
			param.put("fRangeURL", rs.getString("fRangeURL"));
			param.put("fRangeURLName", rs.getString("fRangeURLName"));
			KSQL.executeUpdate(sqlNewArrangePsn, param, OADataModel, null);	
		}
	}

	private static String newScheduleByApply(String applyID, String arrangeID) throws Exception {
		String scheduleID = "";
		String sql = "select a.fMeetName,a.fBeginTime,a.fEndTime,a.fDescription,a.fCreatePsnID,a.fCreatePsnName,a.fCreateTime,a.fCreatePsnFID from OA_MT_UseApply a where a='" + applyID + "'";

		Document result = DocumentHelper.createDocument();
		Element rtRoot = result.addElement("root");
		Element schedule = rtRoot.addElement("schedule");

		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			Row rs = rows.next();
			Element fTitle = schedule.addElement("fTitle");
			fTitle.setText(rs.getString("fMeetName"));
			Element fBeginTime = schedule.addElement("fBeginTime");
			fBeginTime.setText(rs.getDateTime("fBeginTime").toString());
			Element fEndTime = schedule.addElement("fEndTime");
			fEndTime.setText(rs.getDateTime("fEndTime").toString());
			Element fContent = schedule.addElement("fContent");
			if (rs.getString("fDescription") == null)
				fContent.setText("");
			else
				fContent.setText(rs.getString("fDescription"));
			Element fIsShared = schedule.addElement("fIsShared");
			fIsShared.setText("1");
			Element fIsRemind = schedule.addElement("fIsRemind");
			fIsRemind.setText("1");
			Element fRemindTime = schedule.addElement("fRemindTime");
			fRemindTime.setText(rs.getDateTime("fBeginTime").toString());
			Element fCreatePsnID = schedule.addElement("fCreatePsnID");
			fCreatePsnID.setText(rs.getString("fCreatePsnID"));
			Element fCreatePsnName = schedule.addElement("fCreatePsnName");
			fCreatePsnName.setText(rs.getString("fCreatePsnName"));
			Element fCreateTime = schedule.addElement("fCreateTime");
			fCreateTime.setText(rs.getDateTime("fCreateTime").toString());
			Element fCreateURL = schedule.addElement("fCreateURL");
			fCreateURL.setText(rs.getString("fCreatePsnFID"));
			Element fBizID = schedule.addElement("fBizID");
			fBizID.setText(arrangeID);
			Element fBizType = schedule.addElement("fBizType");
			fBizType.setText("会议安排");
		}
		String getApplyPsnSql = "select a.fPersonID,a.fPersonName from OA_MT_UseApplyPsns a where a.fMasterID='" + applyID + "'";
		Table tab = KSQL.select(getApplyPsnSql, null, OADataModel, null);
		Iterator<Row> tabs = tab.iterator();
		Element Executors = schedule.addElement("Executors");
		while (tabs.hasNext()) {
			Row rs1 = tabs.next();
			Element Executor = Executors.addElement("Executor");
			Element fExecutorID = Executor.addElement("fExecutorID");
			fExecutorID.setText(rs1.getString("fPersonID"));
			Element fExecutorName = Executor.addElement("fExecutorName");
			fExecutorName.setText(rs1.getString("fPersonName"));
		}

		scheduleID = OAbar.schedule.ScheduleInterface.newSchedule(result);

		return scheduleID;
	}
	
	private static String checkBoardroomUsed(String fBoardroomID, String fBeginTime, String fEndTime, String fArrangeID) {
		String sql = "";
		fBeginTime = fBeginTime.replace("T", " ");
		fEndTime = fEndTime.replace("T", " ");
		fBeginTime = fBeginTime.substring(0, 19);
		fEndTime = fEndTime.substring(0, 19);

		sql = "select r from OA_MT_RoomArrange r where r.fBoardroomID = '" + fBoardroomID + "' and r.fEndTime > stringToDateTime('" + fBeginTime
				+ "') and r.fBeginTime < stringToDateTime('" + fEndTime + "') and r.fEffect = 1";
		if (fArrangeID != null && (!"".equals(fArrangeID))) {
			sql += " and (fID !='" + fArrangeID + "')";
		}
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			return "true";
		} else {
			return "false";
		}

	}
}
