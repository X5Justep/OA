import java.lang.String;
import java.util.*;

public class StaffStateUtil {

	private ArrayList indexList;

	private StaffStateUtil() {
		this.indexList = new ArrayList();
	}

	public static StaffStateUtil getStaffStateUtil() {
		StaffStateUtil sul = new StaffStateUtil();
		return sul;
	}
	/*新增data,如果人员ID一样则替换，否则新增
	 * */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void addItem(String personName, String ManOrgFName, String Sequence,
			Map<StaffState.Week, Map<StaffState.State, String>> signelStateMap,
			String personID) {
		// 0人员名称，1组织机构名称，2序列号码,3map对象，4 personID 为主键

		ArrayList temp;
		ArrayList dataList = new ArrayList();
		dataList.add(0, personName);
		dataList.add(1, ManOrgFName);
		dataList.add(2, Sequence);
		dataList.add(3, signelStateMap);
		dataList.add(4, personID);
		String tempPersonID;
		boolean flag = false;
		for (int i = 0; i < indexList.size(); i++) {
			temp = (ArrayList) indexList.get(i);
			tempPersonID = (String) temp.get(4);
			if (tempPersonID == personID) {
				indexList.set(i, dataList);
				flag = true;
				break;
			}
		}
		if (!flag) {
			indexList.add(dataList);
		}
	}
	/*
	 *  根据人员id获得Map对象
	 */
	public Map<StaffState.Week, Map<StaffState.State, String>> getDataMap(
			String personID) {
		ArrayList temp;
		String tempPersonID;
		Map<StaffState.Week, Map<StaffState.State, String>> t = new HashMap();
		for (int i = 0; i < indexList.size(); i++) {
			temp = (ArrayList) indexList.get(i);

			tempPersonID = (String) temp.get(4);
		if (tempPersonID.equals(personID)) {
				t = (Map<StaffState.Week, Map<StaffState.State, String>>) temp
						.get(3);
				break;
			}

		}
		return t;
	}
	/*
	 * 得到存储数据
	 */
	public ArrayList getIndexList() {
		return this.indexList;
	}
	/*
	 * 根据personid更新map
	 */

}