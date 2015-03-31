<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="financeReimbrseApplyQueryProcess"> 
    <label language="zh_CN">报销申请查询</label>  
    <static-activity name="startActivity"> 
      <label language="zh_CN">startActivity</label> 
    </static-activity>  
      
     
  <has-action action="queryFCReimbApplyMAction" access-permission="public"></has-action>
<has-action action="queryFCReimbApplyDAction" access-permission="public"></has-action>
<has-action action="sqlQueryAction" access-permission="public"><public name="dataModel" type="String" value="/OA/car/data"></public>
</has-action>
</process> 
</model>
