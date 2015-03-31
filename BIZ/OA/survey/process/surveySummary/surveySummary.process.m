<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <process name="surveySummaryProcess">
    <label language="zh_CN">调查统计</label>
    <static-activity name="surveySummaryActivity">
      <label language="zh_CN">调查统计</label>
    </static-activity>
    
    
    
  <has-action action="queryVSPaperAction" access-permission="public"></has-action>
<has-action action="queryVSSurveyAction" access-permission="public"></has-action>
<has-action action="queryDom" access-permission="public"></has-action>
<has-action action="getSurveyFinallyDataAction" access-permission="public"></has-action>
</process>
</model>
