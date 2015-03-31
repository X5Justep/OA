<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <procedure name="officeSummaryMainProcedure" code-model="/OA/officeSupplyConsumables/logic/code" code="OfficeSupplyConsumables.officeSummaryMain"> 
    <parameter name="beginDate" type="String"/>  
    <parameter name="endDate" type="String"/>  
    <parameter name="dayNum" type="String"/>  
    <parameter name="orgIDs" type="String"/> 
  </procedure>  
  <procedure name="officeSummaryDetailProcedure" code-model="/OA/officeSupplyConsumables/logic/code" code="OfficeSupplyConsumables.officeSummaryDetail"> 
    <parameter name="beginDate" type="String"/>  
    <parameter name="endDate" type="String"/>  
    <parameter name="orgIDs" type="String"/> 
  </procedure>  
  <procedure name="officeSummaryZTProcedure" code-model="/OA/officeSupplyConsumables/logic/code" code="OfficeSupplyConsumables.officeSummaryZT"> 
    <parameter name="beginDate" type="String"/>  
    <parameter name="endDate" type="String"/>  
    <parameter name="dayNum" type="String"/>  
    <parameter name="orgIDs" type="String"/> 
  </procedure>  
  <procedure name="officeSummaryBTProcedure" code-model="/OA/officeSupplyConsumables/logic/code" code="OfficeSupplyConsumables.officeSummaryBT">
    <parameter name="beginDate" type="String"/>
    <parameter name="endDate" type="String"/>
    <parameter name="orgIDs" type="String"/>
  </procedure>
</model>
