<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="financeLoanTypeProcess"> 
    <label language="zh_CN">借款类型</label>  
    <static-activity name="startActivity"> 
      <label language="zh_CN">startActivity</label> 
    </static-activity>  
  <has-action action="queryOA_Pub_BaseCodeAction" access-permission="public"></has-action>
<has-action action="saveOA_Pub_BaseCodeAction" access-permission="public"></has-action>
<has-action action="createOA_Pub_BaseCodeAction" access-permission="public"></has-action>
</process> 
</model>
