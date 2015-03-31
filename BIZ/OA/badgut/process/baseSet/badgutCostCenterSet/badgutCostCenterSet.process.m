<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="badgutCostCenterSetProcess"> 
    <label language="zh_CN">badgutCostCenterSet</label>  
    <static-activity name="badgutCostCenterSetActivity"> 
      <label language="zh_CN">成本中心设置</label> 
    </static-activity>  
    <has-action action="queryOA_Pub_BaseCodeAction" access-permission="public"/>  
    <has-action action="createBGCostCenterAction" access-permission="public"/>  
    <has-action action="queryBGCostCenterAction" access-permission="public"/>  
    <has-action action="saveBGCostCenterAction" access-permission="public"/>  
    <has-action action="createBGCostAccountAction" access-permission="public"/>  
    <has-action action="queryBGCostAccountAction" access-permission="public"/>  
    <has-action action="saveBGCostAccountAction" access-permission="public"/> 
  </process> 
</model>
