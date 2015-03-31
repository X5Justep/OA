import java.text.SimpleDateFormat;

import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.util.Utils;

public class Fn {
	private static final String DATA_MODEL = "/OA/signature/data";
	private static final String CONCEPT = "OA_SL_Signature";
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
		String s = String.format("%s需要在%s使用%s。", 
					row.getString("fApplyPsnName"), new SimpleDateFormat("yyyy-MM-dd HH:mm").format(row.getDateTime("fUseDate")),
					row.getString("fSignatureTypeName"));
		return s;
	}
}