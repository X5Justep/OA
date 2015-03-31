import java.util.Iterator;

import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;

public class Car {
	public static final String OADataModel ="/OA/car/data";
	/**
	 * �?查编号是否唯�?
	 * 
	 * @param id
	 *            ,code,fieldName,tableName
	 * @throws Exception
	 */
	public static boolean checkUniqueness(String id, String code,
			String fieldName, String tableName) {
		String sql = "select t from " + tableName + " t where t <> '" + id
					+ "' and t." + fieldName + " = '" + code + "'";
		Table table = KSQL.select(sql, null, OADataModel, null);

		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 删除表OA_CA_CarManage中数�?
	 * 
	 * @param id
	 * @throws Exception
	 */
	public static void deleteData(String id) {
		String sql = null;
		sql = "delete from OA_CA_CarManage c where c = '" + id + "'";
		KSQL.executeUpdate(sql, null, OADataModel, null);
		
		sql = "delete from OA_CA_CarManageArrange c where c.fMasterID = '" + id + "'";
		KSQL.executeUpdate(sql, null, OADataModel, null);

	}

	/**
	 * �?查车辆是否被占用
	 * 
	 * @param fCarID
	 *            : 车牌�? fBeginTime ：开始时�? fEndTime ：结束时�? fArrangeID : 用车安排ID
	 * @throws Exception
	 */

	public static String checkCarUsed(String fCarID, String fBeginTime,
			String fEndTime, String fArrangeID)  {
		if (fBeginTime.equals("") || fEndTime.equals("")) {
			return "false";
		}

		String sql = "";
		String result = "0";

		fBeginTime = fBeginTime.replace("T", " ");
		fEndTime = fEndTime.replace("T", " ");
		fBeginTime = fBeginTime.substring(0, 19);
		fEndTime = fEndTime.substring(0, 19);
		sql = "select count(a) as CT from OA_CA_CarManageArrange a where a.fMasterID in(select m from OA_CA_CarManage m where  m.fEndTime > stringToDateTime('"
			+ fBeginTime + "') and m.fBeginTime < stringToDateTime('" + fEndTime + "')) "
			+ " and a.fCarID = '" + fCarID + "' and a.fEffect = 1";

		if (fArrangeID != null && (!"".equals(fArrangeID))) {
			sql += " and (a <> '" + fArrangeID + "')";
		}
		Table table = KSQL.select(sql, null, "/OA/car/data", null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			Row row = rows.next();
			System.out.println("dddd="+row.getValue("CT"));
			result = row.getValue("CT").toString();
		}
		return result;
	}

	/**
	 * 修改制定ID的数�?
	 */
	public static void upDataFieldValue(String id, String fieldName,
			String fieldValue, String tableName) {

		String sql = "update " + tableName + " a set a." + fieldName + "='"
					+ fieldValue + "' where a ='" + id + "'";
		KSQL.executeUpdate(sql, null, "/OA/car/data", null);
	}

	/**
	 * 车辆管理安排
	 */
	public static String upDataArrange(String arrangeID)  {
		String sql = "";
		String sqlu = "";
		String result = "true";

		sql = "select ca.fCarID as fCarID,cm.fBeginTime as fBeginTime,cm.fEndTime as fEndTime from OA_CA_CarManage cm join OA_CA_CarManageArrange ca on ca.fMasterID=cm.fid where ca.fID='"
						+ arrangeID + "'";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			Row rs = rows.next();
			if (checkCarUsed(rs.getString("fCarID"),
						rs.getDateTime("fBeginTime").toString(), rs.getDateTime("fEndTime").toString(),
						arrangeID).equals("0")) {
				sqlu = "update OA_CA_CarManageArrange c set c.fEffect='1' where c='" + arrangeID + "'";
				KSQL.executeUpdate(sqlu, null, "/OA/car/data", null);
			} else {
				result = "false";
			}
		}

		return result;
	}
}