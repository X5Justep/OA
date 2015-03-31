<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="repairApplyProcess" end="end1" start="start1"> 
    <label language="zh_CN">补签申请</label>  
    <token name="init"/>  
    <business-activity name="bizActivity1" condition="true">
      <label language="zh_CN">补签申请</label>  
      <output name="x" unit="bizActivity2"/>  
      <input name="x" unit="start1"/> 
    </business-activity>  
    <business-activity name="bizActivity2" condition="true">
      <label language="zh_CN">补签申请审批</label>  
      <input name="x" unit="bizActivity1"/>  
      <output name="x" unit="bizActivity3"/> 
    </business-activity>  
    <business-activity name="bizActivity3" condition="true">
      <label language="zh_CN">人事部审批</label>  
      <input name="x" unit="bizActivity2"/>  
      <output name="x" unit="end1"/>  
        
       
    
<advance-rule condition="true" dialog-enabled="false" save-enabled="false" jump-enabled="false" customized-enabled="false" ignore-execute-mode="false" task-wait="false" task-join="false"></advance-rule>

<back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" then-flow-mode="flowToAgain"><to activity="bizActivity1"></to>
</back-rule>
</business-activity>  
    <place name="end1">
      <label language="zh_CN">结束</label> 
    </place>  
      
      
      
      
      
      
    <place name="start1">
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <static-activity name="mainActivity">
      <label language="zh_CN">补签申请</label> 
    </static-activity> 
  





<has-action action="saveOA_repair_EXECUTEAction" access-permission="public"></has-action>
<has-action action="createOA_repair_EXECUTEAction" access-permission="public"></has-action>
<has-action action="queryOA_repair_EXECUTEAction" access-permission="public"></has-action>
<has-action action="queryOA_WM_repairApplyAction" access-permission="public"></has-action>
<has-action action="saveOA_WM_repairApplyAction" access-permission="public"></has-action>
<has-action action="createOA_WM_repairApplyAction" access-permission="public"></has-action>
</process> 
</model>
