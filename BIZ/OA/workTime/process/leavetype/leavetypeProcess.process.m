<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="leavetypeProcess"> 
    <label language="zh_CN">请假类型管理</label>  
    <static-activity name="mainActivity"/>  
    <has-action action="queryOA_WM_LeaveTypeAction" access-permission="public"/>  
    <has-action action="saveOA_WM_LeaveTypeAction" access-permission="public"/>  
    <has-action action="createOA_WM_LeaveTypeAction" access-permission="public"/> 
  </process> 
</model>
