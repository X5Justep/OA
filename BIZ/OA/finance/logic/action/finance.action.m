<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">  
  <!-- OA_FC_CostType -->  
    
    
     
  <!-- OA_FC_LoanType -->  
    
    
    
  <!-- OA_FC_LoanApply -->  
  <action name="createFCLoanApplyAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_FC_LoanApply"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryFCLoanApplyAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_FC_LoanApply"/>  
    <private name="select" type="String" value="OA_FC_LoanApply.*"/>  
    <private name="from" type="String" value="OA_FC_LoanApply OA_FC_LoanApply"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/finance/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_FC_LoanApply"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveFCLoanApplyAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_FC_LoanApply"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/> 
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/finance/data"/> 
  </action>  
  <!-- OA_FC_ReimbApplyM -->  
  <action name="createFCReimbApplyMAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_FC_ReimbApplyM"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryFCReimbApplyMAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_FC_ReimbApplyM"/>  
    <private name="select" type="String" value="OA_FC_ReimbApplyM.*"/>  
    <private name="from" type="String" value="OA_FC_ReimbApplyM OA_FC_ReimbApplyM"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/finance/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_FC_ReimbApplyM"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveFCReimbApplyMAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_FC_ReimbApplyM"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/> 
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/finance/data"/> 
  </action>  
  <!-- OA_FC_ReimbApplyD -->  
  <action name="createFCReimbApplyDAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_FC_ReimbApplyD"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryFCReimbApplyDAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_FC_ReimbApplyD"/>  
    <private name="select" type="String" value="OA_FC_ReimbApplyD.*"/>  
    <private name="from" type="String" value="OA_FC_ReimbApplyD OA_FC_ReimbApplyD"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/finance/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_FC_ReimbApplyD"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveFCReimbApplyDAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_FC_ReimbApplyD"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/finance/data"/> 
  </action>  
  <!-- OA_FC_ReimbBadgutD -->  
  <action name="createFCReimbBadgutDAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_FC_ReimbBadgutD"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryFCReimbBadgutDAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_FC_ReimbBadgutD"/>  
    <private name="select" type="String" value="OA_FC_ReimbBadgutD.*"/>  
    <private name="from" type="String" value="OA_FC_ReimbBadgutD OA_FC_ReimbBadgutD"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/finance/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_FC_ReimbBadgutD"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveFCReimbBadgutDAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_FC_ReimbBadgutD"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/finance/data"/> 
  </action>  
</model>