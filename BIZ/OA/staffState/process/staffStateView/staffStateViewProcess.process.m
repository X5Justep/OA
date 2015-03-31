<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="staffStateViewProcess"> 
    <label language="zh_CN">人员状态</label>  
    <has-action action="staffStateQueryAction" access-permission="public"/>  
    <static-activity name="mainActivity">
      <has-action action="staffStateQueryAction" access-permission="public"/> 
    </static-activity> 
  </process> 
</model>
