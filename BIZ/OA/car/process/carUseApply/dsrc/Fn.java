import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.util.Utils;

public class Fn {
	private static final String DATA_MODEL = "/OA/car/data";
	private static final String CONCEPT = "OA_CA_CarUseApply";
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
		int fPersonCount = 0;
		if(row.getInteger("fPersonCount")!=null){
			fPersonCount = row.getInteger("fPersonCount");
		}
		String s = String.format("%s在%s到%s申请用车,人数%s。", 
					row.getString("fApplyPsnName"), row.getDateTime("fBeginTime").toLocaleString(),
					row.getDateTime("fEndTime").toLocaleString(), fPersonCount);
		return s;
	}
}