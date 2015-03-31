<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">  
  <!-- OA_CA_CarKindSet -->  
    
    
    
  <!-- OA_CA_UseKindSet -->  
    
    
    
  <!-- OA_CA_FeeKindSet -->  
    
    
    
  <!-- OA_CA_PeccancyKindSet -->  
    
    
    
  <!-- OA_CA_YearCheckItemSet -->  
    
    
    
  <!-- OA_CA_CarBasicInfo -->  
  <action name="createCACarBasicInfoAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarBasicInfo"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryCACarBasicInfoAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarBasicInfo"/>  
    <private name="select" type="String" value="OA_CA_CarBasicInfo.*"/>  
    <private name="from" type="String" value="OA_CA_CarBasicInfo OA_CA_CarBasicInfo"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_CA_CarBasicInfo"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveCACarBasicInfoAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarBasicInfo"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String"/> 
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/> 
  </action>  
  <!-- OA_CA_DriverBasicInfo -->  
  <action name="createCADriverBasicInfoAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_CA_DriverBasicInfo"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryCADriverBasicInfoAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_CA_DriverBasicInfo"/>  
    <private name="select" type="String" value="OA_CA_DriverBasicInfo.*"/>  
    <private name="from" type="String" value="OA_CA_DriverBasicInfo OA_CA_DriverBasicInfo"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_CA_DriverBasicInfo"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveCADriverBasicInfoAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_CA_DriverBasicInfo"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String"/> 
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/> 
  </action>  
  <!-- OA_CA_CarYearCheckInfo -->  
  <action name="createCACarYearCheckInfoAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarYearCheckInfo"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryCACarYearCheckInfoAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarYearCheckInfo"/>  
    <private name="select" type="String" value="OA_CA_CarYearCheckInfo.*"/>  
    <private name="from" type="String" value="OA_CA_CarYearCheckInfo OA_CA_CarYearCheckInfo"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_CA_CarYearCheckInfo"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveCACarYearCheckInfoAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarYearCheckInfo"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String"/> 
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/> 
  </action>  
  <!-- OA_CA_CarSafetyInfo -->  
  <action name="createCACarSafetyInfoAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarSafetyInfo"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryCACarSafetyInfoAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarSafetyInfo"/>  
    <private name="select" type="String" value="OA_CA_CarSafetyInfo.*"/>  
    <private name="from" type="String" value="OA_CA_CarSafetyInfo OA_CA_CarSafetyInfo"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_CA_CarSafetyInfo"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveCACarSafetyInfoAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarSafetyInfo"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String"/> 
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/> 
  </action>  
  <!-- OA_AS_Kind -->  
    
    
    
  <!-- OA_AS_Card -->  
  <action name="createASCardAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_AS_Card"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryASCardAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_AS_Card"/>  
    <private name="select" type="String" value="OA_AS_Card.*"/>  
    <private name="from" type="String" value="OA_AS_Card OA_AS_Card"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_AS_Card"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveASCardAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_AS_Card"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String"/> 
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/> 
  </action>  
  <!-- OA_CA_CarUseApply -->  
  <action name="createCACarUseApplyAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarUseApply"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryCACarUseApplyAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarUseApply"/>  
    <private name="select" type="String" value="OA_CA_CarUseApply.*"/>  
    <private name="from" type="String" value="OA_CA_CarUseApply OA_CA_CarUseApply"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_CA_CarUseApply"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveCACarUseApplyAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarUseApply"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String"/> 
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/> 
  </action>  
  <!-- OA_CA_CarUseExecute -->  
  <action name="createCACarUseExecuteAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarUseExecute"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryCACarUseExecuteAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarUseExecute"/>  
    <private name="select" type="String" value="OA_CA_CarUseExecute.*"/>  
    <private name="from" type="String" value="OA_CA_CarUseExecute OA_CA_CarUseExecute"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_CA_CarUseExecute"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveCACarUseExecuteAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarUseExecute"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String"/> 
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/> 
  </action>  
  <!-- OA_CA_CarUseArrange -->  
  <action name="createCACarUseArrangeAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarUseArrange"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryCACarUseArrangeAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarUseArrange"/>  
    <private name="select" type="String" value="OA_CA_CarUseArrange.*"/>  
    <private name="from" type="String" value="OA_CA_CarUseArrange OA_CA_CarUseArrange"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_CA_CarUseArrange"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveCACarUseArrangeAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarUseArrange"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String"/> 
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/> 
  </action>  
  <!-- OA_CA_CarManage -->  
  <action name="createCACarManageAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarManage"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryCACarManageAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarManage"/>  
    <private name="select" type="String" value="OA_CA_CarManage.*"/>  
    <private name="from" type="String" value="OA_CA_CarManage OA_CA_CarManage"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_CA_CarManage"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveCACarManageAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarManage"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String"/> 
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/> 
  </action>  
  <!-- OA_CA_CarManageArrange -->  
  <action name="createCACarManageArrangeAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarManageArrange"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryCACarManageArrangeAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarManageArrange"/>  
    <private name="select" type="String" value="OA_CA_CarManageArrange.*"/>  
    <private name="from" type="String" value="OA_CA_CarManageArrange OA_CA_CarManageArrange"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_CA_CarManageArrange"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveCACarManageArrangeAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarManageArrange"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String"/> 
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/> 
  </action>  
  <!-- OA_CA_PeccancyRecord -->  
  <action name="createCAPeccancyRecordAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_CA_PeccancyRecord"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryCAPeccancyRecordAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_CA_PeccancyRecord"/>  
    <private name="select" type="String" value="OA_CA_PeccancyRecord.*"/>  
    <private name="from" type="String" value="OA_CA_PeccancyRecord OA_CA_PeccancyRecord"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_CA_PeccancyRecord"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveCAPeccancyRecordAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_CA_PeccancyRecord"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String"/> 
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/> 
  </action>  
  <!-- OA_CA_AccidentRecord -->  
  <action name="createCAAccidentRecordAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_CA_AccidentRecord"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryCAAccidentRecordAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_CA_AccidentRecord"/>  
    <private name="select" type="String" value="OA_CA_AccidentRecord.*"/>  
    <private name="from" type="String" value="OA_CA_AccidentRecord OA_CA_AccidentRecord"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_CA_AccidentRecord"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveCAAccidentRecordAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_CA_AccidentRecord"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String"/> 
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/> 
  </action>  
  <!-- OA_CA_CarRecord -->  
  <action name="createCACarRecordAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarRecord"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryCACarRecordAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarRecord"/>  
    <private name="select" type="String" value="OA_CA_CarRecord.*"/>  
    <private name="from" type="String" value="OA_CA_CarRecord OA_CA_CarRecord"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_CA_CarRecord"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveCACarRecordAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarRecord"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String"/> 
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/> 
  </action>  
  <!-- OA_CA_CarRecordFeeDetail -->  
  <action data-model="/OA/car/data" name="createCACarRecordFeeDetailAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarRecordFeeDetail"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action data-model="/OA/car/data" name="queryCACarRecordFeeDetailAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarRecordFeeDetail"/>  
    <private name="select" type="String" value="OA_CA_CarRecordFeeDetail.*"/>  
    <private name="from" type="String" value="OA_CA_CarRecordFeeDetail OA_CA_CarRecordFeeDetail"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_CA_CarRecordFeeDetail"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action data-model="/OA/car/data" name="saveCACarRecordFeeDetailAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarRecordFeeDetail"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String"/> 
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/> 
  </action>  
  <!-- OA_CA_CarManageArrange Query -->  
  <action data-model="/OA/car/data" name="queryCACarManageArrangeDetailAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarManageArrange"/>  
    <private name="select" type="String" value="OA_CA_CarManageArrange.*,c.fNO AS fNO,c.fApplyDeptID AS fApplyDeptID,c.fApplyDeptName AS fApplyDeptName,c.fApplyPsnID AS fApplyPsnID,c.fApplyPsnName AS fApplyPsnName,c.fBeginTime AS fBeginTime,c.fEndTime AS fEndTime,c.fApplyDate AS fApplyDate"/>  
    <private name="from" type="String" value="OA_CA_CarManageArrange OA_CA_CarManageArrange optional join OA_CA_CarManage c on OA_CA_CarManageArrange.fMasterID = c"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_CA_CarManageArrange"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <!-- OA_CA_CarBasicInfo Query -->  
  <action name="queryCACarDriverInfoAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_CA_CarBasicInfo"/>  
    <private name="select" type="String" value="OA_CA_CarBasicInfo.*,d.fTelephone"/>  
    <private name="from" type="String" value="OA_CA_CarBasicInfo OA_CA_CarBasicInfo optional join OA_CA_DriverBasicInfo d on OA_CA_CarBasicInfo.fCarDriverID = d"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/car/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_CA_CarBasicInfo"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <!-- Java Action -->  
  <action name="checkUniquenessAction" procedure="checkUniquenessProcedure"> 
    <public name="id" type="String"/>  
    <public name="code" type="String"/>  
    <public name="fieldName" type="String"/>  
    <public name="tableName" type="String"/> 
  </action>  
  <procedure code="Car.checkUniqueness" code-model="/OA/car/logic/code" name="checkUniquenessProcedure"> 
    <parameter name="id" type="String"/>  
    <parameter name="code" type="String"/>  
    <parameter name="fieldName" type="String"/>  
    <parameter name="tableName" type="String"/> 
  </procedure>  
  <action name="deleteDataAction" procedure="deleteDataProcedure"> 
    <public name="id" type="String"/> 
  </action>  
  <procedure code="Car.deleteData" code-model="/OA/car/logic/code" name="deleteDataProcedure"> 
    <parameter name="id" type="String"/> 
  </procedure>  
  <action name="checkCarUsedAction" procedure="checkCarUsedProcedure"> 
    <public name="fCarID" type="String"/>  
    <public name="fBeginTime" type="String"/>  
    <public name="fEndTime" type="String"/>  
    <public name="fArrangeID" type="String"/> 
  </action>  
  <procedure code="Car.checkCarUsed" code-model="/OA/car/logic/code" name="checkCarUsedProcedure"> 
    <parameter name="fCarID" type="String"/>  
    <parameter name="fBeginTime" type="String"/>  
    <parameter name="fEndTime" type="String"/>  
    <parameter name="fArrangeID" type="String"/> 
  </procedure>  
  <action name="upDataFieldValueAction" procedure="upDataFieldValueProcedure"> 
    <public name="id" type="String"/>  
    <public name="fieldName" type="String"/>  
    <public name="fieldValue" type="String"/>  
    <public name="tableName" type="String"/> 
  </action>  
  <procedure code="Car.upDataFieldValue" code-model="/OA/car/logic/code" name="upDataFieldValueProcedure"> 
    <parameter name="id" type="String"/>  
    <parameter name="fieldName" type="String"/>  
    <parameter name="fieldValue" type="String"/>  
    <parameter name="tableName" type="String"/> 
  </procedure>  
  <action name="upDataArrangeAction" procedure="upDataArrangeProcedure"> 
    <public name="arrangeID" type="String"/> 
  </action>  
  <procedure code="Car.upDataArrange" code-model="/OA/car/logic/code" name="upDataArrangeProcedure"> 
    <parameter name="arrangeID" type="String"/> 
  </procedure> 
<action name="queryOA_CA_FeesRegisterAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_CA_FeesRegister"/>
<private name="select" type="String" value="OA_CA_FeesRegister.*"/>
<private name="from" type="String" value="OA_CA_FeesRegister OA_CA_FeesRegister"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/car/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_CA_FeesRegister"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveOA_CA_FeesRegisterAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="OA_CA_FeesRegister"/>
<private name="dataModel" type="String" value="/OA/car/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createOA_CA_FeesRegisterAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="OA_CA_FeesRegister"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
</model>