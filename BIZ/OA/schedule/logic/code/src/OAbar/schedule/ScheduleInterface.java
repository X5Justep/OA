package OAbar.schedule;
import java.text.SimpleDateFormat;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.Node;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.justep.system.data.KSQL;

public class ScheduleInterface {
	public static final String OADataModel ="/OA/schedule/data";
	public static String newSchedule(Document dom) throws Exception {
		Element root = dom.getRootElement();
		Element scheduleNode = (Element) (root.selectSingleNode("schedule"));
		String scheduleID = "";
		if (scheduleNode == null)
			throw new Exception("没有找到schedule节点");

		scheduleID = newScheduleData(scheduleNode);
		return scheduleID;
	}

	private static String newScheduleData(Element scheduleNode)
			throws Exception {
		String scheduleID = java.util.UUID.randomUUID().toString();
		SimpleDateFormat s = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		
		String sqlDeleteExecutor = String
		.format(
				"delete from OA_SD_Executor e where e.fSDMasterID in(select s from OA_SD_Schedule s where s.fBizID='%s' and s.fBizType='%s')",
				scheduleNode.selectSingleNode("fBizID").getText(),
				scheduleNode.selectSingleNode("fBizType").getText());
		KSQL.executeUpdate(sqlDeleteExecutor, null, OADataModel, null);
		
		String sqlDeleteSchedule = String
				.format(
						"delete from OA_SD_Schedule s where s.fBizID='%s' and s.fBizType='%s'",
						scheduleNode.selectSingleNode("fBizID").getText(),
						scheduleNode.selectSingleNode("fBizType").getText());
		KSQL.executeUpdate(sqlDeleteSchedule, null, OADataModel, null);

		String fBeginTime = scheduleNode.selectSingleNode("fBeginTime").getText();
		if(fBeginTime == null ||("".equals(fBeginTime)))
			throw new Exception("开始时间不能为空!");
		String fEndTime = scheduleNode.selectSingleNode("fEndTime")
				.getText();
		if(fEndTime == null ||("".equals(fEndTime)))
			throw new Exception("结束时间不能为空!");
		fBeginTime = fBeginTime.replace("T", " ");
		fEndTime = fEndTime.replace("T", " ");
		java.util.Date beginTime = s.parse(fBeginTime);
		java.util.Date endTime = s.parse(fEndTime);
		String beginTimePart = String.format("%tR", s.parse(fBeginTime));
		String endTimePart = String.format("%tR", s.parse(fEndTime));
		if (beginTime.after(endTime)) {
			throw new Exception("结束时间必须大于开始时间");
		}
		String fContent = scheduleNode.selectSingleNode("fContent")
				.getText();
		String fRemindTime = scheduleNode.selectSingleNode("fRemindTime")
				.getText();
		if(fRemindTime != null)
			fRemindTime =fRemindTime.replace("T", " ");
		String fCreateTime = scheduleNode.selectSingleNode("fCreateTime")
				.getText();
		if(fCreateTime != null)
			fCreateTime = fCreateTime.replace("T", " ");
		java.util.Date createTime = s.parse(fCreateTime);
		String executorNames = "";
		Node nodeExecutor = scheduleNode.selectSingleNode("./Executors");
		if(nodeExecutor == null)
			throw new Exception("");
		List<Element> ExecutorInfos = (List<Element>) nodeExecutor
				.selectNodes("./Executor");
		for (Element executor : ExecutorInfos) {
			executorNames += executor.selectSingleNode("./fExecutorName")
					.getText()
					+ ",";
		}
		
		
		String sqlNewSchedule = "insert into OA_SD_Schedule s"
			+ "		(s, s.version, s.fTitle, s.fBeginDatePart, s.fBeginTimePart, s.fBeginTime, "
			+ "		s.fEndDatePart, s.fEndTimePart, s.fEndTime, "
			+ "		s.fContent, s.fExecutors, s.fIsShared, s.fIsRemind, "
			+ "		s.fRemindDatePart, s.fRemindTimePart, s.fRemindTime,"
			+ "		s.fCreatePsnID, s.fCreatePsnName, s.fCreateTime, s.fCreateURL, s.fBizID, s.fBizType) "
			+ "	values(:scheduleID,0,:fTitle,:fBeginDatePart,:fBeginTimePart,:fBeginTime,:fEndDatePart,:fEndTimePart,:fEndTime,:fContent,:fExecutors," 
			+ ":fIsShared,:fIsRemind,:fRemindDatePart,:fRemindTimePart,:fRemindTime,:fCreatePsnID,:fCreatePsnName,:fCreateTime,:fCreateURL,:fBizID,:fBizType) ";
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("scheduleID", scheduleID);
		param.put("fTitle", scheduleNode.selectSingleNode("fTitle").getText());
		param.put("fBeginDatePart",  new java.sql.Date(beginTime.getTime()));
		param.put("fBeginTimePart",  beginTimePart);
		param.put("fBeginTime",  new java.sql.Timestamp(beginTime.getTime()));
		param.put("fEndDatePart", new java.sql.Date(endTime.getTime()));
		param.put("fEndTimePart",endTimePart);
		param.put("fEndTime",new java.sql.Timestamp(endTime.getTime()));
		if (fContent == null)
			param.put("fContent",java.sql.Types.NULL);
		else
			param.put("fContent",scheduleNode.selectSingleNode("fContent").getText());
		param.put("fExecutors",executorNames);
		param.put("fIsShared",Integer.parseInt(scheduleNode.selectSingleNode("fIsShared").getText()));
		param.put("fIsRemind",Integer.parseInt(scheduleNode.selectSingleNode("fIsRemind").getText()));
		if ("".equals(fRemindTime)) {
			param.put("fRemindDatePart",java.sql.Types.NULL);
			param.put("fRemindTimePart",java.sql.Types.NULL);
			param.put("fRemindTime",java.sql.Types.NULL);
		} else {
			java.util.Date remindTime = s.parse(fRemindTime);
			String remindTimePart = String.format("%tR", s
					.parse(fRemindTime));
			param.put("fRemindDatePart",new java.sql.Date(remindTime.getTime()));
			param.put("fRemindTimePart",remindTimePart);
			param.put("fRemindTime",new java.sql.Timestamp(remindTime.getTime()));
		}
		param.put("fCreatePsnID",scheduleNode.selectSingleNode("fCreatePsnID")
					.getText());
		param.put("fCreatePsnName",scheduleNode.selectSingleNode("fCreatePsnName")
					.getText());
		param.put("fCreateTime",new java.sql.Timestamp(createTime.getTime()));
		param.put("fCreateURL", scheduleNode.selectSingleNode("fCreateURL")
					.getText());
		param.put("fBizID", scheduleNode.selectSingleNode("fBizID")
					.getText());
		param.put("fBizType", scheduleNode.selectSingleNode("fBizType")
					.getText());
		KSQL.executeUpdate(sqlNewSchedule, param, OADataModel, null);
	

		newScheduleExecutors(scheduleNode, scheduleID);
		return scheduleID;
	}

