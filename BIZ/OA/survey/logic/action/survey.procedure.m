<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="getSurveyFinallyDataProcedure" code-model="/OA/survey/logic/code" code="Survey.getSurveyFinallyData"> 
    <parameter name="paperID" type="String"/> 
  </procedure>  
  <procedure name="getSurveyTaskDataProcedure" code-model="/OA/survey/logic/code" code="Survey.getSurveyTaskData"> 
    <parameter name="task" type="String"/>  
    <parameter name="paperID" type="String"/>  
    <parameter name="surveyID" type="String"/> 
  </procedure>  
  <procedure name="getSurveyPaperDataProcedure" code-model="/OA/survey/logic/code" code="Survey.getSurveyPaperData">
    <parameter name="paperID" type="String"/>
  </procedure>
</model>
