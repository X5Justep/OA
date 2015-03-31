import java.util.Iterator;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;

public class Office {
	public static final String OADataModel ="/OA/officeSupplyConsumables/data";
	public static String canUse(String bizID) throws Exception {
		String sql = null, result = "";
		sql = "select d.fItemID,d.fName,d.fFactNum from OA_OSC_UseApplyD d where d.fMasterID = '" + bizID + "'";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs1 = rows.next();
			String itemID = rs1.getString("fItemID");
			String name = rs1.getString("fName");
			int num = rs1.getInt("fFactNum");

			sql = "select b.fStock from OA_OSC_BaseInfo b where b = '" + itemID + "'";
			Table tab = KSQL.select(sql, null, OADataModel, null);
			Iterator<Row> tabs = tab.iterator();
			if (tabs.hasNext()) {
				Row rs = tabs.next();
				int stock = rs.getInt("fStock");
				if (num > stock) {
					if (result == "" || result == null) {
						result = name;
					} else {
						result = result + "、" + name;
					}
				}
			}
		}
		if (result.equals("")) {
			result = "OK";
		}
		return result;
	}

	public static String useRegister(String bizID) {
		String sql = null, result = "";
		sql = "update OA_OSC_UseApplyM m set m.fProvideState=1,m.fProvideStateName='已发放',m.fBizState='bsFinished',m.fBizStateName='已完成' where m='" + bizID + "'";
		KSQL.executeUpdate(sql, null, OADataModel, null);

		sql = "select d.fItemID,d.fFactNum from OA_OSC_UseApplyD d where d.fMasterID = '" + bizID + "'";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs1 = rows.next();
			String itemID = rs1.getString("fItemID");
			int num = rs1.getInt("fFactNum");
			sql = "update OA_OSC_BaseInfo b set b.fStock = b.fStock - " + num + " where b = '" + itemID + "'";
			KSQL.executeUpdate(sql, null, OADataModel, null);
		}
		if (result.equals("")) {
			result = "OK";
		}

		return result;
	}
}