	private static void newScheduleExecutors(Element scheduleNode, String scheduleID) throws Exception {
		String executorIDs = "";
		String executorNames = "";
		Node nodeExecutor = scheduleNode.selectSingleNode("./Executors");
		List<Element> ExecutorInfos = (List<Element>) nodeExecutor
				.selectNodes("./Executor");
		for (Element executor : ExecutorInfos) {
			executorIDs += executor.selectSingleNode("./fExecutorID").getText()
					+ ",";
			executorNames += executor.selectSingleNode("./fExecutorName")
					.getText()
					+ ",";
		}
		String[] executorIDArray = executorIDs.split(",");
		String[] executorNameArray = executorNames.split(",");
		
		for (int k = 0; k < executorIDArray.length; k++) {
			if ("".equals(executorIDArray[k]))
				continue;
			String sqlNewExceutor = "insert into OA_SD_Executor e"
					+ "(e,e.version,e.fSDMasterID,e.fExecutorID,e.fExecutorName,e.fRemark) "
					+ "values(guid(), 0,:fSDMasterID, :fExecutorID,:fExecutorName,:fRemark)";
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("fSDMasterID", scheduleID);
			param.put("fExecutorID", executorIDArray[k]);
			param.put("fExecutorName", executorNameArray[k]);
			param.put("fRemark", "");
			KSQL.executeUpdate(sqlNewExceutor, param, OADataModel, null);

		}
	}
}
