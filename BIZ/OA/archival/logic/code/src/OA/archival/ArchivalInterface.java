package OA.archival;

import java.sql.Connection;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.Element;

import com.justep.oa.SysUtils;
import com.justep.model.ModelUtils;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.KSQL;
import com.justep.system.util.CommonUtils;

public class ArchivalInterface {
	/**
	 * 创建档案信息
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
				KSQL.executeUpdate(sqls, null, "/OA/archival/data", null);
			}
		} else {
			KSQL.executeUpdate(sql, null, "/OA/archival/data", null);
		} 
	}

	
	/**
	 * 档案接口
	 */
	
	public static void archivalInterface(Document dom) throws Exception {
			Element root = dom.getRootElement();
			String newAMID = java.util.UUID.randomUUID().toString().replace(
					"-", "").toUpperCase();
			// 系统用户相关
			String fCreateOgnID = SysUtils.getCurrentOgnID();
			String fCreateOgnName = SysUtils.getCurrentOgnName();
			String fCreateDeptID = SysUtils.getCurrentDeptID();
			String fCreateDeptName = SysUtils.getCurrentDeptName();
			String fCreatePosID = SysUtils.getCurrentPosID();
			String fCreatePosName = SysUtils.getCurrentPosName();
			String fCreatePsnID = SysUtils.getCurrentPersonID();
			String fCreatePsnName = SysUtils.getCurrentPersonName();
			String fCreatePsnFullID = SysUtils.getCurrentPersonMemberFID();
			String fCreatePsnFullName = SysUtils.getCurrentPersonMemberFName();
			
			String businessID = root.selectSingleNode("businessID").getText();
			String rollID = root.selectSingleNode("rollID").getText();
			String sign = "1";
			if(rollID.equals(""))
				sign = "0";
			String sql = "insert into OA_AM_Archival a(a,a.version,a.fFileNO,a.fDocumentNO,a.fArchivalNO,a.fMicroNO,a.fSequence,a.fMenuNO,a.fPageNO,a.fBoxNO,"
					+ "a.fAMDate,a.fAMLevel,a.fAMYear,a.fSecret,a.fDescription,a.fBusinessID,a.fFuncURL,a.fTitle,a.fSubTitle,a.fKeyWord,a.fFondsID,a.fFondsName,a.fCategoryID,"
					+ "a.fCategoryName,a.fRollID,a.fRollName,a.fFileDeptID,a.fFileDeptName,a.fResponsibleID,a.fResponsibleName,a.fFileDate,a.fKeepLimit,a.fCarry,a.fIsBorrow,"
					+ "a.fNum,a.fUnit,a.fRoom,a.fChest,a.fGrid,a.fVersionCode,a.fRemark,a.fState,a.fStateName,a.fSign,a.fIsRoll,a.fVoucherBegin,a.fVoucherEnd,a.fVoucherNum,a.fVoucherNO,fURL,"
					+ "a.fRelevanceID,fRelevanceName,a.fInventory,a.fCreateognID,a.fCreateOgnnName,a.fCreateDeptID,a.fCreateDeptName,a.fCreatePosID,a.fCreatePosName,a.fCreatePsnID,"
					+ "a.fCreatePsnName,a.fCreatePsnFID,a.fCreatePsnFName,a.fCreateTime,a.fDocLink,a.fCopies,a.fPages)"
					+ " values('"+newAMID+"',0,'"+root.selectSingleNode("fileNO").getText()+"','"+root.selectSingleNode("documentNO").getText()+"','"+root.selectSingleNode("archivalNO").getText()+"',null,null,null,null,null,:strDate,null,'"+root.selectSingleNode("year").getText()+"','"+root.selectSingleNode("secret").getText()+"',null,'"+businessID+"','"+root.selectSingleNode("funcURL").getText()+"','"+root.selectSingleNode("title").getText()+"',null,'"+root.selectSingleNode("keyword").getText()+"','"+root.selectSingleNode("fondsID").getText()+"','"+root.selectSingleNode("fondsName").getText()+"','"+root.selectSingleNode("categoryID").getText()+"','"+root.selectSingleNode("categoryName").getText()+"','"+rollID+"','"+root.selectSingleNode("rollName").getText()+"',null,null,null,null,null,'"+root.selectSingleNode("limit").getText()+"','"+root.selectSingleNode("carry").getText()+"',0,null,null,null,null,null,null,null,'01','编制中','"+sign+"',0,null,null,null,null,null,'"+root.selectSingleNode("relevanceID").getText()+"','"+root.selectSingleNode("relevanceName").getText()+"',1,'"+fCreateOgnID+"','"+fCreateOgnName+"','"+fCreateDeptID+"','"+fCreateDeptName+"','"+fCreatePosID+"','"+fCreatePosName+"','"+fCreatePsnID+"','"+fCreatePsnName+"','"+fCreatePsnFullID+"','"+fCreatePsnFullName+"',:strCurrentDate,'"+root.selectSingleNode("docLink").getText()+"',"+root.selectSingleNode("fCopies")+","+root.selectSingleNode("fPages")+")";
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("strDate", "stringToDate("+root.selectSingleNode("date").getText()+")");
			param.put("strCurrentDate", CommonUtils.getCurrentDateTime());
			KSQL.executeUpdate(sql, null, "/OA/archival/data", null);
			
			generateArchivalInfo(newAMID, "all"); 
			
			String tableName = root.selectSingleNode("table").getText();
			String filedName = root.selectSingleNode("filed").getText();
			if (!tableName.equals("")) {
				sql = "update " + tableName + " a set a." + filedName + " = '"
				+ newAMID + "' where a = '" + businessID + "'";
				KSQL.executeUpdate(sql, null, "/OA/archival/data", null);
			}
	}
}
