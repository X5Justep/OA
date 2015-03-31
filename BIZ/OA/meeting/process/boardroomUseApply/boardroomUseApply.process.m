<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="boardroomUseApplyProcess" start="start1" end="end1"> 
    <label language="zh_CN">会议室使用申请</label>  
    <static-activity name="useApply"> 
      <label language="zh_CN">会议室使用申请</label> 
    </static-activity>  
      
      
      
    
    
    
      
      
      
      
      
    
    
     <token name="t1281511522312"/>  
    <listener action="advanceProcessAction" event="after" handler="boardroomUseApplyProcessAfterAdvanceProcedure"/>  
    <token name="init"/>  
    <place name="start1">
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <business-activity name="useApplyActivity" condition="true">
      <label language="zh_CN">会议室使用申请</label>  
      <input name="x" unit="start1"/>  
      <output name="x" unit="useApproveActivity"/> 
    </business-activity>  
    <business-activity name="useApproveActivity" condition="true">
      <label language="zh_CN">会议室使用审批</label>  
      <input name="x" unit="useApplyActivity"/>  
      <output name="x" unit="useArrangeActivity"/> 
    
<back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" ><to activity="useApplyActivity"></to>
</back-rule>
</business-activity>  
    <business-activity name="useArrangeActivity" condition="true">
      <label language="zh_CN">会议室使用安排</label>  
      <input name="x" unit="useApproveActivity"/>  
      <output name="x" unit="end1"/> 
    
<back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" ><to activity="useApplyActivity"></to>
</back-rule>
</business-activity>  
    <place name="end1">
      <label language="zh_CN">结束</label> 
    </place> 
  <has-action action="createMTUSEAPPLYAction" access-permission="public"></has-action>
<has-action action="queryMTUSEAPPLYAction" access-permission="public"></has-action>
<has-action action="saveMTUSEAPPLYAction" access-permission="public"></has-action>
<has-action action="saveMTBOARDROOMAction" access-permission="public"></has-action>
<has-action action="queryMTBOARDROOMAction" access-permission="public"></has-action>
<has-action action="createMTBOARDROOMAction" access-permission="public"></has-action>
<has-action action="createMTUSEAPPLYPSNSAction" access-permission="public"></has-action>
<has-action action="queryMTUSEAPPLYPSNSAction" access-permission="public"></has-action>
<has-action action="saveMTUSEAPPLYPSNSAction" access-permission="public"></has-action>
<has-action action="queryOA_Pub_BaseCodeAction" access-permission="public"></has-action>
<has-action action="checkBoardroomUsedAction" access-permission="public"></has-action>
<has-action action="queryMTRoomArrangeAction" access-permission="public"></has-action>
<has-action action="sqlQueryAction" access-permission="public"><public name="dataModel" type="String" value="/OA/meeting/data"></public>
</has-action>
<has-action action="queryOPOrgAction" access-permission="public"></has-action>
</process> 
</model>
