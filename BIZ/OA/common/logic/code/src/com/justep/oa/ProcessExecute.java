package com.justep.oa;



import java.util.ArrayList;
import java.util.List;
import com.justep.system.data.KSQL;

import com.justep.model.Model;
import com.justep.model.ModelUtils;
import com.justep.system.process.ActivityInstance;
import com.justep.system.process.ProcessInstance;
import com.justep.system.process.ProcessUtils;
import com.justep.system.process.TaskStatus;

import com.justep.system.context.ContextHelper;

/**
 * 流程处理配置文件 processExecuteConfig.xml
<?xml version="1.0" encoding="UTF-8"?>
<root> 
 	<enabled>true</enabled>
 	<data-model></data-model>
 	<biz-concept></biz-concept>
 	<execute-concept></execute-concept>
	
	<execute-dialog>
		 <verdict-displayed>none</verdict-displayed>
		 <opinion-required>none</opinion-required>
		
		 <advance-enabled>all</advance-enabled>
		 <back-enabled>all</back-enabled>
		 <transfer-enabled>all</transfer-enabled>
		 <abort-enabled>all</abort-enabled>
		 
		 <suspend-enabled>none</suspend-enabled>
		<customized-enabled>none</customized-enabled>
		<processChart-enabled>none</processChart-enabled>
		<executeList-enabled>none</executeList-enabled>
	</execute-dialog>
	<execute-list>
		<displayed-activities></displayed-activities>
	</execute-list>
 </root>

 * enabled 流程处理是否生效 (defaultValue=false)
 * data-model 数据模块的路径
 * biz-concept 业务主表概念 
 * 		(必须包含以下relation: 
 * 			fBizState(STRING 36), 
 * 			fBizStateName(STRING 64), 
 * 			fCurrentActivities(STRING 128), 
 * 			fCurrentExecutors(STRING 128)
 * 		)
 * execute-concept 处理表概念 (参照下面的范例)
 * 
 * execute-dialog/verdict-displayed 是否显示结论 (环节配置项defaultValue=false)
 * execute-dialog/opinion-required 是否必须填写意见 (环节配置项defaultValue=false)
 * 
 * execute-dialog/advance-enabled 是否能流转 (环节配置项defaultValue=true)
 * execute-dialog/back-enabled 是否能回退 (环节配置项defaultValue=true)
 * execute-dialog/transfer-enabled 是否能转发 (环节配置项defaultValue=true)
 * execute-dialog/abort-enabled 是否能终止 (环节配置项defaultValue=true)
 * 
 * execute-list/displayed-activities 处理列表显示哪些环节 
 * 
 * 配置项的说明见ConfigUtils
 */

public class ProcessExecute {

	public static final String PROCESS_EXECUTE_CONFIG_FILE = "processExecuteConfig.xml";

	public static final String BIZ_STATE_EDITING = "bsEditing";
	public static final String BIZ_STATE_EXECUTING = "bsExecuting";
	public static final String BIZ_STATE_FINISHED = "bsFinished";
	public static final String BIZ_STATE_ABORTED = "bsAborted";
	public static final String BIZ_STATE_SUSPEND = "bsSuspend";

	public static String getBizStateLabel(String bizState) {
		if (bizState.equalsIgnoreCase(BIZ_STATE_EDITING))
			return "编辑中";
		else if (bizState.equalsIgnoreCase(BIZ_STATE_EXECUTING))
			return "处理中";
		else if (bizState.equalsIgnoreCase(BIZ_STATE_FINISHED))
			return "已完成";
		else if (bizState.equalsIgnoreCase(BIZ_STATE_ABORTED))
			return "已终止";
		else if (bizState.equalsIgnoreCase(BIZ_STATE_SUSPEND))
			return "已暂停";
		throw new RuntimeException("无效的业务状态");
	}


	private static String getBizID() {
		return ProcessUtils.getProcessData1();
	}



	/**
	 * 修改流程业务状态，同时记录流程当前的环节和执行者
	 * 
	 * @param dataModel
	 * @param mainConcept
	 * @param bizState
	 */
	private static void updateBizState(String dataModel, String mainConcept,
			String bizState) {
		List<ActivityInstance> aiList = getActiveActivities();
		String activities = getActivitesLabel(aiList);
		String executors = getExecutorsName(aiList);
		String ksqlUpdateBizState = String.format("UPDATE %s a "
				+ "	SET a.fBizState = '%s', a.fBizStateName = '%s', "
				+ "		a.fCurrentActivities = '%s', a.fCurrentExecutors = '%s' "
				+ "	WHERE a = '%s' ", mainConcept, bizState,
				getBizStateLabel(bizState), activities, executors, getBizID());
		KSQL.executeUpdate(ksqlUpdateBizState, null, dataModel, null);
	}

	/**
	 * 通用流程规则事件
	 */
	public static void doAfterProcessAction() {
		
		
		Model model = ContextHelper.getActionContext().getProcess().getModel();
	
		String dataModel = model.getUseableConfig("oa.dataModel").getValue();
		
		String mainConcept = model.getUseableConfig("oa.mainConcept").getValue();
		if(dataModel == null || mainConcept == null || dataModel.equals("") || mainConcept.equals(""))
			return;

		String action = ModelUtils.getRequestContext().getActionContext().getAction().getName();
		_doAfterProcessAction(dataModel, mainConcept, action);
	}

