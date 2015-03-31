<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="badgutAlterProcess" start="start1" end="end1"> 
    <label language="zh_CN">预算计划变更</label>
    <static-activity name="startActivity">  
    	<label language="zh_CN">预算计划变更</label>
    </static-activity>  
    <place name="start1"> 
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <token name="init"/>  
    <business-activity name="applyActivity" condition="true"> 
      <label language="zh_CN">预算变更申请</label>  
      <input name="x" unit="start1"/>  
      <output name="x" unit="deptAuditActivity"/> 
    </business-activity>  
    <business-activity name="deptAuditActivity" condition="true"> 
      <label language="zh_CN">部门领导审批</label>  
      <input name="x" unit="applyActivity"/>  
      <output name="x" unit="accountAuditActivity"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" > 
        <to activity="applyActivity"/> 
      </back-rule> 
    </business-activity>  
    <business-activity name="accountAuditActivity" condition="true"> 
      <label language="zh_CN">财务部门审批</label>  
      <input name="x" unit="deptAuditActivity"/>  
      <output name="x" unit="managerAuditActivity"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" > 
        <to activity="applyActivity"/> 
      </back-rule> 
    </business-activity>  
    <business-activity name="managerAuditActivity" condition="true"> 
      <label language="zh_CN">主管领导审批</label>  
      <input name="x" unit="accountAuditActivity"/>  
      <output name="x" unit="end1"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" > 
        <to activity="applyActivity"/> 
      </back-rule> 
    </business-activity>  
    <place name="end1"> 
      <label language="zh_CN">结束</label> 
    </place>  
    <has-action action="createBGAlterMAction" access-permission="public"/>  
    <has-action action="queryBGAlterMAction" access-permission="public"/>  
    <has-action action="saveBGAlterMAction" access-permission="public"/>  
    <has-action action="createBGAlterDAction" access-permission="public"/>  
    <has-action action="queryBGAlterDAction" access-permission="public"/>  
    <has-action action="saveBGAlterDAction" access-permission="public"/>  
    <has-action action="getBadgutData" access-permission="public"/>  
    <has-action action="queryBGBadgutAction" access-permission="public"/>  
    <has-action action="queryBGCostCenterAction" access-permission="public"/> 
  <listener action="finishProcessAction" event="after" handler="badgutAlterProcessAfterFinishProcedure"></listener>

</process> 
</model>
