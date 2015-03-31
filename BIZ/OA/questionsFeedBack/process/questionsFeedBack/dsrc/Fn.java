import java.text.SimpleDateFormat;
import java.util.Iterator;

import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.util.Utils;

public class Fn {
	private static final String DATA_MODEL = "/OA/questionsFeedBack/data";
	private static final String CONCEPT = "OA_QB_QuestionsFeedBack";
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
		String fApplyTime = "",fRequestTime="";
		if(row.getDate("fApplyTime")!=null){
			fApplyTime =  row.getDate("fApplyTime").toString();
		}
		if(row.getDateTime("fRequestTime")!=null){
			fRequestTime =  row.getDateTime("fRequestTime").toString();
		}
		String s = String.format("%s在%s提出%s类问题,希望在%s完成。", 
					row.getString("fApplyPsnName"),  
					fApplyTime,
					row.getString("fQuestionsType"),
					fRequestTime);
		return s;
	}
}