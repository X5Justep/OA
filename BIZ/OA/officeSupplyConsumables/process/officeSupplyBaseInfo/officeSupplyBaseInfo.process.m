<?xml version="1.0" encoding="utf-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="officeSupplyBaseInfoProcess">
		<label language="zh_CN">办公用品基本信息</label>
		<static-activity name="officeSupplyBaseInfoActivity">
			<label language="zh_CN">办公用品基本信息</label>
		</static-activity>
		<has-action action="createOSCBaseInfoAction" />
		<has-action action="queryOSCBaseInfoAction" />
		<has-action action="saveOSCBaseInfoAction" />
		<has-action action="queryOA_Pub_BaseCodeAction" />
	</process>
</model>
