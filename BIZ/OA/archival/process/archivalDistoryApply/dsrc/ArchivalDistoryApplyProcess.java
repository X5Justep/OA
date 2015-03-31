import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.justep.model.ModelUtils;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.KSQL;
import com.justep.system.process.ProcessUtils;

public class ArchivalDistoryApplyProcess {
	public static void archivalDistoryApplyProcessAfterFinish(){
		String bizID = ProcessUtils.getProcessData1();
		String sql = "update OA_AM_Archival a set"
					+ " a.fState = case when a.fIsRoll = 1 then '14' else '04' end,"
					+ " a.fStateName = case when a.fIsRoll = 1 then '已撤销' else '已销毁' end,"
					+ " a.fInventory = 0 where a in"
					+ " (select dd.fArchivalID from OA_AM_DistoryApplyD dd where dd.fDistoryID = '"
					+ bizID + "')";

		KSQL.executeUpdate(sql, null, "/OA/archival/data", null);
	}
}
