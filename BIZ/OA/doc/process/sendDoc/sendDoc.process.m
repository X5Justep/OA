<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="sendDocProcess" start="start1" end="end1"> 
    <label language="zh_CN">公文业务流程</label>  
    <static-activity name="startActivity"> 
      <label language="zh_CN">拟稿</label> 
    </static-activity>  
    <static-activity name="secretaryHandleActivity"/>  
    <place name="start1"> 
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <token name="init"/>  
    <business-activity name="draftActivity" condition="true"> 
      <label language="zh_CN">拟稿</label>  
      <input name="x" unit="start1"/>  
      <output name="x" unit="deptApproveActivity"/>  
      <execute-rule condition="isStartingProcess()" task-assign-mode="together">
        <executor-range range-expr="currentPersonMember()" default-expr="currentPersonMember()">
          <kind>PSM</kind> 
        </executor-range>  
        <task-relation-value>
          <item relation="sPreemptMode">'tpmOpen'</item>  
          <item relation="sExecuteMode">'temPreempt'</item>  
          <item relation="sName">concat('【发文:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'),'（拟办日期：',toString(relationValue('OA_DC_Doc',:sData1,'','','fDraftTime','/OA/doc/data')),'）','单号： ',relationValue('OA_DC_Doc',:sData1,'','','fExtendStr1','/OA/doc/data'))</item> 
        </task-relation-value> 
      </execute-rule> 
    </business-activity>  
    <business-activity name="deptApproveActivity" condition="true"> 
      <label language="zh_CN">本部门审核</label>  
      <input name="x" unit="draftActivity"/>  
      <output name="x" unit="drafterActivity"/>  
      <input name="x" unit="xor3"/>  
      <advance-rule condition="true" dialog-enabled="false" save-enabled="false" jump-enabled="false"
        customized-enabled="false" ignore-execute-mode="false" task-wait="false" task-join="false"/>  
       
    




<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivityInAEDept('draftActivity',true)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【发文:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'),'（拟办日期：',toString(relationValue('OA_DC_Doc',:sData1,'','','fDraftTime','/OA/doc/data')),'）','单号： ',relationValue('OA_DC_Doc',:sData1,'','','fExtendStr1','/OA/doc/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="drafterActivity" condition="true"> 
      <label language="zh_CN">拟稿人处理</label>  
      <output name="x" unit="xor3"/>  
      <input name="x" unit="deptApproveActivity"/>  
      <input name="x" unit="xor1"/>  
      <advance-rule condition="true" dialog-enabled="true" save-enabled="false" jump-enabled="false"
        customized-enabled="false" ignore-execute-mode="false" task-wait="true" task-join="true"/>  
      <execute-rule condition="currentActivityLabel()='本部门审核'" task-assign-mode="together">
        <executor-range range-expr="findActivityCreator('START')" default-expr="findActivityCreator('START')">
          <kind>PSM</kind> 
        </executor-range>  
        <task-relation-value>
          <item relation="sPreemptMode">'tpmOpen'</item>  
          <item relation="sExecuteMode">'temPreempt'</item>  
          <item relation="sName">concat('【发文:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'),'（拟办日期：',toString(relationValue('OA_DC_Doc',:sData1,'','','fDraftTime','/OA/doc/data')),'）','单号： ',relationValue('OA_DC_Doc',:sData1,'','','fExtendStr1','/OA/doc/data'))</item> 
        </task-relation-value> 
      </execute-rule>  
      <execute-rule condition="currentActivityLabel()='部门会签'" task-assign-mode="together">
        <executor-range range-expr="findActivityCreator('START')" default-expr="findActivityCreator('START')">
          <kind>PSM</kind> 
        </executor-range>  
        <task-relation-value>
          <item relation="sPreemptMode">'tpmOpen'</item>  
          <item relation="sExecuteMode">'temPreempt'</item>  
          <item relation="sName">concat('【发文:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'),'（拟办日期：',toString(relationValue('OA_DC_Doc',:sData1,'','','fDraftTime','/OA/doc/data')),'）','单号： ',relationValue('OA_DC_Doc',:sData1,'','','fExtendStr1','/OA/doc/data'))</item> 
        </task-relation-value> 
      </execute-rule> 
    </business-activity>  
    <place name="xor3"> 
      <label language="zh_CN">xor</label> 
    </place>  
    <business-activity name="checkActivity" condition="true"> 
      <label language="zh_CN">核稿</label>  
      <output name="x" unit="secretaryDealActivity"/>  
      <input name="x" unit="xor3"/>  
        
      <execute-rule condition="true" task-assign-mode="together">
        <executor-range range-expr="findOrgUnitsHasCActivity('', true)" default-expr="">
          <kind>PSM</kind> 
        </executor-range>  
        <task-relation-value>
          <item relation="sPreemptMode">'tpmOpen'</item>  
          <item relation="sExecuteMode">'temPreempt'</item>  
          <item relation="sName">concat('【发文:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'),'（拟办日期：',toString(relationValue('OA_DC_Doc',:sData1,'','','fDraftTime','/OA/doc/data')),'）','单号： ',relationValue('OA_DC_Doc',:sData1,'','','fExtendStr1','/OA/doc/data'))</item> 
        </task-relation-value> 
      </execute-rule> 
    <advance-rule condition="true" dialog-enabled="true" save-enabled="false" jump-enabled="false" customized-enabled="false" ignore-execute-mode="false" task-wait="false" task-join="false"></advance-rule>
