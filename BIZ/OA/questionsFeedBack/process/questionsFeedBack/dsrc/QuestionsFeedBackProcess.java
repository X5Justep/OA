import java.sql.Date;
import java.text.SimpleDateFormat;

import org.apache.commons.lang.SystemUtils;
import com.justep.system.util.*;
import com.justep.system.process.*;
import com.justep.system.context.*;
import com.justep.system.opm.*;
import com.justep.system.data.*;
import com.justep.system.action.*;
import com.justep.model.*;
import com.justep.oa.SysUtils;
import com.justep.system.process.ProcessUtils;

public class QuestionsFeedBackProcess {
	
	public static void approveActivityBeforeAdvance() {
		updateAuditBy(1);
	}

	public static void approveActivityBeforeBack() {
		updateAuditBy(0);
	}	
	
	public static void approveActivityAfterAdvance() {
		
	}
	
	public static void ensureActivityAfterBack() {
		updateActualCompleteTimeAndDealState(0);
	}
	
	public static void questionsFeedBackProcessBeforeFinish() {
		updateActualCompleteTimeAndDealState(1);
	}
	
	public static void questionsFeedBackProcessBeforeAbort() {
		whenProcessAbort();
	}
	
	public static void updateAuditBy(int status) {
		String auditPsnID = SysUtils.getCurrentPersonID();
		String auditPsnName = SysUtils.getCurrentPersonName();
		String questionID = ProcessUtils.getProcessData1();
		int isAuditBy = 0;
		if(status == 1)
			isAuditBy = 1;
		String ksql = String.format("update OA_QB_QuestionsFeedBack OA_QB_QuestionsFeedBack set OA_QB_QuestionsFeedBack.fIsAuditBy = '%s',OA_QB_QuestionsFeedBack.fAuditPsnID = '%s', OA_QB_QuestionsFeedBack.fAuditPsnName = '%s' where OA_QB_QuestionsFeedBack = '%s'", isAuditBy, auditPsnID, auditPsnName, questionID);
		KSQL.executeUpdate(ksql, null, "/OA/questionsFeedBack/data", null);
	}
		
	public static void updateActualCompleteTimeAndDealState(int finishState) {
		String questionID = ProcessUtils.getProcessData1();
		String ensurePsnID = SysUtils.getCurrentPersonID();
		String ensurePsnName = SysUtils.getCurrentPersonName();
		String ksql = null;
		if(finishState == 1){
			ksql = String.format("update OA_QB_QuestionsFeedBack OA_QB_QuestionsFeedBack set OA_QB_QuestionsFeedBack.fFinishStatus = 1,OA_QB_QuestionsFeedBack.fFinishStatusName = '已完成',OA_QB_QuestionsFeedBack.fEnsurePsnID = '%s',OA_QB_QuestionsFeedBack.fEnsurePsnName = '%s',OA_QB_QuestionsFeedBack.fEnsureTime = :currentDateTime(),OA_QB_QuestionsFeedBack.fActualTime = :currentDateTime() where OA_QB_QuestionsFeedBack = '%s'", ensurePsnID, ensurePsnName, questionID);
		}
		else if(finishState == 0){
			ksql = String.format("update OA_QB_QuestionsFeedBack OA_QB_QuestionsFeedBack set OA_QB_QuestionsFeedBack.fFinishStatus = 0,OA_QB_QuestionsFeedBack.fFinishStatusName = '未完成',OA_QB_QuestionsFeedBack.fEnsurePsnID = '%s',OA_QB_QuestionsFeedBack.fEnsurePsnName = '%s',OA_QB_QuestionsFeedBack.fActualTime = null where OA_QB_QuestionsFeedBack = '%s'", ensurePsnID, ensurePsnName, questionID);
		}
		KSQL.executeUpdate(ksql, null, "/OA/questionsFeedBack/data", null);
	}
	
	public static void whenProcessAbort() {
		String questionID = ProcessUtils.getProcessData1();
		String ksql = String.format("update OA_QB_QuestionsFeedBack OA_QB_QuestionsFeedBack set OA_QB_QuestionsFeedBack.fFinishStatus = 3,OA_QB_QuestionsFeedBack.fFinishStatusName = '已终止',OA_QB_QuestionsFeedBack.fActualTime = null where OA_QB_QuestionsFeedBack = '%s'", questionID);
		KSQL.executeUpdate(ksql, null, "/OA/questionsFeedBack/data", null);
	}

	
}