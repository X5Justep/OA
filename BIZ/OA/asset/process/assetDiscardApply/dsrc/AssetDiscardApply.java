import com.justep.system.process.ProcessUtils;
import com.justep.system.data.KSQL;

public class AssetDiscardApply {
	public static void assetDiscardApplyProcessAfterFinish(){
		String bizID = ProcessUtils.getProcessData1();
		String sql = "update OA_AS_Card c set c.fStatus=2,c.fStatusName='报废' where c=(select d.fAssetID from OA_AS_DiscardApply d where d='"
					+ bizID + "')";
		KSQL.executeUpdate(sql, null, "/OA/asset/data", null);
	}
}