</business-activity>  
    <business-activity name="secretaryDealActivity" condition="true"> 
      <label language="zh_CN">秘书处理</label>  
      <input name="x" unit="checkActivity"/>  
      <output name="x" unit="xor5"/>  
      <input name="x" unit="reviewActivity"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true"
        back-range="all" then-flow-mode="flowToAgain"/>  
        
        
        
        
       
    














<advance-rule condition="true" dialog-enabled="true" save-enabled="false" jump-enabled="false" customized-enabled="false" ignore-execute-mode="false" task-wait="false" task-join="false"></advance-rule>


<input name="x" unit="deptMeetingActivity"></input>
<execute-rule condition="currentActivityLabel()='核稿'" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('',  true)" default-expr="findOrgUnitsHasCActivityInAEDept('checkActivity', true)"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmExecute'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【发文:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'),'（拟办日期：',toString(relationValue('OA_DC_Doc',:sData1,'','','fDraftTime','/OA/doc/data')),'）','单号： ',relationValue('OA_DC_Doc',:sData1,'','','fExtendStr1','/OA/doc/data'))</item>
</task-relation-value>
</execute-rule>
<execute-rule condition="currentActivityLabel()='领导签阅'" task-assign-mode="together"><executor-range range-expr="findActivityExecutor('secretaryDealActivity')" default-expr="findActivityExecutor('secretaryDealActivity')"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmExecute'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat(currentActivityLabelOfProcessContext(),':发文--',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'))</item>
</task-relation-value>
</execute-rule>
<execute-rule condition="currentActivityLabel()='部门会签'" task-assign-mode="together"><executor-range range-expr="findActivityExecutor('secretaryDealActivity')" default-expr="findActivityExecutor('secretaryDealActivity')"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmExecute'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat(currentActivityLabelOfProcessContext(),':发文--',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <place name="xor5"> 
      <label language="zh_CN">xor</label> 
    </place>  
    <business-activity name="signActivity" condition="true"> 
      <label language="zh_CN">领导签发</label>  
      <input name="x" unit="xor5"/>  
      <output name="x" unit="registerNumActivity"/>  
      <advance-rule condition="true" dialog-enabled="false" save-enabled="false" jump-enabled="false"
        customized-enabled="false" ignore-execute-mode="false" task-wait="false" task-join="false"/>  
      <execute-rule condition="true" task-assign-mode="together">
        <executor-range range-expr="findOrgUnitsByID(splitExecutors(:sData1,relationValue('OA_DC_Doc',:sData1,'','','fExtendPsnIDs3','/OA/doc/data'),'signActivity'))"
          default-expr="findOrgUnitsByID(splitExecutors(:sData1,relationValue('OA_DC_Doc',:sData1,'','','fExtendPsnIDs3','/OA/doc/data'),'signActivity'))">
          <kind>PSM</kind> 
        </executor-range>  
        <task-relation-value>
          <item relation="sPreemptMode">'tpmOpen'</item>  
          <item relation="sExecuteMode">'temPreempt'</item>  
          <item relation="sName">concat('【发文:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'),'（拟办日期：',toString(relationValue('OA_DC_Doc',:sData1,'','','fDraftTime','/OA/doc/data')),'）','单号： ',relationValue('OA_DC_Doc',:sData1,'','','fExtendStr1','/OA/doc/data'))</item> 
        </task-relation-value> 
      </execute-rule> 
    </business-activity>  
    <business-activity name="registerNumActivity" condition="true"> 
      <label language="zh_CN">文件编号</label>  
      <output name="x" unit="stampActivity"/>  
      <input name="x" unit="signActivity"/>  
      <advance-rule condition="true" dialog-enabled="true" save-enabled="false" jump-enabled="false"
        customized-enabled="false" ignore-execute-mode="false" task-wait="false" task-join="false"/>  
      <back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true"
        back-range="all" then-flow-mode="flowToAgain"/>  
      <execute-rule condition="true" task-assign-mode="together">
        <executor-range range-expr="findActivityExecutor('secretaryDealActivity')" default-expr="findActivityExecutor('secretaryDealActivity')">
          <kind>PSM</kind> 
        </executor-range>  
        <task-relation-value>
          <item relation="sPreemptMode">'tpmOpen'</item>  
          <item relation="sExecuteMode">'temPreempt'</item>  
          <item relation="sName">concat('【发文:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'),'（拟办日期：',toString(relationValue('OA_DC_Doc',:sData1,'','','fDraftTime','/OA/doc/data')),'）','单号： ',relationValue('OA_DC_Doc',:sData1,'','','fExtendStr1','/OA/doc/data'))</item> 
        </task-relation-value> 
      </execute-rule> 
    </business-activity>  
    <business-activity name="stampActivity" condition="true"> 
      <label language="zh_CN">文件排版</label>  
      <input name="x" unit="registerNumActivity"/>  
      <output name="x" unit="dispenseActivity"/>  
      <advance-rule condition="true" dialog-enabled="true" save-enabled="false" jump-enabled="false"
        customized-enabled="false" ignore-execute-mode="false" task-wait="false" task-join="false"/>  
       
    <execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('', false)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【发文:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'),'（拟办日期：',toString(relationValue('OA_DC_Doc',:sData1,'','','fDraftTime','/OA/doc/data')),'）','单号： ',relationValue('OA_DC_Doc',:sData1,'','','fExtendStr1','/OA/doc/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="dispenseActivity" condition="true"> 
      <label language="zh_CN">用印、发布</label>  
      <input name="x" unit="stampActivity"/>  
      <output name="x" unit="end1"/>  
      <advance-rule condition="true" dialog-enabled="true" save-enabled="false" jump-enabled="false"
        customized-enabled="false" ignore-execute-mode="false" task-wait="false" task-join="false"/>  
      <execute-rule condition="true" task-assign-mode="together">
        <executor-range range-expr="findOrgUnitsHasCActivity('', true)" default-expr="findActivityExecutor('registerNumActivity')">
          <kind>PSM</kind> 
        </executor-range>  
        <task-relation-value>
          <item relation="sPreemptMode">'tpmOpen'</item>  
          <item relation="sExecuteMode">'temPreempt'</item>  
          <item relation="sName">concat('【发文:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'),'（拟办日期：',toString(relationValue('OA_DC_Doc',:sData1,'','','fDraftTime','/OA/doc/data')),'）','单号： ',relationValue('OA_DC_Doc',:sData1,'','','fExtendStr1','/OA/doc/data'))</item> 
        </task-relation-value> 
      </execute-rule> 
    </business-activity>  
    <place name="end1"> 
      <label language="zh_CN">结束</label> 
    </place>  
    <business-activity name="meetingActivity" condition="true"> 
      <label language="zh_CN">部门会签</label>  
      <input name="x" unit="xor3"/>  
      <output name="x" unit="xor1"/>  
      <input name="x" unit="deptdoActivity1"/>  
      <advance-rule condition="true" dialog-enabled="true" save-enabled="false" jump-enabled="false"
        customized-enabled="false" ignore-execute-mode="false" task-wait="false" task-join="false"/>  
      <execute-rule condition="currentActivityLabel()='拟稿人处理'" task-assign-mode="singleness">
        <executor-range range-expr="findOrgUnitsHasCActivity('', true )" default-expr="">
          <kind>PSM</kind> 
        </executor-range>  
        <task-relation-value>
          <item relation="sName">concat('【发文:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'),'（拟办日期：',toString(relationValue('OA_DC_Doc',:sData1,'','','fDraftTime','/OA/doc/data')),'）','单号： ',relationValue('OA_DC_Doc',:sData1,'','','fExtendStr1','/OA/doc/data'))</item> 
        </task-relation-value> 
      </execute-rule>  
      <execute-rule condition="currentActivityLabel()='部门内处理'" task-assign-mode="singleness">
        <executor-range range-expr="findActivityCreator('deptdoActivity1')" default-expr="findActivityCreator('deptdoActivity1')">
          <kind>PSM</kind> 
        </executor-range>  
        <task-relation-value>
          <item relation="sName">concat('【发文:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'),'（拟办日期：',toString(relationValue('OA_DC_Doc',:sData1,'','','fDraftTime','/OA/doc/data')),'）','单号： ',relationValue('OA_DC_Doc',:sData1,'','','fExtendStr1','/OA/doc/data'))</item> 
        </task-relation-value> 
      </execute-rule> 
    </business-activity>  
    <business-activity name="reviewActivity" condition="true"> 
      <label language="zh_CN">领导签阅</label>  
      <input name="x" unit="xor5"/>  
      <output name="x" unit="secretaryDealActivity"/>  
      <advance-rule condition="true" dialog-enabled="false" save-enabled="false" jump-enabled="false"
        customized-enabled="false" ignore-execute-mode="false" task-wait="false" task-join="false"/>  
      <execute-rule condition="true" task-assign-mode="together">
        <executor-range range-expr="findOrgUnitsByID(splitExecutors(:sData1,relationValue('OA_DC_Doc',:sData1,'','','fExtendPsnIDs2','/OA/doc/data'),'reviewActivity'))"
          default-expr="findOrgUnitsByID(splitExecutors(:sData1,relationValue('OA_DC_Doc',:sData1,'','','fExtendPsnIDs2','/OA/doc/data'),'reviewActivity'))">
          <kind>PSM</kind> 
        </executor-range>  
        <task-relation-value>
          <item relation="sExecuteMode">'temSimultaneous'</item>  
          <item relation="sName">concat('【发文:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'),'（拟办日期：',toString(relationValue('OA_DC_Doc',:sData1,'','','fDraftTime','/OA/doc/data')),'）','单号： ',relationValue('OA_DC_Doc',:sData1,'','','fExtendStr1','/OA/doc/data'))</item> 
        </task-relation-value> 
      </execute-rule> 
    </business-activity>  
    <listener action="finishProcessAction" event="before" handler="sendDocProcessBeforeFinishProcedure"/>  
    <start-rule condition="true"> 
      <task-relation-value> 
        <item relation="sName">concat(currentActivityLabelOfProcessContext(),':发文--',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'))</item> 
      </task-relation-value> 
    </start-rule>  
    <business-activity name="deptMeetingActivity" condition="true"> 
      <label language="zh_CN">部门会签</label>  
        
        
        
        
        
       
    


















<advance-rule condition="true" dialog-enabled="true" save-enabled="false" jump-enabled="false" customized-enabled="false" ignore-execute-mode="false" task-wait="false" task-join="false"></advance-rule>













<execute-rule condition="currentActivityLabel()='秘书处理'" task-assign-mode="together"><executor-range range-expr="findOrgUnitsByID(splitExecutors(:sData1,relationValue('OA_DC_Doc',:sData1,'','','fExtendPsnIDs1','/OA/doc/data'),'deptMeetingActivity'))" default-expr="findOrgUnitsByID(splitExecutors(:sData1,relationValue('OA_DC_Doc',:sData1,'','','fExtendPsnIDs1','/OA/doc/data'),'deptMeetingActivity'))"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sExecuteMode">'temSimultaneous'</item>
<item relation="sName">concat('【发文:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'),'（拟办日期：',toString(relationValue('OA_DC_Doc',:sData1,'','','fDraftTime','/OA/doc/data')),'）','单号： ',relationValue('OA_DC_Doc',:sData1,'','','fExtendStr1','/OA/doc/data'))</item>
</task-relation-value>
</execute-rule>
<output name="x" unit="secretaryDealActivity"></output>
<input name="x" unit="xor5"></input>
</business-activity>   
    <place name="xor1">
      <label language="zh_CN">XOR</label> 
    </place>  
    <business-activity name="deptdoActivity1" condition="true">
      <label language="zh_CN">部门内处理</label>  
      <input name="x" unit="xor1"/>  
      <output name="x" unit="meetingActivity"/>  
      <advance-rule condition="true" dialog-enabled="true" save-enabled="false" jump-enabled="false"
        customized-enabled="false" ignore-execute-mode="false" task-wait="false" task-join="false"/>  
      <execute-rule condition="true" task-assign-mode="singleness">
        <executor-range range-expr="findOrgUnitsHasCActivityInAEDept('meetingActivity',true)"
          default-expr="">
          <kind>PSM</kind> 
        </executor-range>  
        <task-relation-value>
          <item relation="sName">concat('【发文:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'),'（拟办日期：',toString(relationValue('OA_DC_Doc',:sData1,'','','fDraftTime','/OA/doc/data')),'）','单号： ',relationValue('OA_DC_Doc',:sData1,'','','fExtendStr1','/OA/doc/data'))</item> 
        </task-relation-value> 
      </execute-rule> 
    </business-activity>  
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
     
  <has-action action="createOA_DC_DocAction" access-permission="public"></has-action>
