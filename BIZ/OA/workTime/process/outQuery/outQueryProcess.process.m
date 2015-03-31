<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="outQueryProcess">
		<label language="zh_CN">外出申请查询</label>
		<static-activity name="mainActivity"/>
	<has-action action="queryOA_WM_outApplyAction" access-permission="public"></has-action>
<has-action action="queryOA_out_EXECUTEAction" access-permission="public"></has-action>
<has-action action="getBizConfigAction" access-permission="public"></has-action>
</process>
</model>
