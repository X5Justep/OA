<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
<action name="countTaskReportAction" global="false" procedure="countTaskReportProcedure"><public type="String" required="true" name="beginDate"/>
<public type="String" required="true" name="endDate"/>
<public type="String" required="true" name="orgID"/>
</action>
<action name="countTaskPieReportAction" global="false" procedure="countTaskPieReportProcedure"><public type="String" required="true" name="beginDate"/>
<public type="String" required="true" name="endDate"/>
<public type="String" required="true" name="orgID"/>
</action>
<action name="countTaskSeriesReportAction" global="false" procedure="countTaskSeriesReportProcedure"><public type="String" required="true" name="beginDate"/>
<public type="String" required="true" name="endDate"/>
<public type="String" required="true" name="orgID"/>
</action>
</model>