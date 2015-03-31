<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="financeLoanApplyQueryProcess"> 
    <label language="zh_CN">借款申请查询</label>  
    <static-activity name="startActivity"> 
      <label language="zh_CN">startActivity</label> 
    </static-activity>  
     
  <has-action action="queryFCLoanApplyAction" access-permission="public"></has-action>
<has-action action="sqlQueryAction" access-permission="public"><public name="dataModel" type="String" value="/OA/car/data"></public>
</has-action>
</process> 
</model>
