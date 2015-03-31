import java.util.Calendar;
import java.util.Iterator;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;


public class badgut {
	public static final String OADataModel ="/OA/badgut/data";
	public static void applicationTemplate(String applyID) throws Exception {
			String sql = "delete from OA_BG_ApplyD d where d.fBGApplyID = '" + applyID + "'";
			KSQL.executeUpdate(sql, null, OADataModel, null);
			String ksql = "insert into OA_BG_ApplyD d(d,d.fAccountID,d.fAccountCode,d.fAccountName,d.fBGApplyID,d.fPlan1,d.fPlan2,d.fPlan3,d.fPlan4," 
					+ "d.fPlan5,d.fPlan6,d.fPlan7,d.fPlan8,d.fPlan9,d.fPlan10,d.fPlan11,d.fPlan12,d.fPlanall,d.version) "
					+ " (select guid(), case when cc.fAllAccount = 1 then pb else ca.fAccountID end,"
					+ " case when cc.fAllAccount = 1 then pb.fCode else ca.fAccountCode end as fCode,"
					+ " case when cc.fAllAccount = 1 then pb.fName else ca.fAccountName end,"
					+ "'" + applyID + "', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 "
					+ " from OA_BG_ApplyM am optional join OA_BG_CostCenter cc on am.fCostCenterID = cc "
					+ " optional join OA_BG_CostAccount ca on cc = ca.fCostCenterID and cc.fAllAccount <> 1 "
					+ " optional join OA_Pub_BaseCode pb on pb.fUseStatus = 1 and pb.fScope='总账科目' and cc.fAllAccount = 1 "
					+ " where am = '" + applyID + "' order by pb.fCode)";
			KSQL.executeUpdate(ksql, null, OADataModel, null);

	}

	public static void getBadgutData(String badgutIDs, String alterID){

		String sql = "";

		String[] infoIDs = badgutIDs.split(",");
		for (int i = 0; i < infoIDs.length; i++) {
			sql = "insert into OA_BG_AlterD d(d,d.version,d.fBGAlterID,d.fAccountID,d.fAccountCode,d.fAccountName," 
				+ "d.fPlan1,d.fPlan2,d.fPlan3,d.fPlan4,d.fPlan5,d.fPlan6,d.fPlan7,d.fPlan8,d.fPlan9,d.fPlan10,d.fPlan11,d.fPlan12,d.fPlanall," 
				+ "d.fFact1,d.fFact2,d.fFact3,d.fFact4,d.fFact5,d.fFact6,d.fFact7,d.fFact8,d.fFact9,d.fFact10,d.fFact11,d.fFact12,d.fFactall," 
				+ "d.fAlter1,d.fAlter2,d.fAlter3,d.fAlter4,d.fAlter5,d.fAlter6,d.fAlter7,d.fAlter8,d.fAlter9,d.fAlter10,d.fAlter11,d.fAlter12,d.fAlterall,d.fBGDetailID)" 
				+ " (select guid(),0,'" + alterID + "',a.fAccountID, a.fAccountCode, a.fAccountName,"
						+ " a.fPlan1, a.fPlan2, a.fPlan3, a.fPlan4, a.fPlan5, a.fPlan6, a.fPlan7, a.fPlan8, a.fPlan9, a.fPlan10, a.fPlan11, a.fPlan12, a.fPlanall,"
						+ " a.fFact1, a.fFact2, a.fFact3, a.fFact4, a.fFact5, a.fFact6, a.fFact7, a.fFact8, a.fFact9, a.fFact10, a.fFact11, a.fFact12, a.fFactall,"
						+ " a.fPlan1, a.fPlan2, a.fPlan3, a.fPlan4, a.fPlan5, a.fPlan6, a.fPlan7, a.fPlan8, a.fPlan9, a.fPlan10, a.fPlan11, a.fPlan12, a.fPlanall,a"
						+ " from OA_BG_BadgutD a optional join OA_BG_AlterD b on a.fAccountID = b.fAccountID and b.fBGAlterID = '"
						+ alterID + "' where b is null and a = '" + infoIDs[i] + "')";
			KSQL.executeUpdate(sql, null, OADataModel, null);
		}
	}

	public static String getConfig()  {
		String strMonth = null;
		String sql = "select c.fCurrentYear,c.fCurrentMonth from OA_BG_Config c";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			Row rs = rows.next();
			strMonth = rs.getString("fCurrentYear") + "-"
						+ rs.getString("fCurrentMonth");
		} else {
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH) + 1;
			sql = "insert into OA_BG_Config c (c.fCurrentYear,c.fCurrentMonth,c,c.version,c.fHasPassed)values ('" + year + "','"
						+ month + "',guid(),0,'0')";
			KSQL.executeUpdate(sql, null, OADataModel, null);
			strMonth = year + "-" + month;
		}

		return strMonth;
	}

	public static void setConfig(String aYear, String aMonth)  {
		String sql = "update OA_BG_Config c set c.fCurrentYear = " + aYear
					+ ", c.fCurrentMonth = " + aMonth;
		KSQL.executeUpdate(sql, null, OADataModel, null);

	}

}