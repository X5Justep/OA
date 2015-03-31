<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">  
    
    
    
    
    
    
  <action name="createOSCBaseInfoAction" procedure="bizCreateProcedure"> 
  	<public name="concept" type="String" value="OA_OSC_BaseInfo"/>
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryOSCBaseInfoAction" procedure="bizQueryProcedure"> 
  	<public name="concept" type="String" value="OA_OSC_BaseInfo"/>
    <public name="idColumn" type="String" value="OA_OSC_BaseInfo"/>  
    <private name="select" type="String" value="OA_OSC_BaseInfo.*"/>  
    <private name="from" type="String" value="OA_OSC_BaseInfo OA_OSC_BaseInfo"/>  
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
    <private name="dataModel" type="String" value="/OA/officeSupplyConsumables/data"/> 
  </action>  
  <action name="saveOSCBaseInfoAction" procedure="bizSaveProcedure"> 
  	<public name="concept" type="String" value="OA_OSC_BaseInfo"/>
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/officeSupplyConsumables/data"/> 
  </action>  
  <action name="createOSCBuyApplyMAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_OSC_BuyApplyM"/>
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryOSCBuyApplyMAction" procedure="bizQueryProcedure"> 
  	<public name="concept" type="String" value="OA_OSC_BuyApplyM"/>
    <public name="idColumn" type="String" value="OA_OSC_BuyApplyM"/>  
    <private name="select" type="String" value="OA_OSC_BuyApplyM.*"/>  
    <private name="from" type="String" value="OA_OSC_BuyApplyM OA_OSC_BuyApplyM"/>  
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
    <private name="dataModel" type="String" value="/OA/officeSupplyConsumables/data"/> 
  </action>  
  <action name="saveOSCBuyApplyMAction" procedure="bizSaveProcedure"> 
  	<public name="concept" type="String" value="OA_OSC_BuyApplyM"/>
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/officeSupplyConsumables/data"/> 
  </action>  
  <action name="createOSCBuyApplyDAction" procedure="bizCreateProcedure"> 
  	<public name="concept" type="String" value="OA_OSC_BuyApplyD"/>
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryOSCBuyApplyDAction" procedure="bizQueryProcedure"> 
  	<public name="concept" type="String" value="OA_OSC_BuyApplyD"/>
    <public name="idColumn" type="String" value="OA_OSC_BuyApplyD"/>  
    <private name="select" type="String" value="OA_OSC_BuyApplyD.*"/>  
    <private name="from" type="String" value="OA_OSC_BuyApplyD OA_OSC_BuyApplyD"/>  
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
    <private name="dataModel" type="String" value="/OA/officeSupplyConsumables/data"/> 
  </action>  
  <action name="saveOSCBuyApplyDAction" procedure="bizSaveProcedure"> 
  	<public name="concept" type="String" value="OA_OSC_BuyApplyD"/>
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/officeSupplyConsumables/data"/> 
  </action>  
  <action name="createOSCUseApplyMAction" procedure="bizCreateProcedure"> 
  	<public name="concept" type="String" value="OA_OSC_UseApplyM"/>
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryOSCUseApplyMAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_OSC_UseApplyM"/>
    <public name="idColumn" type="String" value="OA_OSC_UseApplyM"/>  
    <private name="select" type="String" value="OA_OSC_UseApplyM.*"/>  
    <private name="from" type="String" value="OA_OSC_UseApplyM OA_OSC_UseApplyM"/>  
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
    <private name="dataModel" type="String" value="/OA/officeSupplyConsumables/data"/> 
  </action>  
  <action name="saveOSCUseApplyMAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_OSC_UseApplyM"/>
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/officeSupplyConsumables/data"/> 
  </action>  
  <action name="createOSCUseApplyDAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_OSC_UseApplyD"/>
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryOSCUseApplyDAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_OSC_UseApplyD"/>
    <public name="idColumn" type="String" value="OA_OSC_UseApplyD"/>  
    <private name="select" type="String" value="OA_OSC_UseApplyD.*"/>  
    <private name="from" type="String" value="OA_OSC_UseApplyD OA_OSC_UseApplyD"/>  
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
    <private name="dataModel" type="String" value="/OA/officeSupplyConsumables/data"/> 
  </action>  
  <action name="saveOSCUseApplyDAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_OSC_UseApplyD"/>
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/officeSupplyConsumables/data"/> 
  </action>  
  <action name="queryOSCUseApplyDetailAction" procedure="bizQueryProcedure"> 
  	<public name="concept" type="String" value="OA_OSC_UseApplyD"/>
    <public name="idColumn" type="String" value="OA_OSC_UseApplyD"/>  
    <private name="select" type="String" value="OA_OSC_UseApplyD.*,m.fBizState AS fBizState,m.fBizStateName AS fBizStateName,m.fCreatePsnID AS fCreatePsnID,m.fCreatePsnFID AS fCreatePsnFID,m.fCreateTime AS fCreateTime,m.fApplyDeptName AS fApplyDeptName,m.fApplyPsnID AS fApplyPsnID,m.fApplyPsnName AS fApplyPsnName,m.fApplyPsnFID AS fApplyPsnFID,m.fApplyDate AS fApplyDate"/>  
    <private name="from" type="String" value="OA_OSC_UseApplyD OA_OSC_UseApplyD optional join OA_OSC_UseApplyM m on OA_OSC_UseApplyD.fMasterID = m"/>  
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
    <private name="dataModel" type="String" value="/OA/officeSupplyConsumables/data"/> 
  </action>  
  <action name="canUseAction" procedure="canUseProcedure">
  	<public name="bizID" type="String"/>
  </action>  
  <procedure code="Office.canUse" code-model="/OA/officeSupplyConsumables/logic/code" name="canUseProcedure"> 
    <parameter name="bizID" type="String"/> 
  </procedure> 
  
  <action name="useRegisterAction" procedure="useRegisterProcedure">
  	<public name="bizID" type="String"/>
  </action>  
  <procedure code="Office.useRegister" code-model="/OA/officeSupplyConsumables/logic/code" name="useRegisterProcedure"> 
    <parameter name="bizID" type="String"/> 
  </procedure> 
  
  
</model>