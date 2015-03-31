import com.justep.system.process.ProcessUtils;
import com.justep.system.data.KSQL;

public class AssetDealApply {
	public static void assetDealApplyProcessAfterFinish(){
		String bizID = ProcessUtils.getProcessData1();
		String sql = "update OA_AS_Card c set c.fStatus=3,c.fStatusName='处理' where c=(select d.fAssetID from OA_AS_DealApply d where d='"
					+ bizID + "')";
		KSQL.executeUpdate(sql, null, "/OA/asset/data", null);
	}
}
