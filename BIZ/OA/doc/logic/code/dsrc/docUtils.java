import org.dom4j.*;
import java.sql.*;
import java.util.*;

import com.justep.model.ModelUtils;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.util.CommonUtils;
import com.justep.system.context.ContextHelper;
public class docUtils {
	public static final String OADataModel ="/OA/doc/data";
	/**
	 * 记录阅文人
	 * 
	 * @param docID
	 * @param personID
	 * @throws Exception
	 */
	public static void recordReaded(String docID, String personID){
		String sqlGet = "select d.fReaderIDs from OA_DC_Doc d where d = '"
					+ docID + "'";
		Table table = KSQL.select(sqlGet, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			Row rs = rows.next();
			String fReaderIDs = "";
			fReaderIDs = rs.getString("fReaderIDs");
			if (fReaderIDs == "" || fReaderIDs == null) {
				fReaderIDs = personID;
			} else {
				if (fReaderIDs.indexOf(personID) == -1) {
					fReaderIDs += ", " + personID;
				}
			}
			String sqlUpdate = "update OA_DC_Doc d set d.fReaderIDs = '"
								+ fReaderIDs + "' where d = '" + docID + "'";
			KSQL.executeUpdate(sqlUpdate, null, OADataModel, null);
		}
	}

	/**
	 * 记录收文机构
	 * 
	 * @param fSendDocId
	 * @param currentOgnId
	 * @throws Exception
	 */
	public static void recordReceived(String fSendDocId, String currentOgnId) {

		String sqlGet = "select d.fReceiveOgnIDs from OA_DC_Doc d where d = '" + fSendDocId + "'";
		Table table = KSQL.select(sqlGet, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			Row rs = rows.next();
			String receiveOgnIDs = "";
			receiveOgnIDs = rs.getString("fReceiveOgnIDs");
			if (receiveOgnIDs == "" || receiveOgnIDs == null) {
				receiveOgnIDs = currentOgnId;
			} else {
				if (receiveOgnIDs.indexOf(currentOgnId) == -1) {
					receiveOgnIDs += ", " + currentOgnId;
				}
			}
			String sqlUpdate = "update OA_DC_Doc d set d.fReceiveOgnIDs = '"
					+ receiveOgnIDs + "' where d = '" + fSendDocId + "'";
			KSQL.executeUpdate(sqlUpdate, null, OADataModel, null);
		}
	}

	/**
	 * 设置阅文范围
	 * 
	 * @param docID
	 * @param dom
	 * @throws Exception
	 */
	public static String setReaderRange(String docID, Document dom) {
		String result = "";

		String fCreatePsnID = com.justep.oa.SysUtils.getCurrentPersonID();
		String fCreatePsnName = com.justep.oa.SysUtils.getCurrentPersonName();

		String sql1 = "", sql2 = "";
		List<Node> nodes = dom.selectNodes("/root/OA_DC_ReaderRange");
		for (Node node : nodes) {
			String psnID = node.selectSingleNode("fPersonID").getText();
			sql1 = "select r.fPersonName from OA_DC_ReaderRange r where r.fMasterID='" + docID + "' and r.fPersonID = '" + psnID + "'";
			Table table = KSQL.select(sql1, null, OADataModel, null);
			Iterator<Row> rows = table.iterator();
			if (rows.hasNext()) {
				Row rs = rows.next();
				if (result == "") {
					result = rs.getString("fPersonName");
				} else {
					result = result + "," + rs.getString("fPersonName");
				}
			} else {
				sql2 = "insert into OA_DC_ReaderRange r(r,r.fMasterID,r.fOrgTreeID,r.fOrgKind,r.fOrgID,r.fOrgName,"
						+ "r.fPersonID,r.fPersonName,r.fRangeURL,r.fRangeURLName,r.fCreatePsnID,r.fCreatePsnName,r.fCreateTime,r.version) "
						+ " values(guid(),'" + docID + "','"
						+ node.selectSingleNode("fOrgTreeID").getText()
						+ "','"
						+ node.selectSingleNode("fOrgKind").getText()
						+ "','"
						+ node.selectSingleNode("fOrgID").getText()
						+ "','"
						+ node.selectSingleNode("fOrgName").getText()
						+ "','"
						+ node.selectSingleNode("fPersonID").getText()
						+ "','"
						+ node.selectSingleNode("fPersonName").getText()
						+ "','"
						+ node.selectSingleNode("fRangeURL").getText()
						+ "','"
						+ node.selectSingleNode("fRangeURLName").getText()
						+ "','"
						+ fCreatePsnID
						+ "','"
						+ fCreatePsnName
						+ "',:fCreateTime,0)";
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("fCreateTime", CommonUtils.getCurrentDateTime());
				KSQL.executeUpdate(sql2, param, OADataModel, null);
			}
		}
		return result;
	}

