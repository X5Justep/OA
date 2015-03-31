import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.text.DateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;

public class Schedule {
	public static final String OADataModel ="/OA/schedule/data";
	public static final String sysDataModel ="/system/data";
	public static String newSchedule(String fTitle, String fBeginTime,String fEndTime) throws ParseException{
		SimpleDateFormat s = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
		java.util.Date beginTime = s.parse(fBeginTime);
		java.util.Date endTime = s.parse(fEndTime);
		String beginTimePart = String.format("%tR", s.parse(fBeginTime));
		String endTimePart = String.format("%tR", s.parse(fEndTime));

		String currentPsnID = com.justep.oa.SysUtils
				.getCurrentPersonID();
		String currentPsnName = com.justep.oa.SysUtils
				.getCurrentPersonName();
		String currentPsnURL = com.justep.oa.SysUtils
				.getCurrentPersonMemberFID();
		String currentPsnFName = com.justep.oa.SysUtils
		.getCurrentPersonMemberFName();
		String id = java.util.UUID.randomUUID().toString();
		
		String sqlNewSchedule = "insert into OA_SD_Schedule s "
				+ "	(s.version, s, s.fTitle, s.fBeginDatePart, s.fBeginTimePart, s.fBeginTime, "
				+ "		s.fEndDatePart, s.fEndTimePart, s.fEndTime, s.fExecutors, "
				+ "		s.fCreatePsnID, s.fCreatePsnName, s.fCreateURL, s.fCreateTime, s.fIsShared) "
				+ "	values (0, '"+id+"', '"+fTitle+"',:fBeginDatePart,:fBeginTimePart,:fBeginTime,:fEndDatePart,:fEndTimePart,:fEndTime, " 
				+ "'"+currentPsnName+"','"+currentPsnID+"','"+currentPsnName+"','"+currentPsnURL+"',:fCreateTime, 1) ";
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("fBeginDatePart",new java.sql.Date(beginTime.getTime()));
		param.put("fBeginTimePart", beginTimePart);
		param.put("fBeginTime", new java.sql.Timestamp(beginTime.getTime()));
		param.put("fEndDatePart", new java.sql.Date(endTime.getTime()));
		param.put("fEndTimePart", endTimePart);
		param.put("fEndTime",new java.sql.Timestamp(endTime.getTime()));
		param.put("fCreateTime", new java.sql.Timestamp(new java.util.Date().getTime()));
		KSQL.executeUpdate(sqlNewSchedule, param, OADataModel, null);
		
		String sqlNewExecutor = "insert into OA_SD_Executor e"
				+ "	(e.version, e, e.fSDMasterID, e.fExecutorID, e.fExecutorName, e.fExtendStr1) "
				+ "	values (0, guid(), '"+id+"','"+currentPsnID+"','"+currentPsnName+"','"+currentPsnFName+"') ";
		KSQL.executeUpdate(sqlNewExecutor, null, OADataModel, null);

		return id;
	}

	public static void deleteSchedule(String fID) {
		String sqlDelSchedule = "delete from OA_SD_Schedule s where s = '"+fID+"'";
		KSQL.executeUpdate(sqlDelSchedule, null, OADataModel, null);
		
		String sqlDelExecutor = "delete from OA_SD_Executor e where e.fSDMasterID = '"+fID+"'";
		KSQL.executeUpdate(sqlDelExecutor, null, OADataModel, null);
	}

	public static void deleteScheduleByBiz(String fBizID, String fBizType){
		String sqlDelSchedule = "delete from OA_SD_Schedule s where s.fBizID = '"+fBizID+"' and s.fBizType='"+fBizType+"'";
		KSQL.executeUpdate(sqlDelSchedule, null, OADataModel, null);
		
		String sqlDelExecutor = "delete from OA_SD_Executor e where e.fSDMasterID in (select s from OA_SD_Schedule s where s.fBizID = '"+fBizID+"' and s.fBizType='"+fBizType+"')";
		KSQL.executeUpdate(sqlDelExecutor, null, OADataModel, null);

	}

	public static void updateSchedule(String fID, String fTitle,String fBeginTime, String fEndTime) throws ParseException {
		SimpleDateFormat s = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
		java.util.Date beginTime = s.parse(fBeginTime);
		java.util.Date endTime = s.parse(fEndTime);
		DateFormat formatTime = new SimpleDateFormat("HH:mm");
				
		String ksql = "update OA_SD_Schedule s  set s.fTitle = '"+fTitle+"',s.fBeginDatePart = :fBeginDatePart,s.fBeginTimePart = :fBeginTimePart, s.fBeginTime=:fBeginTime, "
				+ "s.fEndDatePart = :fEndDatePart, s.fEndTimePart = :fEndTimePart, s.fEndTime = :fEndTime where s = '"+fID+"' ";
				
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("fBeginDatePart", new java.sql.Date(beginTime.getTime()));
		param.put("fBeginTimePart", formatTime.format(beginTime));
		param.put("fBeginTime", new java.sql.Timestamp(beginTime.getTime()));
		param.put("fEndDatePart", new java.sql.Date(endTime.getTime()));
		param.put("fEndTimePart", formatTime.format(endTime));
		param.put("fEndTime", new java.sql.Timestamp(endTime.getTime()));
		KSQL.executeUpdate(ksql, param, OADataModel, null);

	}

