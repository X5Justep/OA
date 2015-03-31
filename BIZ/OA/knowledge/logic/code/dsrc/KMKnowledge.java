import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;
import java.util.HashMap;
import java.util.List;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Node;
import org.json.JSONException;
import org.json.JSONObject;

import com.justep.oa.SysUtils;
import com.justep.system.data.BizData;
import com.justep.system.data.DataPermission;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.util.CommonUtils;
import it.sauronsoftware.base64.Base64;
public class KMKnowledge {
	public static final String OADataModel ="/OA/knowledge/data";
	/**
	 * 判断当前人是否有权限创建知识
	 * 
	 * @param folderID
	 * @return
	 * @throws Exception
	 */
	public static boolean canCreateKW(String folderID) {
		boolean result = false;

		Collection<String> memberFullIDs = com.justep.oa.SysUtils.getAllPersonMemberFIDs();
		String orgCondition = null;
		for (String memberFullID : memberFullIDs) {
			if (orgCondition == null) {
				orgCondition = "'" + memberFullID + "' like concat(r.fOrgFID ,'%')";
			} else {
				orgCondition += " or '" + memberFullID + "' like concat(r.fOrgFID  ,'%')";
			}

			String sql = "select r from OA_KM_Rights r where r.fKWKind = 'Folder' and r.fFolderID='" + folderID + "' "
					+ " and r.fCanCreateKW = 1 and (" + orgCondition + ")";

			Table table = KSQL.select(sql, null, OADataModel, null);
			Iterator<Row> rows = table.iterator();
			if (rows.hasNext()) {
				result = true;
			}

		}

		return result;
	}

	/**
	 * 判断当前人是否有权限发布知识
	 * 
	 * @param folderID
	 * @return
	 * @throws Exception
	 */
	public static boolean canReleaseKW(String folderID){
		boolean result = false;

		String psnID = com.justep.oa.SysUtils.getCurrentPersonID();
		Collection<String> memberFullIDs = com.justep.oa.SysUtils.getAllPersonMemberFIDs();
		String orgCondition = null;
		for (String memberFullID : memberFullIDs) {
			if (orgCondition == null) {
				orgCondition = "concat('" + memberFullID + "','/','" + psnID + "','.psn') like concat(r.fOrgFID,'%')";
			} else {
				orgCondition += " or concat('" + memberFullID + "','/','" + psnID + "','.psn') like concat(r.fOrgFID,'%')";
			}
		}

		String sql = "select r from OA_KM_Rights r " + " where r.fKWKind = 'Folder' and r.fFolderID='" + folderID + "' "
				+ " and r.fCanReleaseKW = 1 and (" + orgCondition + ")";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			result = true;
		}

