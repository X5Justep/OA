<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="archivalBorrowApplyProcess" start="start1" end="end1"> 
    <label language="zh_CN">档案借阅申请</label>  
    <place name="start1"> 
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <token name="init"/>  
    <business-activity name="applyActivity" condition="true"> 
      <label language="zh_CN">借阅申请</label>  
      <input name="x" unit="start1"/>  
      <output name="x" unit="directorActivity"/> 
    
<execute-rule condition="isStartingProcess()" task-assign-mode="together"><executor-range range-expr="currentPersonMember()" default-expr="currentPersonMember()"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【',currentProcessLabelOfProcessContext(),':',currentActivityLabelOfProcessContext(),'】','借阅人： ',relationValue('OA_AM_BorrowApplyM',:sData1,'','','fBorrowPsnName','/OA/archival/data'),'（借阅时间：',toString(relationValue('OA_AM_BorrowApplyM',:sData1,'','','fBorrowTime','/OA/archival/data')))
</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="directorActivity" condition="true"> 
      <label language="zh_CN">档案室审批</label>  
      <input name="x" unit="applyActivity"/>  
      <output name="x" unit="xor1"/> 
    

<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('', false)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【',currentProcessLabelOfProcessContext(),':',currentActivityLabelOfProcessContext(),'】','借阅人： ',relationValue('OA_AM_BorrowApplyM',:sData1,'','','fBorrowPsnName','/OA/archival/data'),'（借阅时间：',toString(relationValue('OA_AM_BorrowApplyM',:sData1,'','','fBorrowTime','/OA/archival/data')),'）')
</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <place name="xor1"> 
      <label language="zh_CN">XOR</label> 
    </place>  
    <business-activity name="confirmActivity" condition="true"> 
      <label language="zh_CN">借阅确认</label>  
      <input name="x" unit="xor1"/>  
      <output name="x" unit="end1"/>  
      <input name="x" unit="applyConfirmActivity"/> 
    

<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('', false)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【',currentProcessLabelOfProcessContext(),':',currentActivityLabelOfProcessContext(),'】','借阅人： ',relationValue('OA_AM_BorrowApplyM',:sData1,'','','fBorrowPsnName','/OA/archival/data'),'（借阅时间：',toString(relationValue('OA_AM_BorrowApplyM',:sData1,'','','fBorrowTime','/OA/archival/data')),'）')
</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <place name="end1"> 
      <label language="zh_CN">结束</label> 
    </place>  
    <business-activity name="applyConfirmActivity" condition="true"> 
      <label language="zh_CN">申请人确认</label>  
      <input name="x" unit="xor1"/>  
      <output name="x" unit="confirmActivity"/>  
       
    


<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findActivityExecutor('applyActivity')" default-expr="findActivityExecutor('applyActivity')"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【',currentProcessLabelOfProcessContext(),':',currentActivityLabelOfProcessContext(),'】','借阅人： ',relationValue('OA_AM_BorrowApplyM',:sData1,'','','fBorrowPsnName','/OA/archival/data'),'（借阅时间：',toString(relationValue('OA_AM_BorrowApplyM',:sData1,'','','fBorrowTime','/OA/archival/data')),'）')
</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <listener action="finishProcessAction" event="after" handler="archivalBorrowApplyProcessAfterFinishProcedure"/>  
    <static-activity name="startActivity"> 
      <label language="zh_CN">档案借阅申请</label> 
    </static-activity>  
    <static-activity name="noticeActivity"> 
      <label language="zh_CN">档案借阅通知</label> 
    </static-activity>  
    <notice-rule condition="true" dialog-enabled="true" save-enabled="false" task-assign-mode="singleness"> 
      <occasion>finishProcess</occasion>  
      <executor-range range-expr="findActivityExecutor('START')" default-expr="findActivityExecutor('START')"> 
        <kind>PSM</kind> 
      </executor-range>  
      <task-relation-value> 
        <item relation="sEURL">'/OA/archival/process/archivalBorrowApply/noticeActivity.w'</item>  
        <item relation="sExecuteMode2">'finishWhenOpen'</item>  
        <item relation="sName">'通知:档案借阅申请'</item> 
      </task-relation-value> 
    </notice-rule>  
    <has-action action="createAMBorrowApplyMAction"/>  
    <has-action action="queryAMBorrowApplyMAction"/>  
    <has-action action="saveAMBorrowApplyMAction"/>  
    <has-action action="createAMBorrowApplyDAction"/>  
    <has-action action="queryAMBorrowApplyDAction"/>  
    <has-action action="saveAMBorrowApplyDAction"/>  
    <has-action action="queryAMBorrowApplyDWithArchivalAction"/>  
    <has-action action="queryAMArchivalAction"/>  
    <has-action action="getBorrowInfoAction"/> 
    <has-action action="getNodeInfoAction"/> 
  </process> 
</model>
