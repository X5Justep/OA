<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="addressBookSystemProcess"> 
    <label language="zh_CN">系统通讯录查询</label>  
    <static-activity name="startActivity"> 
      <label language="zh_CN">系统通讯录</label>  
      <has-action action="queryOPPersonAction" access-permission="public"/> 
    </static-activity> 
    <has-action action="queryOPOrgAction" access-permission="public"></has-action>
  </process> 
</model>
