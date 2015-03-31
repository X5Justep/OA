<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="officeSupplyUseApplyProcess" start="start1" end="end1"> 
    <label language="zh_CN">办公用品领用申请</label>  
    <static-activity name="startActivity"> 
      <label language="zh_CN">办公用品领用申请</label> 
    </static-activity>  
    <place name="start1"> 
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <static-activity name="noticeActivity"> 
      <label language="zh_CN">办公用品领用通知</label> 
    </static-activity>  
    <has-action action="createOSCUseApplyMAction" access-permission="public"/>  
    <has-action action="queryOSCUseApplyMAction" access-permission="public"/>  
    <has-action action="saveOSCUseApplyMAction" access-permission="public"/>  
    <has-action action="createOSCUseApplyDAction" access-permission="public"/>  
    <has-action action="queryOSCUseApplyDAction" access-permission="public"/>  
    <has-action action="saveOSCUseApplyDAction" access-permission="public"/>  
    <has-action action="queryOSCBaseInfoAction" access-permission="public"/>  
    <has-action action="canUseAction" access-permission="public"/>  
    <token name="init"/>  
    <business-activity name="useApplyActivity" condition="true"> 
      <label language="zh_CN">领用申请</label>  
      <input name="x" unit="start1"/>  
      <output name="x" unit="deptHeaderActivity"/> 
    

<execute-rule condition="isStartingProcess()" task-assign-mode="together"><executor-range range-expr="currentPersonMember()" default-expr="currentPersonMember()"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【',currentProcessLabelOfProcessContext(),':',currentActivityLabelOfProcessContext(),'】','申请部门： ',relationValue('OA_OSC_UseApplyM',:sData1,'','','fApplyDeptName','/OA/officeSupplyConsumables/data'),'（需求日期：',toString(relationValue('OA_OSC_UseApplyM',:sData1,'','','fDemandDate','/OA/officeSupplyConsumables/data')),'）','单号： ',relationValue('OA_OSC_UseApplyM',:sData1,'','','fNO','/OA/officeSupplyConsumables/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="deptHeaderActivity" condition="true"> 
      <label language="zh_CN">部门领导审批</label>  
      <input name="x" unit="useApplyActivity"/>  
      <output name="x" unit="releaseActivity"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" >
        <to activity="useApplyActivity"/> 
      </back-rule> 
    






<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivityInAEDept('useApplyActivity',true)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【',currentProcessLabelOfProcessContext(),':',currentActivityLabelOfProcessContext(),'】','申请部门： ',relationValue('OA_OSC_UseApplyM',:sData1,'','','fApplyDeptName','/OA/officeSupplyConsumables/data'),'（需求日期：',toString(relationValue('OA_OSC_UseApplyM',:sData1,'','','fDemandDate','/OA/officeSupplyConsumables/data')),'）','单号： ',relationValue('OA_OSC_UseApplyM',:sData1,'','','fNO','/OA/officeSupplyConsumables/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="releaseActivity" condition="true"> 
      <label language="zh_CN">签收</label>  
      <input name="x" unit="deptHeaderActivity"/>  
      <output name="x" unit="end1"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" >
        <to activity="useApplyActivity"/> 
      </back-rule> 
    


<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('',  true )" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sExecuteMode">'temSimultaneous'</item>
<item relation="sName">concat('【',currentProcessLabelOfProcessContext(),':',currentActivityLabelOfProcessContext(),'】','申请部门： ',relationValue('OA_OSC_UseApplyM',:sData1,'','','fApplyDeptName','/OA/officeSupplyConsumables/data'),'（需求日期：',toString(relationValue('OA_OSC_UseApplyM',:sData1,'','','fDemandDate','/OA/officeSupplyConsumables/data')),'）','单号： ',relationValue('OA_OSC_UseApplyM',:sData1,'','','fNO','/OA/officeSupplyConsumables/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <place name="end1"> 
      <label language="zh_CN">结束</label> 
    </place>  
      
    <listener action="finishProcessAction" event="after" handler="officeSupplyUseApplyProcessAfterFinishProcedure"/> 
  <notice-rule condition="true" dialog-enabled="true" save-enabled="false" task-assign-mode="singleness"><occasion>finishProcess</occasion>
<executor-range range-expr="findActivityExecutor('useApplyActivity')" default-expr="findActivityExecutor('useApplyActivity')"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sEURL">'/OA/officeSupplyConsumables/process/officeSupplyUseApply/noticeActivity.w'</item>
<item relation="sExecuteMode2">'finishWhenOpen'</item>
<item relation="sName">concat('通知:','【',currentProcessLabelOfProcessContext(),':',currentActivityLabelOfProcessContext(),'】','申请部门： ',relationValue('OA_OSC_UseApplyM',:sData1,'','','fApplyDeptName','/OA/officeSupplyConsumables/data'),'（需求日期：',toString(relationValue('OA_OSC_UseApplyM',:sData1,'','','fDemandDate','/OA/officeSupplyConsumables/data')),'）','单号： ',relationValue('OA_OSC_UseApplyM',:sData1,'','','fNO','/OA/officeSupplyConsumables/data'))</item>
</task-relation-value>
</notice-rule>
</process> 
</model>
