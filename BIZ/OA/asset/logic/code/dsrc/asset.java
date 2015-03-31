import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.util.BizUtils;
import com.justep.system.util.CommonUtils;

public class asset {

	private static class rAssetInfo {
		String fIDs;
		String fError;
	}
	public static final String OADataModel ="/OA/asset/data";

	private static rAssetInfo canAssetIn(String assetInIDs) {
		rAssetInfo aIDs = new rAssetInfo();
		String IDs = "", errors = "", sql = null;

		sql = "select coalesce(case when c is not null then '资产编号已存在' else null end,'校验通过') as error,d.fID,d.fCode from"
				+ " (select dd AS fID,dd.fCode AS fCode from OA_AS_InD dd where dd in (" + assetInIDs + ")) d optional join OA_AS_Card c  on c.fCode = d.fCode";

		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs = rows.next();
			if (rs.getString("error").equals("校验通过")) {
				if (IDs.equals("")) {
					IDs = "'" + rs.getString("fID") + "'";
				} else {
					IDs = IDs + ",'" + rs.getString("fID") + "'";
				}
			} else {
				errors = errors + rs.getString("fCode") + "  " + rs.getString("error") + "\n";
			}
		}
		aIDs.fIDs = IDs;
		aIDs.fError = errors;
		return aIDs;
	}

	public static String assetIn(String assetInDate, String assetInIDs) {
		String sql = null, updateSQL = null,result = "资产入库数据信息修改失败！";

		rAssetInfo aIDs = canAssetIn(assetInIDs);
		
		if (!aIDs.fIDs.equals("")) {
			sql = "update OA_AS_InD d set d.fIsIn = '1',d.fIsInName = '已入库',d.fDate=stringToDate('" + assetInDate + "') where d in (" + aIDs.fIDs + ")";
			KSQL.executeUpdate(sql, null, OADataModel, null);

			updateSQL = "update OA_AS_InM m set m.fState = '1', m.fStateName = '已完成' where not exists (select d from OA_AS_InD d"
					+ " where d.fMasterID = m and d.fIsIn <> '1')";
			KSQL.executeUpdate(updateSQL, null, OADataModel, null);

			insertAssetCard(aIDs.fIDs);
			modifyBuyOrderInfo(aIDs.fIDs);
		}
		if (aIDs.fError.equals("")) {
			result = "资产入库成功！";
		} else {
			result = aIDs.fError;
		}
		return result;
	}

	public static void insertAssetCard(String assetInIDs) {
		String sql = null, qsql=null,usql=null,fCode=null;

		String date  = CommonUtils.getCurrentDate().toString().replaceAll("-", "");

		String ognID = com.justep.oa.SysUtils.getCurrentOgnID();
		String ognName = com.justep.oa.SysUtils.getCurrentOgnName();
		String deptID = com.justep.oa.SysUtils.getCurrentDeptID();
		String deptName = com.justep.oa.SysUtils
					.getCurrentDeptName();
		String psnID = com.justep.oa.SysUtils.getCurrentPersonID();
		String psnName = com.justep.oa.SysUtils
					.getCurrentPersonName();
		String psnFID = com.justep.oa.SysUtils
					.getCurrentPersonMemberFID();
		String psnFName = com.justep.oa.SysUtils
					.getCurrentPersonMemberFName();
		if ((deptID == null) || (deptID.equals(""))
					|| (deptID.equals("null"))) {
				deptID = ognID;
				deptName = ognName;
		}
		qsql = "select d as subFID,d.fCode,d.fKindID,e.fCode as fKindCode,d.fKind,d.fName,d.fSpecType,d.fUnitID,d.fUnit,d.fCheckID,d.fCheckNO,0," 
				+ "'闲置',d.fAmount,d.fAmount,0,m.fModeID,m.fMode,m.fDutyOgnID,m.fDutyOgnName,m.fDutyOgnFID,m.fDutyDeptID,m.fDutyDeptName,m.fDutyPosID," 
				+ "m.fDutyPosName,m.fDutyPsnID,m.fDutyPsnName,m.fDutyPsnFID,m.fDutyPsnFName,m.fCreateOgnID,m.fCreateOgnName,m.fCreateDeptID,m.fCreateDeptName," 
				+ "m.fCreatePsnID,m.fCreatePsnName,m.fCreatePsnFID,m.fCreatePsnFName,m.fCreateTime,m.fUpdatePsnID,m.fUpdatePsnName,m.fUpdateTime,0,m,m.fNO," 
				+ "d.fBuyApplyID,d.fBuyApplyNO,d.fServicTag,d.fESCode,d.fSHKSSJ,d.fSHJSSJ,'已续保'  from OA_AS_InM m join OA_AS_InD d on m = d.fMasterID " 
				+ "and d in (" + assetInIDs + ") join OA_Pub_BaseCode e on e = d.fKindID and e.fScope='固定资产类别'";
		Table table = KSQL.select(qsql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
				Row rs = rows.next();
				fCode = BizUtils.createNextSequenceString(date+"-"+rs.getString("fKindCode")+"-", "000");
				sql = "insert into OA_AS_Card c(c,"
					+ "c.fCode,c.fKindID,c.fKind,c.fName,c.fSpecType,c.fUnitID,c.fUnit,c.fCheckID,c.fCheckNO,"
					+ "c.fStatus,c.fStatusName,"
					+ "c.fOriginValue,c.fRemainValue,"
					+ "c.fAddDepreValue,c.fSource,c.fSourceName,"
					+ "c.fDutyOgnID,c.fDutyOgnName,c.fDutyOgnFID,"
					+ "c.fDutyDeptID,c.fDutyDeptName,"
					+ "c.fDutyPosID,c.fDutyPosName,"
					+ "c.fDutyPsnID,c.fDutyPsnName,c.fDutyPsnFID,c.fDutyPsnFName,"
					+ "c.fCreateOgnID,c.fCreateOgnName,"
					+ "c.fCreateDeptID,c.fCreateDeptName,"
					+ "c.fCreatePsnID,c.fCreatePsnName,c.fCreatePsnFID,c.fCreatePsnFName,c.fCreateTime,"
					+ "c.fUpdatePsnID,c.fUpdatePsnName,c.fUpdateTime,c.version,c.fAssetInID,c.fAssetInNO,c.fBuyApplyID,c.fBuyApplyNO,c.fExtendStr1,c.fExtendStr2,c.fExtendDate1,c.fExtendDate2,c.fExtendStr4,c.fAssetConfirm)"
					+ " (select guid(),'"+fCode 
					+ "',d.fKindID,d.fKind,d.fName,d.fSpecType,d.fUnitID,d.fUnit,d.fCheckID,d.fCheckNO,"
					+ "0,'闲置',"
					+ "d.fAmount,d.fAmount,"
					+ "0,m.fModeID,m.fMode,"
					+ "m.fDutyOgnID,m.fDutyOgnName,m.fDutyOgnFID,"
					+ "m.fDutyDeptID,m.fDutyDeptName,"
					+ "m.fDutyPosID,m.fDutyPosName,"
					+ "m.fDutyPsnID,m.fDutyPsnName,m.fDutyPsnFID,m.fDutyPsnFName,'"
					+ ognID
					+ "','"
					+ ognName
					+ "','"
					+ deptID
					+ "','"
					+ deptName
					+ "','"
					+ psnID
					+ "','"
					+ psnName
					+ "','"
					+ psnFID
					+ "','"
					+ psnFName
					+ "',:dateTime,'"
					+ psnID
					+ "','"
					+ psnName
					+ "',:dateTime,0,m,m.fNO,d.fBuyApplyID,d.fBuyApplyNO,d.fServicTag,d.fESCode,d.fSHKSSJ,d.fSHJSSJ,'已续保','未确认' "
					+ "from OA_AS_InM m join OA_AS_InD d "
					+ "on m = d.fMasterID and d = '" + rs.getString("subFID") + "')";
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("dateTime", CommonUtils.getCurrentDateTime());
			KSQL.executeUpdate(sql, param, OADataModel, null);
				
			usql = "update OA_AS_InD d set d.fCode = '"+fCode+"' where d ='"+rs.getString("subFID")+"'";
			KSQL.executeUpdate(usql, null, OADataModel, null);
		}
	}

	private static void modifyBuyOrderInfo(String assetInIDs){
		String sql = null;

		sql = "select count(d) as ct,d.fBuyDetailID from OA_AS_InD d  where d in ("
			+ assetInIDs
			+ ") and d.fBuyDetailID is not null group by fBuyDetailID";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs = rows.next();
			sql = "update OA_AS_BuyApplyD d set d.fInNum= d.fInNum + "
				+ rs.getInt("ct") + "where d='"
				+ rs.getString("fBuyDetailID") + "'";
			KSQL.executeUpdate(sql, null, OADataModel, null);
		}
			
		sql = "update OA_AS_BuyApplyM m set m.fState = '1',m.fStateName = '已入库' where m in (select d.fMasterID from OA_AS_BuyApplyD d where d.fInNum < d.fBuyNum  group by d.fMasterID having count(fID) = 0)";

	}

	/**
	 * 生成资产安排记录
	 * 
	 * @param assetID
	 * @param arrangeDate
	 * @throws Exception
	 */
	public static void assetArrangeRecord(String assetID, String arrangeDate){
		String sql = null;

		sql = "update OA_AS_UseRecord u set u.fEndDate=stringToDate('" + arrangeDate
			+ "') where u.fAssetID='" + assetID + "' and u.fEndDate is null";
		KSQL.executeUpdate(sql, null, OADataModel, null);

		sql = "insert into OA_AS_UseRecord u"
						+ "(u,u.fAssetID,u.fKindID,u.fKind,u.fCode,u.fName,u.fSpecType,"
						+ "u.fDutyOgnID,u.fDutyOgnName,"
						+ "u.fDutyDeptID,u.fDutyDeptName,"
						+ "u.fDutyPosID,u.fDutyPosName,"
						+ "u.fDutyPsnID,u.fDutyPsnName,u.fDutyPsnFID,u.fDutyPsnFName,"
						+ "u.fBeginDate,u.fRemark,u.version) "
						+ "(select guid(),c,c.fKindID,c.fKind,c.fCode,c.fName,c.fSpecType,"
						+ "c.fDutyOgnID,c.fDutyOgnName,"
						+ "c.fDutyDeptID,c.fDutyDeptName,"
						+ "c.fDutyPosID,c.fDutyPosName,"
						+ "c.fDutyPsnID,c.fDutyPsnName,c.fDutyPsnFID,c.fDutyPsnFName,stringToDate('"
						+ arrangeDate + "'),'',0 " + "from OA_AS_Card c "
						+ "where c='" + assetID + "')";
		KSQL.executeUpdate(sql, null, OADataModel, null);

	}

	/**
	 * 资产归还
	 * 
	 * @param assetID
	 * @param returnDate
	 * @throws Exception
	 */
	public static void assetReturn(String assetID, String returnDate){
		String sql = "update OA_AS_UseRecord u set u.fEndDate=stringToDate('" + returnDate
			+ "') where u.fAssetID='" + assetID + "' and u.fEndDate is null";
		KSQL.executeUpdate(sql, null, OADataModel, null);
	}

	/**
	 * 插入折旧数据
	 * 
	 * @param year
	 * @param month
	 * @return
	 * @throws Exception
	 */
	public static void insertDepreciation(String year, String month){
		String sql = "insert into OA_AS_Deprecition d"
						+ "(d.fDepreYear,d.fDepreMonth,d.fBgDepreYear,d.fBgDepreMonth"
						+ ",d,d.fKindID,d.fKind,d.fName,d.fSpecType,d.fOriginValue"
						+ ",d.fAddDepreValue"
						+ ",d.fDutyDeptID,d.fDutyDeptName,d.fDutyPsnID,d.fDutyPsnName,d.fServiceYear"
						+ ",d.fCreateTime,d.fCode,d.version)"
						+ "(select '"
						+ year
						+ "','"
						+ month
						+ "'"
						+ ",c.fBgDepreYear,c.fBgDepreMonth,guid()"
						+ ",c.fKindID,c.fKind,c.fName,c.fSpecType,c.fOriginValue"
						+ ",c.fAddDepreValue"
						+ ",c.fDutyDeptID,c.fDutyDeptName,c.fDutyPsnID,c.fDutyPsnName,c.fServiceYear"
						+ ",c.fCreateTime,c.fCode,c.version from OA_AS_Card c"
						+ " where not c.fCode  in (select dd.fCode from OA_AS_Deprecition dd  where dd.fDepreYear='"+ year
						+"' and dd.fDepreMonth='"+ month 
						+"') and ((c.fBgDepreYear < '" + year
						+ "' and c.fBgDepreMonth is not null)"
						+ " or (c.fBgDepreYear ='" + year
						+ "' and c.fBgDepreMonth <'" + month 
						+ "')) and (c.fBgDepreYear+c.fServiceYear > '"+ year 
						+"' or (c.fBgDepreYear+c.fServiceYear ='"+ year 
						+"' and c.fBgDepreMonth > '"+ month 
						+"')))";

		KSQL.executeUpdate(sql, null, OADataModel, null);
	}

	/**
	 * 更新资产折旧数据
	 * 
	 * @param year
	 * @param month
	 * @return
	 * @throws Exception
	 */
	public static void updateDepreciation(String year, String month) {
		String sql = "update OA_AS_Deprecition d set d.fPercent='1',"
					+ " d.fYearDepre=" + "case when "
					+ year
					+ "> d.fBgDepreYear"
					+ " 	then round((d.fOriginValue)/(d.fServiceYear*12) * "
					+ month
					+ ",2) "
					+ "	else round((d.fOriginValue)/(d.fServiceYear*12) * ("
					+ month
					+ "- d.fBgDepreMonth),2) "
					+ "end,"
					+ "d.fMonthDepre= round((d.fOriginValue)/(d.fServiceYear*12),2),"
					+ "d.fAddDepreValue= round((d.fOriginValue)/(d.fServiceYear*12) * "
					+ "(("
					+ year
					+ "*12 + "
					+ month
					+ ")-(d.fBgDepreYear *12+ d.fBgDepreMonth)),2),"
					+ "d.fEquity=d.fOriginValue - round((d.fOriginValue)/(d.fServiceYear*12) * "
					+ "(("
					+ year
					+ "*12 + "
					+ month
					+ ")-(d.fBgDepreYear *12+ d.fBgDepreMonth)),2)"
					+ " ,"
					+ "d.fUseMonth=("
					+ year
					+ "*12 + "
					+ month
					+ ")-(d.fBgDepreYear *12+ d.fBgDepreMonth)"
					+ " where d.fDepreYear='"
					+ year
					+ "' and d.fDepreMonth='"
					+ month + "'";
			KSQL.executeUpdate(sql, null, OADataModel, null);
			updateCardAddDepreValue(year, month);
	}

	/**
	 * 删除资产使用申请安排信息
	 * 
	 * @param id
	 * @throws Exception
	 */
	public static void deleteAssetUseArrange(String id) throws Exception {
		String sql = "delete from OA_AS_UseArrange u where u='" + id + "'";
		KSQL.executeUpdate(sql, null, OADataModel, null);
	}
	//更新资产卡片中资产确认字段的状态
	public static void updateAssetConfirmStatus() throws Exception{
		String sql ="update OA_AS_Card c set c.fAssetConfirm='未确认'";
		KSQL.executeUpdate(sql, null, OADataModel, null);
	}
	//当折旧后更新资产卡片中累计折旧字段的值
	public static void updateCardAddDepreValue(String year, String month){
		String sql = "select dep.fCode,max(dep.fAddDepreValue) as fAddDepreValue from OA_AS_Deprecition dep where " +
					"dep.fCode in (select d.fCode from OA_AS_Deprecition d " +
					"where d.fDepreYear = '"+ year +"' and d.fDepreMonth = '"+ month +"') group by dep.fCode"; 
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs = rows.next();
			sql = "update OA_AS_Card c set c.fAddDepreValue = " 
				+ rs.getString("fAddDepreValue")+ " where c.fCode = '" + rs.getString("fCode") + "'";
			KSQL.executeUpdate(sql, null, OADataModel, null);
		}


	}
	public static String checkCanDeleteAssetInData(String id){
		String result = "";
		String qsql = "select d from OA_AS_InD d where d.fMasterID = '"+id+"' and d.fIsIn = 1 ";
		Table table = KSQL.select(qsql, null, "/OA/asset/data", null);
		int cnt = table.size();
		if(cnt==0){
			result = "true";
		}else{
			result = "false";
		}
		return result;
	}
	public static void deleteAssetInData(String id){
		String sql = "delete from OA_AS_InM m where m = '"+id+"'";
		KSQL.executeUpdate(sql, null, "/OA/asset/data", null);
		String dsql = "delete from OA_AS_InD d where d.fMasterID = '"+id+"'";
		KSQL.executeUpdate(dsql, null, "/OA/asset/data", null);
	}
}