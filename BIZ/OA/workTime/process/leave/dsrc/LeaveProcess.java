import java.util.Iterator;
import com.justep.system.process.*;
import com.justep.system.data.*;

public class LeaveProcess {
	private static final String OADataModel = "/OA/workTime/data";

	private static String getBizID() {
		return ProcessUtils.getProcessData1();
	}

	public static void leaveProcessAfterFinish() throws Exception {
		String sql = "";
		int fFactDays = 0;// 申请天数
		float fFactHours = 0;// 申请小时
		String fApplyDate = "";// 申请日期
		String fApplyPersonID = "";// 申请人id
		int year = 0;// 年度
		int fLeavingsDay = 0;// 剩余天数
		float fLeavingsHour = 0;// 剩余小时
		float LeavingSumHour = 0;// 剩余总时长(小时)
		float FactSumHour = 0;// 申请总时长(小时)
		int fAlreadyDay = 0;
		float fAlreadyHour = 0;
		float AlreadySumHour = 0;
		float sum = 0;// 计算后剩余时长(小时)
		float sum2 = 0;// 已休总时长(小时)

		sql = "select l.fFactDays,l.fFactHours,l.fApplyDate,l.fApplyPersonID from OA_WM_LeaveApply l where l='"
					+ getBizID() + "'";

		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs = rows.next();
				// 取得申请信息
			fFactDays = rs.getInt("fFactDays");// 天数
			fFactHours = rs.getFloat("fFactHours");// 小时
			fApplyDate = rs.getDate("fApplyDate").toString();// 日期
			fApplyPersonID = rs.getString("fApplyPersonID");// 人员id
			year = Integer.parseInt(fApplyDate.substring(0, 4));// 截取年度


			sql = "select v.fLeavingsDay,v.fLeavingsHour,v.fAlreadyDay,v.fAlreadyHour from OA_WM_Vacation v where v.fPersonID='"
						+ fApplyPersonID + "' and v.fYear=" + year;

			Table tab = KSQL.select(sql, null, OADataModel, null);
			Iterator<Row> tabs = tab.iterator();
			while (tabs.hasNext()) {
				Row rs1 = tabs.next();
					// 取得该人员的年假信息
				fLeavingsDay = rs1.getInt("fLeavingsDay");// 天数
				fLeavingsHour = rs1.getFloat("fLeavingsHour");// 小时

				fAlreadyDay = rs1.getInt("fAlreadyDay");// 天数
				fAlreadyHour = rs1.getFloat("fAlreadyHour");// 小时

				LeavingSumHour = fLeavingsDay * 8 + fLeavingsHour;// 剩余时长（小时）
				AlreadySumHour = fAlreadyDay * 8 + fAlreadyHour;// 已修时长（小时）

				FactSumHour = fFactDays * 8 + fFactHours;// 申请总时长（小时）
				sum2 = AlreadySumHour + FactSumHour;
				sum = LeavingSumHour - FactSumHour;// 计算差
				if (sum >= 0) {
					sql = "update OA_WM_Vacation v set v.fLeavingsDay="
								+ Math.floor(sum / 8) + ", v.fLeavingsHour="
								+ sum % 8 + ",v.fAlreadyDay="
								+ Math.floor(sum2 / 8) + ",v.fAlreadyHour="
								+ sum2 % 8 + " where v.fPersonID='"
								+ fApplyPersonID + "' and v.fYear=" + year;
					KSQL.executeUpdate(sql, null, OADataModel, null);

				}
			}
		}

	
	}

}