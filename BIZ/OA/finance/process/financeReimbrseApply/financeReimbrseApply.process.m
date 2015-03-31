<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="financeReimbrseApplyProcess" start="start1" end="end1"> 
    <label language="zh_CN">报销申请</label>  
    <place name="start1"> 
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <token name="init"/>  
    <business-activity name="createActivity" condition="true"> 
      <label language="zh_CN">报销申请</label>  
      <input name="x" unit="start1"/>  
      <output name="x" unit="deptActivity"/> 
    
<execute-rule condition="isStartingProcess()" task-assign-mode="together"><executor-range range-expr="currentPersonMember()" default-expr="currentPersonMember()"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【',currentProcessLabelOfProcessContext(),':',currentActivityLabelOfProcessContext(),'】','报销人： ',relationValue('OA_FC_ReimbApplyM',:sData1,'','','fLoanPsnName','/OA/finance/data'),'（报销金额：',toString(relationValue('OA_FC_ReimbApplyM',:sData1,'','','fReimAmt','/OA/finance/data')),'元）','单号： ',relationValue('OA_FC_ReimbApplyM',:sData1,'','','fNO','/OA/finance/data'))
</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="deptActivity" condition="true"> 
      <label language="zh_CN">部门领导审批</label>  
      <input name="x" unit="createActivity"/>  
        
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true"
        back-range="specified"> 
        <to activity="createActivity"/> 
      </back-rule> 
    

<output name="x" unit="xor1"></output>










<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivityInAEDept('createActivity',true)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【',currentProcessLabelOfProcessContext(),':',currentActivityLabelOfProcessContext(),'】','报销人： ',relationValue('OA_FC_ReimbApplyM',:sData1,'','','fLoanPsnName','/OA/finance/data'),'（报销金额：',toString(relationValue('OA_FC_ReimbApplyM',:sData1,'','','fReimAmt','/OA/finance/data')),'元）','单号： ',relationValue('OA_FC_ReimbApplyM',:sData1,'','','fNO','/OA/finance/data'))
</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="propertyActivity" condition="true"> 
      <label language="zh_CN">分管领导审批</label>  
        
      <output name="x" unit="cashiActivity"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true"
        back-range="specified"> 
        <to activity="createActivity"/> 
      </back-rule> 
    






<input name="x" unit="xor1"></input>









<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('', false)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【',currentProcessLabelOfProcessContext(),':',currentActivityLabelOfProcessContext(),'】','报销人： ',relationValue('OA_FC_ReimbApplyM',:sData1,'','','fLoanPsnName','/OA/finance/data'),'（报销金额：',toString(relationValue('OA_FC_ReimbApplyM',:sData1,'','','fReimAmt','/OA/finance/data')),'元）','单号： ',relationValue('OA_FC_ReimbApplyM',:sData1,'','','fNO','/OA/finance/data'))
</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="cashiActivity" condition="true"> 
      <label language="zh_CN">财务出纳</label>  
      <input name="x" unit="propertyActivity"/>  
      <output name="x" unit="end1"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true"
        back-range="specified"> 
        <to activity="createActivity"/> 
      </back-rule> 
    
<input name="x" unit="xor1"></input>





<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('',  true )" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【',currentProcessLabelOfProcessContext(),':',currentActivityLabelOfProcessContext(),'】','报销人： ',relationValue('OA_FC_ReimbApplyM',:sData1,'','','fLoanPsnName','/OA/finance/data'),'（报销金额：',toString(relationValue('OA_FC_ReimbApplyM',:sData1,'','','fReimAmt','/OA/finance/data')),'元）','单号： ',relationValue('OA_FC_ReimbApplyM',:sData1,'','','fNO','/OA/finance/data'))
</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <place name="end1"> 
      <label language="zh_CN">结束</label> 
    </place>  
    <listener action="finishProcessAction" event="after" handler="financeReimbrseApplyProcessAfterFinishProcedure"/>  
    <static-activity name="startActivity"> 
      <label language="zh_CN">报销申请</label> 
    </static-activity>  
    <static-activity name="noticeActivity"> 
      <label language="zh_CN">报销申请通知</label> 
    </static-activity>  
    <notice-rule condition="true" dialog-enabled="true" save-enabled="false" task-assign-mode="together"> 
      <occasion>finishProcess</occasion>  
      <executor-range range-expr="findActivityExecutor('createActivity')" default-expr="findActivityExecutor('createActivity')"> 
        <kind>PSM</kind> 
      </executor-range>  
      <task-relation-value> 
        <item relation="sPreemptMode">'tpmOpen'</item>  
        <item relation="sEURL">'/OA/finance/process/financeReimbrseApply/noticeActivity.w'</item>  
        <item relation="sExecuteMode">'temPreempt'</item>  
        <item relation="sExecuteMode2">'finishWhenOpen'</item>  
        <item relation="sName">'通知:报销申请'</item> 
      </task-relation-value> 
    </notice-rule>  
    <has-action action="createFCReimbApplyMAction" access-permission="public"/>  
    <has-action action="queryFCReimbApplyMAction" access-permission="public"/>  
    <has-action action="saveFCReimbApplyMAction" access-permission="public"/>  
    <has-action action="createFCReimbApplyDAction" access-permission="public"/>  
    <has-action action="queryFCReimbApplyDAction" access-permission="public"/>  
    <has-action action="saveFCReimbApplyDAction" access-permission="public"/>  
    <has-action action="queryOA_Pub_BaseCodeAction" access-permission="public"/>  
    <has-action action="queryFCLoanApplyAction" access-permission="public"/> 
    <has-action action="sqlQueryAction">
    	<public name="dataModel" type="String" value="/OA/finance/data" />
    </has-action>
  <place name="xor1"><label language="zh_CN">XOR</label>
</place>
</process> 
</model>
