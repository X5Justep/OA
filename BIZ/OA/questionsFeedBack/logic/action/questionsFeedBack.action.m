<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">
  <action name="queryOA_QB_QuestionsFeedBackAction" procedure="bizQueryProcedure">
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="OA_QB_QuestionsFeedBack"/>  
    <private name="select" type="String" value="OA_QB_QuestionsFeedBack.*"/>  
    <private name="from" type="String" value="OA_QB_QuestionsFeedBack OA_QB_QuestionsFeedBack"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/questionsFeedBack/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_QB_QuestionsFeedBack"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveOA_QB_QuestionsFeedBackAction" procedure="bizSaveProcedure">
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="OA_QB_QuestionsFeedBack"/>  
    <private name="dataModel" type="String" value="/OA/questionsFeedBack/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createOA_QB_QuestionsFeedBackAction" procedure="bizCreateProcedure">
    <private name="concept" type="String" value="OA_QB_QuestionsFeedBack"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryOA_QB_ModulesAction" procedure="bizQueryProcedure">
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="OA_QB_Modules"/>  
    <private name="select" type="String" value="OA_QB_Modules.*"/>  
    <private name="from" type="String" value="OA_QB_Modules OA_QB_Modules"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/questionsFeedBack/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_QB_Modules"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="queryProjectNameAction" procedure="bizQueryProcedure">
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="OA_QB_Modules"/>  
    <private name="select" type="String" value="OA_QB_Modules,OA_QB_Modules.fProjectName as fProjectName"/>  
    <private name="from" type="String" value="OA_QB_Modules OA_QB_Modules"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/questionsFeedBack/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String" value="OA_QB_Modules in (select  min(m) from OA_QB_Modules m  group by m.fProjectName)"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_QB_Modules"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveOA_QB_ModulesAction" procedure="bizSaveProcedure">
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="OA_QB_Modules"/>  
    <private name="dataModel" type="String" value="/OA/questionsFeedBack/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createOA_QB_ModulesAction" procedure="bizCreateProcedure">
    <private name="concept" type="String" value="OA_QB_Modules"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
    
    
   
</model>