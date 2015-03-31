
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;

public class PersonState {
	private enum Week {
		monday, tuesday, wednesday, thursday, friday, saturday, Sunday
	};

	/**
	 * evec,leave,schedule 出差，请假，日程
	 */
	private enum State {
		evec, leave, schedule
	}

	private static final Map HashMap = null;;

	private String personName;

	private Map<Week, Map<State, String>> personWeekState = new HashMap<Week, Map<State, String>>();

	public String getPersonName() {
		return personName;
	}

	public void setPersonName(String personName) {
		this.personName = personName;
	}

	public Map<Week, Map<State, String>> getPersonWeekState() {
		return personWeekState;
	}

	public void setPersonWeekState(Map<Week, Map<State, String>> personWeekState) {
		this.personWeekState = personWeekState;
	}

	@Override
	public String toString() {
		for (Week w : Week.values()) {
			Map<State, String> stateMap = this.getPersonWeekState().get(w);

		}
		return super.toString();
	}

	@SuppressWarnings("unchecked")
	public static void main(String[] args) {
		Map<StaffState.Week, Map<StaffState.State, String>> qq ;
		qq= new HashMap<StaffState.Week, Map<StaffState.State, String>>();
		StaffStateUtil ssu = StaffStateUtil.getStaffStateUtil();
		ssu.addItem("a0", "aaa", "aaaa", qq, "a0");
		ssu.addItem("a1", "aaa", "aaaa", qq, "a1");
		ssu.addItem("a2", "aaa", "aaaa", qq, "a2");
	
		Map map1;
		Map<StaffState.State, String> map2;
		map1 = ssu.getDataMap("a0");
		map2 =(Map<StaffState.State, String>) map1.get(Week.friday);
		if(map2==null){
			map2=new HashMap<StaffState.State, String>();
			map2.put(StaffState.State.evec, "~~~");
		}else{
			map2.put(StaffState.State.evec, "~~~");
		}
		map1.put(Week.friday,map2);
		String personName = "";
		String tSequence = "";
		String tOrgName = "";

		ArrayList testAL;
		ArrayList ar = ssu.getIndexList();
		
		for (int j = 0; j < ssu.getIndexList().size(); j++) {
			personName = (String) ((ArrayList) ar.get(j)).get(0);
			tSequence = (String) ((ArrayList) ar.get(j)).get(2);
			tOrgName = (String) ((ArrayList) ar.get(j)).get(1);
			qq = (Map<StaffState.Week, Map<StaffState.State, String>>) ((ArrayList) ar
					.get(j)).get(3);
			System.out.println("test+" + j + "---" + personName);
			System.out.println("test+" + j + "---" + tSequence);
			System.out.println("test+" + j + "---" + tOrgName);

			Map<StaffState.State, String> map3;
			for (Week e : Week.values()) {
				map3 = qq.get(e);
				if (map3 != null) {
					for (StaffState.State s : StaffState.State.values()) {
						System.out.println(j + "--" + e.toString() + "--"
								+ s.toString() + "--" + map3.get(s));
					}
				}
			}
		}
		qq=(Map<StaffState.Week, Map<StaffState.State, String>>) ssu.getDataMap("a0");
	}

}
