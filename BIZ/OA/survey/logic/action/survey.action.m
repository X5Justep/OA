<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action name="createVSPaperAction" procedure="bizCreateProcedure" data-model="/OA/survey/data"> 
    <public name="concept" type="String" value="OA_VS_Paper"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryVSPaperAction" procedure="bizQueryProcedure" data-model="/OA/survey/data"> 
    <public name="concept" type="String" value="OA_VS_Paper"/>  
    <private name="select" type="String" value="OA_VS_Paper.*"/>  
    <private name="from" type="String" value="OA_VS_Paper OA_VS_Paper"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/survey/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_VS_Paper"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
  </action>  
  <action name="saveVSPaperAction" procedure="bizSaveProcedure" data-model="/OA/survey/data"> 
    <public name="concept" type="String" value="OA_VS_Paper"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/survey/data"/> 
  </action>  
  <action name="createVSQuestionAction" procedure="bizCreateProcedure" data-model="/OA/survey/data"> 
     <public name="concept" type="String" value="OA_VS_Question"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryVSQuestionAction" procedure="bizQueryProcedure" data-model="/OA/survey/data"> 
    <public name="concept" type="String" value="OA_VS_Question"/>  
    <private name="select" type="String" value="OA_VS_Question.*"/>  
    <private name="from" type="String" value="OA_VS_Question OA_VS_Question"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/survey/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_VS_Question"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
  </action>  
  <action name="saveVSQuestionAction" procedure="bizSaveProcedure" data-model="/OA/survey/data"> 
    <public name="concept" type="String" value="OA_VS_Question"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/survey/data"/> 
  </action>  
  <action name="queryOAVSSurveyAction" procedure="bizQueryProcedure" data-model="/OA/survey/data"> 
    <public name="concept" type="String" value="V_OA_VS_Survey"/>  
    <private name="select" type="String" value="V_OA_VS_Survey.*"/>  
    <private name="from" type="String" value="V_OA_VS_Survey V_OA_VS_Survey"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/survey/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="V_OA_VS_Survey"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
  </action>  
  <action name="queryOAVSAnswerAction" procedure="bizQueryProcedure" data-model="/OA/survey/data"> 
    <public name="concept" type="String" value="V_OA_VS_Answer"/>  
    <private name="select" type="String" value="V_OA_VS_Answer.*"/>  
    <private name="from" type="String" value="V_OA_VS_Answer V_OA_VS_Answer"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/survey/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="V_OA_VS_Answer"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
  </action>  
  <action name="createVSItemsAction" procedure="bizCreateProcedure" data-model="/OA/survey/data"> 
    <public name="concept" type="String" value="OA_VS_Items"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryVSItemsAction" procedure="bizQueryProcedure" data-model="/OA/survey/data"> 
    <public name="concept" type="String" value="OA_VS_Items"/>  
    <private name="select" type="String" value="OA_VS_Items.*"/>  
    <private name="from" type="String" value="OA_VS_Items OA_VS_Items"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/survey/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_VS_Items"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
  </action>  
  <action name="saveVSItemsAction" procedure="bizSaveProcedure" data-model="/OA/survey/data"> 
    <public name="concept" type="String" value="OA_VS_Items"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/survey/data"/> 
  </action>  
  <action name="queryOAVSItemsAction" procedure="bizQueryProcedure" data-model="/OA/survey/data"> 
    <public name="concept" type="String" value="V_OA_VS_Items"/>  
    <private name="select" type="String" value="V_OA_VS_Items.*"/>  
    <private name="from" type="String" value="V_OA_VS_Items V_OA_VS_Items"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/survey/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="V_OA_VS_Items"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
  </action>  
  <action name="createVSSurveyAction" procedure="bizCreateProcedure" data-model="/OA/survey/data"> 
    <public name="concept" type="String" value="OA_VS_Survey"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryVSSurveyAction" procedure="bizQueryProcedure" data-model="/OA/survey/data"> 
    <public name="concept" type="String" value="OA_VS_Survey"/>  
    <private name="select" type="String" value="OA_VS_Survey.*"/>  
    <private name="from" type="String" value="OA_VS_Survey OA_VS_Survey"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/survey/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_VS_Survey"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
  </action>  
  <action name="saveVSSurveyAction" procedure="bizSaveProcedure" data-model="/OA/survey/data"> 
    <public name="concept" type="String" value="OA_VS_Survey"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/survey/data"/> 
  </action>  
  <action name="createVSDetailAction" procedure="bizCreateProcedure" data-model="/OA/survey/data"> 
    <public name="concept" type="String" value="OA_VS_Detail"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryVSDetailAction" procedure="bizQueryProcedure" data-model="/OA/survey/data"> 
    <public name="concept" type="String" value="OA_VS_Detail"/>  
    <private name="select" type="String" value="OA_VS_Detail.*"/>  
    <private name="from" type="String" value="OA_VS_Detail OA_VS_Detail"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/survey/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_VS_Detail"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
  </action>  
  <action name="saveVSDetailAction" procedure="bizSaveProcedure" data-model="/OA/survey/data"> 
    <public name="concept" type="String" value="OA_VS_Detail"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/survey/data"/> 
  </action>  
  <action name="queryOAVSSumQuestionAction" procedure="bizQueryProcedure" data-model="/OA/survey/data"> 
    <public name="concept" type="String" value="V_OA_VS_SumQuestion"/>  
    <private name="select" type="String" value="V_OA_VS_SumQuestion.*"/>  
    <private name="from" type="String" value="V_OA_VS_SumQuestion V_OA_VS_SumQuestion"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/survey/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="V_OA_VS_SumQuestion"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
  </action>  
  <action name="queryOAVSSumItemsAction" procedure="bizQueryProcedure" data-model="/OA/survey/data"> 
    <public name="concept" type="String" value="V_OA_VS_SumItems"/>  
    <private name="select" type="String" value="V_OA_VS_SumItems.*"/>  
    <private name="from" type="String" value="V_OA_VS_SumItems V_OA_VS_SumItems"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/survey/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="V_OA_VS_SumItems"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
  </action>  
  <action name="sendSurveyAction" procedure="sendSurveyProcedure"> 
    <public name="paperID" type="String"/> 
  </action>  
  <procedure name="sendSurveyProcedure" code="Survey.sendSurvey" code-model="/OA/survey/logic/code"> 
    <parameter name="paperID" type="String"/> 
  </procedure>  
  <action name="singleSendSurveyAction" procedure="singleSendSurveyProcedure"> 
    <public name="paperID" type="String"/>  
    <public name="surveyID" type="String"/> 
  </action>  
  <procedure name="singleSendSurveyProcedure" code="Survey.singleSendSurvey" code-model="/OA/survey/logic/code"> 
    <parameter name="paperID" type="String"/>  
    <parameter name="surveyID" type="String"/> 
  </procedure>  
  <action name="destroySurveyAction" procedure="destroySurveyProcedure"> 
    <public name="taskID" type="String"/>  
    <public name="surveyID" type="String"/> 
  </action>  
  <procedure name="destroySurveyProcedure" code="Survey.destroySurvey" code-model="/OA/survey/logic/code"> 
    <parameter name="taskID" type="String"/>  
    <parameter name="surveyID" type="String"/> 
  </procedure>  
  <action name="finishSurveyAction" procedure="finishSurveyProcedure"> 
    <public name="paperID" type="String"/> 
  </action>  
  <procedure name="finishSurveyProcedure" code="Survey.finishSurvey" code-model="/OA/survey/logic/code"> 
    <parameter name="paperID" type="String"/> 
  </procedure>  
  <action name="abortSurveyAction" procedure="abortSurveyProcedure"> 
    <public name="paperID" type="String"/> 
  </action>  
  <procedure name="abortSurveyProcedure" code="Survey.abortSurvey" code-model="/OA/survey/logic/code"> 
    <parameter name="paperID" type="String"/> 
  </procedure>  
  <action name="copyPaperAction" procedure="copyPaperProcedure"> 
    <public name="paperID" type="String"/> 
  </action>  
  <procedure name="copyPaperProcedure" code="Survey.copyPaper" code-model="/OA/survey/logic/code"> 
    <parameter name="paperID" type="String"/> 
  </procedure>  
  <action name="saveSurvey" procedure="saveSurveyProcedure"> 
    <public name="saveInfo" type="Map"/> 
  </action>  
  <procedure name="saveSurveyProcedure" code="Survey.saveSurvey" code-model="/OA/survey/logic/code"> 
    <parameter name="saveInfo" type="Map"/> 
  </procedure>  
  <action name="commitSurvey" procedure="commitSurveyProcedure"> 
    <public name="taskID" type="String"/> 
  </action>  
  <procedure name="commitSurveyProcedure" code="Survey.commitSurvey" code-model="/OA/survey/logic/code"> 
    <parameter name="taskID" type="String"/> 
  </procedure> 
  <action name="queryDom" procedure="queryDomProcedure"> 
    <public name="sql" type="String"/> 
  </action>  
  <procedure name="queryDomProcedure" code="Survey.queryDom" code-model="/OA/survey/logic/code"> 
    <parameter name="sql" type="String"/> 
  </procedure> 
<action name="getSurveyFinallyDataAction" global="false" procedure="getSurveyFinallyDataProcedure"><public type="String" required="true" name="paperID"/>
</action>
<action name="getSurveyTaskDataAction" global="false" procedure="getSurveyTaskDataProcedure"><public type="String" required="true" name="task"/>
<public type="String" required="true" name="paperID"/>
<public type="String" required="true" name="surveyID"/>
</action>
<action name="getSurveyPaperDataAction" global="false" procedure="getSurveyPaperDataProcedure"><public type="String" required="true" name="paperID"/>
</action>
</model>
