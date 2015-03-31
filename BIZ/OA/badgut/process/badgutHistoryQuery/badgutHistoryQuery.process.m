<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="badgutHistoryQueryProcess"> 
    <label language="zh_CN">预算历史流水查询</label>  
    <static-activity name="badgutHistoryQueryActivity"> 
      <label language="zh_CN">预算历史流水查询</label> 
    </static-activity>  
    <has-action action="queryBGHistoryAction" access-permission="public"/> 
  </process> 
</model>
