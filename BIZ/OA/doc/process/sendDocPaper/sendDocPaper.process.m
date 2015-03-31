<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">  
  <process name="sendDocPaperProcess" start="start1" end="end1"> 
    <label language="zh_CN">公文业务流程</label>  
    <static-activity name="startActivity"> 
      <label language="zh_CN">拟稿</label> 
    </static-activity>  
    <place name="start1"> 
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <token name="init"/>  
    <business-activity name="draftActivity" condition="true"> 
      <label language="zh_CN">拟稿</label>  
      <input name="x" unit="start1"/>  
       
    <output name="x" unit="deptApproveActivity"/>
<execute-rule condition="isStartingProcess()" task-assign-mode="together"><executor-range range-expr="currentPersonMember2()" default-expr="currentPersonMember2()"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【发文稿纸:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity>  
      
    <business-activity name="deptApproveActivity" condition="true"> 
      <label language="zh_CN">本部门审核</label>  
        
       
    
<input name="x" unit="draftActivity"/>
<output name="x" unit="drafterActivity"/>
<input name="x" unit="xor3"/>
<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('', false)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【发文稿纸:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity>  
      
    <business-activity name="drafterActivity" condition="true"> 
      <label language="zh_CN">拟稿人处理</label>  
        
       
    
<input name="x" unit="deptApproveActivity"/>
<input name="x" unit="meetingActivity"/>
<output name="x" unit="xor3"/>


<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findActivityCreator('START')" default-expr="findActivityCreator('START')"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【发文稿纸:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'))</item>
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
<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('', false)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【发文稿纸:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity>  
      
    <business-activity name="secretaryDealActivity" condition="true"> 
      <label language="zh_CN">秘书处理</label>  
        
       
    
<input name="x" unit="checkActivity"/>
<output name="x" unit="xor5"/>
<input name="x" unit="reviewActivity"/>
<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('', false)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【发文稿纸:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <place name="xor5"> 
      <label language="zh_CN">xor</label> 
    </place>  
    <business-activity name="signActivity" condition="true"> 
      <label language="zh_CN">领导签发</label>  
        
      <output name="x" unit="secretaryHandleActivity"/> 
    <input name="x" unit="xor5"/>
<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('', false)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【发文稿纸:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="secretaryHandleActivity" condition="true"> 
      <label language="zh_CN">秘书处理</label>  
      <input name="x" unit="signActivity"/>  
      <output name="x" unit="registerNumActivity"/> 
    



<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('', false)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【发文稿纸:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="registerNumActivity" condition="true"> 
      <label language="zh_CN">文件编号</label>  
      <input name="x" unit="secretaryHandleActivity"/>  
      <output name="x" unit="stampActivity"/> 
    <execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('', false)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【发文稿纸:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="stampActivity" condition="true"> 
      <label language="zh_CN">文件排版</label>  
      <input name="x" unit="registerNumActivity"/>  
      <output name="x" unit="dispenseActivity"/> 
    <execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('', false)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【发文稿纸:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="dispenseActivity" condition="true"> 
      <label language="zh_CN">用印、发布</label>  
      <input name="x" unit="stampActivity"/>  
        
       
    <output name="x" unit="end1"/>

<advance-rule condition="true" dialog-enabled="false" save-enabled="false" jump-enabled="false" customized-enabled="false" ignore-execute-mode="false" task-wait="false" task-join="false"></advance-rule>
<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('', false)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【发文稿纸:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <place name="end1"> 
      <label language="zh_CN">结束</label> 
    </place>  
    <business-activity name="meetingActivity" condition="true"> 
      <label language="zh_CN">部门会签</label>  

<output name="x" unit="drafterActivity"/>
<input name="x" unit="xor3"/>



<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('',true)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sExecuteMode">'temSimultaneous'</item>
<item relation="sName">concat('【发文稿纸:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="reviewActivity" condition="true"> 
      <label language="zh_CN">领导签阅</label>  
        
        
        
       
    <input name="x" unit="xor5"/>
<output name="x" unit="secretaryDealActivity"/>
<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('', false)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【发文稿纸:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity> 
    <has-action action="createOA_DC_DocAction" access-permission="public"/>
    <has-action action="queryOA_DC_DocAction" access-permission="public"/>
    <has-action action="saveOA_DC_DocAction" access-permission="public"/>
    <has-action action="queryOA_Pub_BaseCodeAction" access-permission="public"/>
    <has-action action="queryOA_DC_ExternalUnitAction" access-permission="public"/>
    <has-action action="createNextSeqStringAction" access-permission="public"/>
    <has-action action="checkDocNumberAction" access-permission="public"/>
    <has-action action="checkTitleAction" access-permission="public"/>
    <has-action action="getMeetingPsnIDsAction" access-permission="public"/>
    <has-action action="checkOrgNumAction" access-permission="public"/>
    <has-action action="addRelevanceAction" access-permission="public"/>
    <has-action action="deleteRelevanceAction" access-permission="public"/>
    <has-action action="updateRelevanceAction" access-permission="public"/>
    <has-action action="getDocReaderRangeAction" access-permission="public"/>
    <has-action action="setDocReaderRangeAction" access-permission="public"/>
    <has-action action="getDocReceiveRangeAction" access-permission="public"/>
    <has-action action="setDocReceiveRangeAction" access-permission="public"/>  
  
<start-rule condition="true"><task-relation-value><item relation="sName">concat(currentProcessLabelOfProcessContext(),'--',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'))</item>
</task-relation-value>
</start-rule>
</process> 
</model>