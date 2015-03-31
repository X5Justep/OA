import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.justep.oa.SysUtils;
import com.justep.model.ModelUtils;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.util.CommonUtils;
import com.justep.system.context.ContextHelper;

public class KMFolder {
	public static final String OADataModel ="/OA/knowledge/data";
	/**
	 * 初始化栏目根节点(public,private,map)
	 * 
	 * @throws Exception
	 */
	public static void initFolderRoot(){
		boolean hasPublicRoot = false, hasPrivateRoot = false, hasMapRoot = false;

		String querySql = "select f from OA_KM_Folder f where f.fUseStatus = 1 and f.fParent is null";
		Table table = KSQL.select(querySql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs = rows.next();
			String fid = rs.getString("f");
			if (fid.equals("public")) {
				hasPublicRoot = true;
			} else if (fid.equals("private")) {
				hasPrivateRoot = true;
			} else if (fid.equals("map")) {
				hasMapRoot = true;
			}
		}
		String sql = "insert into OA_KM_Folder f(f,f.fName,f.fDescription,f.fFullID,f.fFullName,"
					+ "f.fUseStatus,f.fUseStatusName,f.fCreatePsnID,f.fCreatePsnName,f.fCreateTime,f.version) "
					+ "values('{fID}','{fName}','{fDescription}','{fFullID}','{fFullName}',1,'启用','{fCreatePsnID}','{fCreatePsnName}',:currentDate,0)";
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("currentDate", CommonUtils.getCurrentDateTime());	
		String insertSql = null;
		if (!hasPublicRoot) {
			insertSql = sql.replace("{fID}", "public").replace("{fName}", "知识中心").replace("{fDescription}", "知识中心")
							.replace("{fFullID}", "public").replace("{fFullName}", "知识中心").replace("{fCreatePsnID}", SysUtils.getCurrentPersonID())
							.replace("{fCreatePsnName}", SysUtils.getCurrentPersonNameWithAgent());
			KSQL.executeUpdate(insertSql, param, OADataModel, null);
		}
		if (!hasPrivateRoot) {
			insertSql = sql.replace("{fID}", "private").replace("{fName}", "个人知识").replace("{fDescription}", "个人知识")
							.replace("{fFullID}", "private").replace("{fFullName}", "个人知识").replace("{fCreatePsnID}", SysUtils.getCurrentPersonID())
							.replace("{fCreatePsnName}", SysUtils.getCurrentPersonNameWithAgent());
			KSQL.executeUpdate(insertSql, param, OADataModel, null);
		}
		if (!hasMapRoot) {
			insertSql = sql.replace("{fID}", "map").replace("{fName}", "知识地图").replace("{fDescription}", "知识地图").replace("{fFullID}", "map")
							.replace("{fFullName}", "知识地图").replace("{fCreatePsnID}", SysUtils.getCurrentPersonID())
							.replace("{fCreatePsnName}", SysUtils.getCurrentPersonNameWithAgent());
			KSQL.executeUpdate(insertSql, param, OADataModel, null);
		}
	}

	/**
	 * 新增栏目时赋初始值
	 * 
	 * @param folderID
	 * @param pid
	 * @throws Exception
	 */
	public static void setDefValueToFolderWhenNew(String folderID, String pid) {
		String updateSql = null;
		if (pid.equals("public") || pid.equals("private") || pid.equals("map")) {
			updateSql = "update OA_KM_Folder f set f.fIsNeedApprove=0,f.fIsInheritApprove=0,f.fIsInheritManager=0,f.fIsInheritRights=0 "
						+ "where f = '"+folderID+"'";
		} else {
			updateSql = "update OA_KM_Folder f set f.fIsNeedApprove=0,f.fIsInheritApprove=1,f.fIsInheritManager=1,f.fIsInheritRights=1 "
						+ "where f = '"+folderID+"'";
		}
		KSQL.executeUpdate(updateSql, null, OADataModel, null);
	}

	/**
	 * 全部启用(栏目)
	 * 
	 * @throws Exception
	 */
	public static void allUse(String kind)  {
		String sql = "update OA_KM_Folder f set f.fUseStatus = 1,f.fUseStatusName='启用' where f.fUseStatus = 0 and f.fFullID like '" + kind + "%'";
		KSQL.executeUpdate(sql, null, OADataModel, null);
	}

	/**
	 * 更新栏目fFullName路径
	 * 
	 * @throws Exception
	 */
	public static void updateAllSubNodeFullName(String oldFName, String newFName) {
		String updateSql = "update OA_KM_Folder f set f.fFullName = replace(f.fFullName, '"+oldFName+"', '"+newFName+"') " + "where f.fFullName like concat('"+oldFName+"','%')";
		KSQL.executeUpdate(updateSql, null, OADataModel, null);

	}

	/**
	 * 继承父栏目审批设置
	 * 
	 * @param folderID
	 * @throws Exception
	 */
	public static void inheritApproveSet(String folderID) {
		String fIsNeedApprove = null;
		String querySql = "select f.fIsNeedApprove from OA_KM_Folder f where f in(select ff.fParent from OA_KM_Folder ff where not ff.fParent in('public','map','private'))";
		Table table = KSQL.select(querySql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			Row rs = rows.next();
			fIsNeedApprove = rs.getInteger("fIsNeedApprove").toString();
		}

		if (fIsNeedApprove != null) {
			String updateSql = "update OA_KM_Folder f set f.fIsNeedApprove = '"+fIsNeedApprove+"',f.fIsInheritApprove=1 " + "where f = '"+folderID+"'";
			KSQL.executeUpdate(updateSql, null, OADataModel, null);
		}


	}

