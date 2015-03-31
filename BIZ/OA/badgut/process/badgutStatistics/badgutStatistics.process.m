<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="badgutStatisticsProcess"> 
    <label language="zh_CN">预算执行统计</label>  
    <static-activity name="badgutStatisticsActivity"> 
      <label language="zh_CN">预算执行统计</label> 
    </static-activity>  
    <has-action action="sqlQueryAction" access-permission="public"> 
      <public name="dataModel" type="String" value="/OA/badgut/data"/> 
    </has-action>  
    <has-action action="queryOA_Pub_BaseCodeAction" access-permission="public"/>  
    <has-action action="queryBGCostCenterAction" access-permission="public"/> 
  </process> 
</model>
