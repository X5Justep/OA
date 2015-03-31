<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action name="createLSLicenseManageAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_LS_LicenseManage"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryLSLicenseManageAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_LS_LicenseManage"/>  
    <private name="select" type="String" value="OA_LS_LicenseManage.*"/>  
    <private name="from" type="String" value="OA_LS_LicenseManage OA_LS_LicenseManage"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/license/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_LS_LicenseManage"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveLSLicenseManageAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_LS_LicenseManage"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/license/data"/> 
  </action>   
  <action name="createLSLicenseApplyMAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_LS_LicenseApplyM"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryLSLicenseApplyMAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_LS_LicenseApplyM"/>  
    <private name="select" type="String" value="OA_LS_LicenseApplyM.*"/>  
    <private name="from" type="String" value="OA_LS_LicenseApplyM OA_LS_LicenseApplyM"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/license/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_LS_LicenseApplyM"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveLSLicenseApplyMAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_LS_LicenseApplyM"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/> 
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/license/data"/> 
  </action>  
  <action name="createLSLicenseApplyDAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_LS_LicenseApplyD"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryLSLicenseApplyDAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_LS_LicenseApplyD"/>  
    <private name="select" type="String" value="OA_LS_LicenseApplyD.*"/>  
    <private name="from" type="String" value="OA_LS_LicenseApplyD OA_LS_LicenseApplyD"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/license/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_LS_LicenseApplyD"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveLSLicenseApplyDAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_LS_LicenseApplyD"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/license/data"/> 
  </action>   
  <action name="createLSApplyExecuteAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_LS_ApplyExecute"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryLSApplyExecuteAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_LS_ApplyExecute"/>  
    <private name="select" type="String" value="OA_LS_ApplyExecute.*"/>  
    <private name="from" type="String" value="OA_LS_ApplyExecute OA_LS_ApplyExecute"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/license/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_LS_ApplyExecute"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveLSApplyExecuteAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_LS_ApplyExecute"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/license/data"/> 
  </action>   
  <action name="createLSLicenseViewAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_LS_LicenseView"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryLSLicenseViewAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_LS_LicenseView"/>  
    <private name="select" type="String" value="OA_LS_LicenseView.*"/>  
    <private name="from" type="String" value="OA_LS_LicenseView OA_LS_LicenseView"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/license/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_LS_LicenseView"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveLSLicenseViewAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_LS_LicenseView"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/> 
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/license/data"/> 
  </action>  
  <!-- Actions -->  
  <action name="LicenseBackAction" procedure="LicenseBackProcedure"> 
    <public name="fInfoID" type="String"/>  
    <public name="fRecDate" type="String"/>  
    <public name="fApplyID" type="String"/>  
    <public name="fLicenseID" type="String"/> 
  </action>  
  <procedure name="LicenseBackProcedure" code-model="/OA/license/logic/code" code="License.licenseBack"> 
    <parameter name="fInfoID" type="String"/>  
    <parameter name="fRecDate" type="String"/>  
    <parameter name="fApplyID" type="String"/>  
    <parameter name="fLicenseID" type="String"/> 
  </procedure>  
  <action name="isExistInLicenseApplyDAction" procedure="isExistInLicenseApplyDProcedure"> 
    <public name="fLicenseID" type="String"/> 
  </action>  
  <procedure name="isExistInLicenseApplyDProcedure" code-model="/OA/license/logic/code" code="License.isExistInLicenseApplyD"> 
    <parameter name="fLicenseID" type="String"/> 
  </procedure>  
  <action name="updateLicenseStateAction" procedure="updateLicenseStateProcedure"> 
    <public name="fUseStatus" type="String"/>  
    <public name="fUseStatusName" type="String"/>  
    <public name="applyID" type="String"/> 
  </action>  
  <procedure name="updateLicenseStateProcedure" code-model="/OA/license/logic/code" code="License.updateLicenseState"> 
    <parameter name="fUseStatus" type="String"/>  
    <parameter name="fUseStatusName" type="String"/>  
    <parameter name="applyID" type="String"/> 
  </procedure> 
</model>
