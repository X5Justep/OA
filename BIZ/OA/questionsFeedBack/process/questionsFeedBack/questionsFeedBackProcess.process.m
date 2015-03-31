<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="questionsFeedBackProcess" start="start1" end="end1"> 
    <label language="zh_CN">问题反馈</label>  
      
    <place name="start1"> 
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <token name="init"/>  
    <business-activity name="applyActivity" condition="true"> 
      <label language="zh_CN">问题反馈</label>  
      <input name="x" unit="start1"/>  
      <output name="x" unit="approveActivity"/> 
    </business-activity>  
    <business-activity name="approveActivity" condition="true"> 
      <label language="zh_CN">问题审核</label>  
      <input name="x" unit="applyActivity"/>  
      <output name="x" unit="dealActivity"/> 
    <listener action="advanceProcessAction" event="before" handler="approveActivityBeforeAdvanceProcedure"></listener>
<listener action="backProcessAction" event="before" handler="approveActivityBeforeBackProcedure"></listener>
<listener action="advanceProcessAction" event="after" handler="approveActivityAfterAdvanceProcedure"></listener>
</business-activity>  
    <business-activity name="dealActivity" condition="true"> 
      <label language="zh_CN">问题处理</label>  
      <input name="x" unit="approveActivity"/>  
      <output name="x" unit="xor1"/> 
    </business-activity>  
    <place name="xor1"> 
      <label language="zh_CN">XOR</label> 
    </place>  
    <business-activity name="ensureActivity" condition="true"> 
      <label language="zh_CN">确认复核</label>  
      <input name="x" unit="xor1"/>  
      <output name="x" unit="end1"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true"
        back-range="specified" then-flow-mode="flowToAgain"> 
        <to activity="dealActivity"/> 
      </back-rule> 
    <listener action="backProcessAction" event="after" handler="ensureActivityAfterBackProcedure"></listener>
</business-activity>  
    <place name="end1"> 
      <label language="zh_CN">结束</label> 
    </place>  
    <arc name="x" from="xor1" to="end1"/>  
      
      
      
      
     
    
  <listener action="abortProcessAction" event="before" handler="questionsFeedBackProcessBeforeAbortProcedure"></listener>
<listener action="finishProcessAction" event="before" handler="questionsFeedBackProcessBeforeFinishProcedure"></listener>
<static-activity name="mainActivity"><label language="zh_CN">问题反馈</label>
</static-activity>
<static-activity name="noticeActivity"/>

<notice-rule condition="true" dialog-enabled="true" save-enabled="false" task-assign-mode="singleness"><occasion>abortProcess</occasion>
<occasion>finishProcess</occasion>
<executor-range range-expr="findActivityExecutor('START')" default-expr="findActivityExecutor('START')"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sEURL">'/OA/questionsFeedBack/process/questionsFeedBack/noticeActivity.w'</item>
<item relation="sExecuteMode2">'finishWhenOpen'</item>
<item relation="sName">'通知:问题反馈'</item>
</task-relation-value>
</notice-rule>





<has-action action="queryOA_QB_QuestionsFeedBackAction" access-permission="public"></has-action>
<has-action action="saveOA_QB_QuestionsFeedBackAction" access-permission="public"></has-action>
<has-action action="createOA_QB_QuestionsFeedBackAction" access-permission="public"></has-action>
<has-action action="queryOA_QB_ModulesAction" access-permission="public"></has-action>
<has-action action="queryProjectNameAction" access-permission="public"></has-action>
<has-action action="queryOA_Pub_BaseCodeAction" access-permission="public"></has-action>
</process> 
</model>
