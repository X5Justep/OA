<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action name="docSummaryFWAction" global="false" procedure="docSummaryFWProcedure"> 
    <public type="String" name="beginDate"/>  
    <public type="String" name="endDate"/>  
    <public type="String" name="dayNum"/>  
    <public type="String" name="orgIDs"/> 
  </action>  
  <action name="docSummarySWAction" global="false" procedure="docSummarySWProcedure"> 
    <public type="String" name="beginDate"/>  
    <public type="String" name="endDate"/>  
    <public type="String" name="dayNum"/>  
    <public type="String" name="orgIDs"/> 
  </action>  
  <action name="docSummaryFWChartAction" global="false" procedure="docSummaryFWChartProcedure"> 
    <public type="String" name="beginDate"/>  
    <public type="String" name="endDate"/>  
    <public type="String" name="dayNum"/>  
    <public type="String" name="orgIDs"/> 
  </action>  
  <action name="docSummarySWChartAction" global="false" procedure="docSummarySWChartProcedure"> 
    <public type="String" name="beginDate"/>  
    <public type="String" name="endDate"/>  
    <public type="String" name="dayNum"/>  
    <public type="String" name="orgIDs"/> 
  </action>  
  <action name="docSummaryTaskDetailAction" global="false" procedure="docSummaryTaskDetailProcedure">
    <public type="String" required="true" name="taskType"/>  
    <public type="String" required="true" name="docType"/>  
    <public type="String" required="true" name="beginDate"/>  
    <public type="String" required="true" name="endDate"/>  
    <public type="String" name="dayNum" required="true"/>  
    <public type="String" name="orgIDs" required="true"/> 
  </action>  
  <action name="docSummaryTaskDetailTitleAction" global="false" procedure="docSummaryTaskDetailTitleProcedure">
    <public type="String" required="true" name="taskType"/>  
    <public type="String" required="true" name="docType"/>  
    <public type="String" required="true" name="beginDate"/>  
    <public type="String" required="true" name="endDate"/>  
    <public type="String" name="dayNum" required="true"/>  
    <public type="String" name="orgIDs" required="true"/>  
  </action> 
<action name="sendDocFlowTrackAction" global="false" procedure="sendDocFlowTrackProcedure"><public type="String" required="true" name="id"/>
</action>
<action name="sendDocDetailFlowTrackAction" global="false" procedure="sendDocDetailFlowTrackProcedure"><public type="String" required="true" name="id"/>
</action>
<action name="receiveDocFlowTrackAction" global="false" procedure="receiveDocFlowTrackProcedure"><public type="String" required="true" name="id"/>
</action>
<action name="receiveDocDetailFlowTrackAction" global="false" procedure="receiveDocDetailFlowTrackProcedure"><public type="String" required="true" name="id"/>
</action>
<action name="docQueryFlowTrackAction" global="false" procedure="docQueryFlowTrackProcedure"><public type="String" required="true" name="id"/>
<public type="String" required="true" name="docType"/>
</action>
<action name="docQueryDetailFlowTrackAction" global="false" procedure="docQueryDetailFlowTrackProcedure"><public type="String" required="true" name="id"/>
<public type="String" required="true" name="docType"/>
</action>
</model>
