<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="outApplyProcess" start="start1" end="end1"> 
    <label language="zh_CN">外出申请</label>  
    <place name="start1"> 
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <token name="init"/>  
    <business-activity name="bizActivity1" condition="true"> 
      <label language="zh_CN">外出申请</label>  
      <input name="x" unit="start1"/>  
      <output name="x" unit="bizActivity2"/> 
    </business-activity>  
    <business-activity name="bizActivity2" condition="true"> 
      <label language="zh_CN">外出申请审批</label>  
      <input name="x" unit="bizActivity1"/>  
      <output name="x" unit="bizActivity3"/> 
    </business-activity>  
    <business-activity name="bizActivity3" condition="true"> 
      <label language="zh_CN">人事部审批</label>  
      <input name="x" unit="bizActivity2"/>  
      <output name="x" unit="end1"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true"
        back-range="start"/>  
      <advance-rule condition="true" dialog-enabled="false" save-enabled="false" jump-enabled="false"
        customized-enabled="false" ignore-execute-mode="false" task-wait="false" task-join="false"/> 
    </business-activity>  
    <place name="end1"> 
      <label language="zh_CN">结束</label> 
    </place>  
    <static-activity name="mainActivity"> 
      <label language="zh_CN">外出申请</label> 
    </static-activity>  
    <has-action action="queryOA_WM_outApplyAction" access-permission="public"/>  
    <has-action action="saveOA_WM_outApplyAction" access-permission="public"/>  
    <has-action action="createOA_WM_outApplyAction" access-permission="public"/>  
    <has-action action="queryOA_out_EXECUTEAction" access-permission="public"/>  
    <has-action action="saveOA_out_EXECUTEAction" access-permission="public"/>  
    <has-action action="createOA_out_EXECUTEAction" access-permission="public"/>  
    <has-action action="getBizConfigAction" access-permission="public"/>  
    <has-action action="queryOrgAction" access-permission="public"/>  
    <has-action action="queryOA_WM_outMemberAction" access-permission="public"/>  
    <has-action action="saveOA_WM_outMemberAction" access-permission="public"/>  
    <has-action action="createOA_WM_outMemberAction" access-permission="public"/> 
    <has-action action="queryOPOrgAction" access-permission="public"></has-action>
  </process> 
</model>
