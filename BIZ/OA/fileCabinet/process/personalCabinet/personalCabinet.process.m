<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="personalCabinetProcess"> 
    <label language="zh_CN">个人文件柜</label>  
    <has-action action="queryDocNodeAction"/>  
    <has-action action="createDocNodeAction"/>  
    <has-action action="saveDocNodeAction"/>  
    <has-action action="queryAuthAction"/>  
    <has-action action="createAuthAction"/>  
    <has-action action="saveAuthAction"/>  
    <has-action action="queryOrgAction"/>  
    <has-action action="queryPermissionAction"/>  
    <has-action action="queryNameSpaceAction"/>  
    <has-action action="queryDocAction"/>  
    <has-action action="addAccessRecordAction"/>  
    <has-action action="dispatchOptAction"/>  
    <has-action action="ksqlQueryAction"/>  
    <has-action action="getCabinetInfoAction"/>  
    <static-activity name="mainActivity"/> 
  </process> 
</model>
