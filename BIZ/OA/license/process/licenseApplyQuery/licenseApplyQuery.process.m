<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="licenseApplyQueryProcess"> 
    <label language="zh_CN">证照借用申请查询</label>  
    <static-activity name="licenseApplyQueryActivity"> 
      <label language="zh_CN">证照借用申请查询</label> 
    </static-activity>  
    <has-action action="queryLSLicenseApplyMAction" access-permission="public"/>  
    <has-action action="queryLSLicenseApplyDAction" access-permission="public"/> 
  </process> 
</model>
