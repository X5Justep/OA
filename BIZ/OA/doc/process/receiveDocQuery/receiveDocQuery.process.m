<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <!--(DEFPROCESS receiveDocQueryProcess	(FLOW FALSE)
	(LABEL "公文接收" "zh_CN")
	(HAS-DEFAULT-ACTIONS "/OA/doc/data")
	(DEFACTIVITY-STATIC receiveDocQueryActivity
		(LABEL "公文接收" "zh_CN"))
	(HAS-ACTION queryDCDocAction "/OA/doc/data")
	(HAS-ACTION queryReceiveDocAction "/OA/doc/data")
	)-->
  <process name="receiveDocQueryProcess">
    <label language="zh_CN">公文接收</label>
    <static-activity name="receiveDocQueryActivity">
      <label language="zh_CN">公文接收</label>
    </static-activity>
    <has-action action="queryOA_DC_DocAction"/>
    <has-action action="queryReceiveDocAction"/>
  </process>
</model>
