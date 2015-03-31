<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="signatureApplyProcess" start="start1" end="end1"> 
    <label language="zh_CN">印章使用申请</label>  
    <static-activity name="startActivity"> 
      <label language="zh_CN">印章申请</label> 
    </static-activity>  
    <place name="start1"> 
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <token name="init"/>  
    <business-activity name="createSignatureActivity" condition="true"> 
      <label language="zh_CN">印章申请</label>  
      <input name="x" unit="start1"/>  
      <output name="x" unit="managerProcessSignatureActivity"/> 
    </business-activity>  
    <business-activity name="managerProcessSignatureActivity" condition="true"> 
      <label language="zh_CN">部门审批</label>  
      <input name="x" unit="createSignatureActivity"/>  
      <output name="x" unit="chargeActivity"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true"
        back-range="specified">
        <to activity="createSignatureActivity"/> 
      </back-rule> 
    



<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivityInAEDept('createSignatureActivity',true)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">'部门审批:印章使用申请'</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="managerDealActivity" condition="true"> 
      <label language="zh_CN">签收</label>  
      <output name="x" unit="end1"/>  
      <input name="x" unit="headMangerActivity"/>  
      <input name="x" unit="conditionFork1"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true"
        back-range="specified">
        <to activity="createSignatureActivity"/> 
      </back-rule> 
    
<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('', false)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">'签收:印章使用申请'</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <place name="end1"> 
      <label language="zh_CN">结束</label> 
    </place>  
    <static-activity name="noticeActivity"> 
      <label language="zh_CN">印章使用申请通知</label> 
    </static-activity>  
      
      
      
      
    <notice-rule condition="true" dialog-enabled="true" save-enabled="false" task-assign-mode="together">
      <occasion>finishProcess</occasion>  
      <executor-range range-expr="findActivityCreator('START')" default-expr="findActivityCreator('START')">
        <kind>PSM</kind> 
      </executor-range>  
      <task-relation-value>
        <item relation="sPreemptMode">'tpmOpen'</item>  
        <item relation="sEURL">'/OA/signature/process/signatureApply/noticeActivity.w'</item>  
        <item relation="sExecuteMode">'temPreempt'</item>  
        <item relation="sExecuteMode2">'finishWhenOpen'</item>  
        <item relation="sName">'通知:印章使用申请---已完成'</item> 
      </task-relation-value> 
    </notice-rule>  
    <business-activity name="chargeActivity" condition="true">
      <label language="zh_CN">办公室主任审批</label>  
      <input name="x" unit="managerProcessSignatureActivity"/>  
      <output name="x" unit="conditionFork1"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true"
        back-range="specified">
        <to activity="createSignatureActivity"/> 
      </back-rule> 
    
<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('', false)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">'办公室主任审批:印章使用申请'</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <if-else-activity name="conditionFork1" condition="relationValue('OA_SL_Signature', :sData1, '', '', 'fExtendStr1', '/OA/signature/data')='1'">
      <label language="zh_CN">需主管领导批示</label>  
      <input name="x" unit="chargeActivity"/>  
      <true-output name="x" unit="headMangerActivity"/>  
      <false-output name="x" unit="managerDealActivity"/> 
    </if-else-activity>  
    <business-activity name="headMangerActivity" condition="true">
      <label language="zh_CN">主管领导批示</label>  
      <input name="x" unit="conditionFork1"/>  
      <output name="x" unit="managerDealActivity"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true"
        back-range="specified">
        <to activity="createSignatureActivity"/> 
      </back-rule> 
    
<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('', false)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">'主管领导批示:印章使用申请'</item>
</task-relation-value>
</execute-rule>
</business-activity> 
  <has-action action="createSLSignatureAction" access-permission="public"></has-action>
<has-action action="querySLSignatureAction" access-permission="public"></has-action>
<has-action action="saveSLSignatureAction" access-permission="public"></has-action>
<has-action action="queryOA_Pub_BaseCodeAction" access-permission="public"></has-action>
</process> 
</model>
