<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <!--(DEFPROCESS signatureApplyQueryProcess
	(FLOW FALSE)
	(LABEL "印章申请查询" "zh_CN")
	(HAS-DEFAULT-ACTIONS "/OA/signature/data")
	(DEFACTIVITY-STATIC startActivity
		(LABEL "startActivity" "zh_CN"))
	(HAS-ACTION querySLSignatureAction "/OA/signature/data"))-->  
  <process name="signatureApplyQueryProcess"> 
    <label language="zh_CN">印章申请查询</label>  
    <static-activity name="startActivity"> 
      <label language="zh_CN">startActivity</label> 
    </static-activity>  
    <has-action action="querySLSignatureAction" access-permission="public"/> 
  </process> 
</model>
