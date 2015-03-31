<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <process name="officeSupplyBuyApplyQueryProcess">
    <label language="zh_CN">办公用品请购查询</label>
    <static-activity name="buyApplyQueryActivity">
      <label language="zh_CN">办公用品请购查询</label>
    </static-activity>
    <has-action action="queryOSCBuyApplyMAction"/>
    <has-action action="queryOSCBuyApplyDAction"/>
  </process>
</model>
