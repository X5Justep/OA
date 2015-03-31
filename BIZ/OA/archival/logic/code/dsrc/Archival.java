import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.Element;

import com.justep.oa.SysUtils;
import com.justep.model.ModelUtils;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.util.CommonUtils;


public class Archival {
	public static final String OADataModel ="/OA/archival/data";
	
	/**
	 * 删除案卷
	 */
	
	
	
	
	public static void deleteRoll(String filedIDs) {
		String sql = null;
		String[] ids = filedIDs.split(",");
		for (int i = 0; i < ids.length; i++) {
			sql = "select count(a) as CT from OA_AM_Archival a where a.fRollID = '" + ids[i]
					+ "' and (a.fState = '01' or a.fState = '02' or a.fState = '03')";
			Table table = KSQL.select(sql, null, OADataModel, null);
			Iterator<Row> rows = table.iterator();
			if (rows.hasNext()) {
				Row rs = rows.next();
				if (rs.getInt("CT") < 1) {
					sql = "delete from OA_AM_Archival a where a = '" + ids[i] + "'";
					KSQL.executeUpdate(sql, null, OADataModel, null);
				}
			}
		}
	}

	/**
	 * 删除档案
	 */
	
	
	public static void deleteArchival(String filedIDs) throws Exception {
		String sql = null;
		String ids = filedIDs.replace(",", "','");
		sql = "delete from OA_AM_Archival a where a in('" + ids
					+ "') and a.fState = '01' and a.fBusinessID is null";
		KSQL.executeUpdate(sql, null, OADataModel, null);

	}


	// 归档确认
	
	public static void filedArchival(String rollIDs, String fileIDs,String filedInfo, String hasChildren)  {
		String sqls = "";
			String[] rolls = rollIDs.split(",");
			String[] files = fileIDs.split(",");
			String[] infos = filedInfo.split(",");
			for (int i = 0; i < rolls.length; i++) {
				sqls = "Update OA_AM_Archival a set a.fState = '13',a.fStateName = '已立卷',a.fFileDate=:fFileDate," 
						+ "a.fFileDeptID = '" + infos[0] + "',a.fFileDeptName = '" + infos[1] + "',a.fResponsibleID = '" + infos[2]
				        + "',a.fResponsibleName = '" + infos[3] + "'" + " where a = '" + rolls[i] + "' and a.fState = '12'";
				Map<String, Object> params = new HashMap<String, Object>();
				params.put("fFileDate", CommonUtils.getCurrentDate());
				KSQL.executeUpdate(sqls, params, OADataModel, null);
				if (hasChildren.equals("1")) {
					String sql = "select c from V_OA_AM_FiledCheck c where (c.fError = '校验通过' or c.fError = '所属案卷尚未归档') and c.fState = '02' and c.fRollID = '" + rolls[i] + "'";
					Table result = KSQL.select(sql, null, OADataModel, null);
					Iterator<Row> rows = result.iterator();
					while (rows.hasNext()) {
						Row row = rows.next();
						sqls = "Update OA_AM_Archival set fState = '03',fStateName = '已归档',fFileDate=:fFileDate,fFileDeptID = '" + infos[0]
						     + "',fFileDeptName = '" + infos[1] + "',fResponsibleID = '" + infos[2] + "',fResponsibleName = '" + infos[3] + "'"
						     + " where fID = '" + row.getString("c") + "'";
						Map<String, Object> param = new HashMap<String, Object>();
						param.put("fFileDate", CommonUtils.getCurrentDate());
						KSQL.executeUpdate(sqls, param, OADataModel, null);
					}
				}
			}
			for (int i = 0; i < files.length; i++) {
				sqls = "Update OA_AM_Archival a set a.fState = '03',a.fStateName = '已归档',a.fFileDate=:fFileDate,a.fFileDeptID = '" + infos[0] + "',a.fFileDeptName = '"
					+ infos[1] + "',a.fResponsibleID = '" + infos[2]+ "',a.fResponsibleName = '" + infos[3] + "'"
				    + " where a = '" + files[i] + "' and a.fState = '02'";
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("fFileDate", CommonUtils.getCurrentDate());
				KSQL.executeUpdate(sqls, param, OADataModel, null);
			}
	}

