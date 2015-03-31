<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <process name="officeSupplyUseApplyDetailQueryProcess">
    <label language="zh_CN">办公用品领用明细查询</label>
    <static-activity name="useApplyDetailQueryActivity">
      <label language="zh_CN">办公用品领用明细查询</label>
    </static-activity>
    <has-action action="queryOSCUseApplyDetailAction"/>
    <has-action action="queryOSCUseApplyMAction"/>
    <has-action action="queryOSCUseApplyDAction"/>
  </process>
</model>
