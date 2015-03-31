<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="docSummaryReportProcess">
		<static-activity name="mainActivity"/>
	<label language="zh_CN">公文统计报表</label>
	
      






<has-action action="sqlQueryAction" access-permission="public"><public name="dataModel" type="String" value="/OA/doc/data"></public>
</has-action>
<has-action action="queryOA_DC_DocAction" access-permission="public"></has-action>
<has-action action="docSummaryFWAction" access-permission="public"></has-action>
<has-action action="docSummarySWAction" access-permission="public"></has-action>
<has-action action="docSummaryFWChartAction" access-permission="public"></has-action>
<has-action action="docSummarySWChartAction" access-permission="public"></has-action>
<has-action action="docSummaryTaskDetailAction" access-permission="public"></has-action>
<has-action action="docSummaryTaskDetailTitleAction" access-permission="public"></has-action>
</process>
</model>