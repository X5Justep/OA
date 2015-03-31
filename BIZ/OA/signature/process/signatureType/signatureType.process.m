<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <!--(DEFPROCESS signatureTypeProcess	(FLOW FALSE)
	(LABEL "印章类别" "zh_CN")
	(HAS-DEFAULT-ACTIONS "/OA/signature/data")
	(DEFACTIVITY-STATIC startActivity
		(LABEL "startActivity" "zh_CN"))
	(HAS-ACTION createSLSignatureTypeAction "/OA/signature/data")
	(HAS-ACTION querySLSignatureTypeAction "/OA/signature/data")
	(HAS-ACTION saveSLSignatureTypeAction "/OA/signature/data"))-->  
  <process name="signatureTypeProcess"> 
    <label language="zh_CN">印章类别</label>  
    <static-activity name="startActivity"> 
      <label language="zh_CN">startActivity</label> 
    </static-activity>  
      
      
     
  <has-action action="queryOA_Pub_BaseCodeAction" access-permission="public"></has-action>
<has-action action="saveOA_Pub_BaseCodeAction" access-permission="public"></has-action>
<has-action action="createOA_Pub_BaseCodeAction" access-permission="public"></has-action>
</process> 
</model>
