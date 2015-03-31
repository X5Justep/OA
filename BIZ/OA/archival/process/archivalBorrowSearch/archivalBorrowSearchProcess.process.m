<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="archivalBorrowSearchProcess"> 
    <label language="zh_CN">档案借阅查询</label>  
    <static-activity name="startActivity">
      <label language="zh_CN">档案借阅查询</label> 
    </static-activity> 
  

<has-action action="queryAMHistoryWithArchivalAction" ></has-action>
<has-action action="queryAMArchivalAction" ></has-action>
</process> 
</model>
