<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <action name="createFlowLanchApplyAction" procedure="bizCreateProcedure">
    <public name="concept" type="String" value="OA_FL_FlowLanchApply"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/>
  </action>
  <action name="queryFlowLanchApplyAction" procedure="bizQueryProcedure">
    <public name="concept" type="String" value="OA_FL_FlowLanchApply"/>  
    <public name="idColumn" type="String" value="OA_FL_FlowLanchApply"/>  
    <private name="select" type="String" value="OA_FL_FlowLanchApply.*"/>  
    <private name="from" type="String" value="OA_FL_FlowLanchApply OA_FL_FlowLanchApply"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <private name="aggregate" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <private name="fnModel" type="String"/>  
    <private name="dataModel" type="String" value="/OA/flowLanch/data"/> 
    
  </action>
  <action name="saveFlowLanchApplyAction" procedure="bizSaveProcedure" >
    <public name="concept" type="String" value="OA_FL_FlowLanchApply"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/flowLanch/data"/>
    
  </action>
  <action name="createOSCUseExecuteAction" procedure="bizCreateProcedure" >
    <public name="concept" type="String" value="OA_FL_FlowLanchExecute"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/>
    
  </action>
  <action name="queryOSCUseExecuteAction" procedure="bizQueryProcedure" >
    <public name="concept" type="String" value="OA_FL_FlowLanchExecute"/>  
    <public name="idColumn" type="String" value="OA_FL_FlowLanchExecute"/>  
    <private name="select" type="String" value="OA_FL_FlowLanchExecute.*"/>  
    <private name="from" type="String" value="OA_FL_FlowLanchExecute OA_FL_FlowLanchExecute"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <private name="aggregate" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <private name="fnModel" type="String"/>  
    <private name="dataModel" type="String" value="/OA/flowLanch/data"/> 
    
  </action>
  <action name="saveOSCUseExecuteAction" procedure="bizSaveProcedure" data-model="/OA/flowLanch/data">
    <public name="concept" type="String" value="OA_FL_FlowLanchExecute"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/flowLanch/data"/>
    
  </action>
</model>
