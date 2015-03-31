import java.util.Iterator;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;

public class AddressBook {

	/**
	 * @param args
	 */
	public static String getAddressBookShareIDAction(String fCurrentPsnFid){
		String sql = null;
		String result = "";
		String orgFullID = null;
		String orgCondition=null;

		String[] arrOrgFullID = fCurrentPsnFid.split("/");
		for (int i = 0; i < arrOrgFullID.length; i++) {
			if (orgFullID == null) {
					orgFullID = arrOrgFullID[i];
			} else {
					orgFullID = orgFullID + "/" + arrOrgFullID[i];
			}

			if (orgCondition == null) {
					orgCondition = "(S.fSharedPsnFID  = '" + orgFullID
							+ "') ";
			} else {
					orgCondition = orgCondition
							+ " or (S.fSharedPsnFID  = '" + orgFullID
							+ "') ";
			}
		}
			
			
		sql = "SELECT S.fMasterID FROM OA_AB_AddressBookShare S WHERE S.fSharedPsnFID = '%s' or (%s)";
			sql=String.format(sql,fCurrentPsnFid,orgCondition);
			
		Table table = KSQL.select(sql, null, "/OA/addressBook/data", null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs = rows.next();
			result = result + "," + rs.getString("fMasterID");

		}
		if (result.length() > 1) {
			result = "'" + result.substring(1).replace(",", "','") + "'";
		}

		return result;
	}
}
