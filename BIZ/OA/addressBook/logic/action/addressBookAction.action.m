<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  

  <action name="createAddressBookAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_AB_AddressBook"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/>  
  </action>  
  <action name="queryAddressBookAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_AB_AddressBook"/>  
    <private name="select" type="String" value="OA_AB_AddressBook.*,case when OA_AB_AddressBook.fCreatePsnID = :currentPersonID() then 0 else 1 end as isSelf"/>  
    <private name="from" type="String" value="OA_AB_AddressBook OA_AB_AddressBook"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/addressBook/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_AB_AddressBook"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="isSelf asc,OA_AB_AddressBook.fGroup desc,OA_AB_AddressBook.fCreateTime desc"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveAddressBookAction" procedure="bizSaveProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
    <public name="concept" type="String" value="OA_AB_AddressBook"/>  
    <private name="fnModel" type="String"/> 
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/addressBook/data"/> 
  </action>  
   <action name="queryAddressBookShareAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_AB_AddressBookShare"/>  
    <private name="select" type="String" value="OA_AB_AddressBookShare.*"/>  
    <private name="from" type="String" value="OA_AB_AddressBookShare OA_AB_AddressBookShare"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/addressBook/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_AB_AddressBookShare"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>   
  <action name="saveAddressBookShareAction" procedure="bizSaveProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
    <public name="concept" type="String" value="OA_AB_AddressBookShare"/>   
    <private name="fnModel" type="String"/> 
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/addressBook/data"/> 
  </action>  
  <action name="createAddressBookShareAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_AB_AddressBookShare"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="AddressBookShareQueryAction" procedure="AddressBookShareQueryProcedure"> 
    <public name="fCurrentPsnFid" type="String"/>  
  </action>  
  <procedure code="AddressBook.getAddressBookShareIDAction" code-model="/OA/addressBook/logic/code" name="AddressBookShareQueryProcedure"> 
    <parameter name="fCurrentPsnFid" type="String"/>  
  </procedure>  
</model>