		return result;
	}

	/**
	 * 获取知识所属的栏目权限
	 * 
	 * @param kwid
	 * @return
	 * @throws Exception
	 */
	public static Table getAttachedFDRights(String kwid)  {
		String sql = null;
		sql = "select OA_KM_Rights.fFolderID,OA_KM_Folder.fName as fFolderName,OA_KM_Folder.fFullID as fFolderFullID,"
				+ "OA_KM_Rights.fOrgKind,OA_KM_Rights.fOrgID,OA_KM_Rights.fOrgName,OA_KM_Rights.fOrgFID,OA_KM_Rights.fOrgFName,"
				+ "OA_KM_Rights.fCanCreateKW,OA_KM_Rights.fCanReadKW,OA_KM_Rights.fCanReleaseKW,OA_KM_Rights.fCanCreateComment,OA_KM_Rights.fCanReadComment,OA_KM_Rights.fCanReadRecord,OA_KM_Rights.fCanScore "
				+ "from OA_KM_Rights OA_KM_Rights join OA_KM_Folder OA_KM_Folder on OA_KM_Rights.fFolderID = OA_KM_Folder "
				+ "where OA_KM_Rights.fFolderID in(select OA_KM_KWFolder.fFolderID from OA_KM_KWFolder OA_KM_KWFolder where OA_KM_KWFolder.fKWID='"
				+ kwid + "') and OA_KM_Rights.fKWKind = 'Folder'";
		Table result = KSQL.select(sql, null, "/OA/knowledge/data", null);
		return result;
	}

	/**
	 * 发布知识接口
	 * 
	 * @param bizData
	 * @throws Exception
	 */
	public static void publishKwInterfaceByFolder(Document bizData) {
		String kwID = java.util.UUID.randomUUID().toString().replace("-", "").toUpperCase();
		String strID = java.util.UUID.randomUUID().toString().replace("-", "").toUpperCase();

		String sql = "";

		String bizID = getSingleNodeValue(bizData, "root/fBizID");
		String folderID = getSingleNodeValue(bizData, "root/fFolderID");
		String otherFolderIDs = getSingleNodeValue(bizData,
				"root/fOtherFolderIDs");
		otherFolderIDs = "'" + otherFolderIDs.replaceAll(",", "','") + "'";

		deleteOldKnowledge(bizID);

		sql = "insert into OA_KM_Knowledge k(k,k.version,k.fTitle,k.fKeyword,k.fDocNumber,k.fImportant,k.fWriter,k.fFolderID,k.fFolderName,k.fFolderFullID,"
					+ " k.fFolderFullName,k.fIsNeedApprove,k.fContentType,k.fContentTypeName,k.fIsTop,k.fCreateOgnID,k.fCreateOgnName,k.fCreateDeptID,k.fCreateDeptName,k.fCreatePsnID,"
					+ " k.fCreatePsnName,k.fCreatePsnFID,k.fCreatePsnFName,k.fCreateTime,k.fReleaseStatus,k.fReleaseStatusName,"
					+ " k.fIsDisplayOnPortal,k.fIsInheritRights,k.fOtherFolders,k.fAttachment,"
					+ " k.fDocument,k.fBizID,k.fImportantName,k.fReaderCount,k.fRepliesCount,k.fBizType,k.fBizTypeName,"
					+ " k.fReleaseOgnID,k.fReleaseOgnName,k.fReleaseDeptID,k.fReleaseDeptName,k.fReleasePsnID,k.fReleasePsnName,k.fReleasePsnFID,"
					+ " k.fReleasePsnFName,k.fReleaseTime) (select '"
					+ kwID
					+ "',0,'"
					+ getSingleNodeValue(bizData, "root/fTitle")
					+ "','"
					+ getSingleNodeValue(bizData, "root/fKeyword")
					+ "','"
					+ getSingleNodeValue(bizData, "root/fDocNumber")
					+ "','low','"
					+ getSingleNodeValue(bizData, "root/fWriter")
					+ "','"
					+ folderID
					+ "',f.fName,f.fFullID,f.fFullName,f.fIsNeedApprove,'"
					+ getSingleNodeValue(bizData, "root/fContentType")
					+ "','"
					+ getSingleNodeValue(bizData, "root/fContentTypeName")
					+ "',0,'"
					+ getSingleNodeValue(bizData, "root/fCreateOgnID")
					+ "','"
					+ getSingleNodeValue(bizData, "root/fCreateOgnName")
					+ "','"
					+ getSingleNodeValue(bizData, "root/fCreateDeptID")
					+ "','"
					+ getSingleNodeValue(bizData, "root/fCreateDeptName")
					+ "','"
					+ getSingleNodeValue(bizData, "root/fCreatePsnID")
					+ "','"
					+ getSingleNodeValue(bizData, "root/fCreatePsnName")
					+ "','"
					+ getSingleNodeValue(bizData, "root/fCreatePsnFID")
					+ "','"
					+ getSingleNodeValue(bizData, "root/fCreatePsnFName")
					+ "',:currentDate,1,'已发布',0,1,'"
					+ getSingleNodeValue(bizData, "root/fOtherFolderNames")
					+ "','"
					+ getSingleNodeValue(bizData, "root/fAttachment")
					+ "','"
					+ getSingleNodeValue(bizData, "root/fDocument")
					+ "','"
					+ bizID
					+ "','低',0,0,'"
					+ getSingleNodeValue(bizData, "root/fBizType")
					+ "','"
					+ getSingleNodeValue(bizData, "root/fBizTypeName")
					+ "','"
					+ getSingleNodeValue(bizData, "root/fReleaseOgnID")
					+ "','"
					+ getSingleNodeValue(bizData, "root/fReleaseOgnName")
					+ "','"
					+ getSingleNodeValue(bizData, "root/fReleaseDeptID")
					+ "','"
					+ getSingleNodeValue(bizData, "root/fReleaseDeptName")
					+ "','"
					+ getSingleNodeValue(bizData, "root/fReleasePsnID")
					+ "','"
					+ getSingleNodeValue(bizData, "root/fReleasePsnName")
					+ "','"
					+ getSingleNodeValue(bizData, "root/fReleasePsnFID")
					+ "','"
					+ getSingleNodeValue(bizData, "root/fReleasePsnFName")
					+ "',:currentDate from OA_KM_Folder f where f = '"
					+ folderID + "')";
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("currentDate", CommonUtils.getCurrentDateTime());

		synchroKMFolder(strID, kwID, folderID,
					otherFolderIDs);

		synchroRights(strID, kwID, folderID,
					otherFolderIDs, true);

		KSQL.executeUpdate(sql, param, OADataModel, null);
	}

	public static void deleteOldKnowledge(String bizID){
		String deleteSQL = "";
		deleteSQL = "delete from OA_KM_KWFolder kw where kw.fKWID = (select k from OA_KM_Knowledge k where k.fBizID='"
				+ bizID + "')";
		KSQL.executeUpdate(deleteSQL, null, OADataModel, null);
		
		deleteSQL = "delete from OA_KM_Rights r where r.fKWID = (select k from OA_KM_Knowledge k where k.fBizID='"
				+ bizID + "')";
		KSQL.executeUpdate(deleteSQL, null, OADataModel, null);
		
		deleteSQL = "delete from OA_KM_READERS r where r.fKWID = (select k from OA_KM_Knowledge k where k.fBizID='"
				+ bizID + "')";
		KSQL.executeUpdate(deleteSQL, null, OADataModel, null);
		
		deleteSQL = "delete from OA_KM_Knowledge k where k.fBizID='" + bizID + "'";
		KSQL.executeUpdate(deleteSQL, null, OADataModel, null);
	}

	public static void synchroKMFolder(String StrID,String kwid, String folderID, String otherFolderIDs){
		String KMFolderSQL = "";
		KMFolderSQL = "insert into OA_KM_KWFolder kw (kw, kw.version, kw.fKWID, kw.fFolderKind, kw.fFolderID, kw.fKWFullID, kw.fKWFullName) (select '"
				+ StrID
				+ "',0,'"
				+ kwid
				+ "','MainFolder',f,concat(f.fFullID,'/', '"+ kwid+ "'),null from OA_KM_Folder f where f = '"
				+ folderID
				+ "')";
		KSQL.executeUpdate(KMFolderSQL, null, OADataModel, null);

		KMFolderSQL = "insert into OA_KM_KWFolder kw (kw, kw.version, kw.fKWID, kw.fFolderKind, kw.fFolderID, kw.fKWFullID, kw.fKWFullName) (select '"
				+ StrID
				+ "',0,'"
				+ kwid
				+ "','OtherFolder',f,concat(f.fFullID ,'/','" + kwid + "'),null from OA_KM_Folder f where f in ("
				+ otherFolderIDs + "))";
		KSQL.executeUpdate(KMFolderSQL, null, OADataModel, null);
	}

	public static void synchroRights(String StrID,String kwid, String folderID,
			String otherFolderIDs, Boolean isInheritRights){
		String RightsSQL = "";
		if (isInheritRights) {
			otherFolderIDs = "'" + folderID + "'," + otherFolderIDs;
			RightsSQL = "insert into OA_KM_Rights r (r,r.version,r.fKWKind,r.fFolderID,r.fFolderName,r.fKWID,r.fKWName,r.fKWFullID,r.fKWFullName,"
					+ "r.fOrgKind,r.fOrgID,r.fOrgName,r.fOrgFID,r.fOrgFName,r.fCanCreateKW,r.fCanReadKW,r.fCanCreateComment,r.fCanReadComment,r.fCanScore,"
					+ "r.fCanReadRecord,r.fIsInherit,r.fCreatePsnID,r.fCreatePsnName,r.fCreateTime,r.fCanReleaseKW) (select '"
					+ StrID
					+ "',0,'Knowledge',r.fFolderID,null,'"
					+ kwid
					+ "',null,concat(r.fKWFullID,'/','"+ kwid
					+ "'),null,r.fOrgKind,r.fOrgID,r.fOrgName,r.fOrgFID,r.fOrgFName,r.fCanCreateKW,r.fCanReadKW,r.fCanCreateComment,r.fCanReadComment,r.fCanScore,"
					+ "r.fCanReadRecord,1,'"
					+ com.justep.oa.SysUtils.getCurrentPersonID()
					+ "','"
					+ com.justep.oa.SysUtils
							.getCurrentPersonNameWithAgent()
					+ "',:currentDate,r.fCanReleaseKW from OA_KM_Rights r where r.fKWKind = 'Folder' and r.fFolderID in ("
					+ otherFolderIDs + "))";
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("currentDate", CommonUtils.getCurrentDateTime());
			KSQL.executeUpdate(RightsSQL, param, OADataModel, null);
		}
	}

	public static void publishKnowledgeInterface(Document bizData,String delFlag) {
		String strID = java.util.UUID.randomUUID().toString().replace("-", "").toUpperCase();

		Map<String, String> map = new HashMap<String, String>();
		String[] arrOtherFolder = null;
		String[] arrRight = null;
		parseKWInfoFromDoc(map, bizData);
		arrOtherFolder = parseOtherFolderFromDoc(arrOtherFolder, bizData);
		arrRight = parseRightFromDoc(arrRight, bizData);

		if (delFlag.equals("1")) {
			deleteOldKnowledge(map);
		}
		String kwid = createNewKnowledge(map);
		createKMFolder(map, arrOtherFolder, kwid);
		createKWRights(map, arrOtherFolder, arrRight, kwid,strID);
	}

	private static void parseKWInfoFromDoc(Map map, Document doc) {
		map.put("fTitle", getSingleNodeValue(doc, "root/fTitle"));
		map.put("fKeyword", getSingleNodeValue(doc, "root/fKeyword"));
		map.put("fDocNumber", getSingleNodeValue(doc, "root/fDocNumber"));
		map.put("fWriter", getSingleNodeValue(doc, "root/fWriter"));
		map.put("fFolderID", getSingleNodeValue(doc, "root/fFolderID"));
		map.put("fFolderName", getSingleNodeValue(doc, "root/fFolderName"));
		map.put("fFolderFullID", getSingleNodeValue(doc, "root/fFolderFullID"));
		map.put("fFolderFullName", getSingleNodeValue(doc,
				"root/fFolderFullName"));
		map.put("fRightsText", getSingleNodeValue(doc, "root/fRightsText"));
		map.put("fIsNeedApprove",
				getSingleNodeValue(doc, "root/fIsNeedApprove"));
		map.put("fImportant", getSingleNodeValue(doc, "root/fImportant"));
		map.put("fImportantName",
				getSingleNodeValue(doc, "root/fImportantName"));
		map.put("fContentType", getSingleNodeValue(doc, "root/fContentType"));
		map.put("fContentTypeName", getSingleNodeValue(doc,
				"root/fContentTypeName"));
		map.put("fTemplateID", getSingleNodeValue(doc, "root/fTemplateID"));
		map.put("fTemplateName", getSingleNodeValue(doc, "root/fTemplateName"));
		map.put("fLinkURL", getSingleNodeValue(doc, "root/fLinkURL"));
		map.put("fContent", getSingleNodeValue(doc, "root/fContent"));
		map.put("fContentURL", getSingleNodeValue(doc, "root/fContentURL"));
		map.put("fIsTop", getSingleNodeValue(doc, "root/fIsTop"));
		map.put("fCreateOgnID", getSingleNodeValue(doc, "root/fCreateOgnID"));
		map.put("fCreateOgnName",
				getSingleNodeValue(doc, "root/fCreateOgnName"));
		map.put("fCreateDeptID", getSingleNodeValue(doc, "root/fCreateDeptID"));
		map.put("fCreateDeptName", getSingleNodeValue(doc,
				"root/fCreateDeptName"));
		map.put("fCreatePsnID", getSingleNodeValue(doc, "root/fCreatePsnID"));
		map.put("fCreatePsnName",
				getSingleNodeValue(doc, "root/fCreatePsnName"));
		map.put("fCreatePsnFID", getSingleNodeValue(doc, "root/fCreatePsnFID"));
		map.put("fCreatePsnFName", getSingleNodeValue(doc,
				"root/fCreatePsnFName"));
		map.put("fCreateTime", getSingleNodeValue(doc, "root/fCreateTime"));
		map.put("fReleaseOgnID", getSingleNodeValue(doc, "root/fReleaseOgnID"));
		map.put("fReleaseOgnName", getSingleNodeValue(doc,
				"root/fReleaseOgnName"));
		map.put("fReleaseDeptID",
				getSingleNodeValue(doc, "root/fReleaseDeptID"));
		map.put("fReleaseDeptName", getSingleNodeValue(doc,
				"root/fReleaseDeptName"));
		map.put("fReleasePsnID", getSingleNodeValue(doc, "root/fReleasePsnID"));
		map.put("fReleasePsnName", getSingleNodeValue(doc,
				"root/fReleasePsnName"));
		map.put("fReleasePsnFID",
				getSingleNodeValue(doc, "root/fReleasePsnFID"));
		map.put("fReleasePsnFName", getSingleNodeValue(doc,
				"root/fReleasePsnFName"));
		map.put("fReleaseTime", getSingleNodeValue(doc, "root/fReleaseTime"));
		
		System.out.print("===fIsDisplayOnPortal=="+getSingleNodeValue(doc,
				"root/fIsDisplayOnPortal"));
		map.put("fIsDisplayOnPortal", getSingleNodeValue(doc,
				"root/fIsDisplayOnPortal"));
		map.put("fIsInheritRights", getSingleNodeValue(doc,
				"root/fIsInheritRights"));
		map.put("fOtherFolders", getSingleNodeValue(doc, "root/fOtherFolders"));
		map.put("fDocument", getSingleNodeValue(doc, "root/fDocument"));
		map.put("fAttachment", getSingleNodeValue(doc, "root/fAttachment"));
		map.put("fBizID", getSingleNodeValue(doc, "root/fBizID"));
		map.put("fBizType", getSingleNodeValue(doc, "root/fBizType"));
		map.put("fBizTypeName", getSingleNodeValue(doc, "root/fBizTypeName"));
		map.put("fReleaseStatus", "1");
		map.put("fReleaseStatusName", "已发布");
	}

	private static String[] parseOtherFolderFromDoc(String[] ofd, Document doc) {
		List otherFolders = doc.selectNodes("/root/otherFolders/folder");
		int size = otherFolders.size();
		if (size > 0) {
			ofd = new String[size];
			for (int i = 0; i < size; i++) {
				Node otherFolder = (Node) otherFolders.get(i);
				String folderID = getSingleNodeValue(otherFolder, "./fFolderID");
				String folderName = getSingleNodeValue(otherFolder,
						"./fFolderName");
				String folderFullID = getSingleNodeValue(otherFolder,
						"./fFolderFullID");
				String folderFullName = getSingleNodeValue(otherFolder,
						"./fFolderFullName");

				ofd[i] = folderID + ":" + folderName + ":" + folderFullID + ":"
						+ folderFullName;
			}
		}
		return ofd;
	}

	private static String[] parseRightFromDoc(String[] rt, Document doc) {
		List rights = doc.selectNodes("/root/rights/right");
		int size = rights.size();
		if (size > 0) {
			rt = new String[size];
			for (int i = 0; i < size; i++) {
				Node right = (Node) rights.get(i);
				String fOrgKind = getSingleNodeValue(right, "./fOrgKind");
				String fOrgID = getSingleNodeValue(right, "./fOrgID");
				String fOrgName = getSingleNodeValue(right, "./fOrgName");
				String fOrgFID = getSingleNodeValue(right, "./fOrgFID");
				String fOrgFName = getSingleNodeValue(right, "./fOrgFName");
				String fCanReadKW = getSingleNodeValue(right, "./fCanReadKW");
				String fCanCreateKW = getSingleNodeValue(right,
						"./fCanCreateKW");
				String fCanReleaseKW = getSingleNodeValue(right,
						"./fCanReleaseKW");
				String fCanReadComment = getSingleNodeValue(right,
						"./fCanReadComment");
				String fCanCreateComment = getSingleNodeValue(right,
						"./fCanCreateComment");
				String fCanReadRecord = getSingleNodeValue(right,
						"./fCanReadRecord");
				String fCanScore = getSingleNodeValue(right, "./fCanScore");

				rt[i] = fOrgKind + ":" + fOrgID + ":" + fOrgName + ":"
						+ fOrgFID + ":" + fOrgFName + ":" + fCanReadKW + ":"
						+ fCanCreateKW + ":" + fCanReleaseKW + ":"
						+ fCanReadComment + ":" + fCanCreateComment + ":"
						+ fCanReadRecord + ":" + fCanScore;
			}
		}
		return rt;
	}

	private static void deleteOldKnowledge(Map m){
		String oldKW = "select k from OA_KM_Knowledge k "
				+ " where k.fBizID = '"+m.get("fBizID")+"' and k.fBizType = '"+m.get("fBizType")+"'";

		// 删除原有知识权限
		String delRights = "delete from OA_KM_Rights r"
				+ " where r.fKWID in ("+oldKW+")";
		KSQL.executeUpdate(delRights, null, OADataModel, null);
		
		// 删除原有知识栏目关系
		String delKWFolder = "delete from OA_KM_KWFolder kw"
				+ " where kw.fKWID in ("+oldKW+")";
		KSQL.executeUpdate(delKWFolder, null, OADataModel, null);
		
		// 删除原有知识
		String delKnowledge = "delete from OA_KM_Knowledge k"
				+ " where k.fBizID = ' "+ m.get("fBizID")+"'";
		KSQL.executeUpdate(delKnowledge, null, OADataModel, null);
	}

	private static String createNewKnowledge(Map m) {
		String kwid = java.util.UUID.randomUUID().toString().replace("-", "").toUpperCase();
		String fIsDisplayOnPortal = "0";
		String fIsInheritRights = "1";
		String fIsTop = "0";
		String fIsNeedApprove = "0";
		if(!m.get("fIsDisplayOnPortal").toString().equals(""))
		{   System.out.print("===输出==="+m.get("fIsDisplayOnPortal").toString());
			fIsDisplayOnPortal = m.get("fIsDisplayOnPortal").toString();
		}
		if(!m.get("fIsInheritRights").toString().equals(""))
			fIsInheritRights = m.get("fIsInheritRights").toString();
		
		if(!m.get("fIsTop").toString().equals(""))
			fIsInheritRights = m.get("fIsTop").toString();
		
		if(!m.get("fIsNeedApprove").toString().equals(""))
			fIsInheritRights = m.get("fIsNeedApprove").toString();
		
		String sql = "insert into OA_KM_Knowledge k("
								+ "k,k.version,"
								+ "k.fTitle,k.fKeyword,k.fDocNumber,k.fWriter,"
								+ "k.fFolderID,k.fFolderName,k.fFolderFullID,k.fFolderFullName,"
								+ "k.fRightsText,k.fIsNeedApprove,"
								+ "k.fImportant,k.fImportantName,"
								+ "k.fContentType,k.fContentTypeName,"
								+ "k.fTemplateID,k.fTemplateName,"
								+ "k.fLinkURL,k.fContent,k.fContentURL,k.fIsTop,"
								+ "k.fCreateOgnID,k.fCreateOgnName,k.fCreateDeptID,k.fCreateDeptName,"
								+ "k.fCreatePsnID,k.fCreatePsnName,k.fCreatePsnFID,k.fCreatePsnFName,k.fCreateTime,"
								+ "k.fReleaseOgnID,k.fReleaseOgnName,k.fReleaseDeptID,k.fReleaseDeptName,"
								+ "k.fReleasePsnID,k.fReleasePsnName,k.fReleasePsnFID,k.fReleasePsnFName,k.fReleaseTime,"
								+ "k.fReleaseStatus,k.fReleaseStatusName,"
								+ "k.fIsDisplayOnPortal,k.fIsInheritRights,k.fOtherFolders,"
								+ "k.fDocument,k.fAttachment,k.fBizID,k.fBizType,k.fBizTypeName"
								+ ")values('"+kwid+"',0,'"+m.get("fTitle")+"','"+m.get("fKeyword")+"','"+m.get("fDocNumber")+"','"+m.get("fWriter")+"','"+m.get("fFolderID")+"','"+m.get("fFolderName")+"','"+m.get("fFolderFullID")+"','"+m.get("fFolderFullName")+"','"+m.get("fRightsText")+"',"+fIsNeedApprove
								+ ",'"+m.get("fImportant")+"','"+m.get("fImportantName")+"','"+m.get("fContentType")+"','"+m.get("fContentTypeName")+"','"+m.get("fTemplateID")+"','"+m.get("fTemplateName")+"','"+m.get("fLinkURL")+"','"+m.get("fContent")+"','"+m.get("fContentURL")+"',"+fIsTop
								+ ",'"+m.get("fCreateOgnID")+"','"+m.get("fCreateOgnName")+"','"+m.get("fCreateDeptID")+"','"+m.get("fCreateDeptName")+"','"+m.get("fCreatePsnID")+"','"+m.get("fCreatePsnName")+"','"+m.get("fCreatePsnFID")+"','"+m.get("fCreatePsnFName")+"',:currentDate"
								+ ",'"+m.get("fReleaseOgnID")+"','"+m.get("fReleaseOgnName")+"','"+m.get("fReleaseDeptID")+"','"+m.get("fReleaseDeptName")+"','"+m.get("fReleasePsnID")+"','"+m.get("fReleasePsnName")+"','"+m.get("fReleasePsnFID")+"','"+m.get("fReleasePsnFName")+"',:currentDate"
								+ ",'"+m.get("fReleaseStatus")+"','"+m.get("fReleaseStatusName")+"',"+fIsDisplayOnPortal+","+fIsInheritRights+",'"+m.get("fOtherFolders")+"','"+m.get("fDocument")+"','"+m.get("fAttachment")+"','"+m.get("fBizID")+"','"+m.get("fBizType")+"','"+m.get("fBizTypeName")+"')";
		System.out.print("==sql ==="+sql);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("currentDate", CommonUtils.getCurrentDateTime());
		KSQL.executeUpdate(sql, param, OADataModel, null);
		return kwid;
	}

	private static void createKMFolder(Map m, String[] ofd,String kwid) {
		String sql = null;
		String mainFolder = m.get("fFolderID").toString();
		if (!mainFolder.equals("")) {
			String id = java.util.UUID.randomUUID().toString();
			String fKWFullID = m.get("fFolderFullID") + "/" + kwid;

			sql = "insert into OA_KM_KWFolder kw (kw,kw.version,"
					+ "kw.fFolderKind,kw.fFolderID,kw.fKWID,kw.fKWFullID ) values('"
					+ id + "',0," + "'MainFolder','" + mainFolder + "','"
					+ kwid + "','" + fKWFullID + "'" + ")";
			KSQL.executeUpdate(sql, null, OADataModel, null);
		}
		if ((ofd != null) && (ofd.length > 0)) {
			for (int i = 0; i < ofd.length; i++) {
				String otherFolder = ofd[i];
				String[] temp = otherFolder.split(":");
				if (temp.length > 0) {
					String folderID = temp[0];
					String folderFullID = temp[2];
					String id = java.util.UUID.randomUUID().toString();
					String fKWFullID = folderFullID + "/" + kwid;

					sql = "insert into OA_KM_KWFolder kw(kw,kw.version,"
							+ "kw.fFolderKind,kw.fFolderID,kw.fKWID,kw.fKWFullID"
							+ ")values('" + id + "',0," + "'OtherFolder','"
							+ folderID + "','" + kwid + "','" + fKWFullID + "'"
							+ ")";
					KSQL.executeUpdate(sql, null, OADataModel, null);
				}
			}
		}
	}

	private static void createKWRights(Map m, String[] ofd,String[] rt, String kwid, String strID){
		String sql = null;
		if ((rt != null) && (rt.length > 0)) {
			for (int i = 0; i < rt.length; i++) {
				String right = rt[i];
				String[] temp = right.split(":");
				if (temp.length > 0) {
					String fOrgKind = temp[0];
					String fOrgID = temp[1];
					String fOrgName = temp[2];
					String fOrgFID = temp[3];
					String fOrgFName = temp[4];
					String fCanReadKW = temp[5];
					if(fCanReadKW.equals(""))
						fCanReadKW = "1";
					String fCanCreateKW = temp[6];
					if(fCanCreateKW.equals(""))
						fCanCreateKW = "1";
					String fCanReleaseKW = temp[7];
					if(fCanReleaseKW.equals(""))
						fCanReleaseKW = "1";
					String fCanReadComment = temp[8];
					if(fCanReadComment.equals(""))
						fCanReadComment = "1";
					String fCanCreateComment = temp[9];
					if(fCanCreateComment.equals(""))
						fCanCreateComment = "1";
					String fCanReadRecord = temp[10];
					if(fCanReadRecord.equals(""))
						fCanReadRecord = "1";
					String fCanScore = temp[11];
					if(fCanScore.equals(""))
						fCanScore = "1";
					String id = java.util.UUID.randomUUID().toString();

					sql = "insert into OA_KM_Rights r(r,r.version,"
							+ "r.fKWKind,r.fKWID,"
							+ "r.fOrgKind,r.fOrgID,r.fOrgName,r.fOrgFID,r.fOrgFName,"
							+ "r.fCanReadKW,r.fCanCreateKW,r.fCanReleaseKW,"
							+ "r.fCanReadComment,r.fCanCreateComment,"
							+ "r.fCanReadRecord,r.fCanScore )values('"
							+ id
							+ "',0,"
							+ "'Knowledge','"
							+ kwid
							+ "','"
							+ fOrgKind
							+ "','"
							+ fOrgID
							+ "','"
							+ fOrgName
							+ "','"
							+ fOrgFID
							+ "','"
							+ fOrgFName
							+ "',"
							+ fCanReadKW
							+ ","
							+ fCanCreateKW
							+ ","
							+ fCanReleaseKW
							+ ","
							+ fCanReadComment
							+ ","
							+ fCanCreateComment
							+ ","
							+ fCanReadRecord
							+ "," + fCanScore  + ")";
					KSQL.executeUpdate(sql, null, OADataModel, null);
				}
			}
		} else { // 没传入权限则自动继承栏目权限
			String folderIDs = "";
			String fFolderID = m.get("fFolderID").toString();
			if (!fFolderID.equals("")) {
				folderIDs = "'" + fFolderID + "'";
			}
			if ((ofd != null) && (ofd.length > 0)) {
				for (int i = 0; i < ofd.length; i++) {
					String otherFolder = ofd[i];
					String[] temp = otherFolder.split(":");
					if (temp.length > 0) {
						String folderID = temp[0];
						if (!folderID.equals("")) {
							if (folderIDs.equals("")) {
								folderIDs = "'" + folderID + "'";
							} else {
								folderIDs += ",'" + folderID + "'";
							}
						}
					}
				}
			}
			if (!folderIDs.equals("")) {
				sql = "insert into OA_KM_Rights r (r,r.version,"
						+ "r.fKWKind,r.fFolderID,r.fKWID,r.fKWFullID,"
						+ "r.fOrgKind,r.fOrgID,r.fOrgName,r.fOrgFID,r.fOrgFName,"
						+ "r.fCanReadKW,r.fCanCreateKW,r.fCanReleaseKW,"
						+ "r.fCanReadComment,r.fCanCreateComment,"
						+ "r.fCanReadRecord,r.fCanScore,r.fIsInherit,"
						+ "r.fCreatePsnID,r.fCreatePsnName,r.fCreateTime"
						+ ") (select '" + strID + "',0,"
						+ "'Knowledge',rr.fFolderID,'" + kwid + "',concat(f.fFullID, '/','" + kwid + "'),"
						+ "rr.fOrgKind,rr.fOrgID,rr.fOrgName,rr.fOrgFID,rr.fOrgFName,"
						+ "rr.fCanReadKW,rr.fCanCreateKW,rr.fCanReleaseKW,"
						+ "rr.fCanReadComment,rr.fCanCreateComment,"
						+ "rr.fCanReadRecord,rr.fCanScore,1,"
						+ "rr.fCreatePsnID,rr.fCreatePsnName,rr.fCreateTime "
						+ "from OA_KM_Rights rr join OA_KM_Folder f "
						+ "on rr.fFolderID = f "
						+ "where rr.fKWKind='Folder' and rr.fFolderID in("
						+ folderIDs + "))";
				KSQL.executeUpdate(sql, null, OADataModel, null);
			}
		}
	}

	/**
	 * 获取XML数据节点值
	 * 
	 * @param doc
	 * @param url
	 * @return
	 */
	private static String getSingleNodeValue(Document doc, String url) {
		String strReturn = "";
		try {
			strReturn = doc.selectSingleNode(url).getText();
		} catch (Exception e) {
		}

		return strReturn;
	}

	/**
	 * 获取XML数据节点值
	 * 
	 * @param doc
	 * @param url
	 * @return
	 */
	private static String getSingleNodeValue(Node node, String url) {
		String strReturn = "";
		try {
			strReturn = node.selectSingleNode(url).getText();
		} catch (Exception e) {
		}

		return strReturn;
	}

	public static String isPublishedByBiz(String fBizID, String fBizType){
		String returnvalue = "false";
		String sqlCheckPublished = "select k from OA_KM_Knowledge k where k.fBizID='"+fBizID+"' and k.fBizType='"+fBizType+"'";
		Table table = KSQL.select(sqlCheckPublished, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			returnvalue = "true";
		}

		return returnvalue;
	}

	public static String getPublishedRangeByBiz(String fBizID, String fBizType){

		String sqlGetRange = "select fOrgFID from OA_KM_Rights r where r.fKWID in"
								+ "(select k from OA_KM_Knowledge k where k.fBizID = '"+fBizID+"' and k.fBizType = '"+fBizType+"') ";
		String rangeIDs = "";
		Table table = KSQL.select(sqlGetRange, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs = rows.next();
			if (rangeIDs.equals("")) {
				String orgFID = rs.getString("fOrgFID");
				if (orgFID == null || orgFID.equals("")) {
								continue;
				}
				rangeIDs = orgFID;
			} else {
					rangeIDs += "," + rs.getString("fOrgFID");
			}
		}
		return rangeIDs;
	}

	/**
	 * 判断当前人是否能够收文
	 * 
	 * @param psnID
	 * @param docID
	 * @return
	 * @throws Exceptions
	 */
	public static boolean canReceiveDoc(String psnID, String docID){

		String sql = "select d from OA_DC_Doc d where d.fCreatePsnID = '"
						+ psnID + "'  and d.fSendDocID = '" + docID + "' "
						+ "and d.fBizState <> 'bsAborted'";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			return false;
		} else {
			return true;
		}
	}

	public static String getPsnMaxSecretLevel() {
		String result = "0";

		String sql = null;

		Collection<String> memberFullIDs = com.justep.oa.SysUtils.getAllPersonMemberFIDs();
		String psnID = com.justep.oa.SysUtils.getCurrentPersonID();
		String urlCondition = "";
		for (String memberFullID : memberFullIDs) {
			String condition = " (concat('"+memberFullID+"','/','"+psnID+"','.psn') like concat(s.fOrgFullID , '%')) ";
					if (urlCondition.equals(""))
						urlCondition = condition;
					else
						urlCondition += " or " + condition;
		}

		sql = "select max(s.fSecretLevel) secretLevel from OA_KM_PsnSecretLevel s where "+urlCondition;
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			Row rs = rows.next();
			result = rs.getString("secretLevel");
		}
		return result;
	}

	/**
	 * 复制知识
	 * 
	 * @param kwid
	 * @return
	 * @throws Exception
	 */
	public static String copyKnowledge(String kwid)  {
		String strID = null;
		String strCurrentDate = null;
		String operator = null;
		String newKWID = java.util.UUID.randomUUID().toString().toUpperCase();

		String fCreateOgnID = SysUtils.getCurrentOgnID();
		String fCreateOgnName = SysUtils.getCurrentOgnName();
		String fCreateDeptID = SysUtils.getCurrentDeptID();
		String fCreateDeptName = SysUtils.getCurrentDeptName();
		String fCreatePsnID = SysUtils.getCurrentPersonID();
		String fCreatePsnName = SysUtils.getCurrentPersonNameWithAgent();
		String fCreatePsnFullID = SysUtils.getCurrentPersonMemberFID();
		String fCreatePsnFullName = SysUtils
				.getCurrentPersonMemberFNameWithAgent();

		String insertKW = "insert into OA_KM_Knowledge k(k,k.version,k.fTitle,k.fKeyword,k.fDocNumber,"
								+ "k.fImportant,k.fImportantName,k.fWriter,"
								+ "k.fFolderID,k.fFolderName,k.fFolderFullID,k.fFolderFullName,"
								+ "k.fRightsText,k.fIsNeedApprove,k.fContentType,k.fContentTypeName,"
								+ "k.fTemplateID,k.fTemplateName,k.fLinkURL,k.fContent,k.fContentURL,"
								+ "k.fCreateOgnID,k.fCreateOgnName,k.fCreateDeptID,k.fCreateDeptName,"
								+ "k.fCreatePsnID,k.fCreatePsnName,k.fCreatePsnFullID,k.fCreatePsnFullName,"
								+ "k.fCreateTime,k.fReleaseStatus,k.fReleaseStatusName,"
								+ "k.fIsDisplayOnPortal,k.fSmallPic,k.fIsInheritRights,"
								+ "k.fOtherFolders,k.fAttachment,k.fDocument,k.fBizID,"
								+ "k.fReaderCount,k.fRepliesCount,k.fBizType,k.fBizTypeName)"
								+ " (select '"+newKWID+"',0,k.fTitle,k.fKeyword,k.fDocNumber,"
								+ "k.fImportant,k.fImportantName,k.fWriter,"
								+ "k.fFolderID,k.fFolderName,k.fFolderFullID,k.fFolderFullName,"
								+ "k.fRightsText,k.fIsNeedApprove,k.fContentType,k.fContentTypeName,"
								+ "k.fTemplateID,k.fTemplateName,k.fLinkURL,k.fContent,k.fContentURL,"
								+ "'"+fCreateOgnID+"','"+fCreateOgnName+"','"+fCreateDeptID+"','"+fCreateDeptName+"',"
								+ " '"+fCreatePsnID+"','"+fCreatePsnName+"','"+fCreatePsnFullID+"','"+fCreatePsnFullName+"',"
								+ " :currentDate,'0','未发布',"
								+ " k.fIsDisplayOnPortal,k.fSmallPic,k.fIsInheritRights,"
								+ " k.fOtherFolders,k.fAttachment,k.fDocument,k.fBizID,"
								+ " 0,0,k.fBizType,k.fBizTypeName "
								+ " from OA_KM_Knowledge k "
								+ " where k = '"+kwid+"')";
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("currentDate", CommonUtils.getCurrentDateTime());
		KSQL.executeUpdate(insertKW, param, OADataModel, null);
		
		String KWFullID = "concat(f.fFullID, '/','"+newKWID+"')";

		String insertKWF = "insert into OA_KM_KWFolder kw(kw,kw.version,kw.fFolderKind,kw.fFolderID,kw.fKWID,kw.fKWFullID)"
						+ " (select '"+strID+"',0,kf.fFolderKind,f,'"+newKWID+"','"+KWFullID+"' "
						+ " from OA_KM_KWFolder kf join OA_KM_Folder f "
						+ " on kf.fFolderID = f where kf.fKWID = '"+kwid+"')";
		KSQL.executeUpdate(insertKWF, null, OADataModel, null);
		
		KWFullID = "case when r.fKWFullID is not null then ("
								+ " concat((select f.fFullID from OA_KM_Folder f where f = r.fFolderID) , '/','"+newKWID+"'))";

		String insertRight = "insert into OA_KM_Rights r(r,r.version,r.fKWkind,r.fFolderID,r.fFolderName,"
								+ "r.fKWID,r.fKWFullID,r.fOrgKind,r.fOrgID,r.fOrgName,"
								+ "r.fOrgFullID,r.fOrgFullName,r.fCanCreateKW,r.fCanReadKW,r.fCanReleaseKW,"
								+ "r.fCanCreateComment,r.fCanReadComment,r.fCanScore,r.fCanReadRecord,"
								+ "r.fIsInherit,r.fCreatePsnID,r.fCreatePsnName,r.fCreateTime)"
								+ " (select '"+strID+"',0,'Knowledge',r.fFolderID,r.fFolderName,"
								+ " 	'"+newKWID+"','"+KWFullID+"',r.fOrgKind,r.fOrgID,r.fOrgName,"
								+ " r.fOrgFullID,r.fOrgFullName,r.fCanCreateKW,r.fCanReadKW,r.fCanReleaseKW,"
								+ " r.fCanCreateComment,r.fCanReadComment,r.fCanScore,r.fCanReadRecord,"
								+ " r.fIsInherit,'"+fCreatePsnID+"','"+fCreatePsnName+"',:currentDate "
								+ " from OA_KM_Rights r"
								+ " where r.fKWID = '"+kwid+"')";

		Map<String, Object> param1 = new HashMap<String, Object>();
		param1.put("currentDate", CommonUtils.getCurrentDateTime());
		KSQL.executeUpdate(insertRight, param1, OADataModel, null);

		return newKWID;
	}

	/**
	 * 根据条件获取值
	 * 
	 * @param tableName
	 *            表名
	 * @param fields
	 *            要查询的字段,以逗号隔开
	 * @param condition
	 *            where条件
	 * @return
	 * @throws Exception
	 */
	public static String getValueByCondition(String tableName, String fields,
			String condition) {
		String result = "";
		String[] arrField = fields.split(",");
		if (condition.equals("empty")) {
			condition = "1 = 1";
		}
		String sql = "select "+fields+" from "+tableName+" where "+condition;

		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs = rows.next();
			String rowResult = null;
			for (int i = 0; i < arrField.length; i++) {
				if (rowResult == null) {
						rowResult = rs.getString(arrField[i]) == null ? ""
										: rs.getString(arrField[i]);
				} else {
						rowResult += ","+ (rs.getString(arrField[i]) == null ? ""
												: rs.getString(arrField[i]));
				}
			}
			if (rowResult != null) {
				if (result.equals("")) {
					result = rowResult;
				} else {
					result += "|" + rowResult;
				}
			}
		}

		return result;
	}

	public static String getKWFolderIDs(String kwID){
		String folderIDs = "";
		String sql = "select kw.fFolderID from OA_KM_KWFolder kw where kw.fKWID='"
				+ kwID + "' and kw.fFolderKind='OtherFolder'";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs = rows.next();
			if (folderIDs.equals("")) {
				folderIDs = rs.getString("fFolderID");
			} else {
				folderIDs = folderIDs + ","
									+ rs.getString("fFolderID");
			}
		}
		return folderIDs;
	}

	public static void docBatchPublish(String id) throws DocumentException, UnsupportedEncodingException, JSONException {
		String delFlag = "1";
		String sql = "select b.fFolderID,b.fFolderName,b.fFolderFullID,b.fFolderFullName,b.fDocument from OA_KM_BatchKW b where b = '"
				+ id + "'";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			Row rs = rows.next();
			String fFolderID = rs.getString("fFolderID");
			String fFolderName = rs.getString("fFolderName");
			String fFolderFullID = rs.getString("fFolderFullID");
			String fFolderFullName = rs.getString("fFolderFullName");
			String fDocument = rs.getString("fDocument");

			if (fDocument != null && !fDocument.equals("")) {
				List lst = new ArrayList();
				int bPos = 1;
				int ePos = 0;
				while (ePos >= 0) {
					ePos = fDocument.indexOf("}");
					if (ePos > 0) {
						String doc = "[" + fDocument.substring(bPos, ePos + 1) + "]";
						fDocument = fDocument.substring(ePos + 2);
						bPos = 0;
						JSONObject json = new JSONObject(doc.replace("[", "").replace("]", ""));
						String fTitle = json.getString("docName");
						fTitle = fTitle.substring(0, fTitle.lastIndexOf("."));
	
						String bizData = "<root><fTitle>" + fTitle + "</fTitle>" + "<fContentType>uploaddoc</fContentType>"
								+ "<fContentTypeName>上传文档</fContentTypeName>" + "<fDocument>" + doc + "</fDocument>" + "<fFolderID>" + fFolderID
								+ "</fFolderID>" + "<fFolderName>" + fFolderName + "</fFolderName>" + "<fFolderFullID>" + fFolderFullID
								+ "</fFolderFullID>" + "<fFolderFullName>" + fFolderFullName + "</fFolderFullName>" + "<fBizID>" + id + "</fBizID>"
								+ "<fCreateOgnID>" + SysUtils.getCurrentOgnID() + "</fCreateOgnID>" + "<fCreateOgnName>"
								+ SysUtils.getCurrentOgnName() + "</fCreateOgnName>" + "<fCreateDeptID>"
								+ (SysUtils.getCurrentDeptID() != null ? SysUtils.getCurrentDeptID() : SysUtils.getCurrentOgnID())
								+ "</fCreateDeptID>" + "<fCreateDeptName>"
								+ (SysUtils.getCurrentDeptName() != null ? SysUtils.getCurrentDeptName() : SysUtils.getCurrentOgnName())
								+ "</fCreateDeptName>" + "<fCreatePsnID>" + SysUtils.getCurrentPersonID() + "</fCreatePsnID>" + "<fCreatePsnName>"
								+ SysUtils.getCurrentPersonName() + "</fCreatePsnName>" + "<fCreatePsnFID>" + SysUtils.getCurrentPersonMemberFID()
								+ "</fCreatePsnFID>" + "<fCreatePsnFName>" + SysUtils.getCurrentPersonMemberFName() + "</fCreatePsnFName>"
								+ "<fReleaseOgnID>" + SysUtils.getCurrentOgnID() + "</fReleaseOgnID>" + "<fReleaseOgnName>"
								+ SysUtils.getCurrentOgnName() + "</fReleaseOgnName>" + "<fReleaseDeptID>"
								+ (SysUtils.getCurrentDeptID() != null ? SysUtils.getCurrentDeptID() : SysUtils.getCurrentOgnID())
								+ "</fReleaseDeptID>" + "<fReleaseDeptName>"
								+ (SysUtils.getCurrentDeptName() != null ? SysUtils.getCurrentDeptName() : SysUtils.getCurrentOgnName())
								+ "</fReleaseDeptName>" + "<fReleasePsnID>" + SysUtils.getCurrentPersonID() + "</fReleasePsnID>"
								+ "<fReleasePsnName>" + SysUtils.getCurrentPersonName() + "</fReleasePsnName>" + "<fReleasePsnFID>"
								+ SysUtils.getCurrentPersonMemberFID() + "</fReleasePsnFID>" + "<fReleasePsnFName>"
								+ SysUtils.getCurrentPersonMemberFName() + "</fReleasePsnFName>" + "</root>";
						Document document = DocumentHelper.parseText(bizData);
						publishKnowledgeInterface(document, delFlag);
						delFlag = "0";
					}
				}
			}
		}
	}

	public static int saveKnowledge(Table table, String concept,
			List<Object> range, String readOnly, String notNull,
			String dataModel, String otherFolderIDs) throws Exception {
		Row knowledgeData = table.iterator().next();
		String kwid = knowledgeData.getString("OA_KM_Knowledge");
		otherFolderIDs = "'" + otherFolderIDs.replaceAll(",", "','") + "'";

			// 同步栏目子表
			String sql = "delete from OA_KM_KWFolder kw where kw.fKWID = '"
					+ kwid + "'";
			KSQL.executeUpdate(sql, null, OADataModel, null);

			sql = "insert into OA_KM_KWFolder kw(kw, kw.version, kw.fKWID, kw.fFolderKind, kw.fFolderID, kw.fKWFullID, kw.fKWFullName) " 
				+ "(select guid(),0,'"
					+ kwid
					+ "','MainFolder',f,concat(f.fFullID,'/','"
					+ kwid
					+ "'),null from OA_KM_Folder f where f = '"
					+ knowledgeData.getString("fFolderID") + "')";
			KSQL.executeUpdate(sql, null, OADataModel, null);

			sql = "insert into OA_KM_KWFolder kw(kw, kw.version, kw.fKWID, kw.fFolderKind, kw.fFolderID, kw.fKWFullID, kw.fKWFullName) " 
				+ "(select guid(),0,'"
					+ kwid
					+ "','OtherFolder',f,concat(f.fFullID,'/','"
					+ kwid
					+ "'),null from OA_KM_Folder f where f in ("
					+ otherFolderIDs + "))";
			KSQL.executeUpdate(sql, null, OADataModel, null);

			// 重置权限
			System.out.println("fIsInheritRights="+knowledgeData.getInt("fIsInheritRights"));
			if (knowledgeData.getInt("fIsInheritRights") == 1) {
				sql = "delete from OA_KM_Rights r where r.fKWID = '" + kwid
						+ "' and r.fIsInherit = 1";
				KSQL.executeUpdate(sql, null, OADataModel, null);
				
				otherFolderIDs = "'" + knowledgeData.getString("fFolderID")
						+ "'," + otherFolderIDs;
				sql = "insert into OA_KM_Rights r(r,r.version,r.fKWKind,r.fFolderID,r.fFolderName,r.fKWID,r.fKWName,r.fKWFullID,r.fKWFullName,"
						+ "r.fOrgKind,r.fOrgID,r.fOrgName,r.fOrgFID,r.fOrgFName,r.fCanCreateKW,r.fCanReadKW,r.fCanCreateComment,r.fCanReadComment,r.fCanScore,"
						+ "r.fCanReadRecord,r.fIsInherit,r.fCreatePsnID,r.fCreatePsnName,r.fCreateTime,r.fCanReleaseKW) " 
						+"(select guid(),0,'Knowledge',r.fFolderID,null,'"
						+ kwid
						+ "',null,concat(r.fKWFullID,'/' ,'"
						+ kwid
						+ "'),null,r.fOrgKind,r.fOrgID,r.fOrgName,r.fOrgFID,r.fOrgFName,r.fCanCreateKW,r.fCanReadKW,r.fCanCreateComment,r.fCanReadComment,r.fCanScore,"
						+ "r.fCanReadRecord,1,'"
						+ com.justep.oa.SysUtils.getCurrentPersonID()
						+ "','"
						+ com.justep.oa.SysUtils
								.getCurrentPersonNameWithAgent()
						+ "',:currentDate,r.fCanReleaseKW from OA_KM_Rights r where r.fKWKind = 'Folder' and r.fFolderID in ("
						+ otherFolderIDs + "))";
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("currentDate", CommonUtils.getCurrentDateTime());
				KSQL.executeUpdate(sql, param, OADataModel, null);
			} else {
				sql = "update OA_KM_Rights r set r.fKWID = 'knowledgeTranfer' where r.fKWID = '"
						+ kwid + "'";
				KSQL.executeUpdate(sql, null, OADataModel, null);
				
				sql = "insert into OA_KM_Rights r(r,r.version,r.fKWKind,r.fFolderID,r.fFolderName,r.fKWID,r.fKWName,r.fKWFullID,r.fKWFullName,"
						+ "r.fOrgKind,r.fOrgID,r.fOrgName,r.fOrgFID,r.fOrgFName,r.fCanCreateKW,r.fCanReadKW,r.fCanCreateComment,r.fCanReadComment,r.fCanScore,"
						+ "r.fCanReadRecord,r.fIsInherit,r.fCreatePsnID,r.fCreatePsnName,r.fCreateTime,r.fCanReleaseKW) "
						+ "(select guid(),0,'Knowledge',null,null,'"
						+ kwid
						+ "',null,null,null,rr.fOrgKind,rr.fOrgID,rr.fOrgName,rr.fOrgFID,rr.fOrgFName,1,1,1,1,1,"
						+ "1,0,'"
						+ com.justep.oa.SysUtils.getCurrentPersonID()
						+ "','"
						+ com.justep.oa.SysUtils
								.getCurrentPersonNameWithAgent()
						+ "',:currentDate,1 from (select distinct s.fOrgKind as fOrgKind,s.fOrgID as fOrgID,s.fOrgName as fOrgName,s.fOrgFID as fOrgFID,s.fOrgFName as fOrgFName from OA_KM_Rights s where s.fKWID = 'knowledgeTranfer') rr)";
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("currentDate", CommonUtils.getCurrentDateTime());
				KSQL.executeUpdate(sql, param, OADataModel, null);
				
				sql = "delete from OA_KM_Rights r where r.fKWID = 'knowledgeTranfer'";
				KSQL.executeUpdate(sql, null, OADataModel, null);
			}
		List<DataPermission> emp = Collections.emptyList();
		return BizData.save(table, concept, emp, emp, emp, readOnly, notNull, dataModel, null);
	}

	public static void deleteKWInfo(String BizID) {
		String sql = "delete from OA_KM_Knowledge k where k.fBizID ='" + BizID + "'";
		KSQL.executeUpdate(sql, null, OADataModel, null);
	}
}