	/**
	 * 继承父栏目 管理员设置
	 * 
	 * @param folderID
	 * @param createPsnID
	 * @param createPsnName
	 * @return
	 * @throws Exception
	 */
	public static String inheritManagerSet(String folderID) {
		String sql = null;
		String result = "";
		String strCurrentDate = null;

		String createPsnID = com.justep.oa.SysUtils.getCurrentPersonID();
		String createPsnName = com.justep.oa.SysUtils.getCurrentPersonName();


		sql = "select f.fParent from OA_KM_Folder f where f='" + folderID + "'";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			Row rs = rows.next();
			String pid = rs.getString("fParent");
			if (pid.equals("public") || pid.equals("private") || pid.equals("map")) { // 是根节点
				result = "not need inherit";
				return result;
			} else {
				sql = "update OA_KM_Folder f set f.fIsInheritManager = 1,f.fManagerNames= (select ff.fManagerNames from (select r as fID,r.fManagerNames as fManagerNames from OA_KM_Folder r) ff where ff.fID='"
							+ pid + "') where f='" + folderID + "'";
				KSQL.executeUpdate(sql, null, OADataModel, null);

				sql = "delete from OA_KM_FDManager m where (m.fFolderID = '" + folderID + "' and m.fIsInherit = 1) or (m.fFolderID = '"
							+ folderID + "' and m.fManagerID in(select mm.fManagerID from (select fm.fFolderID as fFolderID,fm.fManagerID as fManagerID from OA_KM_FDManager fm) mm where mm.fFolderID='" + pid + "'))";
				KSQL.executeUpdate(sql, null, OADataModel, null);

				sql = "insert into OA_KM_FDManager m(m,m.version,m.fFolderID,m.fManagerID,m.fManagerName,m.fIsInherit,"
							+ "m.fCreatePsnID,m.fCreatePsnName,m.fCreateTime)(select guid(),0,'" + folderID
							+ "',mm.fManagerID,mm.fManagerName,1," + "'" + createPsnID + "','" + createPsnName + "',:currentDate "
							+ "from OA_KM_FDManager mm " + "where mm.fFolderID='" + pid + "')";
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("currentDate", CommonUtils.getCurrentDateTime());
				KSQL.executeUpdate(sql, param, OADataModel, null);
				result = "success";
			}
		} else {
			result = "栏目无效!";
		}

