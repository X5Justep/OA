<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <process name="surveyAnswerProcess">
    <label language="zh_CN">调查问卷</label>
    <static-activity name="surveyAnswerActivity">
      <label language="zh_CN">调查问卷</label>
    </static-activity>
    
    
    
    
  <has-action action="saveSurvey" access-permission="public"></has-action>
<has-action action="commitSurvey" access-permission="public"></has-action>
<has-action action="queryOAVSAnswerAction" access-permission="public"></has-action>
<has-action action="queryDom" access-permission="public"></has-action>
<has-action action="getSurveyTaskDataAction" access-permission="public"></has-action>
</process>
</model>
