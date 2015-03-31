<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <!--(DEFACTION createSLSignatureTypeAction
	(PUBLIC conceptMap CONS :DEFAULT (OA_SL_SignatureType))
	(PUBLIC relations CONS :DEFAULT ())
	(PROCEDURE bizCreateProcedure)
	(DATA-MODULE "/OA/signature/data")
)-->
  <!--(DEFACTION querySLSignatureTypeAction
	(PROCEDURE bizQueryProcedure)
	(DATA-MODULE "/OA/signature/data")
	(PRIVATE concept CONS (OA_SL_SignatureType))
	(PRIVATE select CONS(OA_SL_SignatureType.*))
	(PRIVATE join CONS())
	(PROTECTED condition String :DEFAULT "")
	(PERMISSION range)
	(PUBLIC filter String :DEFAULT "")
	(PUBLIC distinct String :DEFAULT "FALSE")
	(PUBLIC offset String :DEFAULT "")
	(PUBLIC limit String :DEFAULT "")
	(PUBLIC columns CONS :DEFAULT ())
	(PUBLIC orderBy String :DEFAULT "")
	(PRIVATE aggregate CONS ())
	(PUBLIC aggregateColumns CONS :DEFAULT ())
)-->
  <!--(DEFACTION saveSLSignatureTypeAction
	(PUBLIC concept CONS :DEFAULT (OA_SL_SignatureType))
	(PUBLIC graph NGRAPH)
	(PERMISSION range)
	(PUBLIC readOnly CONS :DEFAULT())
	(PUBLIC notNull CONS :DEFAULT())
	(PROCEDURE bizSaveProcedure)
	(DATA-MODULE "/OA/signature/data")
)-->
  <!--(DEFACTION createSLSignatureAction
	(PUBLIC conceptMap CONS :DEFAULT (OA_SL_Signature))
	(PUBLIC relations CONS :DEFAULT ())
	(PROCEDURE bizCreateProcedure)
	(DATA-MODULE "/OA/signature/data")
)-->
  <!--(DEFACTION querySLSignatureAction
	(PROCEDURE bizQueryProcedure)
	(DATA-MODULE "/OA/signature/data")
	(PRIVATE concept CONS (OA_SL_Signature))
	(PRIVATE select CONS(OA_SL_Signature.*))
	(PRIVATE join CONS())
	(PROTECTED condition String :DEFAULT "")
	(PERMISSION range)
	(PUBLIC filter String :DEFAULT "")
	(PUBLIC distinct String :DEFAULT "FALSE")
	(PUBLIC offset String :DEFAULT "")
	(PUBLIC limit String :DEFAULT "")
	(PUBLIC columns CONS :DEFAULT ())
	(PUBLIC orderBy String :DEFAULT "")
	(PRIVATE aggregate CONS ())
	(PUBLIC aggregateColumns CONS :DEFAULT ())
)-->
  <!--(DEFACTION saveSLSignatureAction
	(PUBLIC concept CONS :DEFAULT (OA_SL_Signature))
	(PUBLIC graph NGRAPH)
	(PERMISSION range)
	(PUBLIC readOnly CONS :DEFAULT())
	(PUBLIC notNull CONS :DEFAULT())
	(PROCEDURE bizSaveProcedure)
	(DATA-MODULE "/OA/signature/data")
)-->
  <!--(DEFACTION createSLUseExecuteAction
	(PUBLIC conceptMap CONS :DEFAULT (OA_SL_UseExecute))
	(PUBLIC relations CONS :DEFAULT ())
	(PROCEDURE bizCreateProcedure)
	(DATA-MODULE "/OA/signature/data")
)-->
  <!--(DEFACTION querySLUseExecuteAction
	(PROCEDURE bizQueryProcedure)
	(DATA-MODULE "/OA/signature/data")
	(PRIVATE concept CONS (OA_SL_UseExecute))
	(PRIVATE select CONS(OA_SL_UseExecute.*))
	(PRIVATE join CONS())
	(PROTECTED condition String :DEFAULT "")
	(PERMISSION range)
	(PUBLIC filter String :DEFAULT "")
	(PUBLIC distinct String :DEFAULT "FALSE")
	(PUBLIC offset String :DEFAULT "")
	(PUBLIC limit String :DEFAULT "")
	(PUBLIC columns CONS :DEFAULT ())
	(PUBLIC orderBy String :DEFAULT "")
	(PRIVATE aggregate CONS ())
	(PUBLIC aggregateColumns CONS :DEFAULT ())
)-->
  <!--(DEFACTION saveSLUseExecuteAction
	(PUBLIC concept CONS :DEFAULT (OA_SL_UseExecute))
	(PUBLIC graph NGRAPH)
	(PERMISSION range)
	(PUBLIC readOnly CONS :DEFAULT())
	(PUBLIC notNull CONS :DEFAULT())
	(PROCEDURE bizSaveProcedure)
	(DATA-MODULE "/OA/signature/data")
)-->

  
  
  
  <action name="createSLSignatureAction" procedure="bizCreateProcedure">
    <private name="concept" type="String" value="OA_SL_Signature"/>
    <private name="fnModel" type="String"/>
    <public name="table" type="Table"/>
    <public name="defaultValues" type="Map"/>
  </action>
  <action name="querySLSignatureAction" procedure="bizQueryProcedure">
    <permission name="range" type="List"/>
    <private name="concept" type="String" value="OA_SL_Signature"/>
    <private name="select" type="String" value="OA_SL_Signature.*"/>
    <private name="from" type="String" value="OA_SL_Signature OA_SL_Signature"/>
    <private name="aggregate" type="String"/>
    <private name="dataModel" type="String" value="/OA/signature/data"/>
    <private name="fnModel" type="String"/>
    <protected name="condition" type="String"/>
    <public name="distinct" type="Boolean" value="false"/>
    <public name="idColumn" type="String" value="OA_SL_Signature"/>
    <public name="filter" type="String"/>
    <public name="limit" type="Integer"/>
    <public name="offset" type="Integer"/>
    <public name="columns" type="String"/>
    <public name="orderBy" type="String"/>
    <public name="aggregateColumns" type="String"/>
    <public name="variables" type="Map"/>
  </action>
  <action name="saveSLSignatureAction" procedure="bizSaveProcedure">
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>
    <private name="concept" type="String" value="OA_SL_Signature"/>
    <private name="dataModel" type="String" value="/OA/signature/data"/>
    <protected name="readOnly" type="String"/>
    <protected name="notNull" type="String"/>
    <public name="table" type="Table"/>
  </action>
  <action name="createSLUseExecuteAction" procedure="bizCreateProcedure">
    <private name="concept" type="String" value="OA_SL_UseExecute"/>
    <private name="fnModel" type="String"/>
    <public name="table" type="Table"/>
    <public name="defaultValues" type="Map"/>
  </action>
  <action name="querySLUseExecuteAction" procedure="bizQueryProcedure">
    <permission name="range" type="List"/>
    <private name="concept" type="String" value="OA_SL_UseExecute"/>
    <private name="select" type="String" value="OA_SL_UseExecute.*"/>
    <private name="from" type="String" value="OA_SL_UseExecute OA_SL_UseExecute"/>
    <private name="aggregate" type="String"/>
    <private name="dataModel" type="String" value="/OA/signature/data"/>
    <private name="fnModel" type="String"/>
    <protected name="condition" type="String"/>
    <public name="distinct" type="Boolean" value="false"/>
    <public name="idColumn" type="String" value="OA_SL_UseExecute"/>
    <public name="filter" type="String"/>
    <public name="limit" type="Integer"/>
    <public name="offset" type="Integer"/>
    <public name="columns" type="String"/>
    <public name="orderBy" type="String"/>
    <public name="aggregateColumns" type="String"/>
    <public name="variables" type="Map"/>
  </action>
  <action name="saveSLUseExecuteAction" procedure="bizSaveProcedure">
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>
    <private name="concept" type="String" value="OA_SL_UseExecute"/>
    <private name="dataModel" type="String" value="/OA/signature/data"/>
    <protected name="readOnly" type="String"/>
    <protected name="notNull" type="String"/>
    <public name="table" type="Table"/>
  </action>
</model>
