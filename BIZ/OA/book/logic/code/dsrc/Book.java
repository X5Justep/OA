import java.util.Iterator;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;

public class Book {
	public static final String OADataModel ="/OA/book/data";
	public static String isBorrowApplyBook(String bookIDs, String status) {
		String sql = null;
		String result = "";
		if (status.equals("0")) {
				sql = "select distinct t.fBooksName,t.fBooksNumber  from V_OA_Book_ApplyStatus t where t.fBookApplyStatus='0' and t.fBookID in "
						+ "(" + bookIDs + ")";
		}
		if (status.equals("1")) {
				sql = "select distinct t.fBooksName,t.fBooksNumber  from V_OA_Book_ApplyStatus t where t.fBookApplyStatus='1' and t.fBookID in "
						+ "(" + bookIDs + ")";
		}
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs = rows.next();
			result = result + rs.getString("fBooksNumber") + "--"
						+ rs.getString("fBooksName") + "、";
		}
		return result;
	}

	public static String updateBookLoanStatus(String bizID){
		String sql = "";
		String result = "";

		sql = "update OA_BK_BookApplyD d set d.fLoanID='1' where d.fLoanID='0' and d.fBookID='"
					+ bizID + "'";
		KSQL.executeUpdate(sql, null, OADataModel, null);
		sql = "update OA_BK_BookInfo b set b.fLoanID='0',b.fLoanName='闲置',b.fLoanReadDeptID='',b.fLoanReadDeptName='',"
					+ "b.fLoanReadPerID='',b.fLoanReadPerName='' where b='" + bizID + "'";
		KSQL.executeUpdate(sql, null, OADataModel, null);
		result = "图书归还成功!";

		return result;
	}

	public static void AppendBook(String sBookID,String sMasterID){
		String sql = "";
	
		sql = "insert into  OA_BK_BookApplyD d(d,d.version,d.fMasterID,d.fBookID,d.fBooksNumber,d.fBooksName,d.fBooksTypeID,d.fBooksTypeName,d.fBooksNo,"
		     +"d.fBookConcern,d.fAuthor,d.fPageNum,d.fPrice) "
			 +"( select guid(),0,'"+sMasterID+"', b,b.fBooksNumber,b.fBooksName,b.fBooksTypeID,b.fBooksTypeName,b.fBooksNo,"
			 +"b.fBookConcern,b.fAuthor,b.fPageNum,b.fPrice "
			 +" FROM OA_BK_BookInfo b where b in ("+sBookID+"))";
		if(!sBookID.equals(""))		
			KSQL.executeUpdate(sql, null, OADataModel, null);
	}
}