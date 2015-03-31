<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <!--(DEFPROCESS flowLanchQueryProcess
	(FLOW FALSE)
	(LABEL "自由流查询列表" "zh_CN")
	(HAS-DEFAULT-ACTIONS "/OA/flowLanch/data")
	(HAS-ACTION queryFlowLanchApplyAction "/OA/flowLanch/data")
	(DEFACTIVITY-STATIC startActivity
		(LABEL "startActivity" "zh_CN")))-->
  <process name="flowLanchQueryProcess">
    <label language="zh_CN">事务办理查询</label>
    <has-action action="queryFlowLanchApplyAction"/>
    <static-activity name="startActivity">
      <label language="zh_CN">startActivity</label>
    </static-activity>
  </process>
</model>
