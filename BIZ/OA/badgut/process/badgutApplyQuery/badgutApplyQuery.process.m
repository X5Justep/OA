<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="badgutApplyQueryProcess"> 
    <label language="zh_CN">预算计划申请查询</label>  
    <static-activity name="badgutApplyQueryActivity"> 
      <label language="zh_CN">预算计划申请查询</label> 
    </static-activity>  
    <has-action action="queryBGApplyMAction" access-permission="public"/>  
    <has-action action="queryBGApplyDAction" access-permission="public"/> 
  </process> 
</model>
