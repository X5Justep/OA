<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="bookReturnProcess">
		<label language="zh_CN">图书借阅归还</label>
		<static-activity name="mainActivity"/>
		<has-action action="queryBKBookInfoAction" />
		<has-action action="updateBookInfoLoanStatusAction" />
	</process>
</model>
