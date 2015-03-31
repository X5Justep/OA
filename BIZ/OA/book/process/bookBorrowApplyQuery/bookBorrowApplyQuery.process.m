<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="bookBorrowApplyQueryProcess">
		<label language="zh_CN">图书借阅申请查询</label>
		<static-activity name="bookBorrowApplyQueryActivity"/>
		
		
	<has-action action="queryBKBookApplyMAction" access-permission="public"></has-action>
<has-action action="queryBKBookApplyDAction" access-permission="public"></has-action>
<has-action action="queryTaskAction" access-permission="public"></has-action>
</process>
</model>
