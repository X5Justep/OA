<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action name="getDocReaderRangeAction" procedure="getDocReaderRangeProcedure"> 
    <public name="docID" type="String"/> 
  </action>  
  <procedure name="getDocReaderRangeProcedure" code="docUtils.getReaderRange" code-model="/OA/doc/logic/code"> 
    <parameter name="docID" type="String"/> 
  </procedure>  
  <action name="setDocReaderRangeAction" procedure="setDocReaderRangeProcedure"> 
    <public name="docID" type="String"/>  
    <public name="dom" type="Xml"/>  
    <!--<public name="dom" type="String"/>--> 
  </action>  
  <procedure name="setDocReaderRangeProcedure" code="docUtils.setReaderRange" code-model="/OA/doc/logic/code"> 
    <parameter name="docID" type="String"/>  
    <parameter name="dom" type="Xml"/>  
    <!--<parameter name="dom" type="String"/>--> 
  </procedure>  
  <action name="getDocReceiveRangeAction" procedure="getDocReceiveRangeProcedure"> 
    <public name="docID" type="String"/> 
  </action>  
  <procedure name="getDocReceiveRangeProcedure" code="docUtils.getReceiveRange" code-model="/OA/doc/logic/code"> 
    <parameter name="docID" type="String"/> 
  </procedure>  
  <action name="setDocReceiveRangeAction" procedure="setDocReceiveRangeProcedure"> 
    <public name="docID" type="String"/>  
    <public name="dom" type="Xml"/>  
    <!--<public name="dom" type="String"/>--> 
  </action>  
  <procedure name="setDocReceiveRangeProcedure" code="docUtils.setReceiveRange" code-model="/OA/doc/logic/code"> 
    <parameter name="docID" type="String"/>  
    <parameter name="dom" type="Xml"/>  
    <!--<parameter name="dom" type="String"/>--> 
  </procedure>  
  <action name="recordReadedAction" procedure="recordReadedProcedure"> 
    <public name="docID" type="String"/>  
    <public name="personID" type="String"/> 
  </action>  
  <procedure name="recordReadedProcedure" code="docUtils.recordReaded" code-model="/OA/doc/logic/code"> 
    <parameter name="docID" type="String"/>  
    <parameter name="personID" type="String"/> 
  </procedure>  
  <action name="recordReceivedAction" procedure="recordReceivedProcedure"> 
    <public name="fSendDocId" type="String"/>  
    <public name="currentOgnId" type="String"/> 
  </action>  
  <procedure name="recordReceivedProcedure" code="docUtils.recordReceived" code-model="/OA/doc/logic/code"> 
    <parameter name="fSendDocId" type="String"/>  
    <parameter name="currentOgnId" type="String"/> 
  </procedure>  
  <action name="getWaitReadDocAction" procedure="getWaitReadDocProcedure"> 
    <public name="count" type="Integer"/> 
  </action>  
  <procedure name="getWaitReadDocProcedure" code="docUtils.getWaitReadDoc" code-model="/OA/doc/logic/code"> 
    <parameter name="count" type="Integer"/> 
  </procedure>  
  <action name="getWaitReceiveDocAction" procedure="getWaitReceiveDocProcedure"> 
    <public name="count" type="Integer"/> 
  </action>  
  <procedure name="getWaitReceiveDocProcedure" code="docUtils.getWaitReceiveDoc"
    code-model="/OA/doc/logic/code"> 
    <parameter name="count" type="Integer"/> 
  </procedure>  
  <!--<action name="hasSetDocReceiveRangePermissionAction" procedure="hasSetDocReceiveRangePermissionProcedure">
    <label language="zh_CN">公文发送</label>
  </action>
  <procedure name="hasSetDocReceiveRangePermissionProcedure" code="" code-model="/OA/doc/logic/code"/>
  <action name="hasSetDocReadRangePermissionAction" procedure="hasSetDocReadRangePermissionProcedure">
    <label language="zh_CN">阅文设置</label>
  </action>
  <procedure name="hasSetDocReadRangePermissionProcedure" code="" code-model="/OA/doc/logic/code"/>
  <action name="hasPublishDocPermissionAction" procedure="hasPublishDocPermissionProcedure">
    <label language="zh_CN">文件发布</label>
  </action>
  <procedure name="hasPublishDocPermissionProcedure" code="" code-model="/OA/doc/logic/code"/>-->  
  <action name="setReaderOpinionToTaskAction" global="false" procedure="setReaderOpinionToTaskProcedure">
    <public type="String" required="true" name="fOpinion"/>  
    <public type="String" required="true" name="fMasterID"/> 
  </action> 
   <procedure name="setReaderOpinionToTaskProcedure" code="docUtils.setReaderOpinionToTask"
    code-model="/OA/doc/logic/code"> 
    <parameter name="fOpinion" type="String"/> 
    <parameter name="fMasterID" type="String"/> 
  </procedure>
</model>
