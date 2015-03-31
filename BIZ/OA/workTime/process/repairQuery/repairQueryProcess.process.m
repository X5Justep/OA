<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="repairQueryProcess">
		<label language="zh_CN">补签申请查询</label>
		<static-activity name="mainActivity"/>
	


<has-action action="queryOA_WM_repairApplyAction" access-permission="public"></has-action>
<has-action action="getBizConfigAction" access-permission="public"></has-action>
<has-action action="queryOA_repair_EXECUTEAction" access-permission="public"></has-action>
</process>
</model>
