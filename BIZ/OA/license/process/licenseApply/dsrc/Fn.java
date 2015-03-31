import java.text.SimpleDateFormat;
import java.util.Iterator;

import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.util.Utils;

public class Fn {
	private static final String DATA_MODEL = "/OA/license/data";
	private static final String CONCEPT = "OA_LS_LicenseApplyM";
	private static final String CONCEPT_D = "OA_LS_LicenseApplyD";
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
				"select m.* from %s m where m.fApplyID = '%s' ",
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
			String fLicenseName = r.getString("fLicenseName");
			if("".equals(detail)){
				detail = fLicenseName;
			}else{
				detail += "、" + fLicenseName;
			}
		}
		String s = String.format("%s于%s申请借用%s等证照。", 
					row.getString("fCreatePsnName"), new SimpleDateFormat("yyyy-MM-dd HH:mm").format(row.getDateTime("fCreateTime")),
					detail);
		return s;
	}
}