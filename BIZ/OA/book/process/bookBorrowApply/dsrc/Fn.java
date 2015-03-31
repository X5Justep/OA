import java.text.SimpleDateFormat;
import java.util.Iterator;

import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.util.Utils;

public class Fn {
	private static final String DATA_MODEL = "/OA/book/data";
	private static final String CONCEPT = "OA_BK_BookApplyM";
	private static final String CONCEPT_D = "OA_BK_BookApplyD";
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
	
	private static Table getDetailData(String bizID) {
		String ksql = String.format(
				"select m.* from %s m where m.fMasterID = '%s' ",
				CONCEPT_D, bizID);
		Table table = KSQL.select(ksql, null, DATA_MODEL, null);
		
		return table;
	}
	
	public static String getSummary(String bizID) {
		Row row = getData(bizID);
		Table table = getDetailData(bizID);
		Iterator<Row> it = table.iterator();
		String detail = "";
		while(it.hasNext()){
			Row r = it.next();
			String fName = r.getString("fBooksName");
			if("".equals(detail)){
				detail = fName;
			}else{
				detail += "、" + fName;
			}
		}
		String fIntendStartDate="",fIntendEndDate="";
		if(row.getDateTime("fIntendStartDate")!=null){
			fIntendStartDate = row.getDateTime("fIntendStartDate").toString();
		}
		if(row.getDateTime("fIntendEndDate")!=null){
			fIntendEndDate = row.getDateTime("fIntendEndDate").toString();
		}
		String s = String.format("%s申请借阅%s等图书,预计借阅时间范围为:%s -- %s。", 
					row.getString("fApplyPsnName"), detail,
					fIntendStartDate,
					fIntendEndDate);
		return s;
	}
}