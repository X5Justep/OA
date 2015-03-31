<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">  
  <process name="signReportProcess" start="start1" end="end1"> 
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
      <output name="x" unit="checkActivity"/> 
    <execute-rule condition="isStartingProcess()" task-assign-mode="together"><executor-range range-expr="currentPersonMember2()" default-expr="currentPersonMember2()"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【签报:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="checkActivity" condition="true"> 
      <label language="zh_CN">本部门审核</label>  
      <input name="x" unit="draftActivity"/>  
      <output name="x" unit="drafterDisposeActivity"/>  
       
    <input name="x" unit="xor1"/>
<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('', false)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【签报:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="drafterDisposeActivity" condition="true"> 
      <label language="zh_CN">拟稿人处理</label>  
        
        
        
      <input name="x" unit="checkActivity"/> 
    <output name="x" unit="xor1"/>
<input name="x" unit="meetingActivity"/>
<input name="x" unit="xor2"/>




<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findActivityCreator('START')" default-expr="findActivityCreator('START')"><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【签报:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="meetingActivity" condition="true"> 
      <label language="zh_CN">部门会签</label>  

<input name="x" unit="xor1"/>
<output name="x" unit="drafterDisposeActivity"/>



<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('',true)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sExecuteMode">'temSimultaneous'</item>
<item relation="sName">concat('【签报:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <has-action action="createOA_DC_DocAction" access-permission="public"/>  
    <has-action action="queryOA_DC_DocAction" access-permission="public"/>  
    <has-action action="saveOA_DC_DocAction" access-permission="public"/>  
    <has-action action="queryOA_Pub_BaseCodeAction" access-permission="public"/>   
    <has-action action="checkDocNumberAction" access-permission="public"/>  
    <has-action action="checkTitleAction" access-permission="public"/>  
    <has-action action="addRelevanceAction" access-permission="public"/>  
    <has-action action="deleteRelevanceAction" access-permission="public"/>  
    <has-action action="updateRelevanceAction" access-permission="public"/>  
    <has-action action="getMeetingPsnIDsAction" access-permission="public"/>  
    <place name="xor1"> 
      <label language="zh_CN">XOR</label> 
    </place>  
    <business-activity name="secretaryActivity" condition="true"> 
      <label language="zh_CN">秘书处理</label>  
        
        
       
    <input name="x" unit="xor1"/>
<output name="x" unit="xor2"/>
<input name="x" unit="signActivity"/>
<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('', false)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【签报:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <business-activity name="signActivity" condition="true"> 
      <label language="zh_CN">领导签阅</label>  
        
       
    <input name="x" unit="xor2"/>
<output name="x" unit="secretaryActivity"/>
<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('', false)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">concat('【签报:',currentActivityLabelOfProcessContext(),'】',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'))</item>
</task-relation-value>
</execute-rule>
</business-activity>  
    <place name="xor2">
      <label language="zh_CN">XOR</label> 
    </place>  
    <place name="end1">
      <label language="zh_CN">结束</label> 
    </place> 
  




<start-rule condition="true"><task-relation-value><item relation="sName">concat('签报--',relationValue('OA_DC_Doc',:sData1,'','','fTitle','/OA/doc/data'))</item>
</task-relation-value>
</start-rule>

<arc name="x" from="xor1" to="end1"/>
</process> 
</model>