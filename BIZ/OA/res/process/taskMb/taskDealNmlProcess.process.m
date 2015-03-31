<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="taskDealNmlProcess" kind="SYSTEM"> 
    <label language="zh_CN">taskDeal</label>  
    <static-activity name="waitActivity"> 
      <label language="zh_CN">待办</label> 
    </static-activity>  
    <has-action action="queryCommonWordsAction" access-permission="public"/>   
    <has-action action="queryWaitTask2Action" access-permission="public"/>  
    <has-action action="queryTaskGroupType" access-permission="public"/>  
    
  </process> 
</model>
