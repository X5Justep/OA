<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="flowLanchProcess" start="start1" end="end1"> 
    <label language="zh_CN">事务办理</label>  
    <has-action action="createFlowLanchApplyAction"/>  
    <has-action action="queryFlowLanchApplyAction"/>  
    <has-action action="saveFlowLanchApplyAction"/>  
    <static-activity name="startActivity"> 
      <label language="zh_CN">流程发起</label> 
    </static-activity>  
    <token name="init"/>  
    <place name="start1"> 
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <business-activity name="flowLanchApplyActivity" condition="true"> 
      <label language="zh_CN">流程发起</label>  
      <input name="x" unit="start1"/>  
      <output name="x" unit="xor1"/>  
      <input name="x" unit="flowDisposeActivity"/>  
       
    














































<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findPersonMembersByID('',relationValue('OA_FL_FlowLanchApply', :sData1, '', '', 'fCreatePsnID', '/OA/flowLanch/data'))" default-expr="findPersonMembersByID('',relationValue('OA_FL_FlowLanchApply', :sData1, '', '', 'fCreatePsnID', '/OA/flowLanch/data'))"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat(currentActivityLabelOfProcessContext(),':',relationValue('OA_FL_FlowLanchApply',:sData1,'','','fTitle','/OA/flowLanch/data'))</item>
</task-relation-value>
</execute-rule>

<advance-rule condition="true" dialog-enabled="true" save-enabled="false" jump-enabled="false" customized-enabled="false" ignore-execute-mode="false" task-wait="false" task-join="false"></advance-rule>
</business-activity>  
    <place name="xor1"> 
      <label language="zh_CN">XOR</label> 
    </place>  
      
      
    <business-activity name="flowDisposeActivity" condition="true"> 
      <label language="zh_CN">流程处理</label>  
      <input name="x" unit="xor1"/>  
      <output name="x" unit="flowLanchApplyActivity"/>  
       
    





<back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" then-flow-mode="flowToAgain"><to activity="flowLanchApplyActivity"></to>
</back-rule>
<advance-rule condition="true" dialog-enabled="false" save-enabled="false" jump-enabled="false" customized-enabled="false" ignore-execute-mode="false" task-wait="false" task-join="false"></advance-rule>










<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('', false)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sExecuteMode">'temSimultaneous'</item>
<item relation="sName">concat(currentActivityLabelOfProcessContext(),':',relationValue('OA_FL_FlowLanchApply',:sData1,'','','fTitle','/OA/flowLanch/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity> 
  <place name="end1"><label language="zh_CN">结束</label>
</place>
<arc name="x" from="xor1" to="end1"></arc>

<start-rule condition="true"><task-relation-value><item relation="sName">concat(currentActivityLabelOfProcessContext(),':',relationValue('OA_FL_FlowLanchApply',:sData1,'','','fTitle','/OA/flowLanch/data'))</item>
</task-relation-value>
</start-rule>
</process> 
</model>
