<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="carFeesAnalysisProcess"> 
    <label language="zh_CN">用车月费用统计</label>  
    <static-activity name="mainActivity"/>  
    <has-action action="sqlQueryAction" access-permission="public">
      <public name="dataModel" type="String" value="/OA/car/data"/> 
    </has-action> 
  </process> 
</model>
