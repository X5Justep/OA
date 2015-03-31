<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="questionModulesProcess"> 
    <label language="zh_CN">问题模块设置</label>  
    <static-activity name="mainActivity"> 
      <label language="zh_CN">问题模块设置</label> 
    </static-activity>  
    <has-action action="queryOA_QB_ModulesAction" access-permission="public"/>  
    <has-action action="saveOA_QB_ModulesAction" access-permission="public"/>  
    <has-action action="createOA_QB_ModulesAction" access-permission="public"/> 
  </process> 
</model>
