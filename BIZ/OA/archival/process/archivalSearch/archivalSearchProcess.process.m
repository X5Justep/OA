<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="archivalSearchProcess"> 
    <label language="zh_CN">档案查询</label>  
    <static-activity name="startActivity">
      <label language="zh_CN">档案查询</label> 
    </static-activity> 
    <has-action action="queryAMArchivalAction"/> 
    <has-action action="getNodeInfoAction"/> 
  </process> 
</model>
