<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="officeSupplyUseRegisterDetailProcess">
		<label language="zh_CN">办公用品领用登记</label>
		<static-activity name="officeSupplyUseRegisterDetail">
			<label language="zh_CN">办公用品领用登记</label>
		</static-activity>
		<has-action action="createOSCUseApplyMAction" access-permission="public" />  
    <has-action action="queryOSCUseApplyMAction" access-permission="public" />  
    <has-action action="saveOSCUseApplyMAction" access-permission="public" />  
    <has-action action="createOSCUseApplyDAction" access-permission="public" />  
    <has-action action="queryOSCUseApplyDAction" access-permission="public" />  
    <has-action action="saveOSCUseApplyDAction" access-permission="public" />  
    <has-action action="queryOSCBaseInfoAction" access-permission="public" />
    <has-action action="useRegisterAction" />
	</process>
</model>
