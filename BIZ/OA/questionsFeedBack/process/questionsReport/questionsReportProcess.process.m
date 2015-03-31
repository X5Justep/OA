<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="questionsReportProcess"> 
    <label language="zh_CN">问题反馈统计报表</label>  
    <static-activity name="countByQuestionTypeActivity"> 
      <label language="zh_CN">问题反馈统计报表-按分类统计</label> 
    </static-activity>
    <static-activity name="countByModuleActivity"> 
      <label language="zh_CN">问题反馈统计报表-按功能模块统计</label> 
    </static-activity>  
    <has-action action="sqlQueryAction" access-permission="public">
      <public name="dataModel" type="String" value="/OA/questionsFeedBack/data"/> 
    </has-action>  
    <has-action action="ksqlQueryAction" access-permission="public">
      <public name="dataModel" type="String" value="/OA/questionsFeedBack/data"/> 
    </has-action> 
  </process> 
</model>
