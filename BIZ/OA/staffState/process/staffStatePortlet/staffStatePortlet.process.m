<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="staffStatePortletProcess" kind="SYSTEM"> 
    <label language="zh_CN">状态Portlet</label>  
    <static-activity name="staffStateActivity"> 
      <label language="zh_CN">状态Portlet</label> 
    </static-activity>  
    <static-activity name="staffStateActivity_static1"> 
      <label language="zh_CN">状态Portlet</label> 
    </static-activity>  
    <static-activity name="staffStateActivity_static2"> 
      <label language="zh_CN">状态Portlet</label> 
    </static-activity>  
    <static-activity name="staffStateActivity_static3"> 
      <label language="zh_CN">状态Portlet</label> 
    </static-activity>  
    <has-action action="getStaffStateAction" access-permission="public"/>  
    <has-action action="getStaffStateByDeptAction" access-permission="public"/>  
    <has-action action="orgSelectDialogQueryAction" access-permission="public"/>  
    <has-action action="getStaffStateOfDirectlyOgnAction" access-permission="public"/>  
    <has-action action="getStaffStateOfDeptAction" access-permission="public"/>  
    <has-action action="getStaffStateOfDirectDeptAction" access-permission="public"/>  
    <has-action action="getStaffStateOfOwnDeptAction" access-permission="public"/> 
  </process> 
</model>
