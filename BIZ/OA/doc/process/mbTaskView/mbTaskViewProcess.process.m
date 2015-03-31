<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="mbTaskViewProcess"> 
    <label language="zh_CN">公文审批</label>  
    <static-activity name="sendActivity"> 
      <label language="zh_CN">收文审批</label> 
    </static-activity>  
    <has-action action="querySubmitTaskAction" access-permission="public"/>  
    <has-action action="queryWaitTaskAction" access-permission="public"/>  
    <has-action action="queryTaskSummaryAction" access-permission="public"/>  
    <has-action action="queryWaitTask2Action" access-permission="public"/>  
    <has-action action="querySubmitTask2Action" access-permission="public"/>  
    <has-action action="queryTaskGroupType" access-permission="public"/> 
  <static-activity name="receiveActivty"><label language="zh_CN">收文审批</label>
</static-activity>
<static-activity name="signReport"><label language="zh_CN">签报审批</label>
</static-activity>
</process> 
</model>
