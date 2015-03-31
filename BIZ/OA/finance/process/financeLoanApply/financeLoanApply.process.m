<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="financeLoanApplyProcess" start="start1" end="end1"> 
    <label language="zh_CN">借款申请</label>  
    <place name="start1"> 
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <token name="init"/>  
    <business-activity name="createActivity" condition="true"> 
      <label language="zh_CN">借款申请</label>  
      <input name="x" unit="start1"/>  
      <output name="x" unit="deptActivity"/> 
    

<execute-rule condition="isStartingProcess()" task-assign-mode="together"><executor-range range-expr="currentPersonMember()" default-expr="currentPersonMember()"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【',currentProcessLabelOfProcessContext(),':',currentActivityLabelOfProcessContext(),'】','借款人： ',relationValue('OA_FC_LoanApply',:sData1,'','','fLoanPsnName','/OA/finance/data'),'（借款金额：',toString(relationValue('OA_FC_LoanApply',:sData1,'','','fLoanAmt','/OA/finance/data')),'元）','单号： ',relationValue('OA_FC_LoanApply',:sData1,'','','fNO','/OA/finance/data'))
</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="deptActivity" condition="true"> 
      <label language="zh_CN">部门审批</label>  
      <input name="x" unit="createActivity"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true"
        back-range="specified"> 
        <to activity="createActivity"/> 
      </back-rule>  
      <output name="x" unit="chargeActivity"/> 
    




<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivityInAEDept('createActivity',true)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【',currentProcessLabelOfProcessContext(),':',currentActivityLabelOfProcessContext(),'】','借款人： ',relationValue('OA_FC_LoanApply',:sData1,'','','fLoanPsnName','/OA/finance/data'),'（借款金额：',toString(relationValue('OA_FC_LoanApply',:sData1,'','','fLoanAmt','/OA/finance/data')),'元）','单号： ',relationValue('OA_FC_LoanApply',:sData1,'','','fNO','/OA/finance/data'))
</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="financeActivity" condition="true"> 
      <label language="zh_CN">财务主任</label>  
      <output name="x" unit="cashiActivity"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true"
        back-range="specified"> 
        <to activity="createActivity"/> 
      </back-rule>  
      <input name="x" unit="chargeActivity"/> 
    







<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('',  true )" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【',currentProcessLabelOfProcessContext(),':',currentActivityLabelOfProcessContext(),'】','借款人： ',relationValue('OA_FC_LoanApply',:sData1,'','','fLoanPsnName','/OA/finance/data'),'（借款金额：',toString(relationValue('OA_FC_LoanApply',:sData1,'','','fLoanAmt','/OA/finance/data')),'元）','单号： ',relationValue('OA_FC_LoanApply',:sData1,'','','fNO','/OA/finance/data'))
</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="cashiActivity" condition="true"> 
      <label language="zh_CN">财务出纳</label>  
      <input name="x" unit="financeActivity"/>  
      <output name="x" unit="end1"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true"
        back-range="specified"> 
        <to activity="createActivity"/> 
      </back-rule> 
    






<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('',  true)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【',currentProcessLabelOfProcessContext(),':',currentActivityLabelOfProcessContext(),'】','借款人： ',relationValue('OA_FC_LoanApply',:sData1,'','','fLoanPsnName','/OA/finance/data'),'（借款金额：',toString(relationValue('OA_FC_LoanApply',:sData1,'','','fLoanAmt','/OA/finance/data')),'元）','单号： ',relationValue('OA_FC_LoanApply',:sData1,'','','fNO','/OA/finance/data'))
</item>
</task-relation-value>
</execute-rule>
<advance-rule condition="true" dialog-enabled="false" save-enabled="false" jump-enabled="false" customized-enabled="false" ignore-execute-mode="false" task-wait="false" task-join="false"></advance-rule>
</business-activity>  
    <place name="end1"> 
      <label language="zh_CN">结束</label> 
    </place>  
    <has-action action="queryOA_Pub_BaseCodeAction" access-permission="public"/>  
    <has-action action="createFCLoanApplyAction" access-permission="public"/>  
    <has-action action="queryFCLoanApplyAction" access-permission="public"/>  
    <has-action action="saveFCLoanApplyAction" access-permission="public"/>  
    <has-action action="sqlQueryAction">
    	<public name="dataModel" type="String" value="/OA/finance/data" />
    </has-action>
    <static-activity name="startActivity"> 
      <label language="zh_CN">借款申请</label> 
    </static-activity>  
    <static-activity name="noticeActivity"> 
      <label language="zh_CN">借款申请通知</label> 
    </static-activity>  
      
    <business-activity name="chargeActivity" condition="true">
      <label language="zh_CN">分管领导审批</label>  
      <input name="x" unit="deptActivity"/>  
      <output name="x" unit="financeActivity"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true"
        back-range="specified">
        <to activity="createActivity"/> 
      </back-rule> 
    









<advance-rule condition="true" dialog-enabled="true" save-enabled="false" jump-enabled="false" customized-enabled="false" ignore-execute-mode="false" task-wait="false" task-join="false"></advance-rule>
<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('', false)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【',currentProcessLabelOfProcessContext(),':',currentActivityLabelOfProcessContext(),'】','借款人： ',relationValue('OA_FC_LoanApply',:sData1,'','','fLoanPsnName','/OA/finance/data'),'（借款金额：',toString(relationValue('OA_FC_LoanApply',:sData1,'','','fLoanAmt','/OA/finance/data')),'元）','单号： ',relationValue('OA_FC_LoanApply',:sData1,'','','fNO','/OA/finance/data'))
</item>
</task-relation-value>
</execute-rule>
</business-activity> 
  
<notice-rule condition="true" dialog-enabled="true" save-enabled="false" task-assign-mode="singleness"><occasion>finishProcess</occasion>
<executor-range range-expr="findActivityExecutor('createActivity')" default-expr="findActivityExecutor('createActivity')"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sEURL">'/OA/finance/process/financeLoanApply/noticeActivity.w'</item>
<item relation="sExecuteMode2">'finishWhenOpen'</item>
<item relation="sName">concat('通知:','【',currentProcessLabelOfProcessContext(),':',currentActivityLabelOfProcessContext(),'】','借款人： ',relationValue('OA_FC_LoanApply',:sData1,'','','fLoanPsnName','/OA/finance/data'),'（借款金额：',toString(relationValue('OA_FC_LoanApply',:sData1,'','','fLoanAmt','/OA/finance/data')),'元）','单号： ',relationValue('OA_FC_LoanApply',:sData1,'','','fNO','/OA/finance/data'))
</item>
</task-relation-value>
</notice-rule>
</process> 
</model>