	/**
	 * 获取阅文范围
	 * 
	 * @param docID
	 * @return
	 * @throws Exception
	 */
	public static Table getReaderRange(String docID){
		String ksql = "select OA_DC_ReaderRange.fRangeURL, OA_DC_ReaderRange.fRangeURLName from OA_DC_ReaderRange OA_DC_ReaderRange where OA_DC_ReaderRange.fMasterID = '"
				+ docID + "'";
		Table result = KSQL.select(ksql, null, "/OA/data", null);
		return result;
	}

	/**
	 * 获取公文发送范围
	 * 
	 * @param docID
	 * @return
	 * @throws Exception
	 */
	public static Table getReceiveRange(String docID) throws Exception {
		String ksql = "select OA_DC_ReceiveRange.fRangeURL, OA_DC_ReceiveRange.fRangeURLName "
				+ "	from OA_DC_ReceiveRange OA_DC_ReceiveRange where OA_DC_ReceiveRange.fMasterID = '"
				+ docID + "'";
		Table result = KSQL.select(ksql, null, "/OA/data", null);
		return result;
	}

	/**
	 * 设置公文发送范围
	 * 
	 * @param docID
	 * @param dom
	 */
	public static void setReceiveRange(String docID, Document dom){
		String fCreatePsnID = com.justep.oa.SysUtils.getCurrentPersonID();
		String fCreatePsnName = com.justep.oa.SysUtils.getCurrentPersonName();

		List<Node> nodes = dom.selectNodes("/root/OA_DC_ReceiveRange");

		String sql1 = "delete from OA_DC_ReceiveRange r where r.fMasterID = '" + docID + "'";
		KSQL.executeUpdate(sql1, null, OADataModel, null);
		for (Node node : nodes) {
			String sql2 = "insert into OA_DC_ReceiveRange r(r,r.fMasterID,r.fRangeURL,r.fRangeURLName,r.fCreatePsnID,r.fCreatePsnName,r.fCreateTime,r.version) " 
						+ "values(guid(),'" + docID + "','"
						+ node.selectSingleNode("fRangeURL").getText()
						+ "','"
						+ node.selectSingleNode("fRangeURLName").getText()
						+ "','"
						+ fCreatePsnID
						+ "','"
						+ fCreatePsnName + "',:fCreateTime,0)";
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("fCreateTime", CommonUtils.getCurrentDateTime());
			
			KSQL.executeUpdate(sql2, param, OADataModel, null);
		}
	}

	private static String getFilterOfNumbers(String field) {
		String filterCondition = "";
		String psnID = com.justep.oa.SysUtils.getCurrentPersonID();
		Collection<String> memberFIDs = com.justep.oa.SysUtils.getAllPersonMemberFIDs();
		for (String memberFullID : memberFIDs) {
			String psnFullID = memberFullID + "/" + psnID + ".psn";
			String[] psnFullIDSplit = psnFullID.split("/");

			String psnFullIDPart = "";
			for (int j = 0; j < psnFullIDSplit.length; j++) {
				String splitID = psnFullIDSplit[j];
				if (psnFullIDPart == "") {
					psnFullIDPart = splitID;
				} else {
					psnFullIDPart = psnFullIDPart + "/" + splitID;
				}

				String condition = "(" + field + " = '" + psnFullIDPart + "')";
				if (filterCondition.indexOf(condition) < 0) {
					if (filterCondition == "") {
						filterCondition = condition;
					} else {
						filterCondition = filterCondition + " or " + condition;
					}
				}
			}
		}
		return filterCondition;
	}

	public static Table getWaitReadDoc(Integer count) throws Exception {
		String personID = com.justep.oa.SysUtils.getCurrentPersonID();
		String numbersFilter = getFilterOfNumbers("OA_DC_ReaderRange.fRangeURL");
		if (!numbersFilter.equals("")) {
			numbersFilter = " AND (" + numbersFilter + ")";
		}
		String ksql = String.format(
				"SELECT distinct OA_DC_Doc,OA_DC_Doc.fDocType,OA_DC_Doc.fTitle, OA_DC_Doc.fCreateDeptName, OA_DC_Doc.fCreatePsnName, OA_DC_Doc.fCreateTime "
				+ "	FROM OA_DC_Doc OA_DC_Doc join OA_DC_ReaderRange OA_DC_ReaderRange on OA_DC_Doc = OA_DC_ReaderRange.fMasterID "
				+ "	WHERE NOT OA_DC_Doc IN (SELECT OA_DC_DocExecute.fMasterID FROM OA_DC_DocExecute OA_DC_DocExecute WHERE OA_DC_DocExecute.fActivityFName = 'readerOpinion' AND OA_DC_DocExecute.fCreatePsnID = '%s' and OA_DC_DocExecute.fMasterID is not null ) %s "
				+ "	ORDER BY OA_DC_Doc.fCreateTime desc ", personID,
		numbersFilter);
		Table result = KSQL.select(ksql, null, "/OA/doc/data", null);
		return result;
	}

