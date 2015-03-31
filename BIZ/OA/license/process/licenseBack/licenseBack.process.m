<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="licenseBackProcess"> 
    <label language="zh_CN">证照归还</label>  
    <static-activity name="licenseBackActivity"> 
      <label language="zh_CN">证照归还</label> 
    </static-activity>  
    <has-action action="createLSLicenseViewAction" access-permission="public"/>  
    <has-action action="queryLSLicenseViewAction" access-permission="public"/>  
    <has-action action="saveLSLicenseViewAction" access-permission="public"/>  
    <has-action action="LicenseBackAction" access-permission="public"/> 
  </process> 
</model>
