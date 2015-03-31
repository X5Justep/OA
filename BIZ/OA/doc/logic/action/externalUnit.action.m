<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <action name="queryOA_DC_ExternalUnitAction" procedure="bizQueryProcedure">
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="OA_DC_ExternalUnit"/>  
    <private name="select" type="String" value="OA_DC_ExternalUnit.*"/>  
    <private name="from" type="String" value="OA_DC_ExternalUnit OA_DC_ExternalUnit"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/doc/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_DC_ExternalUnit"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveOA_DC_ExternalUnitAction" procedure="bizSaveProcedure">
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/> 
    <private name="concept" type="String" value="OA_DC_ExternalUnit"/>  
    <private name="dataModel" type="String" value="/OA/doc/data"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Table"/> 
  </action>  
  <action name="createOA_DC_ExternalUnitAction" procedure="bizCreateProcedure">
    <private name="concept" type="String" value="OA_DC_ExternalUnit"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action> 
</model>
