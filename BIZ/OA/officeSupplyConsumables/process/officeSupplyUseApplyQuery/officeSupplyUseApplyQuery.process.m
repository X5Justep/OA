<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <!--(DEFPROCESS officeSupplyUseApplyQueryProcess	(LABEL "办公用品领用查询" "zh_CN")
	(FLOW FALSE)
	(HAS-DEFAULT-ACTIONS "/OA/officeSupplyConsumables/data")
	(DEFACTIVITY-STATIC useApplyQueryActivity
		(LABEL "办公用品领用查询" "zh_CN"))
	(HAS-ACTION queryOSCUseApplyMAction "/OA/officeSupplyConsumables/data")
	(HAS-ACTION queryOSCUseApplyDAction "/OA/officeSupplyConsumables/data"))-->
  <process name="officeSupplyUseApplyQueryProcess">
    <label language="zh_CN">办公用品领用查询</label>
    <static-activity name="useApplyQueryActivity">
      <label language="zh_CN">办公用品领用查询</label>
    </static-activity>
    <has-action action="queryOSCUseApplyMAction"/>
    <has-action action="queryOSCUseApplyDAction"/>
  </process>
</model>
