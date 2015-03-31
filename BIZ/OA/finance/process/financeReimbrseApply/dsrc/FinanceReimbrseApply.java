import java.util.Iterator;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.process.ProcessUtils;

public class FinanceReimbrseApply {
	public static final String OADataModel ="/OA/finance/data";
	public static void financeReimbrseApplyProcessAfterFinish(){
		String bizID = ProcessUtils.getProcessData1();
		String sql = "select m.fIsPreLoan from OA_FC_ReimbApplyM m where m = '"+ bizID + "'";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs = rows.next();
			String isPreLoan = rs.getString("fIsPreLoan");
			if (isPreLoan != null) {
				sql = "update OA_FC_LoanApply a set a.fStatus = 1,a.fStatusName='已归还' where a.fNO = '"
							+ isPreLoan + "'";
				KSQL.executeUpdate(sql, null, OADataModel, null);
			}
		}
	}
}
