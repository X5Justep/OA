<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="archivalFondsProcess"> 
    <label language="zh_CN">全宗设置</label>  
    <static-activity name="startActivity"> 
      <label language="zh_CN">全宗设置</label> 
    </static-activity>  
    <has-action action="createAMFondsAction" />  
    <has-action action="queryAMFondsAction" />  
    <has-action action="saveAMFondsAction" />  
    <has-action action="queryAMCategoryAction" />  
    <has-action action="createAMFondsCategoryAction" />  
    <has-action action="queryAMFondsCategoryAction" />  
    <has-action action="saveAMFondsCategoryAction" /> 
    <has-action action="ksqlQueryAction"/>
  </process> 
</model>
