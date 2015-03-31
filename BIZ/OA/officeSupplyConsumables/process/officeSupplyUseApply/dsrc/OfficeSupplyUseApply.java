import java.util.Iterator;
import com.justep.system.process.*;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;

public class OfficeSupplyUseApply {
  public static void officeSupplyUseApplyProcessAfterFinish() throws Exception {
      String sql=null;

      String bizID=ProcessUtils.getProcessData1();
      sql="update OA_OSC_UseApplyM m set m.fProvideState=1,m.fProvideStateName='已发放' where m='" + bizID + "'";
      KSQL.executeUpdate(sql, null, "/OA/officeSupplyConsumables/data", null);
      
      sql="select d.fItemID,d.fFactNum from OA_OSC_UseApplyD d where d.fMasterID = '" + bizID + "'";
      Table table = KSQL.select(sql, null, "/OA/officeSupplyConsumables/data", null);
	  Iterator<Row> rows = table.iterator();
	  while (rows.hasNext()) {
		  Row rs1 = rows.next();
          String itemID=rs1.getString("fItemID");
          int num=rs1.getInt("fFactNum");
	      sql="update OA_OSC_BaseInfo b set b.fStock =b.fStock - " + num + " where b = '"+ itemID+ "'";
	      KSQL.executeUpdate(sql, null, "/OA/officeSupplyConsumables/data", null);
      }
  }
}
