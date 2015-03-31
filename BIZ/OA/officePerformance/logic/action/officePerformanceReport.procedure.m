<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="countTaskReportProcedure" code-model="/OA/officePerformance/logic/code" code="OfficePerformanceReport.countTaskReport"> 
    <parameter name="beginDate" type="String"/>  
    <parameter name="endDate" type="String"/>  
    <parameter name="orgID" type="String"/> 
  </procedure>  
  <procedure name="countTaskPieReportProcedure" code-model="/OA/officePerformance/logic/code" code="OfficePerformanceReport.countTaskPieReport"> 
    <parameter name="beginDate" type="String"/>  
    <parameter name="endDate" type="String"/>  
    <parameter name="orgID" type="String"/> 
  </procedure>  
  <procedure name="countTaskSeriesReportProcedure" code-model="/OA/officePerformance/logic/code" code="OfficePerformanceReport.countTaskSeriesReport">
    <parameter name="beginDate" type="String"/>
    <parameter name="endDate" type="String"/>
    <parameter name="orgID" type="String"/>
  </procedure>
</model>
