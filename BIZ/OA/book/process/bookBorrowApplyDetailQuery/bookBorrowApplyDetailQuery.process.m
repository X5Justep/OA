<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="bookBorrowApplyDetailQueryProcess">
		<label language="zh_CN">图书借阅申请详细查询</label>
		<static-activity name="mainActivity"/>
		<has-action action="queryVBookApplyStatusAction" />
		<has-action action="queryBKBookApplyMAction" />
		<has-action action="queryBKBookApplyDAction" />
	</process>
</model>
