<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="carUseApplyQueryProcess"> 
    <label language="zh_CN">用车申请查询</label>  
    <static-activity name="startActivity"> 
      <label language="zh_CN">startActivity</label> 
    </static-activity>  
      
     
  <has-action action="queryCACarUseApplyAction" access-permission="public"></has-action>
<has-action action="queryCACarUseArrangeAction" access-permission="public"></has-action>
<has-action action="sqlQueryAction" access-permission="public"></has-action>
</process> 
</model>
