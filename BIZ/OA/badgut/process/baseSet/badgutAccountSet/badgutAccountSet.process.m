<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="badgutAccountSetProcess"> 
    <label language="zh_CN">badgutAccountSet</label>  
    <static-activity name="badgutAccountSetActivity"> 
      <label language="zh_CN">总账科目设置</label> 
    </static-activity>  
      
      
     
  <has-action action="queryOA_Pub_BaseCodeAction" access-permission="public"></has-action>
<has-action action="saveOA_Pub_BaseCodeAction" access-permission="public"></has-action>
<has-action action="createOA_Pub_BaseCodeAction" access-permission="public"></has-action>
</process> 
</model>
