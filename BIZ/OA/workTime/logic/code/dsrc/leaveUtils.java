import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.justep.model.ModelUtils;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.util.CommonUtils;

public class leaveUtils {
	public static void leaveSureFinish(String bizID) throws Exception {
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

		sql = "select a.fFactDays,a.fFactHours,a.fApplyDate,a.fApplyPersonID from OA_WM_LeaveApply a where a='" + bizID + "'";
		Table result = KSQL.select(sql, null, "/OA/workTime/data", null);
		Iterator<Row> rows = result.iterator();
		while (rows.hasNext()) {
				// 取得申请信息
			Row rs = rows.next();
				fFactDays = rs.getInt("fFactDays");// 天数
				fFactHours = rs.getFloat("fFactHours");// 小时
				fApplyDate = rs.getDate("fApplyDate").toString();// 日期
				System.out.println("fApplyDate="+fApplyDate);
				fApplyPersonID = rs.getString("fApplyPersonID");// 人员id
				year = Integer.parseInt(fApplyDate.substring(0, 4));// 截取年度
				System.out.println("year="+year);

				sql = "select v.fLeavingsDay,v.fLeavingsHour,v.fAlreadyDay,v.fAlreadyHour  from OA_WM_Vacation v  where v.fPersonID='"
						+ fApplyPersonID + "' and v.fYear=" + year;
				// 查询该人员的年假信息
				Table table = KSQL.select(sql, null, "/OA/workTime/data", null);
				Iterator<Row> its = table.iterator();

				while (its.hasNext()) {
					// 取得该人员的年假信息
					Row rs1 = its.next();
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
						KSQL.executeUpdate(sql, null, "/OA/workTime/data", null);
					}
				}
				String deptName =  "";
				if(ContextHelper.getPersonMember().getDept()==null){
					deptName = ContextHelper.getPersonMember().getOgn().getName();
				}else{
					deptName = ContextHelper.getPersonMember().getDept().getName();
				}

				String usql = "update OA_WM_LeaveApply l set l.fIsReducHoliday=1,l.fCancelHolsDeptName='"+deptName+"',l.fCancelHolsPersonName='"+ContextHelper.getPersonMember().getPerson().getName()+"',l.fCancelHolsDate=:dateTime where l='"+bizID+"'";
				
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("dateTime", CommonUtils.getCurrentDateTime());
				KSQL.executeUpdate(usql, param, "/OA/workTime/data", null);
			}
	} 
}