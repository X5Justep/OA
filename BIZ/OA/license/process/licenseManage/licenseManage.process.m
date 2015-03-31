<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="licenseManageProcess"> 
    <label language="zh_CN">证照信息维护</label>  
    <static-activity name="licenseManageActivity"> 
      <label language="zh_CN">证照信息维护</label> 
    </static-activity>  
    <has-action action="createLSLicenseManageAction" access-permission="public"/>  
    <has-action action="queryLSLicenseManageAction" access-permission="public"/>  
    <has-action action="saveLSLicenseManageAction" access-permission="public"/>  
    <has-action action="isExistInLicenseApplyDAction" access-permission="public"/> 
  </process> 
</model>
