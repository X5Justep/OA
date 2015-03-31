<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="externalUnitProcess" kind="SYSTEM"> 
    <label language="zh_CN">来往单位维护</label>  
    <static-activity name="externalUnitActivity"> 
      <label language="zh_CN">来往单位维护</label> 
    </static-activity>  
    <has-action action="createOA_DC_ExternalUnitAction" access-permission="public"/>  
    <has-action action="queryOA_DC_ExternalUnitAction" access-permission="public"/>  
    <has-action action="saveOA_DC_ExternalUnitAction" access-permission="public"/> 
  </process> 
</model>
