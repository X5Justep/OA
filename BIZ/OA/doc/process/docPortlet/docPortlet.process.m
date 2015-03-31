<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <!--(DEFPROCESS docPortletProcess
	(KIND "SYSTEM")
	(LABEL "公文Portlet" "zh_CN")
	(HAS-DEFAULT-ACTIONS "/OA/doc/data")
	(HAS-ACTION getWaitReadDocAction "/OA/knowledge/data")
	(HAS-ACTION getWaitReceiveDocAction "/OA/knowledge/data")
	
	(DEFACTIVITY-STATIC waitReadActivity
		(LABEL "待阅Portlet" "zh_CN"))
	(DEFACTIVITY-STATIC waitRecvActivity
		(LABEL "待收Portlet" "zh_CN"))
)-->  
  <process name="docPortletProcess" kind="SYSTEM"> 
    <label language="zh_CN">公文Portlet</label>  
    <has-action action="getWaitReadDocAction"/>  
    <has-action action="getWaitReceiveDocAction"/>  
    <static-activity name="waitReadActivity"> 
      <label language="zh_CN">待阅Portlet</label> 
    </static-activity>  
    <static-activity name="waitRecvActivity"> 
      <label language="zh_CN">待收Portlet</label> 
    </static-activity>  
    <static-activity name="docPortletActivity_static"> 
      <label language="zh_CN">公文Portlet</label> 
    </static-activity> 
  </process> 
</model>
