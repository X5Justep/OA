<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="receiveDocProcess" start="start1" end="end1"> 
    <label language="zh_CN">公文业务流程</label>  
    <static-activity name="startActivity"> 
      <label language="zh_CN">收文登记</label> 
    </static-activity>  
    <place name="start1"> 
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <token name="init"/>  
    <business-activity name="regActivity" condition="true"> 
      <label language="zh_CN">收文登记</label>  
      <input name="x" unit="start1"/>  
      <output name="x" unit="draftActivity"/> 
    



<back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" then-flow-mode="flowToAgain"><to activity="regActivity"></to>
</back-rule>
<execute-rule condition="isStartingProcess()" task-assign-mode="together"><executor-range range-expr="currentPersonMember()" default-expr="currentPersonMember()"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【收文:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'),'（收文日期：',toString(relationValue('OA_DC_Doc',:sData1,'','','fIssueDate','/OA/doc/data')),'）','单号： ',relationValue('OA_DC_Doc',:sData1,'','','fExtendStr1','/OA/doc/data'))
</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="draftActivity" condition="true"> 
      <label language="zh_CN">拟办</label>  
      <input name="x" unit="regActivity"/>  
      <output name="x" unit="secretaryActivity"/>  
      <advance-rule condition="true" dialog-enabled="false" save-enabled="false" jump-enabled="false"
        customized-enabled="false" ignore-execute-mode="false" task-wait="false" task-join="false"/>  
       
    

<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('',true)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【收文:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'),'（收文日期：',toString(relationValue('OA_DC_Doc',:sData1,'','','fIssueDate','/OA/doc/data')),'）','单号： ',relationValue('OA_DC_Doc',:sData1,'','','fExtendStr1','/OA/doc/data'))
</item>
</task-relation-value>
</execute-rule>


<back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" then-flow-mode="flowToAgain"><to activity="regActivity"></to>
</back-rule>
</business-activity>  
    <business-activity name="secretaryActivity" condition="true"> 
      <label language="zh_CN">秘书处理</label>  
      <input name="x" unit="draftActivity"/>  
      <output name="x" unit="xor1"/>  
      <input name="x" unit="roundPerusalActivity"/>  
        
      <input name="x" unit="leadApproveActivity"/>  
      <input name="x" unit="xor2"/>  
      <advance-rule condition="true" dialog-enabled="true" save-enabled="false" jump-enabled="false"
        customized-enabled="false" ignore-execute-mode="false" task-wait="true" task-join="true"/>  
        
        
        
        
       
    





















<execute-rule condition="currentActivityLabel()='拟办'" task-assign-mode="together"><executor-range range-expr="findActivityCreator('START')" default-expr="findActivityCreator('START')"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【收文:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'),'（收文日期：',toString(relationValue('OA_DC_Doc',:sData1,'','','fIssueDate','/OA/doc/data')),'）','单号： ',relationValue('OA_DC_Doc',:sData1,'','','fExtendStr1','/OA/doc/data'))
</item>
</task-relation-value>
</execute-rule>
<execute-rule condition="currentActivityLabel()='领导批示'" task-assign-mode="together"><executor-range range-expr="findActivityCreator('leadApproveActivity')" default-expr="findActivityCreator('leadApproveActivity')"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【收文:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'),'（收文日期：',toString(relationValue('OA_DC_Doc',:sData1,'','','fIssueDate','/OA/doc/data')),'）','单号： ',relationValue('OA_DC_Doc',:sData1,'','','fExtendStr1','/OA/doc/data'))
</item>
</task-relation-value>
</execute-rule>
<execute-rule condition="currentActivityLabel()='部门阅办'" task-assign-mode="together"><executor-range range-expr="findActivityExecutor('secretaryActivity')" default-expr="findActivityExecutor('secretaryActivity')"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【收文:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'),'（收文日期：',toString(relationValue('OA_DC_Doc',:sData1,'','','fIssueDate','/OA/doc/data')),'）','单号： ',relationValue('OA_DC_Doc',:sData1,'','','fExtendStr1','/OA/doc/data'))
</item>
</task-relation-value>
</execute-rule>
<execute-rule condition="currentActivityLabel()='传阅'" task-assign-mode="together"><executor-range range-expr="findActivityCreator('roundPerusalActivity')" default-expr="findActivityCreator('roundPerusalActivity')"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【收文:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'),'（收文日期：',toString(relationValue('OA_DC_Doc',:sData1,'','','fIssueDate','/OA/doc/data')),'）','单号： ',relationValue('OA_DC_Doc',:sData1,'','','fExtendStr1','/OA/doc/data'))
</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <place name="xor1"> 
      <label language="zh_CN">XOR</label> 
    </place>  
    <business-activity name="leadApproveActivity" condition="true"> 
      <label language="zh_CN">领导批示</label>  
      <input name="x" unit="xor1"/>  
      <output name="x" unit="secretaryActivity"/>  
      <advance-rule condition="true" dialog-enabled="false" save-enabled="false" jump-enabled="false"
        customized-enabled="false" ignore-execute-mode="false" task-wait="false" task-join="false"/>  
       
    
