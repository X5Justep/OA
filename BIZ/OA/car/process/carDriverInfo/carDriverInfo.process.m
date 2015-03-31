<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="carDriverInfoProcess"> 
    <label language="zh_CN">司机信息</label>  
    <static-activity name="startActivity"> 
      <label language="zh_CN">startActivity</label> 
    </static-activity>  
      
      
      
     
  <has-action action="createCADriverBasicInfoAction" access-permission="public"></has-action>
<has-action action="queryCADriverBasicInfoAction" access-permission="public"></has-action>
<has-action action="saveCADriverBasicInfoAction" access-permission="public"></has-action>
<has-action action="checkUniquenessAction" access-permission="public"></has-action>
<has-action action="queryOA_Pub_BaseCodeAction" access-permission="public"></has-action>
</process> 
</model>