	public static String getCurrentPersonID() {
		return com.justep.oa.SysUtils.getCurrentPersonID();
	}

	public static Document getPortletData(String dateStr, String count){
		Document result = DocumentHelper.createDocument();
		Element items = result.addElement("items");
		int fCount = 0;
		Element itemsCount = items.addElement("COUNT");

			String sql = "";
			String currentPsnID = getCurrentPersonID();
			sql = "select s, s.fTitle, s.fBeginTime, s.fEndTime, s.fCreatePsnName, s.fContent FROM OA_SD_Schedule s"
					+ "	where s IN (select e.fSDMasterID FROM OA_SD_Executor e WHERE e.fExecutorID = '"+currentPsnID+"') "
					+ "	AND (s.fBeginDatePart < stringToDate('"+dateStr+"') OR s.fBeginDatePart = stringToDate('"+dateStr+"')) "
					+ " AND (s.fEndDatePart > stringToDate('"+dateStr+"') OR s.fEndDatePart = stringToDate('"+dateStr+"')) "
					+ "	ORDER BY  s.fBeginTimePart ASC limit 0,"+Integer.parseInt(count)+"";
			Table table = KSQL.select(sql, null, OADataModel, null);
			Iterator<Row> rows = table.iterator();
			while (rows.hasNext()) {
				Row rs = rows.next();
				Element item = items.addElement("items");
				Element key = item.addElement("FID");
				Element fTitle = item.addElement("FTITLE");
				Element fBeginTime = item.addElement("FBEGINTIME");
				Element fEndTime = item.addElement("FENDTIME");
				Element fCreatePsnName = item.addElement("FCREATEPSNNAME");
				Element fContent = item.addElement("FCONTENT");
				key.setText(rs.getString("s"));
				fTitle.setText(rs.getString("fTitle"));
				fBeginTime.setText(rs.getDateTime("fBeginTime").toString());
				fEndTime.setText(rs.getDateTime("fEndTime").toString());
				fCreatePsnName.setText(rs.getString("fCreatePsnName"));
				fContent.setText(rs.getString("fContent")==null?"":rs.getString("fContent"));
				fCount++;

			}
			itemsCount.setText(String.valueOf(fCount));

			return result;
	
	}

	public static void deleteScheduleExecutorsByID(String fMasterID) {
		String sql = "delete  from OA_SD_Executor e WHERE e.fSDMasterID='" + fMasterID + "'";
		KSQL.executeUpdate(sql, null, OADataModel, null);
	}


	public static String isValidate(String beginDate, String title,
			String name, String endDate) {
		String fTitle = "\n";
		beginDate = beginDate.substring(0, 10);
		endDate = endDate.substring(0, 10);

		String sql = "select s.fTitle from OA_SD_ScheduleEsp s where (s.fEndDatePart>=stringToDate('"
					+ beginDate+"') and s.fBeginDatePart<=stringToDate('" + beginDate + "')"
					+ "or s.fEndDatePart>=stringToDate('" + endDate + "')"
					+ "and s.fBeginDatePart<=stringToDate('" + endDate + "'))"
					+ " and s.fExecutors like '%" + name + "%'"
					+ " and s.fTitle<> '" + title + "'";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs = rows.next();		
			fTitle += rs.getString("fTitle") + "\n";
		}
		return fTitle;
	}

	public static String isValidatePerson(String fID,String rowID) {
		String fExecutorName = "";
		String sql = "select p.fExecutorName from OA_SD_especialSchedulePerson p where p.fExecutorID='"
				+ fID + "' and p <> '"+rowID+"'";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs = rows.next();
			fExecutorName = rs.getString("fExecutorName");
		}
		return fExecutorName;
	}

	public static void deleteExecutorAndUpdateExecutor(String deleteId, String names) {
		String [] deleteIdAry = deleteId.split(",");
		String [] deleteNameAry = names.split(",");
		String sql = "";

		for (int i = 1; i < deleteIdAry.length; i++) {
            sql = "delete from OA_SD_Executor e where e.fExecutorID='"+deleteIdAry[i]+"'";
            KSQL.executeUpdate(sql, null, OADataModel, null);
		}
		for(int j=1;j<deleteNameAry.length;j++){
			sql = "update OA_SD_ScheduleEsp s  set s.fExecutors=replace(replace(replace(fexecutors,'"+deleteNameAry[j]+",',''),',"+deleteNameAry[j]+"',''),'"+deleteNameAry[j]+"','')";
			KSQL.executeUpdate(sql, null, OADataModel, null);
		}
	}



	public static String checkPerson(String fID,String rowID){
		String fExecutorName = "";
		String sql = "select p.fExecutorName from OA_SD_especialSchedulePerson p where p.fExecutorID='"
				+ fID + "' and p <> '"+rowID+"'";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs = rows.next();
			fExecutorName = rs.getString("fExecutorName");
		}
		return fExecutorName;
	}
}