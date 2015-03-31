<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action name="officeSummaryMainAction" global="false" procedure="officeSummaryMainProcedure"> 
    <public type="String" name="beginDate"/>  
    <public type="String" name="endDate"/>  
    <public type="String" name="dayNum"/>  
    <public type="String" name="orgIDs"/> 
  </action>  
  <action name="officeSummaryDetailAction" global="false" procedure="officeSummaryDetailProcedure">
    <public type="String" name="beginDate"/>  
    <public type="String" name="endDate"/>  
    <public type="String" name="orgIDs"/> 
  </action>  
  <action name="officeSummaryZTAction" global="false" procedure="officeSummaryZTProcedure">
    <public type="String" name="beginDate"/>  
    <public type="String" name="endDate"/>  
    <public type="String" name="dayNum"/>  
    <public type="String" name="orgIDs"/> 
  </action>  
  <action name="officeSummaryBTAction" global="false" procedure="officeSummaryBTProcedure">
    <public type="String" name="beginDate"/>  
    <public type="String" name="endDate"/>  
    <public type="String" name="orgIDs"/> 
  </action> 
</model>
