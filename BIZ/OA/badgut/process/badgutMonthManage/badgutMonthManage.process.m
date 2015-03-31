<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="badgutMonthManageProcess"> 
    <label language="zh_CN">预算月度结算</label>  
    <static-activity name="badgutMonthManageActivity"> 
      <label language="zh_CN">预算月度结算</label> 
    </static-activity>  
      
      
     
  <has-action action="getConfig" access-permission="public"></has-action>
<has-action action="setConfig" access-permission="public"></has-action>
<has-action action="ksqlQueryAction" access-permission="public"><public name="ksql" type="String"></public>
<public name="dataModel" type="String" value="/OA/badgut/data"></public>
</has-action>
</process> 
</model>
