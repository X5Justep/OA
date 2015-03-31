<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <!-- OA_BG_ApplyM -->  
  <action name="createBGApplyMAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_BG_ApplyM"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryBGApplyMAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_BG_ApplyM"/>  
    <private name="select" type="String" value="OA_BG_ApplyM.*"/>  
    <private name="from" type="String" value="OA_BG_ApplyM OA_BG_ApplyM"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/badgut/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_BG_ApplyM"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveBGApplyMAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_BG_ApplyM"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>   
    <private name="fnModel" type="String"/>   
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/badgut/data"/> 
  </action>  
  <!-- OA_BG_ApplyD -->  
  <action name="createBGApplyDAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_BG_ApplyD"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryBGApplyDAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_BG_ApplyD"/>  
    <private name="select" type="String" value="OA_BG_ApplyD.*"/>  
    <private name="from" type="String" value="OA_BG_ApplyD OA_BG_ApplyD"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/badgut/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_BG_ApplyD"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveBGApplyDAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_BG_ApplyD"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>   
    <private name="fnModel" type="String"/>   
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/badgut/data"/> 
  </action>  
  <!-- OA_BG_AlterM -->  
  <action name="createBGAlterMAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_BG_AlterM"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryBGAlterMAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_BG_AlterM"/>  
    <private name="select" type="String" value="OA_BG_AlterM.*"/>  
    <private name="from" type="String" value="OA_BG_AlterM OA_BG_AlterM"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/badgut/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_BG_AlterM"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveBGAlterMAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_BG_AlterM"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>   
    <private name="fnModel" type="String"/>   
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/badgut/data"/> 
  </action>  
  <!-- OA_BG_AlterD -->  
  <action name="createBGAlterDAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_BG_AlterD"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryBGAlterDAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_BG_AlterD"/>  
    <private name="select" type="String" value="OA_BG_AlterD.*"/>  
    <private name="from" type="String" value="OA_BG_AlterD OA_BG_AlterD"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/badgut/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_BG_AlterD"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveBGAlterDAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_BG_AlterD"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>   
    <private name="fnModel" type="String"/>   
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/badgut/data"/> 
  </action>  
  <!-- actions -->  
  <action name="applicationTemplate" procedure="applicationTemplateProcedure"> 
    <public name="applyID" type="String"/> 
  </action>  
  <procedure code="badgut.applicationTemplate" code-model="/OA/badgut/logic/code" name="applicationTemplateProcedure"> 
    <parameter name="applyID" type="String"/> 
  </procedure>  
  <action name="getConfig" procedure="getConfigProcedure"/>  
  <procedure code="badgut.getConfig" code-model="/OA/badgut/logic/code" name="getConfigProcedure"/>  
  <action name="setConfig" procedure="setConfigProcedure"> 
    <public name="aYear" type="String"/>  
    <public name="aMonth" type="String"/> 
  </action>  
  <procedure code="badgut.setConfig" code-model="/OA/badgut/logic/code" name="setConfigProcedure"> 
    <parameter name="aYear" type="String"/>  
    <parameter name="aMonth" type="String"/> 
  </procedure>  
  <action name="checkBadgut" procedure="checkBadgutProcedure"> 
    <public name="badgutInfo" type="Xml"/> 
  </action>  
  <procedure code="com.justep.OA.badgut.badgutInterface.checkBadgut" code-model="/OA/badgut/logic/code" name="checkBadgutProcedure"> 
    <parameter name="badgutInfo" type="Xml"/> 
  </procedure>  
  <action name="getBadgutData" procedure="getBadgutDataProcedure"> 
    <public name="badgutIDs" type="String"/>  
    <public name="alterID" type="String"/> 
  </action>  
  <procedure code="badgut.getBadgutData" code-model="/OA/badgut/logic/code" name="getBadgutDataProcedure"> 
    <parameter name="badgutIDs" type="String"/>  
    <parameter name="alterID" type="String"/> 
  </procedure>  
  <!-- OA_BG_History -->  
  <action name="queryBGHistoryAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_BG_History"/>  
    <private name="select" type="String" value="OA_BG_History.*"/>  
    <private name="from" type="String" value="OA_BG_History OA_BG_History"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/badgut/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_BG_History"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <!-- OA_BG_BadgutD Query -->  
  <action name="queryBGBadgutAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_BG_BadgutD"/>  
    <private name="select" type="String" value="OA_BG_BadgutD.*,m.fCostCenterID AS fCostCenterID,m.fCostCenterCode AS fCostCenterCode,m.fCostCenterName AS fCostCenterName,m.fYear AS fYear"/>  
    <private name="from" type="String" value="OA_BG_BadgutD OA_BG_BadgutD optional join OA_BG_BadgutM m on OA_BG_BadgutD.fBGBadgutID=m"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/badgut/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_BG_BadgutD"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action> 
</model>
