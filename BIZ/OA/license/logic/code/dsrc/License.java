import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;

public class License {
	public static final String OADataModel ="/OA/license/data";
	// 归还证照
	public static void licenseBack(String fInfoID, String fRecDate,
			String fApplyID, String fLicenseID) throws ParseException  {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date time = sdf.parse(fRecDate);
		java.sql.Date fRettime = new java.sql.Date(time.getTime());

		String fCrossPer = com.justep.oa.SysUtils.getCurrentPersonName();

		String sql1 = "update OA_LS_LicenseManage l set l.fUseStatus='Unused' ,l.fUseStatusName='闲置' where l='"+fInfoID+"'";
		KSQL.executeUpdate(sql1, null, OADataModel, null);
		
		String sql2 = "update OA_LS_LicenseApplyD d set d.fCrossPer='"+fCrossPer+"' ,d.fRetDate=:fRettime,d.fUseStatus='Returned',d.fUseStatusName='归还' where d.fApplyID='"+fApplyID+"' and d.fLicenseID='"+fLicenseID+"'";
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("fRettime", fRettime);
		KSQL.executeUpdate(sql2, param, OADataModel, null);

	}

	/**
	 * 修改证照状态
	 */
	public static void updateLicenseState(String fUseStatus,
			String fUseStatusName, String applyID) {
		String sqlUpdateLicenseState = "update OA_LS_LicenseManage info set info.fUseStatus = '"+fUseStatus+"', info.fUseStatusName = '"+fUseStatusName+"' "
				+ "where info in "
				+ "(select d.fLicenseID from OA_LS_LicenseApplyM m join OA_LS_LicenseApplyD d "
				+ "where d.fApplyID = m and m='"+applyID+"') ";
		KSQL.executeUpdate(sqlUpdateLicenseState, null, OADataModel, null);
		
		String sqlUpdateLicenseApplyDState = "update OA_LS_LicenseApplyD d set d.fUseStatus = '"+fUseStatus+"', d.fUseStatusName = '"+fUseStatusName+"' "
				+ "where d.fApplyID = '"+applyID+"' ";
		KSQL.executeUpdate(sqlUpdateLicenseApplyDState, null, OADataModel, null);

	}

	/**
	 * 判断证照详细信息是否存在
	 */
	public static String isExistInLicenseApplyD(String fLicenseID){
		String flag = "false";
		String sql = "select d from OA_LS_LicenseApplyD d where d.fLicenseID='"
						+ fLicenseID + "'";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			flag = "true";
		}
		return flag;
	}
}