		return result;
	}

	/**
	 * 继承父栏目权限设置
	 * 
	 * @param folderID
	 * @param createPsnID
	 * @param createPsnName
	 * @return
	 * @throws Exception
	 */
	public static void inheritRightsSet(String folderID){
		String sql = null;
		String createPsnID = com.justep.oa.SysUtils.getCurrentPersonID();
		String createPsnName = com.justep.oa.SysUtils.getCurrentPersonName();

		sql = "select f.fParent,f.fFullID from OA_KM_Folder f where f = '" + folderID + "'";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			Row rs = rows.next();
			String pFolderID = rs.getString("fParent");
			String folderFullID = rs.getString("fFullID");

			sql = "insert into OA_KM_Rights r(r,r.version,r.fKWKind,r.fFolderID,r.fKWFullID,r.fOrgKind,r.fOrgID,r.fOrgName,r.fOrgFID,r.fOrgFName,"
						+ "r.fCanCreateKW,r.fCanReadKW,r.fCanReleaseKW,r.fCanCreateComment,r.fCanReadComment,r.fCanScore,r.fCanReadRecord,r.fIsInherit,"
						+ "r.fCreatePsnID,r.fCreatePsnName,r.fCreateTime) (select guid(),0,'Folder','" + folderID + "','" + folderFullID
						+ "'," + "rr.fOrgKind,rr.fOrgID,rr.fOrgName,rr.fOrgFID,rr.fOrgFName,"
						+ "rr.fCanCreateKW,rr.fCanReadKW,rr.fCanReleaseKW,rr.fCanCreateComment,rr.fCanReadComment,rr.fCanScore,rr.fCanReadRecord,1,'" + createPsnID
						+ "','" + createPsnName + "',:currentDate from OA_KM_Rights rr where rr.fFolderID='" + pFolderID
						+ "' and rr.fKWKind = 'Folder')";

			Map<String, Object> param = new HashMap<String, Object>();
			param.put("currentDate", CommonUtils.getCurrentDateTime());
			KSQL.executeUpdate(sql, param, OADataModel, null);
		}
	}

	/**
	 * 获取栏目信息
	 * 
	 * @param folderID
	 * @throws Exception
	 */
	public static String getFolderInfo(String folderID){
		String result = "";
		String querySql = "select f.fIsNeedApprove,f.fIsInheritApprove,f.fIsInheritManager,f.fManagerNames,f.fIsInheritRights, "
					+ "f.fFullName from OA_KM_Folder f where f = '"+folderID+"'";
		Table table = KSQL.select(querySql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			Row rs = rows.next();
			String fIsNeedApprove = rs.getInteger("fIsNeedApprove").toString();
			String fIsInheritApprove = rs.getInteger("fIsInheritApprove").toString();
			String fIsInheritManager = rs.getInteger("fIsInheritManager").toString();
			String fManagerNames = rs.getString("fManagerNames");

			if (fManagerNames == null || fManagerNames.equals("")) {
							fManagerNames = getFolderManagers(folderID);
			}
			String fIsInheritRights = rs.getInteger("fIsInheritRights").toString();
			String fFullName = rs.getString("fFullName");
			result = fIsNeedApprove + "|" + fIsInheritApprove + "|" + fIsInheritManager + "|" + fManagerNames + "|" + fIsInheritRights
								+ "|" + fFullName;

		} else {
			result = "获取栏目信息失败!";
		}
		return result;
	}

	private static String getFolderManagers(String folderID) {
		String result = "";
		String querySql = "select m.fManagerName from OA_KM_FDManager m where m.fFolderID = '"+folderID+"'";

		Table table = KSQL.select(querySql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs = rows.next();
			String manager = rs.getString("fManagerName");
			result = manager + " " + result;
		}

		return result;
	}

	/**
	 * 根据栏目ID获取栏目ID路径(即fFullID)
	 * 
	 * @param conn
	 * @param folderID
	 * @return
	 * @throws Exception
	 */
	private static String getFolderFullID(String folderID) {
		String fullID = null;
		String sql = "select f.fFullID from OA_KM_Folder f where f = '"+folderID+"'";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			Row rs = rows.next();
			fullID = rs.getString("fFullID");
		}
		return fullID;
	}

	/**
	 * 获取父栏目审批设置
	 * 
	 * @param folderID
	 * @return
	 * @throws Exception
	 */
	public static String getParentFolderApproveSet(String folderID){
		String result = "";

		String querySql = "select f,f.fIsNeedApprove from OA_KM_Folder f where f = (select ff.fParent from OA_KM_Folder ff where ff = '"+folderID+"')";
		System.out.print(querySql);
		Table table = KSQL.select(querySql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			Row rs = rows.next();
			String id = rs.getString("f");
			if(id.equals("public") || id.equals("private") || id.equals("map"))
				result = id + " ";
			else{
				String needApprove =   Integer.toString(rs.getInt("fIsNeedApprove"));
				result = id + " " + needApprove;
			}
			
		} else {
			result="没有找到父栏目!";
		}

		return result;
	}

	/**
	 * 更新栏目审批设置
	 * 
	 * @param folderID
	 * @param isNeedApprove
	 * @param isInherit
	 * @param isOverride
	 * @throws Exception
	 */
	public static void updateFolderApproveSet(String folderID, String isNeedApprove, String isInherit, String isOverride){

		String updateSql = "update OA_KM_Folder f set f.fIsNeedApprove='"+isNeedApprove+"',f.fIsInheritApprove='"+isInherit+"' where f='"+folderID+"'";
		KSQL.executeUpdate(updateSql, null, OADataModel, null);
		if (isOverride.equals("0")) {
			updateSubFDApproveSetByInherit(folderID, isNeedApprove);
		} else {
			updateSubFDApproveSetByOverride(folderID, isNeedApprove);
		}
	}

	private static void updateSubFDApproveSetByInherit(String folderID, String isNeedApprove) {
		boolean isSuccess = setApproveRebuildFlag(folderID); // 设置重构标记
		if (isSuccess) {
			String folderFullID = getFolderFullID(folderID);
			if ((folderFullID != null) && (!folderFullID.equals(""))) {
				String fullIDCondition = folderFullID + "%";

				// 构造更新范围
				String rang = "select c.cID from (select c1 as cID,c1.fParent as fParent,c1.fFullID as fFullID,c1.fRebuildApprove as fRebuildApprove,c1.fIsInheritApprove as fIsInheritApprove from OA_KM_Folder c1) c join (select p1 as pID,p1.fRebuildApprove as fRebuildApprove from OA_KM_Folder p1) p "
						+ " on c.fParent = p.pID and c.fRebuildApprove = 1 and p.fRebuildApprove = 0 and c.fIsInheritApprove = 1"
						+ " and c.fFullID like '"+ fullIDCondition+"'";

				// 继承父审批设置
				String updateApprove = "update OA_KM_Folder f set f.fIsNeedApprove="+Integer.parseInt(isNeedApprove)+",f.fIsInheritApprove=1 where f in("+rang+")";
				KSQL.executeUpdate(updateApprove, null, OADataModel, null);
				// 更新重构标记
				String udpateRebuild = "update OA_KM_Folder f set f.fRebuildApprove = 0 where f in("+rang+")";
				KSQL.executeUpdate(udpateRebuild, null, OADataModel, null);
			}
		}
	}

	private static void updateSubFDApproveSetByOverride(String folderID, String isNeedApprove)  {
		String folderFullID = getFolderFullID(folderID);
		if ((folderFullID != null) && (!folderFullID.equals(""))) {
			String fullIDCondition = folderFullID + "/%";

			// 覆盖子栏目审批设置
			String updateApprove = "update OA_KM_Folder f set f.fIsNeedApprove="+isNeedApprove+",f.fIsInheritApprove=1 where f.fFullID like '"+fullIDCondition+"'";
			KSQL.executeUpdate(updateApprove, null, OADataModel, null);
		}
	}

	private static boolean setApproveRebuildFlag(String folderID){
		boolean flag = false;

		// 修改根栏目审批重构的标记为0
		String sql = "update OA_KM_Folder f set f.fRebuildApprove = 0 where f = '"+folderID+"'";
		KSQL.executeUpdate(sql, null, OADataModel, null);
		String folderFullID = getFolderFullID(folderID);

		// 修改所有子栏目的审批重构标记为1
		if ((folderFullID != null) && (!folderFullID.equals(""))) {
			String fullIDCondition = folderFullID + "/%";
			sql = "update OA_KM_Folder f set f.fRebuildApprove = 1 where f.fFullID like '"+fullIDCondition+"'";
			KSQL.executeUpdate(sql, null, OADataModel, null);
		}
		flag = true;

		return flag;
	}

	/**
	 * 获取父栏目管理员
	 * 
	 * @param folderID
	 * @return
	 * @throws Exception
	 */
	public static Table getParentFolderManagerSet(String folderID) {
		String ksqlSelect = "select OA_KM_FDManager.fManagerID,OA_KM_FDManager.fManagerName "
				+ "from OA_KM_FDManager OA_KM_FDManager where OA_KM_FDManager.fFolderID = (select OA_KM_Folder.fParent "
				+ "from OA_KM_Folder OA_KM_Folder " + "where OA_KM_Folder ='" + folderID + "')";
		Table result = KSQL.select(ksqlSelect, null, "/OA/knowledge/data", null);
		return result;
	}

	public static void updateAllSubFolderManagerSet(String folderID, String isInherit, String kind) throws Exception {
		String createPsnID = com.justep.oa.SysUtils.getCurrentPersonID();
		String createPsnName = com.justep.oa.SysUtils.getCurrentPersonName();
		if (kind.equals("1")) { // 继承
			boolean isSuccess = setManagersRebuildFlag(folderID); // 设置重构标记
			if (isSuccess) {
				rebuildManagers(folderID, createPsnID, createPsnName); // 重构栏目管理员
			}
		} else { // 覆盖
			overrideFolderManagers(folderID, createPsnID, createPsnName);
		}
		String updateSql = "update OA_KM_Folder f set f.fIsInheritManager ="+isInherit+" where f = '"+folderID+"'";
		KSQL.executeUpdate(updateSql, null, OADataModel, null);
	}

	/**
	 * 重构栏目管理员(子栏目继承父栏目管理员)
	 * 
	 * @param conn
	 * @param folderID
	 * @param createPsnID
	 * @param createPsnName
	 * @throws Exception
	 */
	private static void rebuildManagers(String folderID, String createPsnID, String createPsnName) {
		String folderFullID = getFolderFullID( folderID);

		if ((folderFullID != null) && (!folderFullID.equals(""))) {
			String fullIDCondition = folderFullID + "%";

			// 构造更新范围
			String rang = "select c.fID from (select c1 as fID,c1.fParent,c1.fRebuildManager,c1.fIsInheritManager,c1.fFullID from OA_KM_Folder c1) c join (select p1 as fID,p1.fRebuildManager as fRebuildManager from OA_KM_Folder p1) p "
					+ " on c.fParent = p.fID and c.fRebuildManager = 1 and p.fRebuildManager = 0 and c.fIsInheritManager = 1"
					+ " and c.fFullID like '"+fullIDCondition+"'";

			// 删除原有继承管理员
			String delInheritSqL = "delete from OA_KM_FDManager fm where fm.fFolderID in ("+rang+") and fm.fIsInherit = 1";
			KSQL.executeUpdate(delInheritSqL, null, OADataModel, null);
			// 继承父管理员
			String insertInheritSql = "insert into OA_KM_FDManager m(m,m.version,m.fFolderID,m.fManagerID,m.fManagerName,m.fIsInherit,"
					+ "m.fCreatePsnID,m.fCreatePsnName,m.fCreateTime) (select guid(),0,f,mm.fManagerID,mm.fManagerName,1,'"+createPsnID
					+"','"+createPsnName+"',:currentDate from OA_KM_Folder f join OA_KM_FDManager mm on mm.fFolderID = f.fParent " 
					+"where f in ("+rang+"))";
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("currentDate", CommonUtils.getCurrentDateTime());
			KSQL.executeUpdate(insertInheritSql, param, OADataModel, null);
			// 去重
			String delRepeatSql = "delete from OA_KM_FDManager m where m.fFolderID in ("+rang+")"
					+ " and (select Max(CONCAT(case when t.fIsInherit=0 then '0' else '1' end, t.fID)) from (select tt as fID ,tt.fIsInherit,tt.fFolderID,tt.fManagerID from OA_KM_FDManager tt) t "
					+ " 		where t.fFolderID = m.fFolderID and t.fManagerID = m.fManagerID "
					+ " ) <> (concat(case when m.fIsInherit=0 then '0' else '1' end , m))";
			KSQL.executeUpdate(delRepeatSql, null, OADataModel, null);
			// 更新重构标记
			String updateSql = "update OA_KM_Folder f set f.fRebuildManager = 0 where f in("+rang+")";
			KSQL.executeUpdate(updateSql, null, OADataModel, null);
		}
	}

	private static void overrideFolderManagers(String folderID, String createPsnID, String createPsnName) {

		String folderFullID = getFolderFullID(folderID);
		if ((folderFullID != null) && (!folderFullID.equals(""))) {
			String fullIDCondition = folderFullID + "/%";
			String rang = "select f from OA_KM_Folder f where f.fFullID like '"+fullIDCondition+"'";

			String delSql = "delete from OA_KM_FDManager m where m.fFolderID in ("+rang+")";
			KSQL.executeUpdate(delSql, null, OADataModel, null);
			
			String insertSql = "insert into OA_KM_FDManager m(m,m.version,m.fFolderID,m.fManagerID,m.fManagerName,m.fIsInherit,"
					+ "	m.fCreatePsnID,m.fCreatePsnName,m.fCreateTime) (select guid(),0,f,m.fManagerID,m.fManagerName,1,"
					+ " '"+createPsnID+"','"+createPsnName+"',:currentDate from OA_KM_Folder f join OA_KM_FDManager m on m.fFolderID = '"+folderID+"' and f in("+rang+"))";
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("currentDate", CommonUtils.getCurrentDateTime());
			KSQL.executeUpdate(insertSql, param, OADataModel, null);
			
			String updateSql = "update OA_KM_Folder f set f.fIsInheritManager = 1 where f.fFullID like '"+fullIDCondition+"'";
			KSQL.executeUpdate(updateSql, null, OADataModel, null);
		}
	}

	/**
	 * 设置管理员重构标记(0=不需要重构 1=需要重构)
	 * 
	 * @param conn
	 * @param folderID
	 * @return
	 * @throws Exception
	 */
	private static boolean setManagersRebuildFlag(String folderID) {
		boolean flag = false;
	
		// 修改根栏目管理员重构的标记为0
		String sql = "update OA_KM_Folder f set f.fRebuildManager = 0 where f = '"+folderID+"'";
		KSQL.executeUpdate(sql, null, OADataModel, null);
		
		String folderFullID = getFolderFullID(folderID);

		// 修改所有子栏目的管理员重构标记为1
		if ((folderFullID != null) && (!folderFullID.equals(""))) {
			String fullIDCondition = folderFullID + "/%";
			sql = "update OA_KM_Folder f set f.fRebuildManager = 1 where f.fFullID like '"+fullIDCondition+"'";
			KSQL.executeUpdate(sql, null, OADataModel, null);
		}
		flag = true;

		return flag;
	}

	/**
	 * 获取父栏目权限设置
	 * 
	 * @param folderID
	 * @throws Exception
	 */
	public static Table getParentFolderRightsSet(String folderID) {
		String ksqlSelect = "select "
				+ "OA_KM_Rights.fOrgKind,OA_KM_Rights.fOrgID,OA_KM_Rights.fOrgName,OA_KM_Rights.fOrgFID,OA_KM_Rights.fOrgFName,"
				+ "OA_KM_Rights.fCanCreateKW,OA_KM_Rights.fCanReadKW,OA_KM_Rights.fCanReleaseKW,OA_KM_Rights.fCanCreateComment,OA_KM_Rights.fCanReadComment,OA_KM_Rights.fCanReadRecord,OA_KM_Rights.fCanScore "
				+ "from OA_KM_Rights OA_KM_Rights where OA_KM_Rights.fFolderID = (select OA_KM_Folder.fParent " + "from OA_KM_Folder OA_KM_Folder "
				+ "where OA_KM_Folder='" + folderID + "') and OA_KM_Rights.fKWKind = 'Folder'";
		Table result = KSQL.select(ksqlSelect, null, "/OA/knowledge/data", null);
		return result;
	}

	/**
	 * 更新所有子栏目权限设置(继承,包括更新继承栏目权限的知识)
	 * 
	 * @param folderID
	 * @throws Exception
	 */
	public static void updateAllSubFDRightsSet(String folderID) {

		String createPsnID = com.justep.oa.SysUtils.getCurrentPersonID();
		String createPsnName = com.justep.oa.SysUtils.getCurrentPersonName();

		boolean isSuccess = setRightsRebuildFlag(folderID); // 设置重构标记
		if (isSuccess) {
			rebuildRights(folderID, createPsnID, createPsnName); // 重构栏目权限
		}
	}

	/**
	 * 重构栏目权限(子栏目继承父栏目权限)
	 * 
	 * @param conn
	 * @param folderID
	 * @param createPsnID
	 * @param createPsnName
	 * @throws Exception
	 */
	private static void rebuildRights(String folderID, String createPsnID, String createPsnName){


		String folderFullID = getFolderFullID(folderID);

		if ((folderFullID != null) && (!folderFullID.equals(""))) {
			String fullIDCondition = folderFullID + "%";

			// 构造更新范围
			String rang = "select c.fID from (SELECT c1 AS fID,c1.fParent,c1.fRebuildRight,c1.fIsInheritRights,c1.fFullID AS fFullID from OA_KM_Folder c1) c join (select p1 as fID,p1.fRebuildRight AS fRebuildRight from OA_KM_Folder p1) p "
					+ " on c.fParent = p.fID and c.fRebuildRight = 1 and p.fRebuildRight = 0 and c.fIsInheritRights = 1"
					+ " and c.fFullID like '"+ fullIDCondition+"'";

			// 删除原有继承权限
			String delInheritSqL ="delete from OA_KM_Rights r where r.fFolderID in ("+rang+")"
					+ " and r.fIsInherit = 1 and r.fKWKind = 'Folder'";
			KSQL.executeUpdate(delInheritSqL, null, OADataModel, null);
			// 继承父权限
			String insertInheritSql = "insert into OA_KM_Rights r(r,r.version,r.fKWKind,r.fFolderID,r.fKWFullID,"
					+ "	r.fOrgKind,r.fOrgID,r.fOrgName,r.fOrgFID,r.fOrgFName,r.fCanCreateKW,r.fCanReadKW,r.fCanReleaseKW,"
					+ " r.fCanCreateComment,r.fCanReadComment,r.fCanScore,r.fCanReadRecord,r.fIsInherit,"
					+ " r.fCreatePsnID,r.fCreatePsnName,r.fCreateTime)  (select guid(),0,'Folder',f,f.fFullID,"
					+ "	rr.fOrgKind,rr.fOrgID,rr.fOrgName,rr.fOrgFID,rr.fOrgFName,rr.fCanCreateKW,rr.fCanReadKW,rr.fCanReleaseKW,"
					+ " rr.fCanCreateComment,rr.fCanReadComment,rr.fCanScore,rr.fCanReadRecord,1," 
					+ " 	'"+createPsnID+"','"+createPsnName+"',:currentDate from OA_KM_Folder f  "
					+ " join OA_KM_Rights rr on rr.fFolderID = f.fParent where f in ("+rang+") and rr.fKWKind = 'Folder')";
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("currentDate", CommonUtils.getCurrentDateTime());
			KSQL.executeUpdate(insertInheritSql, param, OADataModel, null);
			
			// 去重
			String delRepeatSql = "delete from OA_KM_Rights OA_KM_Rights where OA_KM_Rights.fFolderID in ("+rang+") "
					+ " and (select Max(CONCAT(case when t.fIsInherit=0 then '0' else '1' end , t.fID)) from (select tt as fID,tt.fIsInherit,tt.fFolderID,tt.fKWID,tt.fKWKind,tt.fOrgFID from OA_KM_Rights tt) t "
					+ " where COALESCE(t.fFolderID, '-') = COALESCE(OA_KM_Rights.fFolderID, '-') "
					+ " and COALESCE(t.fKWID, '-') = COALESCE(OA_KM_Rights.fKWID, '-') and t.fOrgFID = OA_KM_Rights.fOrgFID "
					+ "	and t.fKWKind = OA_KM_Rights.fKWKind ) <> (CONCAT(case when OA_KM_Rights.fIsInherit=0 then '0' else '1' end , OA_KM_Rights)) "
					+ " and OA_KM_Rights.fKWKind = 'Folder'";
			KSQL.executeUpdate(delRepeatSql, null, OADataModel, null);
			// 更新重构标记
			String updateSql = "update OA_KM_Folder f set f.fRebuildRight = 0 where f in("+rang+")";
			KSQL.executeUpdate(updateSql, null, OADataModel, null);
			
			String folderRang = "'" + folderID + "'";
			rebuildKWRights(folderRang, createPsnID, createPsnName); // 重构根栏目知识权限

		}
	}

	/**
	 * 重构知识权限(知识继承栏目权限)
	 * 
	 * @param conn
	 * @param folderRang
	 * @param createPsnID
	 * @param createPsnName
	 * @throws Exception
	 */
	private static void rebuildKWRights(String folderRang, String createPsnID, String createPsnName){

		// 删除原有继承
		String delSql = "delete from OA_KM_Rights r where r.fFolderID in ("+folderRang+") and r.fKWKind = 'Knowledge' and r.fIsInherit = 1";
		KSQL.executeUpdate(delSql, null, OADataModel, null);
		// 继承栏目权限
		String insertSql = "insert into OA_KM_Rights r(r,r.version,r.fKWKind,r.fFolderID,r.fKWID,r.fKWFullID,"
				+ "	r.fOrgKind,r.fOrgID,r.fOrgName,r.fOrgFID,r.fOrgFName,r.fCanCreateKW,r.fCanReadKW,r.fCanReleaseKW,"
				+ " r.fCanCreateComment,r.fCanReadComment,r.fCanScore,r.fCanReadRecord,r.fIsInherit,"
				+ "	r.fCreatePsnID,r.fCreatePsnName,r.fCreateTime) (select guid(),0,'Knowledge',rr.fFolderID,kf.fKWID,kf.fKWFullID,"
				+ "	rr.fOrgKind,rr.fOrgID,rr.fOrgName,rr.fOrgFID,rr.fOrgFName,rr.fCanCreateKW,rr.fCanReadKW,rr.fCanReleaseKW,"
				+ " rr.fCanCreateComment,rr.fCanReadComment,rr.fCanScore,rr.fCanReadRecord,1,'"+createPsnID+"','"+createPsnName+"',:currentDate from OA_KM_Rights rr "
				+ "	join OA_KM_KWFolder kf on rr.fFolderID = kf.fFolderID "
				+ "	join OA_KM_Knowledge k on kf.fKWID = k and k.fIsInheritRights = 1 where rr.fFolderID in ("+folderRang+") and rr.fKWKind = 'Folder') ";

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("currentDate", CommonUtils.getCurrentDateTime());
		KSQL.executeUpdate(insertSql, param, OADataModel, null);
	}

	/**
	 * 设置权限重构标记(0=不需要重构 1=需要重构)
	 * 
	 * @param conn
	 * @param folderID
	 * @return
	 * @throws Exception
	 */
	private static boolean setRightsRebuildFlag(String folderID){
		boolean flag = false;
		// 修改根栏目权限重构的标记为0
		String sql = "update OA_KM_Folder f set f.fRebuildRight = 0 where f = '"+ folderID+"'";
		KSQL.executeUpdate(sql, null, OADataModel, null);

		String folderFullID = getFolderFullID(folderID);

		// 修改所有子栏目的权限重构标记为1
		if ((folderFullID != null) && (!folderFullID.equals(""))) {
			String fullIDCondition = folderFullID + "/%";
			sql = "update OA_KM_Folder f set f.fRebuildRight = 1 where f.fFullID like '"+fullIDCondition+"'";
			KSQL.executeUpdate(sql, null, OADataModel, null);	
		}

		flag = true;

		return flag;
	}

	/**
	 * 覆盖子栏目权限设置
	 * 
	 * @param folderID
	 * @throws Exception
	 */
	public static void overrideAllSubFDRightsSet(String folderID) {
		String createPsnID = com.justep.oa.SysUtils.getCurrentPersonID();
		String createPsnName = com.justep.oa.SysUtils.getCurrentPersonName();
		overrideFolderRights(folderID, createPsnID, createPsnName);
	}

	private static void overrideFolderRights(String folderID, String createPsnID, String createPsnName)  {

		String folderFullID = getFolderFullID(folderID);
		if ((folderFullID != null) && (!folderFullID.equals(""))) {
			String fullIDCondition = folderFullID + "/%";
			String rang = "select f from OA_KM_Folder f where f.fFullID like '"+ fullIDCondition+"'";

			String delSql = "delete from OA_KM_Rights r where r.fFolderID in ("+rang+") and r.fKWKind = 'Folder'";
			KSQL.executeUpdate(delSql, null, OADataModel, null);
			
			String insertSql = "insert into OA_KM_Rights r(r,r.version,r.fKWKind,r.fFolderID,r.fKWFullID,"
					+ "	r.fOrgKind,r.fOrgID,r.fOrgName,r.fOrgFID,r.fOrgFName,r.fCanCreateKW,r.fCanReadKW,r.fCanReleaseKW,"
					+ " r.fCanCreateComment,r.fCanReadComment,r.fCanScore,r.fCanReadRecord,r.fIsInherit,"
					+ " r.fCreatePsnID,r.fCreatePsnName,r.fCreateTime) (select guid(),0,'Folder',f,f.fFullID,"
					+ "	rr.fOrgKind,rr.fOrgID,rr.fOrgName,rr.fOrgFID,rr.fOrgFName,rr.fCanCreateKW,rr.fCanReadKW,rr.fCanReleaseKW,"
					+ " rr.fCanCreateComment,rr.fCanReadComment,rr.fCanScore,rr.fCanReadRecord,1," 
					+ " '"+createPsnID+"','"+createPsnName+"',:currentDate  from OA_KM_Folder f  "
					+ " join OA_KM_Rights rr on rr.fFolderID = '"+folderID+"' and rr.fKWKind = 'Folder' " + " and f in ("+rang+"))";
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("currentDate", CommonUtils.getCurrentDateTime());
			KSQL.executeUpdate(insertSql, param, OADataModel, null);
			
			String updateSql = "update OA_KM_Folder f set f.fIsInheritRights = 1 where f in("+rang+")";
			KSQL.executeUpdate(updateSql, null, OADataModel, null);

			fullIDCondition = folderFullID + "%";
			String folderRang = "select f from OA_KM_Folder f where f.fFullID like '"+fullIDCondition+"'";
			rebuildKWRights(folderRang, createPsnID, createPsnName);

		}
	}

	/**
	 * 覆盖栏目的知识权限设置(主栏目下的知识)
	 * 
	 * @param folderID
	 * @param includeSub
	 *            includeSub = 'true' 表示要除了要覆盖当前栏目知识权限外,还要覆盖所有子栏目的知识权限
	 *            includeSub = 'false' 只覆盖当前栏目下的知识权限
	 * @throws Exception
	 */
	public static void overrideKWRightsFromFDSet(String folderID, String includeSub) {
		String createPsnID = com.justep.oa.SysUtils.getCurrentPersonID();
		String createPsnName = com.justep.oa.SysUtils.getCurrentPersonName();
		String kwRang = null;
		String mainFolderRang = null;
		if (includeSub.equals("true")) {
			String folderFullID = getFolderFullID(folderID);
			if ((folderFullID != null) && (!folderFullID.equals(""))) {
				String fullIDCondition = folderFullID + "/%";
				kwRang = "select kf.fKWFullID from OA_KM_KWFolder kf join OA_KM_Knowledge k on kf.fKWID = k "
							+ " where kf.fKWFullID like '"+fullIDCondition+"' and kf.fFolderKind = 'MainFolder'";

				fullIDCondition = folderFullID + "%";
				mainFolderRang = "select f from OA_KM_Folder f where f.fFullID like '"+fullIDCondition+"'" ;
			} else {
				return;
			}
		} else {
			kwRang = "select kf.fKWFullID from OA_KM_KWFolder kf join OA_KM_Knowledge k on kf.fKWID = k "
						+ " where kf.fFolderID = '"+folderID+"' and kf.fFolderKind = 'MainFolder'";
			mainFolderRang = "'" + folderID + "'";
		}
		rebuildKWRightsForOverride(folderID, kwRang, mainFolderRang, createPsnID, createPsnName);
	}

	private static void rebuildKWRightsForOverride(String folderID, String kwRang, String mainFolderRang, String createPsnID,
			String createPsnName){

		// 删除原有权限(主栏目)
		String delSql = "delete from OA_KM_Rights r where r.fKWKind = 'Knowledge' and r.fKWFullID in("+kwRang+") and r.fFolderID in("+mainFolderRang+")";
		KSQL.executeUpdate(delSql, null, OADataModel, null);

		String insertSql = "insert into OA_KM_Rights r(r,r.version,r.fKWKind,r.fFolderID,r.fKWID,r.fKWFullID,"
				+ "	r.fOrgKind,r.fOrgID,r.fOrgName,r.fOrgFID,r.fOrgFName,r.fCanCreateKW,r.fCanReadKW,r.fCanReleaseKW,"
				+ " r.fCanCreateComment,r.fCanReadComment,r.fCanScore,r.fCanReadRecord,r.fIsInherit,"
				+ "	r.fCreatePsnID,r.fCreatePsnName,r.fCreateTime) (select guid(),0,'Knowledge',k.fFolderID,kf.fKWID,kf.fKWFullID,"
				+ "	r.fOrgKind,r.fOrgID,r.fOrgName,r.fOrgFID,r.fOrgFName,r.fCanCreateKW,r.fCanReadKW,r.fCanReleaseKW,"
				+ " r.fCanCreateComment,r.fCanReadComment,r.fCanScore,r.fCanReadRecord,1," 
				+ " '"+createPsnID+"','"+createPsnName+"',:currentDate "
				+ "	from OA_KM_Knowledge k join OA_KM_Rights r on r.fFolderID = '"+folderID+"' and r.fKWKind = 'Folder' and k.fFolderID in("+mainFolderRang+") "
				+ " join OA_KM_KWFolder kf on k = kf.fKWID " + " and kf.fFolderKind='MainFolder' and kf.fFolderID in("+mainFolderRang+"))";
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("currentDate", CommonUtils.getCurrentDateTime());
		KSQL.executeUpdate(insertSql, param, OADataModel, null);


		String updateSql = "update OA_KM_Knowledge k set k.fIsInheritRights = 1 where (concat(k.fFolderFullID ,'/', k)) in ("+kwRang+")";
		KSQL.executeUpdate(updateSql, null, OADataModel, null);

	}

	// 判断能否删除某一栏目(为真条件：该栏目下没有子栏目和知识)
	public static boolean canDeleteFolder(String folderID) {
		boolean can = false;
		String querySubFD = "select f from OA_KM_Folder f where f.fParent = '"+folderID+"'";
		Table table = KSQL.select(querySubFD, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (!rows.hasNext()) {
			String queryKW = "select kf from OA_KM_KWFolder kf join OA_KM_Knowledge k  on kf.fFolderID = '"+folderID+"' and kf.fKWID = k";
			Table tab = KSQL.select(queryKW, null, OADataModel, null);
			Iterator<Row> tabs = tab.iterator();
			if (!tabs.hasNext()) {
				can = true;
			}
		}
		return can;
	}

	/**
	 * 更新栏目数据(dataType:数据类型,目前只支持string、integer)
	 * 
	 * @param folderID
	 * @param field
	 * @param dataType
	 * @param value
	 * @throws Exception
	 */
	public static void updateFolderData(String folderID, String field, String dataType, String value) throws Exception {
		String sql = null;

		if (dataType.equals("string")) {
			sql = "update OA_KM_Folder f set " + field + " = '" + value + "' where f='" + folderID + "'";
		} else if (dataType.equals("integer")) {
			sql = "update OA_KM_Folder f set " + field + " = " + value + " where f='" + folderID + "'";
		} else {
			throw new Exception("传入的数据类型错误,目前只支持string、integer");
		}
		KSQL.executeUpdate(sql, null, OADataModel, null);
		
	}

	// 判断能否删除某一栏目(为真条件：该栏目下没有子栏目和知识)
	public static boolean canDeleteNode(String folderID)  {
		boolean can = false;
		String querySubFD = "select 1 from OA_KM_Folder where fParent = '"+folderID+"'";
		Table table = KSQL.select(querySubFD, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (!rows.hasNext()) {
			String queryKW = "select 1 from OA_KM_KWFolder kf join OA_KM_Knowledge k " + " on kf.fFolderID =  '"+folderID+"' and kf.fKWID = k.fID";
			Table tab = KSQL.select(queryKW, null, OADataModel, null);
			Iterator<Row> tabs = tab.iterator();
			if (!tabs.hasNext()) {
				can = true;
			}
		}
		return can;
	}
}
