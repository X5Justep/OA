<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="sendEmailProcess">
		<label language="zh_CN">发件箱</label>
		<static-activity name="mainActivity"/>
	


<has-action action="queryOA_EM_SendEmailAction" access-permission="public"></has-action>
<has-action action="saveOA_EM_SendEmailAction" access-permission="public"></has-action>
<has-action action="createOA_EM_SendEmailAction" access-permission="public"></has-action>
<has-action action="queryOA_EM_ReceiveEmailAction" access-permission="public"></has-action>
<has-action action="saveOA_EM_ReceiveEmailAction" access-permission="public"></has-action>
<has-action action="createOA_EM_ReceiveEmailAction" access-permission="public"></has-action>
</process>
</model>
