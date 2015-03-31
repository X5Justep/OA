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
		String fSourceDate = "";
		if(row.getDate("fSourceDate")!=null){
			fSourceDate =  row.getDate("fSourceDate").toString();
		}
		String s = String.format("%s收到%s于%s发送的%s:《%s》。主题词: %s;来文字号: %s;密级：%s;紧急程度：%s。", 
					row.getDate("fIssueDate").toString(), row.getString("fSourceDept"),
					fSourceDate, row.getString("fDocKindName"), 
					row.getString("fTitle"), row.getString("fKeyword"),
					row.getString("fSourceDocNumber"), row.getString("fDocSecretLevelName"), 
					row.getString("fDocExigenceLevelName"));
		return s;
	}
}