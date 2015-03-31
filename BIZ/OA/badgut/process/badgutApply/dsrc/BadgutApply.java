import java.util.Iterator;
import com.justep.system.process.ProcessUtils;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;

public class BadgutApply {
	public static final String OADataModel = "/OA/badgut/data";
	public static void badgutApplyProcessAfterFinish()  {
		String sql = null;

		String bizID = ProcessUtils.getProcessData1();

		sql = "select m.fCostCenterID,m.fYear from OA_BG_ApplyM m where m = '"
					+ bizID + "'";
		Table table = KSQL.select(sql, null,OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			Row rs = rows.next();
			String costCenterID = rs.getString("fCostCenterID");
			
			sql = "delete from OA_BG_BadgutD d where d.fBGBadgutID in (select m from OA_BG_BadgutM m where m.fCostCenterID = '"
					+ costCenterID + "' and m.fYear = " + rs.getInteger("fYear") + ")";
			KSQL.executeUpdate(sql, null, OADataModel, null);
			
			sql = "delete from OA_BG_BadgutM m where m.fCostCenterID = '"
					+ costCenterID + "' and m.fYear = " + rs.getInteger("fYear") + "";
			KSQL.executeUpdate(sql, null, OADataModel, null);

			sql = "insert into OA_BG_BadgutM m(m,m.version,m.fCostCenterID,m.fCostCenterCode,m.fCostCenterName,m.fYear,m.fRemark)"
					+ " (select am,0,am.fCostCenterID,am.fCostCenterCode,am.fCostCenterName,am.fYear,am.fRemark from OA_BG_ApplyM am where am = '" + bizID + "')";
			KSQL.executeUpdate(sql, null, OADataModel, null);
			
			sql = "insert into OA_BG_BadgutD d(d,d.fAccountID,d.fAccountCode,d.fAccountName,d.fBGBadgutID,d.fPlan1,d.fPlan2,d.fPlan3,d.fPlan4,d.fPlan5,d.fPlan6,d.fPlan7,d.fPlan8,d.fPlan9,d.fPlan10,d.fPlan11,d.fPlan12,d.fPlanall,d.version,d.fFact1,d.fFact2,d.fFact3,d.fFact4,d.fFact5,d.fFact6,d.fFact7,d.fFact8,d.fFact9,d.fFact10,d.fFact11,d.fFact12,d.fFactall,d.fYear1,d.fYear2,d.fYear3,d.fYear4,d.fYear5,d.fYear6,d.fYear7,d.fYear8,d.fYear9,d.fYear10,d.fYear11,d.fYear12,d.fYearall)"
					+ " (select ad, ad.fAccountID,ad.fAccountCode,ad.fAccountName,ad.fBGApplyID,"
					+ " ad.fPlan1,ad.fPlan2,ad.fPlan3,ad.fPlan4,ad.fPlan5,ad.fPlan6,ad.fPlan7,ad.fPlan8,ad.fPlan9,ad.fPlan10,ad.fPlan11,ad.fPlan12,ad.fPlanall,"
					+ " 0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,"
					+ " ad.fPlan1,ad.fPlan2,ad.fPlan3,ad.fPlan4,ad.fPlan5,ad.fPlan6,ad.fPlan7,ad.fPlan8,ad.fPlan9,ad.fPlan10,ad.fPlan11,ad.fPlan12,ad.fPlanall"
					+ " from OA_BG_ApplyD ad where ad.fBGApplyID = '" + bizID + "')";
			KSQL.executeUpdate(sql, null, OADataModel, null);
		
		}
	}
}
