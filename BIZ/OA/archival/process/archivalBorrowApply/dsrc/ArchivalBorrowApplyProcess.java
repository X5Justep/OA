import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Iterator;

import com.justep.model.ModelUtils;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.process.ProcessUtils;
import com.justep.system.util.CommonUtils;

public class ArchivalBorrowApplyProcess {
	public static void archivalBorrowApplyProcessAfterFinish(){
		String sql = null;
		String bizID = ProcessUtils.getProcessData1();
		String fArchivalID = "", fBorrowKind = "";
		int fBorrowNum = 0;
		sql = "select bd.fArchivalID,bd.fBorrowKind,bd.fBorrowNum from OA_AM_BorrowApplyD bd where bd.fBorrowID='" + bizID + "'";
			
		Table table = KSQL.select(sql, null, "/OA/archival/data", null);
		Iterator<Row> it = table.iterator();
		while(it.hasNext()){
			Row rs = it.next();
			fArchivalID = rs.getString("fArchivalID");
			fBorrowKind = rs.getString("fBorrowKind");
			fBorrowNum = rs.getInt("fBorrowNum");
			sql = "insert into OA_AM_History h (h,h.version,h.fArchivalID,h.fBorrowPsnID,h.fBorrowPsnName,h.fBorrowTime,h.fBorrowKind,h.fBorrowNum,h.fReturnPsnID,h.fReturnPsnName,h.fRequestID,h.fReturnNum,h.fCloseTime) "
						+ "(select '"
						+ CommonUtils.createGUID()
						+ "','0','"
						+ fArchivalID
						+ "',b.fBorrowPsnID,b.fBorrowPsnName,b.fBorrowTime,bd.fBorrowKind,'1',null,null,bd,'0',bd.fCloseTime from OA_AM_BorrowApplyM b join OA_AM_BorrowApplyD bd on b=bd.fBorrowID where b='"
						+ bizID + "' and bd.fArchivalID='" + fArchivalID + "')";
			KSQL.executeUpdate(sql, null, "/OA/archival/data", null);
			if (fBorrowKind.equals("原件")) {
				sql = "update OA_AM_Archival a set a.fInventory=case when (a.fInventory-" + fBorrowNum + ")>0 then (a.fInventory-"
					+ fBorrowNum + ") else 0 end where a='" + fArchivalID + "'";
				KSQL.executeUpdate(sql, null, "/OA/archival/data", null);
			}
		}
	}
}
