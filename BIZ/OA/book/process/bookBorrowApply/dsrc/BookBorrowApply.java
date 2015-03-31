import com.justep.system.process.*;
import com.justep.system.context.*;
import com.justep.model.*;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;

public class BookBorrowApply {
	public static void bookBorrowApplyProcessAfterFinish() throws Exception {
		Connection conn = null;
		Statement stmt = null, ustmt = null;
		ResultSet rs = null;
		String sql = null;
		int ct = 0;
		try {
			conn = ModelUtils.getConnection("/OA/book/data");
			ContextHelper.getTransaction().begin(conn);
			stmt = conn.createStatement();
			String bizID = ProcessUtils.getProcessData1();
			sql = "select t.fBookID,m.fApplyDeptID,m.fApplyDeptName,m.fApplyPsnID,m.fApplyPsnName "
					+ "from OA_BK_BookApplyD t join OA_BK_BookApplyM m on t.fMasterID = m.fID "
					+ " where t.fMasterID = '" + bizID + "'";
			ustmt = conn.createStatement();
			try {
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					String bookId = rs.getString("fBookID");
					String fApplyPsnID = rs.getString("fApplyPsnID");
					String fApplyPsnName = rs.getString("fApplyPsnName");
					String fApplyDeptID = rs.getString("fApplyDeptID");
					String fApplyDeptName = rs.getString("fApplyDeptName");
					sql = "update OA_BK_BookApplyD set fLoanID = '0' where fBookID='"
							+ bookId + "' and fMasterID='" + bizID + "'";
					ustmt.addBatch(sql);
					sql = "update OA_BK_BookInfo set fLoanID = '1',fLoanName = '借出',fLoanReadPerID ='"
							+ fApplyPsnID
							+ "',fLoanReadPerName ='"
							+ fApplyPsnName
							+ "',fLoanReadDeptID='"
							+ fApplyDeptID
							+ "',"
							+ "fLoanReadDeptName='"
							+ fApplyDeptName + "' where fID ='" + bookId + "'";
					ustmt.addBatch(sql);
					ct++;
				}
			} finally {
				if (rs != null) {
					rs.close();
					rs = null;
				}
			}
			if (ct > 0) {
				ustmt.executeBatch();
			}
		} finally {
			if (ustmt != null) {
				ustmt.close();
				ustmt = null;
			}
			if (stmt != null) {
				stmt.close();
				stmt = null;
			}
			if (conn != null) {
				conn.close();
				conn = null;
			}
		}
	}
}
