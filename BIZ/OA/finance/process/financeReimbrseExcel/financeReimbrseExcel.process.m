<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="financeReimbrseExcelProcess"> 
    <label language="zh_CN">费用类型统计报表</label>  
    <static-activity name="startActivity"> 
      <label language="zh_CN">startActivity</label> 
    </static-activity>  
    <has-action action="sqlQueryAction" access-permission="public"> 
      <public name="dataModel" type="String" value="/OA/finance/data"/> 
    </has-action> 
  </process> 
</model>
