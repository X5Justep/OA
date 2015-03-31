<model xmlns="http://www.justep.com/model"
	xmlns:m="http://www.justep.com/model">
	<action name="ksqlUpdateAction"
		procedure="ksqlUpdateProcedure">
		<public name="ksql" type="String"/>
		<public name="variables" type="Map"/>
		<public name="dataModel" type="String"/>
		<public name="fnModel" type="String"/>
	</action>
</model>