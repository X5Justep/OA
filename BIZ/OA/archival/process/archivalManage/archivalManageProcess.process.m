<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="archivalManageProcess"> 
    <label language="zh_CN">档案管理</label>  
    <static-activity name="startActivity"> 
      <label language="zh_CN">档案管理</label> 
    </static-activity>  
    <has-action action="queryVAMFiledCheckAction" />  
    <has-action action="createAMArchivalAction" />  
    <has-action action="queryAMArchivalAction" />  
    <has-action action="saveAMArchivalAction" />  
    <has-action action="queryAMFondsAction" />  
    <has-action action="queryVAMCategorySelectAction" />  
    <has-action action="getNodeInfoAction" />  
    <has-action action="generateArchivalInfoAction" />  
    <has-action action="shiftOutAction" />  
    <has-action action="buildUpAction" />  
    <has-action action="rollChangeAction" /> 
    <has-action action="filedArchivalAction" /> 
  </process> 
</model>
