<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="licenseApplyProcess" start="start1" end="end1"> 
    <static-activity name="startActivity"> 
      <label language="zh_CN">证照借用申请</label> 
    </static-activity>  
    <label language="zh_CN">证照借用申请</label>  
    <place name="start1"> 
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <token name="init"/>  
    <business-activity name="lendApplyActivity" condition="true"> 
      <label language="zh_CN">证照借用申请</label>  
      <input name="x" unit="start1"/>  
      <output name="x" unit="deptAuditActivity"/>  
      <listener action="advanceProcessAction" event="after" handler="lendApplyActivityAfterAdvanceProcedure"/> 
    </business-activity>  
    <business-activity name="deptAuditActivity" condition="true"> 
      <label language="zh_CN">部门审批</label>  
      <input name="x" unit="lendApplyActivity"/>  
      <output name="x" unit="ApplyActivity"/>  
        
      <listener action="advanceProcessAction" event="before" handler="deptAuditActivityBeforeAdvanceProcedure"/> 
    

<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('',true)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">'部门审批:证照借用申请'</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="ApplyActivity" condition="true"> 
      <label language="zh_CN">申请人处理</label>  
      <input name="x" unit="deptAuditActivity"/>  
      <output name="x" unit="lendRegisterActivity"/>  
      <execute-rule condition="true" task-assign-mode="together"> 
        <executor-range range-expr="findActivityExecutor('lendApplyActivity')" default-expr="findActivityExecutor('lendApplyActivity')"> 
          <kind>PSM</kind> 
        </executor-range>  
        <task-relation-value> 
          <item relation="sPreemptMode">'tpmOpen'</item>  
          <item relation="sExecuteMode">'temPreempt'</item>  
          <item relation="sName">'申请人处理:证照借用申请'</item> 
        </task-relation-value> 
      </execute-rule> 
    </business-activity>  
    <business-activity name="lendRegisterActivity" condition="true"> 
      <label language="zh_CN">证照借用登记</label>  
      <input name="x" unit="ApplyActivity"/>  
      <output name="x" unit="end1"/>  
      <listener action="advanceProcessAction" event="after" handler="lendRegisterActivityAfterAdvanceProcedure"/> 
    </business-activity>  
    <place name="end1"> 
      <label language="zh_CN">结束</label> 
    </place>  
    <has-action action="createLSLicenseApplyMAction" access-permission="public"/>  
    <has-action action="queryLSLicenseApplyMAction" access-permission="public"/>  
    <has-action action="saveLSLicenseApplyMAction" access-permission="public"/>  
    <has-action action="createLSLicenseApplyDAction" access-permission="public"/>  
    <has-action action="queryLSLicenseApplyDAction" access-permission="public"/>  
    <has-action action="saveLSLicenseApplyDAction" access-permission="public"/>  
    <has-action action="queryLSLicenseManageAction" access-permission="public"/>  
    <has-action action="updateLicenseStateAction" access-permission="public"/> 
  </process> 
</model>
