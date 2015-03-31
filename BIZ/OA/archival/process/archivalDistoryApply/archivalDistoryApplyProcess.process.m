<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="archivalDistoryApplyProcess" start="start1" end="end1"> 
    <label language="zh_CN">档案销毁申请</label>  
    <place name="start1"> 
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <token name="init"/>  
    <business-activity name="applyActivity" condition="true"> 
      <label language="zh_CN">销毁申请</label>  
      <input name="x" unit="start1"/>  
      <output name="x" unit="directorActivity"/> 
    </business-activity>  
    <business-activity name="directorActivity" condition="true"> 
      <label language="zh_CN">销毁审批</label>  
      <input name="x" unit="applyActivity"/>  
      <output name="x" unit="confirmActivity"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" > 
        <to activity="applyActivity"/> 
      </back-rule> 
    </business-activity>  
    <business-activity name="confirmActivity" condition="true"> 
      <label language="zh_CN">销毁确认</label>  
      <input name="x" unit="directorActivity"/>  
      <output name="x" unit="end1"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" > 
        <to activity="applyActivity"/> 
      </back-rule> 
    </business-activity>  
    <place name="end1"> 
      <label language="zh_CN">结束</label> 
    </place>  
    <static-activity name="startActivity"> 
      <label language="zh_CN">档案销毁申请</label> 
    </static-activity>  
    <static-activity name="noticeActivity"> 
      <label language="zh_CN">档案销毁通知</label> 
    </static-activity>  
    <listener action="finishProcessAction" event="after" handler="archivalDistoryApplyProcessAfterFinishProcedure"/>  
    <notice-rule condition="true" dialog-enabled="true" save-enabled="false" task-assign-mode="singleness"> 
      <occasion>finishProcess</occasion>  
      <executor-range range-expr="findActivityExecutor('START')" default-expr="findActivityExecutor('START')"> 
        <kind>PSM</kind> 
      </executor-range>  
      <task-relation-value> 
        <item relation="sEURL">'/OA/archival/process/archivalDistoryApply/noticeActivity.w'</item>  
        <item relation="sExecuteMode2">'finishWhenOpen'</item>  
        <item relation="sName">'通知:档案销毁申请'</item> 
      </task-relation-value> 
    </notice-rule>  
    <has-action action="createAMDistoryApplyMAction" />  
    <has-action action="queryAMDistoryApplyMAction" />  
    <has-action action="saveAMDistoryApplyMAction" />  
    <has-action action="createAMDistoryApplyDAction" />  
    <has-action action="queryAMDistoryApplyDAction" />  
    <has-action action="saveAMDistoryApplyDAction" />  
    <has-action action="queryAMDistoryApplyDWithArchivalAction" />  
    <has-action action="queryAMArchivalAction" />  
    <has-action action="getDistoryInfoAction" /> 
    <has-action action="getNodeInfoAction"/> 
  </process> 
</model>
