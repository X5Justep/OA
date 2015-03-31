import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.util.Utils;

public class Fn {
	private static final String DATA_MODEL = "/OA/finance/data";
	private static final String CONCEPT = "OA_FC_ReimbApplyM";
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
		String fReiBeginDate = "",fReiBackDate="";
		if(row.getDate("fReiBeginDate")!=null){
			fReiBeginDate = row.getDate("fReiBeginDate").toString();
		}
		if(row.getDate("fReiBackDate")!=null){
			fReiBackDate = row.getDate("fReiBackDate").toString();
		}
		String s = String.format("%s在日期区间%s至%s出差报销实报金额%s元。", 
				row.getString("fLoanPsnName"), fReiBeginDate,
				fReiBackDate, row.getDecimal("fMustReimAmt").toString());
		return s;
	}
}