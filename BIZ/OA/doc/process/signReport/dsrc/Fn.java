import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.util.Utils;

public class Fn {
	private static final String DATA_MODEL = "/OA/doc/data";
	private static final String CONCEPT = "OA_DC_Doc";
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
		String s = String.format("%s%s于%s起草的签报文件:《%s》。密级：%s;紧急程度：%s;主题词: %s。", 
					row.getString("fCreateDeptName"), row.getString("fDraftPerName"),
					row.getDate("fDraftTime").toString(), row.getString("fTitle"),
					row.getString("fDocSecretLevelName"), row.getString("fDocExigenceLevelName"), 
					row.getString("fKeyword"));
		return s;
	}
}