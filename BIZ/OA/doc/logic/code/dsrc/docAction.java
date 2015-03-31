import java.sql.*;
import java.util.Iterator;

import com.justep.model.ModelUtils;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.context.ContextHelper;


public class docAction {
	public static final String OADataModel ="/OA/doc/data";
	/**
	 * 根据ID获取文件信息
	 * 
	 * @param docId
	 * @return
	 * @throws Exception
	 */
	public static Table getDocById(String docId) throws Exception {
		String ksql = "select OA_DC_Doc.fTitle,OA_DC_Doc.fKeyword,OA_DC_Doc.fCreateDeptID,OA_DC_Doc.fCreateDeptName,OA_DC_Doc.fIssueDate,"
				+ "OA_DC_Doc.fTemplate,OA_DC_Doc.fAttachment,OA_DC_Doc.fAttachmentName,OA_DC_Doc.fDocNumber,OA_DC_Doc.fDocKind,OA_DC_Doc.fDocKindName,"
				+ "OA_DC_Doc.fDocKindCode,OA_DC_Doc.fDocExigenceLevel,OA_DC_Doc.fDocExigenceLevelCode,OA_DC_Doc.fDocExigenceLevelName,"
				+ "OA_DC_Doc.fDocSecretLevel,OA_DC_Doc.fDocSecretLevelCode,OA_DC_Doc.fDocSecretLevelName,OA_DC_Doc.fCopies,OA_DC_Doc.fSourceDeptID," 
				+ "OA_DC_Doc.fSourceDept,OA_DC_Doc.fSourceDate,OA_DC_Doc.fSourceDocNumber "
				+ "from OA_DC_Doc OA_DC_Doc "
				+ "where OA_DC_Doc = '"
				+ docId
				+ "'";
		Table result = KSQL.select(ksql, null, OADataModel, null);
		return result;
	}

