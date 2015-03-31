<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="evecsureProcess"> 
    <static-activity name="mainActivity"/>  
    <label language="zh_CN">出差确认</label>  
    <has-action action="queryOA_WM_EvecApplyAction" access-permission="public"/>  
    <has-action action="saveOA_WM_EvecApplyAction" access-permission="public"/>  
    <has-action action="createOA_WM_EvecApplyAction" access-permission="public"/> 
  </process> 
</model>
