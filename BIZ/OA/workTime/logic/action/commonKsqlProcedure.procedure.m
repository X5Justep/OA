<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<procedure name="commonKsqlQuery"
		code-model="/OA/workTime/logic/code"
		code="CommonKsql.ksqlQuery">
		<parameter name="ksql" type="String"/>
		<parameter name="dataModel" type="String"/>
	</procedure>
	<procedure name="commonKsqlUpdate"
		code-model="/OA/workTime/logic/code"
		code="CommonKsql.ksqlUpdate">
		<parameter name="ksql" type="String"/>
		<parameter name="dataModel" type="String"/>
	</procedure>
</model>