	/**
	 * 檢查文件標題是否已經存在
	 * 
	 * @param fTitle
	 * @param fDocType
	 * @param rowid
	 * @return
	 * @throws Exception
	 */
	public static String checkTitle(String fTitle, String fDocType, String rowid) {
		String sql = "select d from OA_DC_Doc d where d.fTitle = '" + fTitle
					+ "' and d.fDocType = '" + fDocType + "' and d <> '"
					+ rowid + "'";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			return "1";
		} else {
			return "0";
		}

	}

	/**
	 * 检查文件编号是否已经存在
	 * 
	 * @param fDocNumber
	 * @param rowid
	 * @return
	 * @throws Exception
	 */
	public static String checkDocNumber(String fDocNumber, String rowid){

		String sql = "select d from OA_DC_Doc d where d.fDocNumber = '"
					+ fDocNumber + "' and d <> '" + rowid + "'";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {		
			return "1";
		} else {
			return "0";
		}
	}

	/**
	 * 检查公文文号是否重复
	 * 
	 * @param fOrgLetterName
	 * @param fOrgYear
	 * @param fOrgNum
	 * @param rowid
	 * @return
	 * @throws Exception
	 */
	public static String checkOrgNum(String fOrgLetterName, String fOrgYear,
			String fOrgNum, String rowid){
		String sql = "select d from OA_DC_Doc d where d.fOrgLetterName = '"
					+ fOrgLetterName + "' and d.fOrgYear = '" + fOrgYear
					+ "' and d.fOrgNum = '" + fOrgNum + "' and d <> '" + rowid
					+ "'";

		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {	
			return "1";
		} else {
			return "0";
		}

	}

	/**
	 * 获取环节处理人信息
	 * 
	 * @param activity
	 * @param rowid
	 * @return
	 */
	public static Table getMeetingPsnIDs(String activity, String rowid){
		String ksql = "select OA_DC_DocExecute.fCreatePsnID,OA_DC_DocExecute.fCreatePsnName,OA_DC_DocExecute.fUpdateTime from OA_DC_DocExecute OA_DC_DocExecute where OA_DC_DocExecute.fMasterID = '"
				+ rowid
				+ "' and OA_DC_DocExecute.fActivityFName like '%"
				+ activity + "'";
		Table result = KSQL.select(ksql, null, OADataModel, null);
		return result;
	}

	/**
	 * 添加文件关联
	 * 
	 * @param docId
	 * @param relevanceId
	 * @return
	 * @throws Exception
	 */
	public static String addRelevance(String docId, String relevanceId) {
		String sql = null, sql1 = null, sql2 = null;
		String aRelevanceID = null, bRelevanceID = null, aRelevanceName = null, bRelevanceName = null;
		String bTitle = null;
		String[] relevanceIDs = relevanceId.split(",");
		String result = "";

		for (int i = 0; i < relevanceIDs.length; i++) {
			sql1 = "select d.fRelevanceID,d.fRelevanceName from OA_DC_Doc d where d = '" + docId + "'";
			Table table = KSQL.select(sql1, null, OADataModel, null);
			Iterator<Row> rows = table.iterator();
			while (rows.hasNext()) {
				Row rs1 = rows.next();
				aRelevanceID = (rs1.getString("fRelevanceID") == null) ? "" : rs1.getString("fRelevanceID");
				aRelevanceName = rs1.getString("fRelevanceName");

				sql2 = "select d.fRelevanceID,d.fRelevanceName,d.fTitle from OA_DC_Doc d where d = '" + relevanceIDs[i] + "'";
				Table tab = KSQL.select(sql2, null, OADataModel, null);
				Iterator<Row> tabs = tab.iterator();
				if (tabs.hasNext()) {
					Row rs2 = tabs.next();
					bRelevanceID = (rs2.getString("fRelevanceID") == null) ? "" : rs2.getString("fRelevanceID");
					bRelevanceName = rs2.getString("fRelevanceName");
					bTitle = rs2.getString("fTitle");
				}

				if (aRelevanceID.equals("")) {
					if ("".equals(bRelevanceID)) {
						sql = "update OA_DC_Doc d set d.fRelevanceID = '" + relevanceIDs[i] + "' ,d.fRelevanceName = '" + bTitle + "' where d = '"
								+ docId + "' or d = '" + relevanceIDs[i] + "'";
						KSQL.executeUpdate(sql, null, OADataModel, null);
						result = relevanceIDs[i];
					} else {
						sql = "update OA_DC_Doc d set d.fRelevanceID = '" + bRelevanceID + "' ,d.fRelevanceName = '" + bRelevanceName
								+ "' where d = '" + docId + "'";
						KSQL.executeUpdate(sql, null, OADataModel, null);
						result = bRelevanceID;
					}
				} else {
					if ("".equals(bRelevanceID)) {
						sql = "update OA_DC_Doc d set d.fRelevanceID = '" + aRelevanceID + "' ,d.fRelevanceName = '" + aRelevanceName
								+ "' where d.fRelevanceID = '" + aRelevanceID + "' or d = '" + relevanceIDs[i] + "'";
						KSQL.executeUpdate(sql, null, OADataModel, null);
						result = aRelevanceID;
					} else {
						sql = "update OA_DC_Doc d set d.fRelevanceID = '" + bRelevanceID + "' ,d.fRelevanceName = '" + bRelevanceName
								+ "' where d.fRelevanceID = '" + aRelevanceID + "'";
						KSQL.executeUpdate(sql, null, OADataModel, null);
						result = bRelevanceID;
					}
				}
			}
		}
		return result;
	}

	/**
	 * 删除文件关联
	 * 
	 * @param relevanceId
	 * @throws Exception
	 */
	public static void deleteRelevance(String relevanceId) {
		String sql = "";	
		sql = "select COUNT(d) as ct from OA_DC_Doc d where d.fRelevanceID = '" + relevanceId + "'";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			Row rs = rows.next();
			if (rs.getInt("ct") == 1) {
				sql = "update OA_DC_Doc d set d.fRelevanceID = '' ,d.fRelevanceName = '' where d.fRelevanceID = '" + relevanceId + "'";
				KSQL.executeUpdate(sql, null, OADataModel, null);
			}
		}
	}

	/**
	 * 修改文件关联名称
	 * 
	 * @param relevanceID
	 * @param sResult
	 * @throws Exception
	 */
	public static void updateRelevance(String relevanceID, String sResult) {
		String sql = "update OA_DC_Doc d set d.fRelevanceName = '" + sResult
					+ "' where d.fRelevanceID = '" + relevanceID + "'";
		KSQL.executeUpdate(sql, null, OADataModel, null);
	}

}