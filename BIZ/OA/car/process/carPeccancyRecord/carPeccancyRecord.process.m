<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="carPeccancyRecordProcess"> 
    <label language="zh_CN">违章记录</label>  
    <static-activity name="startActivity"> 
      <label language="zh_CN">startActivity</label> 
    </static-activity>  
      
      
      
      
      
     
  <has-action action="createCAPeccancyRecordAction" access-permission="public"></has-action>
<has-action action="queryCAPeccancyRecordAction" access-permission="public"></has-action>
<has-action action="saveCAPeccancyRecordAction" access-permission="public"></has-action>
<has-action action="queryCACarBasicInfoAction" access-permission="public"></has-action>
<has-action action="queryCACarYearCheckInfoAction" access-permission="public"></has-action>
<has-action action="queryCACarSafetyInfoAction" access-permission="public"></has-action>
<has-action action="queryOA_Pub_BaseCodeAction" access-permission="public"></has-action>
</process> 
</model>
