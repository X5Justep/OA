<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="officeSupplyBuyApplyProcess" start="start1" end="end1"> 
    <label language="zh_CN">办公用品请购申请</label>  
    <static-activity name="startActivity"> 
      <label language="zh_CN">办公用品请购</label> 
    </static-activity>  
    <static-activity name="noticeActivity"> 
      <label language="zh_CN">办公用品请购通知</label> 
    </static-activity>  
    <has-action action="createOSCBuyApplyMAction" access-permission="public" data-model="/OA/officeSupplyConsumables/data"/>  
    <has-action action="queryOSCBuyApplyMAction" access-permission="public" data-model="/OA/officeSupplyConsumables/data"/>  
    <has-action action="saveOSCBuyApplyMAction" access-permission="public" data-model="/OA/officeSupplyConsumables/data"/>  
    <has-action action="createOSCBuyApplyDAction" access-permission="public" data-model="/OA/officeSupplyConsumables/data"/>  
    <has-action action="queryOSCBuyApplyDAction" access-permission="public" data-model="/OA/officeSupplyConsumables/data"/>  
    <has-action action="saveOSCBuyApplyDAction" access-permission="public" data-model="/OA/officeSupplyConsumables/data"/>  
    <has-action action="queryOSCBaseInfoAction" access-permission="public" data-model="/OA/officeSupplyConsumables/data"/>  
    <token name="init"/>  
    <listener action="finishProcessAction" event="after" handler="officeSupplyBuyApplyProcessAfterFinishProcedure"/>  
    <place name="start1"> 
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <business-activity name="buyApplyActivity" condition="true"> 
      <label language="zh_CN">办公用品请购申请</label>  
      <input name="x" unit="start1"/>  
      <output name="x" unit="officeDirectorActivity"/> 
    


<execute-rule condition="isStartingProcess()" task-assign-mode="together"><executor-range range-expr="currentPersonMember()" default-expr="currentPersonMember()"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【',currentProcessLabelOfProcessContext(),':',currentActivityLabelOfProcessContext(),'】','申请人： ',relationValue('OA_OSC_BuyApplyM',:sData1,'','','fApplyPsnName','/OA/officeSupplyConsumables/data'),'（采购金额：',toString(relationValue('OA_OSC_BuyApplyM',:sData1,'','','fConsultAmount','/OA/officeSupplyConsumables/data')),'元）','单号： ',relationValue('OA_OSC_BuyApplyM',:sData1,'','','fNO','/OA/officeSupplyConsumables/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="officeDirectorActivity" condition="true"> 
      <label language="zh_CN">办公室主任审批</label>  
      <input name="x" unit="buyApplyActivity"/>  
      <output name="x" unit="financeDirectorActivity"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" > 
        <to activity="buyApplyActivity"/> 
      </back-rule> 
    










<execute-rule condition="true" task-assign-mode="singleness"><executor-range range-expr="findOrgUnitsHasCActivity('',  true )" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sName">concat('【',currentProcessLabelOfProcessContext(),':',currentActivityLabelOfProcessContext(),'】','申请人： ',relationValue('OA_OSC_BuyApplyM',:sData1,'','','fApplyPsnName','/OA/officeSupplyConsumables/data'),'（采购金额：',toString(relationValue('OA_OSC_BuyApplyM',:sData1,'','','fConsultAmount','/OA/officeSupplyConsumables/data')),'元）','单号： ',relationValue('OA_OSC_BuyApplyM',:sData1,'','','fNO','/OA/officeSupplyConsumables/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="financeDirectorActivity" condition="true"> 
      <label language="zh_CN">财务部审批</label>  
      <input name="x" unit="officeDirectorActivity"/>  
      <output name="x" unit="managerApprovalActivity"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" > 
        <to activity="buyApplyActivity"/> 
      </back-rule> 
    









<execute-rule condition="true" task-assign-mode="singleness"><executor-range range-expr="findOrgUnitsHasCActivity('', true)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sName">concat('【',currentProcessLabelOfProcessContext(),':',currentActivityLabelOfProcessContext(),'】','申请人： ',relationValue('OA_OSC_BuyApplyM',:sData1,'','','fApplyPsnName','/OA/officeSupplyConsumables/data'),'（采购金额：',toString(relationValue('OA_OSC_BuyApplyM',:sData1,'','','fConsultAmount','/OA/officeSupplyConsumables/data')),'元）','单号： ',relationValue('OA_OSC_BuyApplyM',:sData1,'','','fNO','/OA/officeSupplyConsumables/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="managerApprovalActivity" condition="true"> 
      <label language="zh_CN"> 分管领导批准</label>  
      <input name="x" unit="financeDirectorActivity"/>  
      <output name="x" unit="procurementActivity"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" > 
        <to activity="buyApplyActivity"/> 
      </back-rule> 
    









<execute-rule condition="true" task-assign-mode="singleness"><executor-range range-expr="findOrgUnitsHasCActivity('', true)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sName">concat('【',currentProcessLabelOfProcessContext(),':',currentActivityLabelOfProcessContext(),'】','申请人： ',relationValue('OA_OSC_BuyApplyM',:sData1,'','','fApplyPsnName','/OA/officeSupplyConsumables/data'),'（采购金额：',toString(relationValue('OA_OSC_BuyApplyM',:sData1,'','','fConsultAmount','/OA/officeSupplyConsumables/data')),'元）','单号： ',relationValue('OA_OSC_BuyApplyM',:sData1,'','','fNO','/OA/officeSupplyConsumables/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="procurementActivity" condition="true"> 
      <label language="zh_CN">办公用品采购</label>  
      <input name="x" unit="managerApprovalActivity"/>  
      <output name="x" unit="end1"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" > 
        <to activity="buyApplyActivity"/> 
      </back-rule> 
    
















<advance-rule condition="true" dialog-enabled="false" save-enabled="false" jump-enabled="false" customized-enabled="false" ignore-execute-mode="false" task-wait="false" task-join="false"></advance-rule>



<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('',  true)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【',currentProcessLabelOfProcessContext(),':',currentActivityLabelOfProcessContext(),'】','申请人： ',relationValue('OA_OSC_BuyApplyM',:sData1,'','','fApplyPsnName','/OA/officeSupplyConsumables/data'),'（采购金额：',toString(relationValue('OA_OSC_BuyApplyM',:sData1,'','','fConsultAmount','/OA/officeSupplyConsumables/data')),'元）','单号： ',relationValue('OA_OSC_BuyApplyM',:sData1,'','','fNO','/OA/officeSupplyConsumables/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <place name="end1"> 
      <label language="zh_CN">结束</label> 
    </place>  
    <notice-rule condition="true" dialog-enabled="true" save-enabled="false">
      <occasion>finishProcess</occasion>  
      <executor-range range-expr="findActivityExecutor('buyApplyActivity')" default-expr="findActivityExecutor('buyApplyActivity')">
        <kind>PSM</kind> 
      </executor-range>  
      <task-relation-value>
      	<item relation="sPreemptMode">'tpmOpen'</item>  
        <item relation="sEURL">'/OA/officeSupplyConsumables/process/officeSupplyBuyApply/noticeActivity.w'</item>
        <item relation="sExecuteMode">'temPreempt'</item>  
        <item relation="sExecuteMode2">'finishWhenOpen'</item>  
        <item relation="sName">'通知:办公用品请购申请'</item> 
      </task-relation-value> 
    </notice-rule> 
  </process> 
</model>
