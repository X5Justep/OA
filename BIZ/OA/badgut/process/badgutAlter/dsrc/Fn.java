import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.util.Utils;

public class Fn {
	private static final String DATA_MODEL = "/OA/badgut/data";
	private static final String CONCEPT = "OA_BG_AlterM";
	private static Row getData(String bizID) {
		String ksql = String.format(
				"select m.* from %s m where m = '%s' ",
				CONCEPT, bizID);
		Table table = KSQL.select(ksql, null, DATA_MODEL, null);
		Utils.check(table.iterator().hasNext(),
				String.format("无效的ID[%s]", bizID));
		Row row = table.iterator().next();
		return row;
	}
	
	public static String getSummary(String bizID) {
		Row row = getData(bizID);
		String s = String.format("%s于%s提交%s年度成本中心:%s的预算变更。", 
					row.getString("fCreatePsnName"), row.getDateTime("fCreateTime").toLocaleString(),
					row.getInt("fYear"), row.getString("fCostCenterName"));
		return s;
	}
}