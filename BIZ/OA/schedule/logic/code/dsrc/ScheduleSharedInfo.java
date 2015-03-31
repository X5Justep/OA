import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;

public class ScheduleSharedInfo {
	public static final String OADataModel ="/OA/schedule/data";
	public static final String sysDataModel ="/system/data";
	public static String queryWhoShared2Me() {
		Set<String> currPsnFullID = getPersonFullIds();
		Set<String> personIDs = queryPersonIDsByPersonFID(querySharedPerson(currPsnFullID));
		StringBuffer sb = new StringBuffer();
		for (String sid : personIDs) {
			sb.append(",").append(sid);
		}
		if (personIDs.size() != 0){
			return sb.substring(1, sb.length());
		}else{
			return null;			
		}
	}

	private static Set<String> getPersonFullIds(){
		Set<String> personsSet = new HashSet<String>();
		String sql = "select e.sFID from SA_OPOrg e where e.sPersonID='" + com.justep.oa.SysUtils.getCurrentPersonID() + "'";
		Table table = KSQL.select(sql, null, sysDataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs = rows.next();
			String person = rs.getString("sFID");
			if (!personsSet.contains(person))
				personsSet.add(person);
		}
		return personsSet;
	}

	private static Set<String> querySharedPerson(Set<String> currentPsnFullID) {
		List<String> persons = new ArrayList<String>();
		Set<String> personsSet = new HashSet<String>();
			StringBuffer condition = new StringBuffer();
			for (String fid : currentPsnFullID) {	
				condition.append(" or '" + fid+ "' like concat(r.fShareToOrgFID , '%') ");
			}
			String sql = "select r.fSharedOrgFID from OA_SD_ShareRange r where 1=0 " + condition.toString();

			Table table = KSQL.select(sql, null, OADataModel, null);
			Iterator<Row> rows = table.iterator();
			while (rows.hasNext()) {
				Row rs = rows.next();
				String person = rs.getString("fSharedOrgFID");
				if (!persons.contains(person))
					persons.add(person);
			}
			for (String p : persons)
				personsSet.add(p);

		return personsSet;
	}

	private static Set<String> queryPersonIDsByPersonFID(Set<String> FIDs){
		Set<String> result = new HashSet<String>();		
		if(FIDs.size()< 1){
			return result;
		}
		String likeConditions = "";
		StringBuffer sb = new StringBuffer();

		for (String FID : FIDs) {
			sb.append("or o.sFID like concat('" + FID + "','%')");

		}
		if (FIDs.size() != 0) {
			likeConditions = sb.substring(2, sb.length());
			likeConditions = " WHERE o.sPersonID <> '"
					+ com.justep.oa.SysUtils.getCurrentPersonID()
					+ "' AND(1=0 OR " + likeConditions + ")";
		}
		String sql = "";
		if (!(likeConditions.equals("") || null == likeConditions)) {
			sql = "SELECT DISTINCT o.sPersonID FROM SA_OPOrg o" + likeConditions + " ";
		}
		Table table = KSQL.select(sql, null, sysDataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs = rows.next();
			String sid = rs.getString("sPersonID");
			result.add(sid);
		}

		return result;
	}
}