<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="leaveProcess" start="start1" end="end1"> 
    <static-activity name="mainActivity">
    	<label language="zh_CN">请假申请</label>
    </static-activity>  
    <label language="zh_CN">请假申请</label>  
    <place name="start1"> 
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <token name="init"/>  
    <business-activity name="bizActivity1" condition="true"> 
      <label language="zh_CN">请假申请</label>  
      <input name="x" unit="start1"/>  
      <output name="x" unit="bizActivity2"/> 
    </business-activity>  
    <business-activity name="bizActivity2" condition="true"> 
      <label language="zh_CN">请假申请审批</label>  
      <input name="x" unit="bizActivity1"/>  
      <output name="x" unit="end1"/>  
      <advance-rule condition="true" dialog-enabled="false" save-enabled="false" jump-enabled="false"
        customized-enabled="false" ignore-execute-mode="false" task-wait="false" task-join="false"/> 
    </business-activity>  
    <place name="end1"> 
      <label language="zh_CN">结束</label> 
    </place>  
    <start-rule condition="true"> 
      <task-relation-value> 
        <item relation="sName">concat(relationValue('OA_WM_LeaveApply',:sData1,'','','fApplyPersonName','/OA/workTime/data'),'--',currentProcessLabelOfProcessContext())</item> 
      </task-relation-value> 
    </start-rule>  
      
      
      
      
      
      
      
      
     
  















































































































<has-action action="queryOA_WM_LeaveApplyPCAction" access-permission="public"></has-action>
<has-action action="saveOA_WM_LeaveApplyPCAction" access-permission="public"></has-action>
<has-action action="createOA_WM_LeaveApplyPCAction" access-permission="public"></has-action>
<has-action action="queryOA_WM_LeaveApplyAction" access-permission="public"></has-action>
<has-action action="saveOA_WM_LeaveApplyAction" access-permission="public"></has-action>
<has-action action="createOA_WM_LeaveApplyAction" access-permission="public"></has-action>
<has-action action="queryOA_WM_LeaveTypeAction" access-permission="public"></has-action>
<has-action action="saveOA_WM_LeaveTypeAction" access-permission="public"></has-action>
<has-action action="createOA_WM_LeaveTypeAction" access-permission="public"></has-action>
<has-action action="ksqlQueryAction" access-permission="public"></has-action>
<has-action action="queryOA_WM_HolidayAction" access-permission="public"></has-action>
<has-action action="queryOA_WM_VacationAction" access-permission="public"></has-action>

<listener action="finishProcessAction" event="after" handler="leaveProcessAfterFinishProcedure"></listener>
</process> 
</model>
