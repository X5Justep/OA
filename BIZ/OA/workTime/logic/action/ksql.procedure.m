<model xmlns="http://www.justep.com/model"
	xmlns:m="http://www.justep.com/model">
	<procedure name="ksqlUpdateProcedure"
		code-model="/OA/workTime/logic/code"
		code="KSQLProcedure.update">
		<parameter name="ksql" type="String"/>
		<parameter name="variables" type="Map"/>
		<parameter name="dataModel" type="String"/>
		<parameter name="fnModel" type="String"/>
	</procedure>
</model>