	/**
	 * 卷提交
	 */
	public static void rollSubmit(String filedIDs, String filedInfo, String hasChildren) {
		String sqls = "";
		String[] ids = filedIDs.split(",");
		String[] infos = filedInfo.split(",");
		sqls += "fFileDate = '" + SysUtils.getCurrentDateTime() + "',";
		for (int i = 0; i < ids.length; i++) {
			sqls = "Update OA_AM_Archival a set a.fState = '12'," + "a.fStateName = '已提交',";
			sqls += "a.fFileDeptID = '" + infos[0] + "',a.fFileDeptName = '" + infos[1] + "',a.fResponsibleID = '" + infos[2]
					+ "',a.fResponsibleName = '" + infos[3] + "'" + " where a = '" + ids[i] + "' and a.fState = '11'";
			KSQL.executeUpdate(sqls, null, OADataModel, null);

			if (hasChildren.equals("1")) {
				sqls = "Update OA_AM_Archival a set a.fState = '02'," + "a.fStateName = '已提交',";
				sqls += "a.fFileDeptID = '" + infos[0] + "',a.fFileDeptName = '" + infos[1] + "',a.fResponsibleID = '" + infos[2]
						+ "',a.fResponsibleName = '" + infos[3] + "'" + " where a.fRollID = '" + ids[i] + "' and a.fState = '01'";
				KSQL.executeUpdate(sqls, null, OADataModel, null);
			}
		}
	}

	/**
	 * 件提交
	 */
	public static void fileSubmit(String filedIDs, String filedInfo){
		String sqls = "";
			String[] ids = filedIDs.split(",");
			String[] infos = filedInfo.split(",");
			sqls += "a.fFileDate ='"+SysUtils.getCurrentDateTime()+"',";
			for (int i = 0; i < ids.length; i++) {
				sqls = "Update OA_AM_Archival a set a.fState = '02',"
						+ "a.fStateName = '已提交',";
				sqls += "a.fFileDeptID = '" + infos[0] + "',a.fFileDeptName = '"
						+ infos[1] + "',a.fResponsibleID = '" + infos[2]
						+ "',a.fResponsibleName = '" + infos[3] + "'"
						+ " where a = '" + ids[i] + "' and a.fState = '01'";
				KSQL.executeUpdate(sqls, null, OADataModel, null);
			}
	}

