<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
	<action name="getOpinionAction" procedure="getOpinionProcedure">
		<public name="id" type="String" />
		<public name="flag" type="String" />
	</action>
	<procedure name="getOpinionProcedure" code="docPortalUtils.getOpinion"
		code-model="/OA/doc/logic/code">
		<parameter name="id" type="String" />
		<parameter name="flag" type="String" />
	</procedure>
	<action name="queryWaitTaskNoDocAction" procedure="queryWaitTaskNoDocProcedure" />
	<procedure name="queryWaitTaskNoDocProcedure" code-model="/OA/doc/logic/code"
		code="docPortalUtils.queryWaitTaskNoDoc" />
	<action name="queryWaitTaskDocAction" procedure="queryWaitTaskDocProcedure" />
	<procedure name="queryWaitTaskDocProcedure" code-model="/OA/doc/logic/code"
		code="docPortalUtils.queryWaitTaskDoc" />
</model>
