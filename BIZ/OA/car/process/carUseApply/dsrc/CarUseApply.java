import java.util.Iterator;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.process.ProcessUtils;

public class CarUseApply {
	public static final String OADataModel ="/OA/car/data";
	public static void carUseApplyProcessAfterFinish() throws Exception {

		String bizID = ProcessUtils.getProcessData1();
		String sql = null;
		String sqlCarApply = "select b.fCarID AS fCarID, a.fBeginTime AS fBeginTime, a.fEndTime AS fEndTime from OA_CA_CarUseApply a join OA_CA_CarManageArrange b on a= b.fMasterID and a ='"+bizID+"'";

		String isUsed = "false";

		Table table = KSQL.select(sqlCarApply, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			Row rs = rows.next();{
			isUsed = checkCarUsed(rs.getString("fCarID"), rs.getDateTime("fBeginTime").toString(), rs
								.getDateTime("fEndTime").toString(), "");
		}

		if ("true".equals(isUsed)) {
					throw new Exception("");
		} else {
			String guid = java.util.UUID.randomUUID().toString()
							.replace("-", "").toUpperCase();

			sql = "Insert into OA_CA_CarManage c(c,c.fNO,c.fApplyOgnID,c.fApplyOgnName,c.fApplyDeptID,c.fApplyDeptName,c.fApplyPosID,c.fApplyPosName,c.fApplyPsnID,c.fApplyPsnName,c.fApplyPsnFID,c.fApplyPsnFName,c.fApplyDate,c.fPersonCount,c.fDestination,c.fTelephone,c.fBeginTime,c.fEndTime,c.fIsRoundtrip,c.fApplyReason,c.fDriveCircuit,c.fRemark,c.fCreateOgnID,c.fCreateOgnName,c.fCreateDeptID,c.fCreateDeptName,c.fCreatePosID,c.fCreatePosName,c.fCreatePsnID,c.fCreatePsnName,c.fCreatePsnFID,c.fCreatePsnFName,c.fCreateTime,c.fUpdatePsnID,c.fUpdatePsnName,c.fUpdateTime,c.fIsFlow,c.version)"
							+ " (select '"+ guid+"',a.fNO,a.fApplyOgnID,a.fApplyOgnName,a.fApplyDeptID,a.fApplyDeptName,a.fApplyPosID,a.fApplyPosName,a.fApplyPsnID,a.fApplyPsnName,a.fApplyPsnFID,a.fApplyPsnFName,a.fApplyDate,a.fPersonCount,a.fDestination,a.fTelephone,a.fBeginTime,a.fEndTime,a.fIsRoundtrip,a.fApplyReason,a.fDriveCircuit,a.fRemark,a.fCreateOgnID,a.fCreateOgnName,a.fCreateDeptID,a.fCreateDeptName,a.fCreatePosID,a.fCreatePosName,a.fCreatePsnID,a.fCreatePsnName,a.fCreatePsnFID,a.fCreatePsnFName,a.fCreateTime,a.fUpdatePsnID,a.fUpdatePsnName,a.fUpdateTime,1,0 FROM OA_CA_CarUseApply a WHERE a = '"
							+ bizID + "')";
			KSQL.executeUpdate(sql, null, OADataModel, null);
			
			sql = "Insert into OA_CA_CarManageArrange c(c,fMasterID,c.fCarDriverID,c.fCarDriverName,c.fCarID,c.fCode,c.fName,c.fCarKindID,c.fCarKindName,c.fTelephone,c.fArgnPsnID,c.fArgnPsnName,c.fEffect,c.version)"
							+ " select guid(),'"
							+ guid
							+ "',a.fCarDriverID,a.fCarDriverName,a.fCarID,a.fCode,a.fName,a.fCarKindID,a.fCarKindName,a.fTelephone,a.fArgnPsnID,a.fArgnPsnName,1,0 FROM OA_CA_CarUseArrange a WHERE a.fMasterID = '"
							+ bizID + "'";
			KSQL.executeUpdate(sql, null, OADataModel, null);
		}
		}
	}

	/**
	 * 检查车辆是否被占用
	 * 
	 * @param fCarID
	 *            : 车牌号 fBeginTime ：开始时间 fEndTime ：结束时间 fArrangeID : 用车安排ID
	 * @throws Exception
	 */
	public static String checkCarUsed(String fCarID, String fBeginTime,
			String fEndTime, String fArrangeID) throws Exception {
		String sql = "";

		fBeginTime = fBeginTime.replace("T", " ");
		fEndTime = fEndTime.replace("T", " ");
		fBeginTime = fBeginTime.substring(0, 19);
		fEndTime = fEndTime.substring(0, 19);
		sql = "select 1 from OA_CA_CarManageArrange a where a.fMasterID in(select m from OA_CA_CarManage m where  m.fEndTime > stringToDateTime('"
							+ fBeginTime+ "') and m.fBeginTime < stringToDateTime('" + fEndTime + "')) "
							+ " and a.fCarID = '" + fCarID + "' and a.fEffect = 1";

		if (fArrangeID != null && (!"".equals(fArrangeID))) {
			sql += " and (a !='" + fArrangeID + "')";
		}
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			return "true";
		}else{
			return "false";
		}
	}
}
