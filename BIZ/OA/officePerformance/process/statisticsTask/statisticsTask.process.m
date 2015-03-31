<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="statisticsTaskProcess"> 
    <label language="zh_CN">办公绩效</label>  
    <static-activity name="startActivity"> 
      <label language="zh_CN">startActivity</label> 
    </static-activity>  
     
  <has-action action="sqlQueryAction" access-permission="public"><public name="dataModel" type="String" value="/OA/officePerformance/data"></public>
</has-action>
<has-action action="countTaskReportAction" access-permission="public"></has-action>
<has-action action="countTaskPieReportAction" access-permission="public"></has-action>
<has-action action="countTaskSeriesReportAction" access-permission="public"></has-action>
</process> 
</model>