	private static void _doAfterProcessAction(String dataModel,
			String mainConcept, String action) {
	
		if (action.equals("startProcessAction"))
			doAfterStartProcess(dataModel, mainConcept);
		else if (action.equals("advanceProcessAction"))
			doAfterAdvanceProcess(dataModel, mainConcept);
		else if (action.equals("backProcessAction"))
			doAfterBackProcess(dataModel, mainConcept);
		else if (action.equals("transferTaskAction"))
			doAfterTransferTask(dataModel, mainConcept);
		else if (action.equals("abortProcessAction"))
			doAfterAbortProcess(dataModel, mainConcept);
		else if (action.equals("suspendProcessAction"))
			doAfterSuspendProcess(dataModel, mainConcept);
		else if (action.equals("resumeProcessAction"))
			doAfterResumeProcess(dataModel, mainConcept);
		else if (action.equals("withdrawTaskAction"))
			doAfterWithdrawTask(dataModel);
	}

	/**
	 * 开始后
	 * 
	 * @param dataModel
	 * @param mainConcept
	 */
	private static void doAfterStartProcess(String dataModel, String mainConcept) {
		
	}

	/**
	 * 流转后
	 * 
	 * @param dataModel
	 * @param mainConcept
	 * @param executeConcept
	 */
	private static void doAfterAdvanceProcess(String dataModel,
			String mainConcept) {
		if (ProcessUtils.isProcessFinished())
			updateBizState(dataModel, mainConcept, BIZ_STATE_FINISHED);
		else
			updateBizState(dataModel, mainConcept, BIZ_STATE_EXECUTING);

	}

	/**
	 * 回退后
	 * 
	 * @param dataModel
	 * @param mainConcept
	 * @param executeConcept
	 */
	private static void doAfterBackProcess(String dataModel, String mainConcept) {
		updateBizState(dataModel, mainConcept, BIZ_STATE_EXECUTING);
	}

	/**
	 * 转发后
	 * 
	 * @param dataModel
	 * @param mainConcept
	 * @param executeConcept
	 */
	private static void doAfterTransferTask(String dataModel,
			String mainConcept) {
		updateBizState(dataModel, mainConcept, BIZ_STATE_EXECUTING);
	}

	/**
	 * 终止后
	 * 
	 * @param dataModel
	 * @param mainConcept
	 * @param executeConcept
	 */
	private static void doAfterAbortProcess(String dataModel,
			String mainConcept) {
		updateBizState(dataModel, mainConcept, BIZ_STATE_ABORTED);
	}

	/**
	 * 暂停后
	 * 
	 * @param dataModel
	 * @param mainConcept
	 * @param executeConcept
	 */
	private static void doAfterSuspendProcess(String dataModel,
			String mainConcept) {
		updateBizState(dataModel, mainConcept, BIZ_STATE_SUSPEND);
	}

	/**
	 * 唤醒后
	 * 
	 * @param dataModel
	 * @param mainConcept
	 * @param executeConcept
	 */
	private static void doAfterResumeProcess(String dataModel,
			String mainConcept) {
		updateBizState(dataModel, mainConcept, BIZ_STATE_EXECUTING);
	}

	/**
	 * 回收后
	 * @param dataModel
	 * @param executeConcept
	 */
	private static void doAfterWithdrawTask(String dataModel) {

	}

	/**
	 * 获得当前流程所有活动或者暂停的环节实例列表
	 * 
	 * @return
	 */
	private static List<ActivityInstance> getActiveActivities() {
		List<ActivityInstance> activeAIList = new ArrayList<ActivityInstance>();

		ProcessInstance pi = ProcessUtils.getPI();
		List<ActivityInstance> aiList = pi.getActiveAIs();
		for (ActivityInstance ai : aiList) {
			String taskStatus = ai.getTask().getStatus();
			if (taskStatus.equalsIgnoreCase(TaskStatus.WAITED)
					|| taskStatus.equalsIgnoreCase(TaskStatus.READY)
					|| taskStatus.equalsIgnoreCase(TaskStatus.EXECUTING)
					|| taskStatus.equalsIgnoreCase(TaskStatus.SLEEPING)
					|| taskStatus.equalsIgnoreCase(TaskStatus.SUSPEND)) {
				activeAIList.add(ai);
			}
		}
		return activeAIList;
	}

	/**
	 * 获得多个环节的名称
	 * 
	 * @param aiList
	 * @return
	 */
	private static String getActivitesLabel(List<ActivityInstance> aiList) {
		String label = " ";
		for (ActivityInstance ai : aiList) {
			String activityLabel = ai.getActivity().getLabel(
					SysUtils.getLanguage());
			if (label.indexOf(" " + activityLabel + " ") == -1) {
				label += activityLabel + " ";
			}
		}
		if (label.length() > 128)
			label = label.substring(0, 125) + "...";
		return label;
	}

	/**
	 * 获得多个环节的执行组织名称
	 * 
	 * @param aiList
	 * @return
	 */
	private static String getExecutorsName(List<ActivityInstance> aiList) {
		String label = " ";
		for (ActivityInstance ai : aiList) {
			String name = ai.getTask().getExecutorNames();
			if (label.indexOf(" " + name + " ") == -1) {
				label += name + " ";
			}
		}
		if (label.length() > 128)
			label = label.substring(0, 125) + "...";
		return label;
	}
}