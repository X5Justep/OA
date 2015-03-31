<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model"><action name="queryOA_WM_OvertimeApplyAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_WM_OvertimeApply"/>
<private name="select" type="String" value="OA_WM_OvertimeApply.*"/>
<private name="from" type="String" value="OA_WM_OvertimeApply OA_WM_OvertimeApply"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/workTime/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_WM_OvertimeApply"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveOA_WM_OvertimeApplyAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="OA_WM_OvertimeApply"/>
<private name="dataModel" type="String" value="/OA/workTime/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createOA_WM_OvertimeApplyAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="OA_WM_OvertimeApply"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
<action name="queryOA_overtime_EXECUTEAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_overtime_EXECUTE"/>
<private name="select" type="String" value="OA_overtime_EXECUTE.*"/>
<private name="from" type="String" value="OA_overtime_EXECUTE OA_overtime_EXECUTE"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/workTime/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_overtime_EXECUTE"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveOA_overtime_EXECUTEAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="OA_overtime_EXECUTE"/>
<private name="dataModel" type="String" value="/OA/workTime/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createOA_overtime_EXECUTEAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="OA_overtime_EXECUTE"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
</model>