<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="bookBorrowApplyProcess" start="start1" end="end1"> 
    <label language="zh_CN">图书借阅申请</label>  
    <static-activity name="mainActivity"> 
      <label language="zh_CN">图书借阅申请</label> 
    </static-activity>  
      
      
      
      
      
      
      
      
    
    <place name="start1"> 
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <token name="init"/>  
    <business-activity name="bookBorrowApplyActivity" condition="true"> 
      <label language="zh_CN">图书借阅申请</label>  
      <input name="x" unit="start1"/>  
      <output name="x" unit="managerActivity"/> 
    </business-activity>  
    <business-activity name="managerActivity" condition="true"> 
      <label language="zh_CN">主管人办理</label>  
      <input name="x" unit="bookBorrowApplyActivity"/>  
      <output name="x" unit="end1"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" > 
        <to activity="bookBorrowApplyActivity"/> 
      </back-rule>  
      <execute-rule condition="true" task-assign-mode="together">
        <executor-range range-expr="findOrgUnitsHasCActivity('',true)" default-expr="">
          <kind>PSM</kind> 
        </executor-range>  
        <task-relation-value>
          <item relation="sPreemptMode">'tpmOpen'</item>  
          <item relation="sExecuteMode">'temPreempt'</item>  
          <item relation="sName">'主管人办理:图书借阅申请'</item> 
        </task-relation-value> 
      </execute-rule> 
    </business-activity>  
    <place name="end1"> 
      <label language="zh_CN">结束</label> 
    </place>  
     
  <listener action="finishProcessAction" event="after" handler="bookBorrowApplyProcessAfterFinishProcedure"></listener>













<has-action action="createBKBookApplyMAction" access-permission="public"></has-action>
<has-action action="queryBKBookApplyMAction" access-permission="public"></has-action>
<has-action action="saveBKBookApplyMAction" access-permission="public"></has-action>
<has-action action="createBookApplyDAction" access-permission="public"></has-action>
<has-action action="queryBKBookApplyDAction" access-permission="public"></has-action>
<has-action action="saveBKBookApplyDAction" access-permission="public"></has-action>
<has-action action="queryBKBookInfoAction" access-permission="public"></has-action>
<has-action action="isBookStatusAction" access-permission="public"></has-action>
<has-action action="AppendBookAction" access-permission="public"></has-action>
<has-action action="queryBKBookApplyDetailAction" access-permission="public"></has-action>
<static-activity name="noticeActivity"><label language="zh_CN">图书借阅通知</label>
</static-activity>

<notice-rule condition="true" dialog-enabled="true" save-enabled="false" task-assign-mode="singleness"><occasion>finishProcess</occasion>
<executor-range range-expr="findActivityCreator('bookBorrowApplyActivity')" default-expr="findActivityCreator('bookBorrowApplyActivity')"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sExecuteMode2">'finishWhenOpen'</item>
<item relation="sEURL">'/OA/book/process/bookBorrowApply/noticeActivity.a'</item>
<item relation="sName">'通知:图书借阅申请--已完成'</item>
</task-relation-value>
</notice-rule>
</process> 
</model>
