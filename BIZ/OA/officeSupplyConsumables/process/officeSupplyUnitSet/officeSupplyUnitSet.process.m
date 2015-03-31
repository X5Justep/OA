<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <!--(DEFPROCESS officeSupplyUnitSetProcess	(LABEL "办公用品计量单位设置" "zh_CN")
	(FLOW FALSE)
	(HAS-DEFAULT-ACTIONS "/OA/officeSupplyConsumables/data")
	(DEFACTIVITY-STATIC officeSupplyUnitSetActivity
		(LABEL "办公用品计量单位设置" "zh_CN"))
	(HAS-ACTION createOSCUnitAction "/OA/officeSupplyConsumables/data")
	(HAS-ACTION queryOSCUnitAction "/OA/officeSupplyConsumables/data")
	(HAS-ACTION saveOSCUnitAction "/OA/officeSupplyConsumables/data"))-->
  <process name="officeSupplyUnitSetProcess">
    <label language="zh_CN">办公用品计量单位设置</label>
    <static-activity name="officeSupplyUnitSetActivity">
      <label language="zh_CN">办公用品计量单位设置</label>
    </static-activity>
    
    
    
  <has-action action="queryOA_Pub_BaseCodeAction" access-permission="public"></has-action>
<has-action action="saveOA_Pub_BaseCodeAction" access-permission="public"></has-action>
<has-action action="createOA_Pub_BaseCodeAction" access-permission="public"></has-action>
</process>
</model>
