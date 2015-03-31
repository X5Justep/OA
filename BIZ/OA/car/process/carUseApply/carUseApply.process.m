<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="carUseApplyProcess" start="start1" end="end1"> 
    <label language="zh_CN">车辆使用申请</label>  
    <place name="start1"> 
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <token name="init"/>  
    <business-activity name="createActivity" condition="true"> 
      <label language="zh_CN">用车申请</label>  
        
       
    <input name="x" unit="start1"></input>
<output name="x" unit="deptActivity"></output>
</business-activity>  
    <business-activity name="deptActivity" condition="true"> 
      <label language="zh_CN">科长审核</label>  
        
        
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true"
        back-range="specified"> 
        <to activity="createActivity"/> 
      </back-rule> 
    <input name="x" unit="createActivity"></input>
<output name="x" unit="xor1"></output>
</business-activity>  
    <business-activity name="mainDeptActivity" condition="true"> 
      <label language="zh_CN">部门领导审批</label>  
        
        
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true"
        back-range="specified"> 
        <to activity="createActivity"/> 
      </back-rule> 
    
<input name="x" unit="xor1"></input>
<output name="x" unit="xor2"></output>

</business-activity>  
    <business-activity name="carArrangeActivity" condition="true"> 
      <label language="zh_CN">用车安排</label>  
        
        
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true"
        back-range="specified"> 
        <to activity="createActivity"/> 
      </back-rule> 
    <input name="x" unit="xor1"></input>
<input name="x" unit="bizActivity1"></input>
<output name="x" unit="end1"></output>
<input name="x" unit="xor2"></input>
</business-activity>  
    <place name="end1"> 
      <label language="zh_CN">结束</label> 
    </place>  
    <static-activity name="startActivity"> 
      <label language="zh_CN">车辆使用申请</label> 
    </static-activity>  
    <static-activity name="noticeActivity"> 
      <label language="zh_CN">用车申请通知</label> 
    </static-activity>  
    <notice-rule condition="true" dialog-enabled="true" save-enabled="false" task-assign-mode="together"> 
      <occasion>finishProcess</occasion>  
      <executor-range range-expr="findActivityExecutor('createActivity')" default-expr="findActivityExecutor('createActivity')"> 
        <kind>PSM</kind> 
      </executor-range>  
      <task-relation-value> 
        <item relation="sPreemptMode">'tpmOpen'</item>  
        <item relation="sEURL">'/OA/car/process/carUseApply/noticeActivity.w'</item>  
        <item relation="sExecuteMode">'temPreempt'</item>  
        <item relation="sExecuteMode2">'finishWhenOpen'</item>  
        <item relation="sName">'通知:车辆使用申请'</item> 
      </task-relation-value> 
    </notice-rule>  
    <listener action="finishProcessAction" event="after" handler="carUseApplyProcessAfterFinishProcedure"/>  
      
      
      
      
      
      
      
      
      
     
  <business-activity name="bizActivity1" condition="true"><label language="zh_CN">所领导审批</label>

<input name="x" unit="xor2"></input>
<output name="x" unit="carArrangeActivity"></output>
</business-activity>
<place name="xor1"><label language="zh_CN">XOR</label>
</place>
<place name="xor2"><label language="zh_CN">XOR</label>
</place>

<has-action action="createCACarUseApplyAction" access-permission="public"></has-action>
<has-action action="queryCACarUseApplyAction" access-permission="public"></has-action>
<has-action action="saveCACarUseApplyAction" access-permission="public"></has-action>
<has-action action="createCACarUseArrangeAction" access-permission="public"></has-action>
<has-action action="queryCACarUseArrangeAction" access-permission="public"></has-action>
<has-action action="saveCACarUseArrangeAction" access-permission="public"></has-action>
<has-action action="checkCarUsedAction" access-permission="public"></has-action>
<has-action action="queryCACarBasicInfoAction" access-permission="public"></has-action>
<has-action action="queryCADriverBasicInfoAction" access-permission="public"></has-action>
<has-action action="queryCACarDriverInfoAction" access-permission="public"></has-action>
<has-action action="sqlQueryAction" access-permission="public"></has-action>
</process> 
</model>
