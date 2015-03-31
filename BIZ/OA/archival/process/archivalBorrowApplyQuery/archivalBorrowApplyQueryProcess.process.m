<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="archivalBorrowApplyQueryProcess"> 
    <label language="zh_CN">档案借阅查询</label>  
    <static-activity name="startActivity"> 
      <label language="zh_CN">档案借阅查询</label> 
    </static-activity>  
      
      
     
  



<has-action action="queryAMBorrowApplyMAction" ></has-action>
<has-action action="queryAMBorrowApplyDAction" ></has-action>
<has-action action="queryAMArchivalAction" ></has-action>
<has-action action="queryAMBorrowApplyDWithArchivalAction" ></has-action>
</process> 
</model>
