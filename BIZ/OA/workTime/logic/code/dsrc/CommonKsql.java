import com.justep.system.data.KSQL;
import com.justep.system.data.Table;

public class CommonKsql{
	public static Table ksqlQuery(String ksql,String dataModel){
		Table table = KSQL.select(ksql, null, dataModel, null);
		return table;
	}
	public static void ksqlUpdate(String ksql,String dataModel){
		KSQL.executeUpdate(ksql, null, dataModel, null);
	}
}
