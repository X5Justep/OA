<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="testProcess" kind="SYSTEM">
		<static-activity name="mainActivity"/>
	
<has-action action="ksqlQueryAction" access-permission="public"><public name="ksql" type="String"></public>
<public name="dataModel" type="String" value="/OA/flowLanch/data"></public>
</has-action>
</process>
</model>