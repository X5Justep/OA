<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="overtimeProcess" start="start1" end="end1"> 
    <label language="zh_CN">加班申请</label>  
    <place name="start1"> 
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <token name="init"/>  
    <business-activity name="bizActivity1" condition="true"> 
      <input name="x" unit="start1"/>  
      <output name="x" unit="bizActivity2"/>  
      <label language="zh_CN">加班申请</label> 
    </business-activity>  
    <business-activity name="bizActivity2" condition="true"> 
      <input name="x" unit="bizActivity1"/>  
      <label language="zh_CN">加班申请审核</label>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true"
        back-range="specified" then-flow-mode="flowToAgain"> 
        <to activity="bizActivity1"/> 
      </back-rule>  
      <output name="x" unit="end1"/> 
    </business-activity>  
    <place name="end1"> 
      <label language="zh_CN">结束</label> 
    </place>  
    <static-activity name="mainActivity"> 
      <label language="zh_CN">加班申请</label> 
    </static-activity>  
    <has-action action="queryOA_overtime_EXECUTEAction" access-permission="public"/>  
    <has-action action="saveOA_overtime_EXECUTEAction" access-permission="public"/>  
    <has-action action="createOA_overtime_EXECUTEAction" access-permission="public"/>  
    <has-action action="queryOA_WM_OvertimeApplyAction" access-permission="public"/>  
    <has-action action="saveOA_WM_OvertimeApplyAction" access-permission="public"/>  
    <has-action action="createOA_WM_OvertimeApplyAction" access-permission="public"/> 
  </process> 
</model>
