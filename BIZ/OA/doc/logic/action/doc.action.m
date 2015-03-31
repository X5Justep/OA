<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">  
  <action name="queryOA_DC_DocAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="OA_DC_Doc"/>  
    <private name="select" type="String" value="OA_DC_Doc.*"/>  
    <private name="from" type="String" value="OA_DC_Doc OA_DC_Doc"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/doc/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_DC_Doc"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveOA_DC_DocAction" procedure="bizSaveProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <private name="concept" type="String" value="OA_DC_Doc"/>  
    <private name="dataModel" type="String" value="/OA/doc/data"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Table"/> 
  </action>  
  <action name="createOA_DC_DocAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="OA_DC_Doc"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryOA_DC_ReaderRangeAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="OA_DC_ReaderRange"/>  
    <private name="select" type="String" value="OA_DC_ReaderRange.*"/>  
    <private name="from" type="String" value="OA_DC_ReaderRange OA_DC_ReaderRange"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/doc/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_DC_ReaderRange"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveOA_DC_ReaderRangeAction" procedure="bizSaveProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <private name="concept" type="String" value="OA_DC_ReaderRange"/>  
    <private name="dataModel" type="String" value="/OA/doc/data"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Table"/> 
  </action>  
  <action name="createOA_DC_ReaderRangeAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="OA_DC_ReaderRange"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryOA_DC_HandWritingAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="OA_DC_HandWriting"/>  
    <private name="select" type="String" value="OA_DC_HandWriting.*"/>  
    <private name="from" type="String" value="OA_DC_HandWriting OA_DC_HandWriting"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/doc/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_DC_HandWriting"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveOA_DC_HandWritingAction" procedure="bizSaveProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <private name="concept" type="String" value="OA_DC_HandWriting"/>  
    <private name="dataModel" type="String" value="/OA/doc/data"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Table"/> 
  </action>  
  <action name="createOA_DC_HandWritingAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="OA_DC_HandWriting"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryOA_DC_ReaderOpinionAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="OA_DC_ReaderOpinion"/>  
    <private name="select" type="String" value="OA_DC_ReaderOpinion.*"/>  
    <private name="from" type="String" value="OA_DC_ReaderOpinion OA_DC_ReaderOpinion"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/doc/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_DC_ReaderOpinion"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveOA_DC_ReaderOpinionAction" procedure="bizSaveProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <private name="concept" type="String" value="OA_DC_ReaderOpinion"/>  
    <private name="dataModel" type="String" value="/OA/doc/data"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Table"/> 
  </action>  
  <action name="createOA_DC_ReaderOpinionAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="OA_DC_ReaderOpinion"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryOA_DC_ReceiveRangeAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="OA_DC_ReceiveRange"/>  
    <private name="select" type="String" value="OA_DC_ReceiveRange.*"/>  
    <private name="from" type="String" value="OA_DC_ReceiveRange OA_DC_ReceiveRange"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/doc/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_DC_ReceiveRange"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveOA_DC_ReceiveRangeAction" procedure="bizSaveProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <private name="concept" type="String" value="OA_DC_ReceiveRange"/>  
    <private name="dataModel" type="String" value="/OA/doc/data"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Table"/> 
  </action>  
  <action name="createOA_DC_ReceiveRangeAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="OA_DC_ReceiveRange"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryOA_DC_DocExecuteAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="OA_DC_DocExecute"/>  
    <private name="select" type="String" value="OA_DC_DocExecute.*"/>  
    <private name="from" type="String" value="OA_DC_DocExecute OA_DC_DocExecute"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/doc/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_DC_DocExecute"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveOA_DC_DocExecuteAction" procedure="bizSaveProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/> 
    <private name="concept" type="String" value="OA_DC_DocExecute"/>  
    <private name="dataModel" type="String" value="/OA/doc/data"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Table"/> 
  </action>  
  <action name="createOA_DC_DocExecuteAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="OA_DC_DocExecute"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <!-- 待收公文查询action -->  
  <action name="queryReceiveDocAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="OA_DC_Doc"/>  
    <private name="select" type="String" value="OA_DC_Doc.*"/>  
    <!--<private name="from" type="String" value="OA_DC_Doc OA_DC_Doc join OA_DC_ReceiveRange OA_DC_ReceiveRange on OA_DC_Doc = OA_DC_ReceiveRange.fMasterID"/>-->  
    <private name="from" type="String" value="OA_DC_Doc OA_DC_Doc"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/doc/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_DC_Doc"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <!-- 待阅公文查询action -->  
  <action name="queryReadDocAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="OA_DC_Doc"/>  
    <private name="select" type="String" value="OA_DC_Doc.*"/>  
    <!--<private name="from" type="String" value="OA_DC_Doc OA_DC_Doc join OA_DC_ReaderRange OA_DC_ReaderRange on OA_DC_Doc = OA_DC_ReaderRange.fMasterID"/>-->  
    <private name="from" type="String" value="OA_DC_Doc OA_DC_Doc"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/doc/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_DC_Doc"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="queryOA_DC_SignPsnAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="OA_DC_SignPsn"/>  
    <private name="select" type="String" value="OA_DC_SignPsn.*"/>  
    <private name="from" type="String" value="OA_DC_SignPsn OA_DC_SignPsn"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/doc/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_DC_SignPsn"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveOA_DC_SignPsnAction" procedure="bizSaveProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="OA_DC_SignPsn"/>  
    <private name="dataModel" type="String" value="/OA/doc/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createOA_DC_SignPsnAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="OA_DC_SignPsn"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action global="false" name="insertSignPsnAction" procedure="insertSignPsnProcedure"> 
    <public name="sData1" required="true" type="String"/>  
    <public name="activity" required="true" type="String"/>  
    <public name="fCounterSignIDs" required="true" type="String"/>  
    <public name="isAdd" required="true" type="String"/> 
  </action>  
  <action global="false" name="getCActivityOrgUnitAction" procedure="getCActivityOrgUnitProcedure"> 
    <public name="process" required="true" type="String"/>  
    <public name="activity" required="true" type="String"/> 
  </action>  
  <action name="queryV_OA_DC_ReadOpinionAction" procedure="bizQueryProcedure">
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="V_OA_DC_ReadOpinion"/>  
    <private name="select" type="String" value="V_OA_DC_ReadOpinion.*"/>  
    <private name="from" type="String" value="V_OA_DC_ReadOpinion V_OA_DC_ReadOpinion"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/doc/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="V_OA_DC_ReadOpinion"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action> 
</model>