<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsByID(splitExecutors(:sData1,relationValue('OA_DC_Doc',:sData1,'','','fExtendPsnIDs1','/OA/doc/data'),'leadApproveActivity'))" default-expr="findOrgUnitsByID(splitExecutors(:sData1,relationValue('OA_DC_Doc',:sData1,'','','fExtendPsnIDs1','/OA/doc/data'),'leadApproveActivity'))"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sExecuteMode">'temSequential'</item>
<item relation="sName">concat('【收文:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'),'（收文日期：',toString(relationValue('OA_DC_Doc',:sData1,'','','fIssueDate','/OA/doc/data')),'）','单号： ',relationValue('OA_DC_Doc',:sData1,'','','fExtendStr1','/OA/doc/data'))
</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="roundPerusalActivity" condition="true"> 
      <label language="zh_CN">传阅</label>  
      <input name="x" unit="xor1"/>  
      <output name="x" unit="secretaryActivity"/>  
      <advance-rule condition="true" dialog-enabled="false" save-enabled="false" jump-enabled="false"
        customized-enabled="false" ignore-execute-mode="false" task-wait="false" task-join="false"/>  
       
    

<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsByID(splitExecutors(:sData1,relationValue('OA_DC_Doc',:sData1,'','','fExtendPsnIDs4','/OA/doc/data'),'roundPerusalActivity'))" default-expr="findOrgUnitsByID(splitExecutors(:sData1,relationValue('OA_DC_Doc',:sData1,'','','fExtendPsnIDs4','/OA/doc/data'),'roundPerusalActivity'))"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sExecuteMode">'temSimultaneous'</item>
<item relation="sName">concat('【收文:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'),'（收文日期：',toString(relationValue('OA_DC_Doc',:sData1,'','','fIssueDate','/OA/doc/data')),'）','单号： ',relationValue('OA_DC_Doc',:sData1,'','','fExtendStr1','/OA/doc/data'))
</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="operatorActivity" condition="true"> 
      <label language="zh_CN">部门阅办</label>  
      <input name="x" unit="xor1"/>  
      <output name="x" unit="xor2"/>  
      <input name="x" unit="operatorDeptActivity"/>  
        
        
      <advance-rule condition="true" dialog-enabled="true" save-enabled="false" jump-enabled="false"
        customized-enabled="false" ignore-execute-mode="false" task-wait="false" task-join="false"/> 
    













