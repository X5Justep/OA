import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;


public class docSplitExecutors {
	public static List<String> splitExecutors(String sData1, String executors,String activity){
		List<String> list = new ArrayList<String>();
		String ksql = "";
		try{
			if(executors != null ){
				String counterSignIDs = "'" + executors.replaceAll(",", "','") + "'";
				ksql = "select s.fCounterSignID from OA_DC_SignPsn s where s.fMasterID = '" + sData1 
							+ "' and s.fActivity = '" + activity + "' and s.fSignState = '0' and " +
							"s.fCounterSignID in (" + counterSignIDs + ")";
			}else{
				ksql = "select s.fCounterSignID from OA_DC_SignPsn s where s.fMasterID = '" + sData1 
				+ "' and s.fActivity = '" + activity + "' and s.fSignState = '0' " ;
			}
			Table tab = KSQL.select(ksql, null, "/OA/doc/data", null);
			Iterator<Row> rows = tab.iterator();
			while(rows.hasNext()){
				Row row = rows.next();
				list.add(row.getString("fCounterSignID"));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
}