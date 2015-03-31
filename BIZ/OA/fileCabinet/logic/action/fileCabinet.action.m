<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action name="getCabinetInfoAction" procedure="getCabinetInfoProcedure"> 
    <public name="personID" type="String"/>  
    <public name="type" type="String"/> 
  </action>  
  <procedure code="Cabinet.getCabinetInfo" code-model="/OA/fileCabinet/logic/code" name="getCabinetInfoProcedure"> 
    <parameter name="personID" type="String"/>  
    <parameter name="type" type="String"/> 
  </procedure> 
</model>
