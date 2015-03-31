<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="carFeesRegisterProcess"> 
    <label language="zh_CN">车辆费用登记</label>  
    <static-activity name="mainActivity"> 
      <label language="zh_CN">车辆费用登记</label> 
    </static-activity>  
    <has-action action="queryOA_CA_FeesRegisterAction" access-permission="public"/>  
    <has-action action="saveOA_CA_FeesRegisterAction" access-permission="public"/>  
    <has-action action="createOA_CA_FeesRegisterAction" access-permission="public"/>  
    <has-action action="queryCACarBasicInfoAction" access-permission="public"/> 
  </process> 
</model>
