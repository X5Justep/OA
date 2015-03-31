<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <process name="officeReleaseSummaryDetailProcess">
    <label language="zh_CN">发放汇总明细</label>
    <static-activity name="startActivity">
      <label language="zh_CN">发放汇总明细</label>
    </static-activity>
    
  

<has-action action="ksqlQueryAction" access-permission="public"><public name="ksql" type="String"></public>
<public name="dataModel" type="String" value="/OA/officeSupplyConsumables/data"></public>
</has-action>
</process>
</model>