<has-action action="queryOA_DC_DocAction" access-permission="public"></has-action>
<has-action action="saveOA_DC_DocAction" access-permission="public"></has-action>
<has-action action="queryOA_Pub_BaseCodeAction" access-permission="public"></has-action>
<has-action action="createNextSeqStringAction" access-permission="public"></has-action>
<has-action action="checkDocNumberAction" access-permission="public"></has-action>
<has-action action="checkTitleAction" access-permission="public"></has-action>
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
<has-action action="getMeetingPsnIDsAction" access-permission="public"></has-action>
<has-action action="getDocByIdAction" access-permission="public"></has-action>
<has-action action="queryFolderAction" access-permission="public"></has-action>
<has-action action="queryOA_DC_ExternalUnitAction" access-permission="public"></has-action>
<has-action action="sqlQueryAction" access-permission="public"><public name="dataModel" type="String" value="/OA/doc/data"></public>
</has-action>
<has-action action="insertSignPsnAction" access-permission="public"></has-action>
<has-action action="getCActivityOrgUnitAction" access-permission="public"></has-action>
<has-action action="queryV_OA_DC_ReadOpinionAction" access-permission="public"></has-action>
<has-action action="sendDocFlowTrackAction" access-permission="public"></has-action>
<has-action action="sendDocDetailFlowTrackAction" access-permission="public"></has-action>
</process> 
</model>
