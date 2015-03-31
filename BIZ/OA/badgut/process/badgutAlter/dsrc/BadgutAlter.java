import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.justep.system.process.ProcessUtils;
import com.justep.system.util.CommonUtils;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;

public class BadgutAlter {
	public static void badgutAlterProcessAfterFinish() throws Exception {
		String sql = null, detailID = null, fact = null, plan = null;
		int year;
		String deptID = null, deptName = null, personID = null, personName = null, url = null, businessID = null;
		String bizID = ProcessUtils.getProcessData1();
		sql = "select d.fBGDetailID,m.fYear,m.fCreateDeptID,m.fCreateDeptName,m.fCreatePsnID,m.fCreatePsnName,m.fCreatePsnFID,d.fBGAlterID," 
			+"d.fPlan1,d.fPlan2,d.fPlan3,d.fPlan4,d.fPlan5,d.fPlan6,d.fPlan7,d.fPlan8,d.fPlan9,d.fPlan10,d.fPlan11,d.fPlan12," 
			+"d.fAlter1,d.fAlter2,d.fAlter3,d.fAlter4,d.fAlter5,d.fAlter6,d.fAlter7,d.fAlter8,d.fAlter9,d.fAlter10,d.fAlter11,d.fAlter12 from OA_BG_AlterD d join OA_BG_AlterM m on m = d.fBGAlterID where d.fBGAlterID = '" + bizID + "'";
		Table table = KSQL.select(sql, null, "/OA/badgut/data", null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs = rows.next();
			detailID = rs.getString("fBGDetailID");
			year = rs.getInteger("fYear");
			deptID = rs.getString("fCreateDeptID");
			deptName = rs.getString("fCreateDeptName");
			personID = rs.getString("fCreatePsnID");
			personName = rs.getString("fCreatePsnName");
			url = rs.getString("fCreatePsnFID");
			businessID = rs.getString("fBGAlterID");
			for (int i = 1; i < 13; i++) {
				if (rs.getDecimal("fPlan" + i)!=rs.getDecimal("fAlter" + i)) {
					sql = "update OA_BG_BadgutD d set d.fPlan" + i + " = " + fact + " where d = '" + detailID + "'";
					KSQL.executeUpdate(sql, null, "/OA/badgut/data", null);
					sql = "insert into OA_BG_History  h(h,h.fAccountID,h.fAccountCode,h.fAccountName,h.version,h.fCostCenterID,h.fCostCenterCode,h.fCostCenterName," 
							+ "h.fYear,h.fMonth,h.fKindID,h.fKindName,h.fAmount,h.fSurplus,h.fDeptID,h.fDeptName,h.fPersonID,h.fPersonName,h.fURL,h.fBusinessID," 
							+ "h.fFuncURL,h.fDateTime,h.fProcess,h.fActivity)" 
							+"(select guid(),d.fAccountID,d.fAccountCode,d.fAccountName,0,m.fCostCenterID,m.fCostCenterCode,m.fCostCenterName,'"
							+ year + "','" + i + "','alter','预算变更'," + rs.getDecimal("fAlter" + i) + " - " + rs.getDecimal("fPlan" + i) + "," + rs.getDecimal("fAlter" + i) + ",'"
							+ deptID + "','" + deptName + "','" + personID + "','" + personName + "','"
							+ url + "','" + businessID
							+ "','/OA/badgut/process/badgutAlterDetail/badgutAlterDetail.w',:strDate,'/OA/badgut/process/badgutAlterQuery/badgutAlterQueryProcess','startActivity' "
							+" from OA_BG_BadgutM m join OA_BG_BadgutD d on m=d.fBGBadgutID where d = '"
							+ detailID + "')";
					Map<String, Object> param = new HashMap<String, Object>();
					param.put("strDate", CommonUtils.getCurrentDateTime());
					KSQL.executeUpdate(sql, param, "/OA/badgut/data", null);
				}
			}
		}
	}
}
