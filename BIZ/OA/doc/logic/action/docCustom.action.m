<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <action name="checkTitleAction" procedure="checkTitleProcedure">
  	<public name="fTitle" type="String"/>
    <public name="fDocType" type="String"/>
    <public name="rowid" type="String"/>
  </action>
  <procedure name="checkTitleProcedure" code="docAction.checkTitle" code-model="/OA/doc/logic/code">
    <parameter name="fTitle" type="String"/>
    <parameter name="fDocType" type="String"/>
    <parameter name="rowid" type="String"/>
  </procedure>
  <action name="checkDocNumberAction" procedure="checkDocNumberProcedure">
  	<public name="fDocNumber" type="String"/>
    <public name="rowid" type="String"/>
  </action>
  <procedure name="checkDocNumberProcedure" code="docAction.checkDocNumber" code-model="/OA/doc/logic/code">
    <parameter name="fDocNumber" type="String"/>
    <parameter name="rowid" type="String"/>
  </procedure>
  <action name="getDocByIdAction" procedure="getDocByIdProcedure">
  	<public name="docId" type="String"/>
  </action>
  <procedure name="getDocByIdProcedure" code="docAction.getDocById" code-model="/OA/doc/logic/code">
    <parameter name="docId" type="String"/>
  </procedure>
  <action name="getMeetingPsnIDsAction" procedure="getMeetingPsnIDsProcedure">
  	<public name="activity" type="String"/>
    <public name="rowid" type="String"/>
  </action>
  <procedure name="getMeetingPsnIDsProcedure" code="docAction.getMeetingPsnIDs" code-model="/OA/doc/logic/code">
    <parameter name="activity" type="String"/>
    <parameter name="rowid" type="String"/>
  </procedure>
  <action name="checkOrgNumAction" procedure="checkOrgNumProcedure">
  	<public name="fOrgLetterName" type="String"/>
    <public name="fOrgYear" type="String"/>
    <public name="fOrgNum" type="String"/>
    <public name="rowid" type="String"/>
  </action>
  <procedure name="checkOrgNumProcedure" code="docAction.checkOrgNum" code-model="/OA/doc/logic/code">
    <parameter name="fOrgLetterName" type="String"/>
    <parameter name="fOrgYear" type="String"/>
    <parameter name="fOrgNum" type="String"/>
    <parameter name="rowid" type="String"/>
  </procedure>
  <action name="addRelevanceAction" procedure="addRelevanceProcedure">
  	<public name="docId" type="String"/>
    <public name="relevanceId" type="String"/>
  </action>
  <procedure name="addRelevanceProcedure" code="docAction.addRelevance" code-model="/OA/doc/logic/code">
    <parameter name="docId" type="String"/>
    <parameter name="relevanceId" type="String"/>
  </procedure>
  <action name="deleteRelevanceAction" procedure="deleteRelevanceProcedure">
  	<public name="relevanceId" type="String"/>
  </action>
  <procedure name="deleteRelevanceProcedure" code="docAction.deleteRelevance" code-model="/OA/doc/logic/code">
    <parameter name="relevanceId" type="String"/>
  </procedure>
  <action name="updateRelevanceAction" procedure="updateRelevanceProcedure">
  	<public name="relevanceID" type="String"/>
    <public name="sResult" type="String"/>
  </action>
  <procedure name="updateRelevanceProcedure" code="docAction.updateRelevance" code-model="/OA/doc/logic/code">
    <parameter name="relevanceID" type="String"/>
    <parameter name="sResult" type="String"/>
  </procedure>
</model>
