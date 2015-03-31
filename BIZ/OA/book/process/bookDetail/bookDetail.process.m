<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="bookDetailProcess"> 
    <label language="zh_CN">图书详细信息</label>  
    <static-activity name="mainActivity"> 
      <label language="zh_CN">图书详细信息</label> 
    </static-activity>  
    <has-action action="createBKBookInfoAction"/>  
    <has-action action="queryBKBookInfoAction"/>  
    <has-action action="saveBKBookInfoAction"/> 
  </process> 
</model>
