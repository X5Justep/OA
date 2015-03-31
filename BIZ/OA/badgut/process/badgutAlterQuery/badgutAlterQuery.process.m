<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="badgutAlterQueryProcess"> 
    <label language="zh_CN">预算计划变更查询</label>  
    <static-activity name="startActivity"> 
      <label language="zh_CN">startActivity</label> 
    </static-activity>  
    <has-action action="queryBGAlterMAction" access-permission="public"/>  
    <has-action action="queryBGAlterDAction" access-permission="public"/> 
  </process> 
</model>
