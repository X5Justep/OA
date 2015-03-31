import java.util.Iterator;
import com.justep.system.process.ProcessUtils;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;

public class AssetUseApply {
	public static final String OADataModel ="/OA/asset/data";

	public static void assetUseApplyProcessAfterFinish() {
		String sql = null;

		String bizID = ProcessUtils.getProcessData1();
		sql = "select a.fAssetID,a.fArrangeDate from OA_AS_UseArrange a where a.fMasterID='" + bizID + "'";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs = rows.next();
			String fAssetID = rs.getString("fAssetID");
			if ((fAssetID != null) || (fAssetID!="")) {
				sql = "update OA_AS_UseRecord u set u.fEndDate=(select uu.fArrangeDate from OA_AS_UseArrange uu where uu.fMasterID='" + bizID
						+ "') where u.fAssetID='" + fAssetID + "' and u.fEndDate is null";
				KSQL.executeUpdate(sql, null, OADataModel, null);

				sql = "insert into OA_AS_UseRecord u" + "(u,u.fAssetID,u.fKindID,u.fKind,u.fCode,u.fName,u.fSpecType,"
						+ "u.fDutyOgnID,u.fDutyOgnName," + "u.fDutyDeptID,u.fDutyDeptName," + "u.fDutyPosID,u.fDutyPosName,"
						+ "u.fDutyPsnID,u.fDutyPsnName,u.fDutyPsnFID,u.fDutyPsnFName," + "u.fBeginDate,u.fRemark,u.version) "
						+ "(select guid(),d.fAssetID,d.fKindID,d.fKind,d.fCode,d.fName,d.fSpecType," + "m.fApplyOgnID,m.fApplyOgnName,"
						+ "m.fApplyDeptID,m.fApplyDeptName," + "m.fApplyPosID,m.fApplyPosName,"
						+ "m.fApplyPsnID,m.fApplyPsnName,m.fApplyPsnFID,m.fApplyPsnFName," + "d.fArrangeDate,m.fRemark,0 "
						+ "from OA_AS_UseApplyM m join OA_AS_UseArrange d on m='" + bizID
						+ "' and m = d.fMasterID and d.fAssetID is not null)";
				KSQL.executeUpdate(sql, null, OADataModel, null);

				sql = "select m.fApplyOgnID,m.fApplyOgnName,m.fApplyDeptID,m.fApplyDeptName,m.fApplyPosID,m.fApplyPosName,m.fApplyPsnID,m.fApplyPsnName,m.fApplyPsnFID,m.fApplyPsnFName from OA_AS_UseApplyM m where m = '"
						+ bizID + "'";
				Table tab = KSQL.select(sql, null, OADataModel, null);
				Iterator<Row> tabs = tab.iterator();
				while (tabs.hasNext()) {
					Row rs1 = tabs.next();
					sql = "update OA_AS_Card c set c.fStatus=1,c.fStatusName='占用',c.fDutyOgnID = '" + rs1.getString("fApplyOgnID")
							+ "',c.fDutyOgnName = '" + rs1.getString("fApplyOgnName") + "',c.fDutyDeptID = '" + rs1.getString("fApplyDeptID")
							+ "',c.fDutyDeptName = '" + rs1.getString("fApplyDeptName") + "',c.fDutyPosID = '" + rs1.getString("fApplyPosID")
							+ "',c.fDutyPosName = '" + rs1.getString("fApplyPosName") + "',c.fDutyPsnID= '" + rs1.getString("fApplyPsnID")
							+ "',c.fDutyPsnName= '" + rs1.getString("fApplyPsnName") + "',c.fDutyPsnFID= '" + rs1.getString("fApplyPsnFID")
							+ "',c.fDutyPsnFName = '" + rs1.getString("fApplyPsnFName") + "' where c='" + fAssetID + "'";
					KSQL.executeUpdate(sql, null, OADataModel, null);
				}
			}
		}
	}
}
