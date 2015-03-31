<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="evectionProcess" start="start1" end="end1"> 
    <label language="zh_CN">出差申请</label>  
    <place name="start1"> 
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <token name="init"/>  
    <business-activity name="bizActivity1" condition="true"> 
      <label language="zh_CN">出差申请</label>  
      <input name="x" unit="start1"/>  
      <output name="x" unit="bizActivity2"/> 
    </business-activity>  
    <business-activity name="bizActivity2" condition="true"> 
      <label language="zh_CN">出差申请审批</label>  
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
        <item relation="sName">concat(relationValue('OA_WM_EvecApply',:sData1,'','','fAPPLYPERSONNAME','/OA/workTime/data'),'--',currentProcessLabelOfProcessContext())</item> 
      </task-relation-value> 
    </start-rule>  
    <static-activity name="mainActivity"> 
      <label language="zh_CN">出差申请</label> 
    </static-activity>  
    <has-action action="queryOA_WM_EvecApplyAction" access-permission="public"/>  
    <has-action action="saveOA_WM_EvecApplyAction" access-permission="public"/>  
    <has-action action="createOA_WM_EvecApplyAction" access-permission="public"/>  
    <has-action action="queryOA_WM_eveMemberAction" access-permission="public"/>  
    <has-action action="saveOA_WM_eveMemberAction" access-permission="public"/>  
    <has-action action="createOA_WM_eveMemberAction" access-permission="public"/>  
    <has-action action="orgSelectDialogQueryAction" access-permission="public"/> 
    <has-action action="queryOPOrgAction" access-permission="public"></has-action>
  </process> 
</model>
