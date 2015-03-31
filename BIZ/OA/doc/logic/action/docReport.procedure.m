<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="docSummaryFWProcedure" code-model="/OA/doc/logic/code" code="DocReport.docSummaryFW"> 
    <parameter name="beginDate" type="String"/>  
    <parameter name="endDate" type="String"/>  
    <parameter name="dayNum" type="String"/>  
    <parameter name="orgIDs" type="String"/> 
  </procedure>  
  <procedure name="docSummarySWProcedure" code-model="/OA/doc/logic/code" code="DocReport.docSummarySW"> 
    <parameter name="beginDate" type="String"/>  
    <parameter name="endDate" type="String"/>  
    <parameter name="dayNum" type="String"/>  
    <parameter name="orgIDs" type="String"/> 
  </procedure>  
  <procedure name="docSummarySWChartProcedure" code-model="/OA/doc/logic/code" code="DocReport.docSummarySWChart"> 
    <parameter name="beginDate" type="String"/>  
    <parameter name="endDate" type="String"/>  
    <parameter name="dayNum" type="String"/>  
    <parameter name="orgIDs" type="String"/> 
  </procedure>  
  <procedure name="docSummaryFWChartProcedure" code-model="/OA/doc/logic/code" code="DocReport.docSummaryFWChart"> 
    <parameter name="beginDate" type="String"/>  
    <parameter name="endDate" type="String"/>  
    <parameter name="dayNum" type="String"/>  
    <parameter name="orgIDs" type="String"/> 
  </procedure>  
  <procedure name="docSummaryTaskDetailProcedure" code-model="/OA/doc/logic/code" code="DocReport.docSummaryTaskDetail"> 
    <parameter name="taskType" type="String"/>  
    <parameter name="docType" type="String"/>  
    <parameter name="beginDate" type="String"/>  
    <parameter name="endDate" type="String"/>  
    <parameter name="dayNum" type="String"/>  
    <parameter name="orgIDs" type="String"/> 
  </procedure>  
  <procedure name="docSummaryTaskDetailTitleProcedure" code-model="/OA/doc/logic/code" code="DocReport.docSummaryTaskDetailTitle"> 
    <parameter name="taskType" type="String"/>  
    <parameter name="docType" type="String"/>  
    <parameter name="beginDate" type="String"/>  
    <parameter name="endDate" type="String"/>  
    <parameter name="dayNum" type="String"/>  
    <parameter name="orgIDs" type="String"/> 
  </procedure>  
  <procedure name="sendDocFlowTrackProcedure" code-model="/OA/doc/logic/code" code="DocReport.sendDocFlowTrack"> 
    <parameter name="id" type="String"/> 
  </procedure>  
  <procedure name="sendDocDetailFlowTrackProcedure" code-model="/OA/doc/logic/code" code="DocReport.sendDocDetailFlowTrack"> 
    <parameter name="id" type="String"/> 
  </procedure>  
  <procedure name="receiveDocFlowTrackProcedure" code-model="/OA/doc/logic/code" code="DocReport.receiveDocFlowTrack"> 
    <parameter name="id" type="String"/> 
  </procedure>  
  <procedure name="receiveDocDetailFlowTrackProcedure" code-model="/OA/doc/logic/code" code="DocReport.receiveDocDetailFlowTrack"> 
    <parameter name="id" type="String"/> 
  </procedure>  
  <procedure name="docQueryFlowTrackProcedure" code-model="/OA/doc/logic/code" code="DocReport.docQueryFlowTrack"> 
    <parameter name="id" type="String"/>  
    <parameter name="docType" type="String"/> 
  </procedure>  
  <procedure name="docQueryDetailFlowTrackProcedure" code-model="/OA/doc/logic/code" code="DocReport.docQueryDetailFlowTrack">
    <parameter name="id" type="String"/>
    <parameter name="docType" type="String"/>
  </procedure>
</model>
