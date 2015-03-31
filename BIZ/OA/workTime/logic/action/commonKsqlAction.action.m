<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
<action name="KSQLQuery" global="true" procedure="commonKsqlQuery"><label language="zh_CN">KSQL查询</label>
<public type="String" required="true" name="ksql"/>
<public type="String" required="true" name="dataModel"/>
</action>
<action name="KSQLUpdate" global="true" procedure="commonKsqlUpdate"><label language="zh_CN">KSQL更新</label>
<public type="String" required="true" name="ksql"/>
<public type="String" required="true" name="dataModel"/>
</action>
</model>