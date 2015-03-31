<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="badgutApplyProcess" start="start1" end="end1"> 
    <static-activity name="startActivity">
    	<label language="zh_CN">预算计划申请</label>
    </static-activity>  
    <label language="zh_CN">预算计划申请</label>  
    <place name="start1"> 
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <token name="init"/>  
    <business-activity name="applyActivity" condition="true"> 
      <label language="zh_CN">预算计划申请</label>  
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
    <has-action action="createBGApplyMAction" access-permission="public"/>  
    <has-action action="queryBGApplyMAction" access-permission="public"/>  
    <has-action action="saveBGApplyMAction" access-permission="public"/>  
    <has-action action="createBGApplyDAction" access-permission="public"/>  
    <has-action action="queryBGApplyDAction" access-permission="public"/>  
    <has-action action="saveBGApplyDAction" access-permission="public"/>  
    <has-action action="queryOA_Pub_BaseCodeAction" access-permission="public"/>  
    <has-action action="queryBGCostCenterAction" access-permission="public"/>  
    <has-action action="applicationTemplate" access-permission="public"/>  
    <listener action="finishProcessAction" event="after" handler="badgutApplyProcessAfterFinishProcedure"/> 
  </process> 
</model>
