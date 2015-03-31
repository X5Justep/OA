import java.sql.Connection;
import java.sql.Statement;
import com.justep.model.ModelUtils;
import com.justep.system.process.ProcessControl;
import com.justep.system.process.ProcessUtils;
import com.justep.system.context.ContextHelper;

public class LicenseApply {
	private static void updateLicenseState(String fUseStatus,
			String fUseStatusName) throws Exception {
		String sqlUpdateLicenseState = "update OA_LS_LicenseManage set fUseStatus = '%s',fUseStatusName = '%s' "
				+ "where fid in "
				+ "(select d.flicenseid from OA_LS_LicenseApplyM m, OA_LS_LicenseApplyD d "
				+ "where d.fapplyid = m.fid and m.fid='%s') ";
		sqlUpdateLicenseState = String.format(sqlUpdateLicenseState,
				fUseStatus, fUseStatusName, ProcessUtils.getProcessData1());
		String sqlUpdateLicenseApplyDState = "update OA_LS_LicenseApplyD set fUseStatus = '%s', fUseStatusName = '%s' "
				+ "where fapplyid = '%s' ";
		sqlUpdateLicenseApplyDState = String.format(
				sqlUpdateLicenseApplyDState, fUseStatus, fUseStatusName,
				ProcessUtils.getProcessData1());
		Connection conn = ModelUtils.getConnection("/OA");
		ContextHelper.getTransaction().begin(conn);
		try {
			Statement stat = conn.createStatement();
			try {
				stat.execute(sqlUpdateLicenseState);
				stat.execute(sqlUpdateLicenseApplyDState);
			} finally {
				stat.close();
				stat = null;
			}
		} finally {
			conn.close();
			conn = null;
		}
	}

	public static void lendApplyActivityAfterAdvance() throws Exception {
		updateLicenseState("Unused", "闲置");
	}

	public static void lendRegisterActivityAfterAdvance() throws Exception {
		updateLicenseState("Lended", "借出");
	}

	public static void deptAuditActivityBeforeAdvance() throws Exception {
		ProcessControl processControl = (ProcessControl) ModelUtils
				.getRequestContext().getActionContext().getParameter("control");
		processControl.setSaveHistory(false);
	}
}