	public static Table getWaitReceiveDoc(Integer count) throws Exception {
		String ognID = com.justep.oa.SysUtils.getCurrentOgnID();
		String numbersFilter = getFilterOfNumbers("OA_DC_ReceiveRange.fRangeURL");
		if (!numbersFilter.equals("")) {
			numbersFilter = " AND (" + numbersFilter + ")";
		}
		String ksql = String.format(
				"SELECT OA_DC_Doc, OA_DC_Doc.fTitle, OA_DC_Doc.fCreateOgnName, Max(OA_DC_ReceiveRange.fCreatePsnName) AS fCreatePsnName, Max(OA_DC_ReceiveRange.fCreateTime) AS fCreateTime "
				+ "	FROM OA_DC_Doc OA_DC_Doc join OA_DC_ReceiveRange OA_DC_ReceiveRange on OA_DC_Doc = OA_DC_ReceiveRange.fMasterID "
				+ "	WHERE NOT OA_DC_Doc IN (SELECT OA_DC_Doc.fSendDocID FROM OA_DC_Doc OA_DC_Doc WHERE OA_DC_Doc.fCreateOgnID = '%s' AND OA_DC_Doc.fSendDocID is not null) %s "
				+ "	GROUP BY OA_DC_Doc, OA_DC_Doc.fTitle, OA_DC_Doc.fCreateOgnName "
				+ "	ORDER BY fCreateTime desc ", ognID, numbersFilter);
		Table result = KSQL.select(ksql, null, "/OA/doc/data", null);
		return result;
	}
	
	public static void setReaderOpinionToTask(String fOpinion,String fMasterID){
		String currerntOgnID = com.justep.oa.SysUtils.getCurrentOgnID();
		String currerntOgnName = com.justep.oa.SysUtils.getCurrentOgnName();
		String currerntDeptID = com.justep.oa.SysUtils.getCurrentDeptID();
		String currerntDeptName = com.justep.oa.SysUtils.getCurrentDeptName();
		String currerntPosID = com.justep.oa.SysUtils.getCurrentPosID();
		String currerntPosName = com.justep.oa.SysUtils.getCurrentPosName();
		String currerntPsnID = com.justep.oa.SysUtils.getCurrentPersonID();
		String currerntPsnName = com.justep.oa.SysUtils.getCurrentPersonName();
		String currerntPsnFID = com.justep.oa.SysUtils.getCurrentPersonMemberFID();
		String currerntPsnFName = com.justep.oa.SysUtils.getCurrentPersonMemberFName();
		String qsql = "select t from SA_Task t where t.sExecutorPersonID='"+currerntPsnID+"' and t.sData1='"+fMasterID+"' and t.sActivity='readerOpinion'";
		System.out.print("查找数据=="+qsql);
		Table result = KSQL.select(qsql, null, "/system/data", null);
		Iterator<Row> rows = result.iterator();
		String sql = "";
		if(rows.hasNext()){
			sql = "update SA_Task t set t.sContent='"+fOpinion+"',t.sActualFinishTime=:currentDateTime where t.sExecutorPersonID='"+currerntPsnID+"' and t.sData1='"+fMasterID+"' and t.sActivity='readerOpinion'";
			Map<String,Object> params = new HashMap<String,Object>();
			
			System.out.print("修改数据=="+sql);
			
			params.put("currentDateTime", com.justep.oa.SysUtils.getCurrentDateTime());
		
			KSQL.executeUpdate(sql, params, "/system/data", null);
		}else{
			String ksql = "select t from SA_Task t where t.sData1='"+fMasterID+"' and t.sKindID='tkProcessInstance'";
			Table table = KSQL.select(ksql, null, "/system/data", null);
			Iterator<Row> its = table.iterator();
			String sParent = "";
			while(its.hasNext()){
				Row row = its.next();
				sParent = row.getString("t");
			}			
			sql = "insert into SA_Task t(t,t.sParent,t.sFlowID,t.sActivityName,t.sData1,t.sActivity,t.sStatusID,t.sStatusName,t.sExecutorOgnID,t.sExecutorOgnName,t.sExecutorDeptID,t.sExecutorDeptName,t.sExecutorPosID,t.sExecutorPosName,t.sExecutorPersonID,t.sExecutorPersonName,t.sExecutorFID,t.sExecutorFName,t.sActualStartTime,t.sActualFinishTime,t.sTypeName,t.sContent,t.sKindID,t.version) " 
				+ "values(guid(),'"+sParent+"','"+sParent+"','传阅意见','"+fMasterID+"','readerOpinion','tesFinished','已完成','"+currerntOgnID+"','"+currerntOgnName+"','"+currerntDeptID+"','"+currerntDeptName+"','"+currerntPosID+"','"+currerntPosName+"','"+currerntPsnID+"','"+currerntPsnName+"','"+currerntPsnFID+"','"+currerntPsnFName+"',:currentDateTime,:currentDateTime,'阅文意见','"+fOpinion+"','tkTask',0)";
			System.out.print("插入数据=="+sql);
			Map<String,Object> params = new HashMap<String,Object>();
			params.put("currentDateTime", com.justep.oa.SysUtils.getCurrentDateTime());
		
			KSQL.executeUpdate(sql, params, "/system/data", null);
		}
	}
}