	/**
	 * 件组卷
	 */
	public static void archivalBuildUp(String fileIDs, String rollID){
		String sqls = "", sql = "";

		String[] ids = fileIDs.split(",");

		sql = "select a,a.fTitle,a.fFondsID,a.fFondsName,case when a.fCategoryID is null then '' else a.fCategoryID end as fCategoryID,case when a.fCategoryName is null then '' else a.fCategoryName end as fCategoryName from OA_AM_Archival a where a ='"
					+ rollID + "'";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			Row rs = rows.next();
			for (int i = 0; i < ids.length; i++) {
					sqls = "Update OA_AM_Archival a set a.fSign = '1',a.fFondsID = '"
							+ rs.getString("fFondsID") + "',a.fFondsName = '"
							+ rs.getString("fFondsName") + "',a.fCategoryID = '"
							+ rs.getString("fCategoryID")
							+ "',a.fCategoryName = '"
							+ rs.getString("fCategoryName") + "',a.fRollID = '"
							+ rs.getString("a") + "',a.fRollName = '"
							+ rs.getString("fTitle") + "' where a = '"
							+ ids[i] + "'";
					KSQL.executeUpdate(sqls, null, OADataModel, null);
			}
			generateArchivalInfo(fileIDs, "all");
		}

	}

	/**
	 * 件移出
	 */
	public static String archivalShiftOut(String fileIDs) {
		String sqls = "";
		String result = "";
		String ids = fileIDs.replace(",", "','");
		sqls = "select a,a.fTitle from OA_AM_Archival a join OA_AM_Archival r on a.fRollID = r and a in ('"
					+ ids + "') where r.fSign = '0'";
		Table table = KSQL.select(sqls, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			Row rs = rows.next();
			sqls = "Update OA_AM_Archival a set a.fSign = '0',a.fRollID = '',a.fRollName = ''"
						+ " where a = '" + rs.getString("a") + "'";
			KSQL.executeUpdate(sqls, null, OADataModel, null);
			
			result = result + "《" + rs.getString("fTitle") + "》移出成功！\n";
		}
		generateArchivalInfo(fileIDs, "all");
		if (result.equals(""))
			result = "没有可移出的件信息！";

		return result;
	}

	/**
	 * 档案借阅
	 */
	public static String getBorrowInfo(String fArchivalID) {
		String archivalInfo = "";

		String strSQL = "select a,a.fArchivalNO,a.fTitle,a.fCarry,a.fFileDeptName,a.fResponsibleName,a.fState,a.fIsRoll,a.fAMYear from V_OA_AM_ArchivalSelect a where (a.fRollID in ("
				+ fArchivalID + ") or a in (" + fArchivalID + ")) and a.fInventory > 0 order by a.fRollID desc";
		Table table = KSQL.select(strSQL, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs = rows.next();
			if (archivalInfo.equals("")) {
				archivalInfo = rs.getString("a") + "|" + rs.getString("fArchivalNO") + "|" + rs.getString("fTitle") + "|" + rs.getString("fState")
						+ "|" + rs.getString("fAMYear") + "|" + rs.getString("fCarry") + "|" + rs.getString("fFileDeptName") + "|"
						+ rs.getString("fResponsibleName") + "|" + rs.getString("fIsRoll");
			} else {
				archivalInfo = archivalInfo + "," + rs.getString("a") + "|" + rs.getString("fArchivalNO") + "|" + rs.getString("fTitle") + "|"
						+ rs.getString("fState") + "|" + rs.getString("fAMYear") + "|" + rs.getString("fCarry") + "|" + rs.getString("fFileDeptName")
						+ "|" + rs.getString("fResponsibleName") + "|" + rs.getString("fIsRoll");
			}
		}
		return archivalInfo;
	}

	/**
	 * 归还后修改库存数量
	 */
	public static void returnArchival(String fArchivalID, String fReturnNum){
		String strSQL = "update OA_AM_Archival a set a.fInventory='"
					+ fReturnNum + "' where a ='" + fArchivalID + "'";
		KSQL.executeUpdate(strSQL, null, OADataModel, null);
	}

	/**
	 * 档案销毁
	 */
	public static String getDistoryInfo(String fArchivalID) {
		String archivalInfo = "";

		String strSQL = "select a,a.fArchivalNO,a.fTitle,a.fCarry,a.fFileDeptName,a.fResponsibleName,a.fState,a.fIsRoll from OA_AM_Archival a where (a.fRollID in ("
				+ fArchivalID + ") or a in (" + fArchivalID + ")) and (a.fState='03' or a.fState='13') order by a.fRollID desc";
		Table table = KSQL.select(strSQL, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs = rows.next();
			if (archivalInfo.equals("")) {
				archivalInfo = rs.getString("a") + "|" + rs.getString("fArchivalNO") + "|" + rs.getString("fTitle") + "|" + rs.getString("fState")
						+ "|" + rs.getString("fIsRoll") + "|" + rs.getString("fCarry") + "|" + rs.getString("fFileDeptName") + "|"
						+ rs.getString("fResponsibleName");
			} else {
				archivalInfo = archivalInfo + "," + rs.getString("a") + "|" + rs.getString("fArchivalNO") + "|" + rs.getString("fTitle") + "|"
						+ rs.getString("fState") + "|" + rs.getString("fIsRoll") + "|" + rs.getString("fCarry") + "|" + rs.getString("fFileDeptName")
						+ "|" + rs.getString("fResponsibleName");
			}
		}
		return archivalInfo;
	}

	/**
	 * 档案树节点
	 */
	public static String getNodeInfo(String parentID, String type, String URL){
		String sql = null;
		String result = "";
		if (type.equals("root")) {
			sql = "select f as fID,concat(f.fFondsNO,'-',f.fFondsName) as fName,'fonds' as fType,f as nodeID,f.fFondsName as fArtName,'' as fCategoryURLName"
					+ " from OA_AM_Fonds f where f.fUseStatus = 1 and (f.fOwnDeptFID = '' or f.fOwnDeptFID is null or '"
					+ SysUtils.getCurrentPersonMemberFID()
					+ "' like concat(f.fOwnDeptFID,'%')) order by f.fFondsNO";
		} else if (type.equals("fonds")) {
			sql = "select c as fID,concat( c.fCategoryNO ,'-' ,c.fCategoryName) as fName, 'category' as fType,concat('"
					+ URL + "','/', c) as nodeID,c.fCategoryName as fArtName,c.fCategoryURLName "
					+ " from OA_AM_Fonds f"
					+ " optional join OA_AM_FondsCategory fc"
					+ " on f = fc.fFondsID and f.fAllCategory = 0 and f.fUseStatus = 1"
					+ " join OA_AM_Category c"
					+ " on (c = fc.fCategoryID or (f.fAllCategory = 1 and c.fParentID = '_is_root_')) and c.fUseStatus = 1"
					+ " where f = '"
					+ parentID
					+ "' order by c.fCategoryNO";
		} else if (type.equals("category")) {
			sql = "select c as fID,concat(c.fCategoryNO ,'-' ,c.fCategoryName) as fName,'category' as fType,concat('"
					+ URL + "', '/', c) as nodeID,c.fCategoryName as fArtName,c.fCategoryURLName"
					+ " from OA_AM_Category c where c.fUseStatus = 1 and c.fParentID = '"
					+ parentID + "' order by c.fCategoryNO";
		}
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> it = table.iterator();
		while(it.hasNext()){
			Row rs = it.next();
			String subNodeID = rs.getString("fID");
			String subNodeName = rs.getString("fName");
			String subNodeType = rs.getString("fType");
			String subNodeFullID = rs.getString("nodeID");
			String artName = rs.getString("fArtName");
			String fCategoryURLName = rs.getString("fCategoryURLName");
			if (result.equals("")) {
				result = subNodeID + ":" + subNodeName + ":" + subNodeType
				+ ":" + subNodeFullID + ":" + artName+":"+fCategoryURLName;
			} else {
				result = result + "|" + subNodeID + ":" + subNodeName + ":"
				+ subNodeType + ":" + subNodeFullID + ":" + artName+":"+fCategoryURLName;
			}
		}
		return result;
	}

	/**
	 * 卷信息改变
	 */
	public static void rollChange(String rollID, String infoType) {

		String sqls = null;

		// 取值
		String fFondsID = "";
		String fFondsName = "";
		String fCategoryID = "";
		String fCategoryName = "";
		sqls = "select a.fFondsID,a.fFondsName,a.fCategoryID,a.fCategoryName from OA_AM_Archival a where a ='" + rollID + "'";
		Table table = KSQL.select(sqls, null, OADataModel, null);
		Iterator<Row> it = table.iterator();
		if (it.hasNext()) {
			Row rs = it.next();
			fFondsID = rs.getString("fFondsID");
			fFondsName = rs.getString("fFondsName");
			fCategoryID = rs.getString("fCategoryID");
			fCategoryName = rs.getString("fCategoryName");
			// 更新
			sqls = "update OA_AM_Archival a set a.fFondsID='" + fFondsID + "',a.fFondsName='" + fFondsName + "',a.fCategoryID='" + fCategoryID
					+ "',a.fCategoryName='" + fCategoryName + "' where a.fRollID='" + rollID + "'";
			KSQL.executeUpdate(sqls, null, OADataModel, null);
			generateArchivalInfo(rollID, infoType);
		}

	}

	/**
	 * 更新档案信息
	 */
	public static void generateArchivalInfo(String infoIDs, String infoType){
		String sql = null;
			
		if (infoType.equals("TreeURL")) {
			sql = "update OA_AM_Archival t set t.fURL = ("
					+ " select concat(v.fFondsID , '/' ,"
					+ " case when (v.fCategoryID is null or v.fCategoryID = '') then null else concat((select c.fCategoryURL from OA_AM_Category c where c = t.fCategoryID) , '/') end"
					+ " ,  case when (v.RollID is null or v.RollID = '') then null else concat(v.RollID , '/') end"
					+ " , v.fID)  from (select i as fID,i.fFondsID,i.fCategoryID,i.RollID from V_OA_AM_ArchivalURLInfo i) v where v.fID = t)";
		} else if (infoType.equals("ArchivalNO")) {
			sql = "update OA_AM_Archival t"
					+ "   set t.fArchivalNO = (select concat(v.FondsNO , "
					+ "       case when (v.CategoryNO is null or v.CategoryNO = '') then null else concat('-' , v.CategoryNO) end"
					+ "    , case when (v.RollNO is null or v.RollNO = '') then null else concat('-' , v.RollNO) end "
					+ "    , case when (v.fFileNO is null or v.fFileNO = '') then null else concat('-' , v.fFileNO) end)"
					+ "   from (select i as fID,i.CategoryNO,i.FondsNO,i.RollNO,i.fFileNO from V_OA_AM_ArchivalURLInfo i) v "
					+ "   where v.fID = t)";
		} else {
			sql = "update OA_AM_Archival t set t.fURL = ("
					+ " select concat(v.fFondsID , '/' , case when (v.fCategoryID is null or v.fCategoryID = '') then null else concat((select c.fCategoryURL from OA_AM_Category c where c = t.fCategoryID) , '/') end"
					+ " , case when (v.RollID is null or v.RollID = '') then null else concat(v.RollID , '/') end"
					+ " , v.fID)  from (select i as fID,i.fFondsID,i.fCategoryID,i.RollID from V_OA_AM_ArchivalURLInfo i) v where v.fID = t),"
					+ " t.fArchivalNO = (select concat(v.FondsNO, case when (v.CategoryNO is null or v.CategoryNO = '') then null else concat('-' , v.CategoryNO) end"
					+ "  , case when (v.RollNO is null or v.RollNO = '') then null else concat('-' , v.RollNO) end "
					+ "  , case when (v.fFileNO is null or v.fFileNO = '') then null else concat('-' , v.fFileNO) end)"
					+ "	from (select i as fID,i.FondsNO,i.CategoryNO,i.RollNO,i.fFileNO from V_OA_AM_ArchivalURLInfo i) v where v.fID = t)";
		}
		if (!infoIDs.equals("all")) {
			String[] infoID = infoIDs.split(",");
			for (int i = 0; i < infoID.length; i++) {
				String sqls = sql + " where t = '" + infoID[i]
						+ "' or t.fRollID = '" + infoID[i] + "'";
				KSQL.executeUpdate(sqls, null, OADataModel, null);
			}
		} else {
			KSQL.executeUpdate(sql, null, OADataModel, null);
		} 
	}
	public static String rollExcelImport(String fSeparate) throws Exception{
		String sql = null;
		String result="",fIDs="";


			String ognID = com.justep.oa.SysUtils.getCurrentOgnID();
			String ognName = com.justep.oa.SysUtils.getCurrentOgnName();
			String deptID = com.justep.oa.SysUtils.getCurrentDeptID();
			String deptName = com.justep.oa.SysUtils
					.getCurrentDeptName();
			String posID = com.justep.oa.SysUtils.getCurrentPosID();
			String posName = com.justep.oa.SysUtils
					.getCurrentPosName();
			String psnID = com.justep.oa.SysUtils.getCurrentPersonID();
			String psnName = com.justep.oa.SysUtils
			.getCurrentPersonName();
			String psnFID = com.justep.oa.SysUtils
					.getCurrentPersonMemberFID();
			String psnFName = com.justep.oa.SysUtils
					.getCurrentPersonMemberFName();
			if ((deptID == null) || (deptID.equals("")) || (deptID.equals("null"))) {
				deptID = ognID;
				deptName = ognName;
			}

			sql = "update OA_AM_ExcelTemp t set t.fIsRoll = 1,t.fFondsID = (select f FROM OA_AM_Fonds f WHERE f.fUseStatus = 1 and f.fFondsName= t.fFondsName),t.fCategoryID =(select c FROM OA_AM_Category c WHERE c.fUseStatus = 1 and c.fCategoryName= t.fCategoryName) where t.fSeparate = '"+fSeparate+"'";
			KSQL.executeUpdate(sql, null, OADataModel, null);


			sql = "select coalesce(case when t.fFondsID is null then case when t.fFondsName is null then '全宗名称为空记录不能导入！' else concat('全宗名称：' ,t.fFondsName,'，在全宗设置中没有找到匹配的设置！') end else null end,case when t.fTitle is null then '全宗名称：' +t.fFondsName+'，标题为空的记录不能导入！' else null end,case when t.fFileNO is null then concat('标题：' ,t.fTitle,'，卷号为空的记录不能导入！') else null end,case when t.fCategoryID is not null and t.fCategoryID in (select fc.fCategoryID from OA_AM_FondsCategory fc where fc.fFondsID=t.fFondsID) then null else concat('全宗名称：', t.fFondsName,'，在全宗设置中没有找到匹配的目录：' ,t.fCategoryName ,'的设置！') end,'案卷导入成功') as fError from OA_AM_ExcelTemp t where t.fSeparate = '"+fSeparate+"'";
			Table table = KSQL.select(sql, null, OADataModel, null);
			Iterator<Row> it = table.iterator();
			while (it.hasNext()) {
				Row rs = it.next();
				String fError = rs.getString("fError");
				if(!fError.equals("案卷导入成功")){
					if(result.contains(fError)){
						result = fError;
					}else{
						result = result +fError+ "\n";					
					}
				}
			}

			if(result.equals("")) {
				result = "OK";
			}

			sql ="insert into OA_AM_Archival a(a,a.version,a.fFileNO,a.fMicroNO,a.fSequence,a.fPageNO,"
					+ "a.fAMDate,a.fAMLevel,a.fAMYear,a.fSecret,a.fTitle,a.fFondsID,a.fFondsName,a.fCategoryID,"
					+ "a.fCategoryName,a.fKeepLimit,a.fCarry,a.fNum,a.fUnit,a.fRoom,a.fChest,a.fGrid,a.fVersionCode," 
					+ "a.fDescription,a.fRemark,a.fState,a.fStateName,a.fSign,a.fIsRoll,a.fVoucherBegin,a.fVoucherEnd," 
					+ "a.fVoucherNum,a.fVoucherNO,a.fInventory,a.fCreateOgnID,a.fCreateOgnName,a.fCreateDeptID," 
					+ "a.fCreateDeptName,a.fCreatePosID,a.fCreatePosName,a.fCreatePsnID,"
					+ "a.fCreatePsnName,a.fCreatePsnFID,a.fCreatePsnFName,a.fCreateTime) (select guid(),0,t.fFileNO,t.fMicroNO,t.fSequence,t.fPageNO,t.fAMDate,t.fAMLevel,t.fAMYear,t.fSecret,t.fTitle," 
					+ "t.fFondsID,t.fFondsName,t.fCategoryID,t.fCategoryName,t.fKeepLimit,t.fCarry,t.fNum,t.fUnit,t.fRoom," 
					+ "t.fChest,t.fGrid,t.fVersionCode,t.fDescription,t.fRemark,11,'编制中',0,t.fIsRoll,t.fVoucherBegin," 
					+ "t.fVoucherEnd,t.fVoucherNum,t.fVoucherNO,1,'"+ ognID + "','" + ognName
					+ "','" + deptID + "','" + deptName + "','" + posID + "','" + posName+ "','" + psnID 
					+ "','" + psnName + "','" + psnFID + "','" + psnFName + "',:dateTime "
					+ " from OA_AM_ExcelTemp t where t.fFileNO is not null and t.fTitle is not null and t.fFondsID is not null and (t.fCategoryID is null or (t.fCategoryID is not null and t.fCategoryID in (select fc.fCategoryID from OA_AM_FondsCategory fc where fc.fFondsID=t.fFondsID))) and t.fSeparate = '"+fSeparate+"')";
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("dateTime", CommonUtils.getCurrentDateTime());
			KSQL.executeUpdate(sql, param, OADataModel, null);


			sql = "select a FROM OA_AM_Archival a WHERE a.fArchivalNO is null";
			Table tab = KSQL.select(sql, null, OADataModel, null);
			Iterator<Row> tabs = tab.iterator();
			while (tabs.hasNext()) {
				Row rs = tabs.next();
				String id = rs.getString("a");
				if(fIDs.equals("")){
					fIDs=id;
				}else{
					fIDs = fIDs  + ","+ id;	
				}
			}
			if(!fIDs.equals("")){
				generateArchivalInfo(fIDs, "all");
			}


			sql = "delete from OA_AM_ExcelTemp t where t.fSeparate = '"+fSeparate+"'";
			KSQL.executeUpdate(sql, null, OADataModel, null);


		return result;
	}
	
	public static String fileExcelImport(String fSeparate) {
		String sql = null;
		String result="",fIDs="";

			String ognID = com.justep.oa.SysUtils.getCurrentOgnID();
			String ognName = com.justep.oa.SysUtils.getCurrentOgnName();
			String deptID = com.justep.oa.SysUtils.getCurrentDeptID();
			String deptName = com.justep.oa.SysUtils
					.getCurrentDeptName();
			String psnID = com.justep.oa.SysUtils.getCurrentPersonID();
			String psnName = com.justep.oa.SysUtils
					.getCurrentPersonName();
			String posID = com.justep.oa.SysUtils.getCurrentPosID();
			String posName = com.justep.oa.SysUtils
					.getCurrentPosName();
			String psnFID = com.justep.oa.SysUtils
					.getCurrentPersonMemberFID();
			String psnFName = com.justep.oa.SysUtils
					.getCurrentPersonMemberFName();
			if ((deptID == null) || (deptID.equals(""))
					|| (deptID.equals("null"))) {
				deptID = ognID;
				deptName = ognName;
			}

			sql = "update OA_AM_ExcelTemp t set t.fIsRoll = 0,t.fFondsID = (select f FROM OA_AM_Fonds f WHERE f.fUseStatus = 1 and f.fFondsName= t.fFondsName),t.fCategoryID =(select c FROM OA_AM_Category c WHERE c.fUseStatus = 1 and c.fCategoryName= t.fCategoryName),t.fRollID=(select a FROM OA_AM_Archival a WHERE a.fTitle = t.fRollName) where t.fSeparate = '"+fSeparate+"'";
			KSQL.executeUpdate(sql, null, OADataModel, null);


			sql = "select coalesce(case when t.fFondsID is null then case when t.fFondsName is null then '全宗名称为空记录不能导入！' else concat('全宗名称：' ,t.fFondsName,'，在全宗设置中没有找到匹配的设置！') end else null end,case when t.fTitle is null then concat('全宗名称：' ,t.fFondsName,'，标题为空的记录不能导入！') else null end,case when t.fFileNO is null then concat('标题：' ,t.fTitle,'，件号为空的记录不能导入！') else null end,case when t.fCategoryID is not null and t.fCategoryID in (select fc.fCategoryID from OA_AM_FondsCategory fc where fc.fFondsID=t.fFondsID)  then null else concat('全宗名称：', t.fFondsName,'，在全宗设置中没有找到匹配的目录：' ,t.fCategoryName ,'的设置！') end,case when t.fRollID is not null and t.fRollID in (select a from OA_AM_Archival a where a.fCategoryID = t.fCategoryID and a.fFondsID=t.fFondsID) then null else concat('件号：',t.fFileNO,'，对应的全宗和类目与其所属案卷：',t.fRollName,'不匹配！') end,'件导入成功') as fError from OA_AM_ExcelTemp t where t.fSeparate = '"+fSeparate+"'";
			Table table = KSQL.select(sql, null, OADataModel, null);
			Iterator<Row> it = table.iterator();
			while (it.hasNext()) {
				Row rs = it.next();
				String fError = rs.getString("fError");
				if(!fError.equals("件导入成功")){
					if(result.contains(fError)){
						result = fError;
					}else{
						result = result +fError+ "\n";					
					}
				}
			}

			if(result.equals("")) {
				result = "OK";
			}

			sql ="insert into OA_AM_Archival a(a,a.version,a.fFileNO,a.fDocumentNO,a.fMicroNO,a.fMenuNO,a.fPageNO,"
					+ "a.fAMDate,a.fAMLevel,a.fAMYear,a.fSecret,a.fTitle,a.fSubTitle,a.fKeyWord,a.fFondsID,a.fFondsName,a.fCategoryID,"
					+ "a.fCategoryName,a.fRollID,a.fRollName,a.fKeepLimit,a.fCarry,a.fNum,a.fUnit,a.fRoom,a.fChest,a.fGrid,a.fVersionCode," 
					+ "a.fRemark,a.fState,a.fStateName,a.fSign,a.fIsRoll,a.fInventory,a.fCreateOgnID,a.fCreateOgnName,a.fCreateDeptID," 
					+ "a.fCreateDeptName,a.fCreatePosID,a.fCreatePosName,a.fCreatePsnID,"
					+ "a.fCreatePsnName,a.fCreatePsnFID,a.fCreatePsnFName,a.fCreateTime) (select guid(),0,t.fFileNO,t.fDocumentNO,t.fMicroNO,t.fMenuNO,t.fPageNO,t.fAMDate,t.fAMLevel,t.fAMYear,t.fSecret,t.fTitle,t.fSubTitle,t.fKeyWord," 
					+ "t.fFondsID,t.fFondsName,t.fCategoryID,t.fCategoryName,t.fRollID,t.fRollName,t.fKeepLimit,t.fCarry,t.fNum,t.fUnit,t.fRoom," 
					+ "t.fChest,t.fGrid,t.fVersionCode,t.fRemark,'01','编制中',0,t.fIsRoll,1,'"+ ognID + "','" + ognName
					+ "','" + deptID + "','" + deptName + "','" + posID + "','" + posName+ "','" + psnID 
					+ "','" + psnName + "','" + psnFID + "','" + psnFName + "',:dateTime "
					+ " from OA_AM_ExcelTemp t where t.fFileNO is not null and t.fTitle is not null and t.fFondsID is not null and (t.fCategoryID is null or (t.fCategoryID is not null and t.fCategoryID in (select fc.fCategoryID from OA_AM_FondsCategory fc where fc.fFondsID=t.fFondsID))) and (t.fRollID is null or (t.fRollID is not null and t.fRollID in (select a from OA_AM_Archival a where a.fCategoryID = t.fCategoryID and a.fFondsID=t.fFondsID))) and t.fSeparate = '"+fSeparate+"')";
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("dateTime", CommonUtils.getCurrentDateTime());
			KSQL.executeUpdate(sql, param, OADataModel, null);
			

			sql = "select a FROM OA_AM_Archival a WHERE a.fArchivalNO is null";
			Table tab = KSQL.select(sql, null, OADataModel, null);
			Iterator<Row> tabs = tab.iterator();
			while (tabs.hasNext()) {
				Row rs = tabs.next();
				String id = rs.getString("a");
				if(fIDs.equals("")){
						fIDs=id;
				}else{
						fIDs = fIDs  + ","+ id;	
				}
			}
			if(!fIDs.equals("")){
				generateArchivalInfo(fIDs, "all");
			}


			sql = "delete from OA_AM_ExcelTemp t where t.fSeparate = '"+fSeparate+"'";
			KSQL.executeUpdate(sql, null, OADataModel, null);


		return result;
	}
	
	public static void setCategroyURL(String url)throws Exception{
		String newURLName="";
		String[] arrURLs = url.split(";");
		for(int i =0;i< arrURLs.length; i++){
			String ksql ="select c,c.fCategoryURL,c.fCategoryURLName,c.fCategoryName,c.fParentID from OA_AM_Category c where c.fCategoryURL like '"+arrURLs[i]+"%'";
			Table table = KSQL.select(ksql, null, OADataModel, null);
			Iterator<Row> it = table.iterator();
			while(it.hasNext()){
				Row row = it.next();
				newURLName = queryURLName(row.getString("fCategoryURL"));
				String usql = "update OA_AM_Category c  set c.fCategoryURLName ='"+newURLName+"' where c.fCategoryURL like '"+arrURLs[i]+"%'";
				KSQL.executeUpdate(usql, null, OADataModel, null);
			}
		}

	}

	public static String queryURLName(String fCategoryURL)throws Exception{
		String[] arrCURL = fCategoryURL.split("/");
		String fCategoryName="",fCategoryNameURL="";
		for(int j=0;j<arrCURL.length;j++){
			String sql = "select c.fCategoryName from OA_AM_Category c where c ='"+arrCURL[j]+"'";
			Table result = KSQL.select(sql, null, OADataModel, null);
			Iterator<Row> it = result.iterator();
			if(it.hasNext()){
				Row row = it.next();
				fCategoryName = row.getString("fCategoryName");
			}	
			if(fCategoryNameURL==""){
				fCategoryNameURL = "/"+fCategoryName;
			}else{
				fCategoryNameURL =fCategoryNameURL+ "/"+fCategoryName;
			}
		}
		return fCategoryNameURL;
	}

	public static void repairCategroyURLName()throws Exception{
			String ksql ="select c,c.fCategoryURL from OA_AM_Category c";
			Table table = KSQL.select(ksql, null, OADataModel, null);
			Iterator<Row> it = table.iterator();
			while(it.hasNext()){
				Row row = it.next();
				String newURLName = queryURLName(row.getString("fCategoryURL"));
				String usql = "update OA_AM_Category c set c.fCategoryURLName ='"+newURLName+"' where c = '"+row.getString("c")+"'";
				KSQL.executeUpdate(usql, null, OADataModel, null);
			}  
	}
	
	public static void updateRollORFile(String fOldCategoryID,String fCategoryID)throws Exception {
		String ksql ="select c.fCategoryName,c.fCategoryURLName from OA_AM_Category c  where c ='"+fCategoryID+"'";
		Table table = KSQL.select(ksql, null, OADataModel, null);
		Iterator<Row> it = table.iterator();
		if(it.hasNext()){
			Row row = it.next();
			String usql ="update OA_AM_Archival a set a.fCategoryID ='"+fCategoryID+"',a.fCategoryName='"+row.getString("fCategoryName")+"',a.fExtendStr9 ='"+row.getString("fCategoryURLName")+"' where a in("+fOldCategoryID+")";
			KSQL.executeUpdate(usql, null, OADataModel, null);
			generateArchivalInfo(fOldCategoryID.replaceAll("'", ""), "all");
		}
		
	}
}