<execute-rule condition="currentActivityLabel()='秘书处理'" task-assign-mode="singleness"><executor-range range-expr="findOrgUnitsByID(splitExecutors(:sData1,null,'operatorActivity'))" default-expr="findOrgUnitsByID(splitExecutors(:sData1,null,'operatorActivity'))"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sName">concat('【收文:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'),'（收文日期：',toString(relationValue('OA_DC_Doc',:sData1,'','','fIssueDate','/OA/doc/data')),'）','单号： ',relationValue('OA_DC_Doc',:sData1,'','','fExtendStr1','/OA/doc/data'))
</item>
</task-relation-value>
</execute-rule>
<execute-rule condition="currentActivityLabel()='部门内处理'" task-assign-mode="singleness"><executor-range range-expr="findActivityCreator('operatorDeptActivity')" default-expr="findActivityCreator('operatorDeptActivity')"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sName">concat('【收文:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'),'（收文日期：',toString(relationValue('OA_DC_Doc',:sData1,'','','fIssueDate','/OA/doc/data')),'）','单号： ',relationValue('OA_DC_Doc',:sData1,'','','fExtendStr1','/OA/doc/data'))
</item>
</task-relation-value>
</execute-rule>
</business-activity>  
      
    <place name="end1"> 
      <label language="zh_CN">结束</label> 
    </place>  
    <start-rule condition="true"> 
      <task-relation-value> 
        <item relation="sName">concat(currentProcessLabelOfProcessContext(),'--',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'))</item> 
      </task-relation-value> 
    </start-rule>  
    <arc name="x" from="xor1" to="end1"/>  
    <listener action="finishProcessAction" event="before" handler="receiveDocProcessBeforeFinishProcedure"/>  
    <business-activity name="operatorDeptActivity" condition="true"> 
      <label language="zh_CN">部门内处理</label>  
      <input name="x" unit="xor2"/>  
      <output name="x" unit="operatorActivity"/>  
        
      <advance-rule condition="true" dialog-enabled="false" save-enabled="false" jump-enabled="false"
        customized-enabled="false" ignore-execute-mode="false" task-wait="false" task-join="false"/> 
    


<execute-rule condition="true" task-assign-mode="singleness"><executor-range range-expr="findOrgUnitsHasCActivityInAEDept('operatorDeptActivity',  true )" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sName">concat('【收文:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'),'（收文日期：',toString(relationValue('OA_DC_Doc',:sData1,'','','fIssueDate','/OA/doc/data')),'）','单号： ',relationValue('OA_DC_Doc',:sData1,'','','fExtendStr1','/OA/doc/data'))
</item>
</task-relation-value>
</execute-rule>
</business-activity>  
      
    <place name="xor2"> 
      <label language="zh_CN">XOR</label> 
    </place>  
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
     
  


























































<has-action action="createOA_DC_DocAction" access-permission="public"></has-action>
<has-action action="queryOA_DC_DocAction" access-permission="public"></has-action>
<has-action action="saveOA_DC_DocAction" access-permission="public"></has-action>
<has-action action="queryOA_Pub_BaseCodeAction" access-permission="public"></has-action>
<has-action action="queryOA_DC_ExternalUnitAction" access-permission="public"></has-action>
<has-action action="recordReceivedAction" access-permission="public"></has-action>
<has-action action="createNextSeqStringAction" access-permission="public"></has-action>
<has-action action="checkDocNumberAction" access-permission="public"></has-action>
<has-action action="checkTitleAction" access-permission="public"></has-action>
<has-action action="getDocByIdAction" access-permission="public"></has-action>
<has-action action="addRelevanceAction" access-permission="public"></has-action>
<has-action action="deleteRelevanceAction" access-permission="public"></has-action>
<has-action action="updateRelevanceAction" access-permission="public"></has-action>
<has-action action="getDocReaderRangeAction" access-permission="public"></has-action>
<has-action action="setDocReaderRangeAction" access-permission="public"></has-action>
<has-action action="getDocReceiveRangeAction" access-permission="public"></has-action>
<has-action action="setDocReceiveRangeAction" access-permission="public"></has-action>
<has-action action="isPublishedByBizAction" access-permission="public"></has-action>
<has-action action="getPublishedRangeByBizAction" access-permission="public"></has-action>
<has-action action="publishKnowledgeInterfaceAction" access-permission="public"></has-action>
<has-action action="queryFolderAction" access-permission="public"></has-action>
<has-action action="sqlQueryAction" access-permission="public"><public name="dataModel" type="String" value="/OA/doc/data"></public>
</has-action>
<has-action action="getCActivityOrgUnitAction" access-permission="public"></has-action>
<has-action action="insertSignPsnAction" access-permission="public"></has-action>
<has-action action="queryV_OA_DC_ReadOpinionAction" access-permission="public"></has-action>
<has-action action="receiveDocFlowTrackAction" access-permission="public"></has-action>
<has-action action="receiveDocDetailFlowTrackAction" access-permission="public"></has-action>
</process> 
</model>
