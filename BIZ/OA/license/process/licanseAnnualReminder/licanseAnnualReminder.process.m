<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="licanseAnnualReminderProcess"> 
    <label language="zh_CN">证照年检提醒</label>  
    <static-activity name="licanseAnnualReminderActivity"> 
      <label language="zh_CN">证照年检提醒</label> 
    </static-activity>  
    <has-action action="queryLSLicenseManageAction" access-permission="public"/> 
  </process> 
</model>
