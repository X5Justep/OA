<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="insertSignPsnProcedure" code-model="/OA/doc/logic/code" code="Doc.insertSignPsn"> 
    <parameter name="sData1" type="String"/>  
    <parameter name="activity" type="String"/>  
    <parameter name="fCounterSignIDs" type="String"/>  
    <parameter name="isAdd" type="String"/> 
  </procedure>  
  <procedure name="getCActivityOrgUnitProcedure" code-model="/OA/doc/logic/code" code="Doc.getCActivityOrgUnit"> 
    <parameter name="process" type="String"/>
    <parameter name="activity" type="String"/>
  </procedure> 
</model>
