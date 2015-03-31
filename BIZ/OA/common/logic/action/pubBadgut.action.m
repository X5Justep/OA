<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">  
  <action name="createBGCostCenterAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_BG_CostCenter"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryBGCostCenterAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_BG_CostCenter"/>  
    <private name="select" type="String" value="OA_BG_CostCenter.*"/>  
    <private name="from" type="String" value="OA_BG_CostCenter OA_BG_CostCenter"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/common/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_BG_CostCenter"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveBGCostCenterAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_BG_CostCenter"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/common/data"/> 
  </action>  
  <action name="createBGCostAccountAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_BG_CostAccount"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryBGCostAccountAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_BG_CostAccount"/>  
    <private name="select" type="String" value="OA_BG_CostAccount.*"/>  
    <private name="from" type="String" value="OA_BG_CostAccount OA_BG_CostAccount"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/common/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_BG_CostAccount"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveBGCostAccountAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_BG_CostAccount"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/common/data"/> 
  </action>  
    
    
   
</model>