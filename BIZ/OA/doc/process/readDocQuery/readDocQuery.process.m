<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="readDocQueryProcess"> 
    <label language="zh_CN">阅文</label>  
    <static-activity name="readDocQueryActivity"> 
      <label language="zh_CN">阅文</label> 
    </static-activity>  
    <static-activity name="readDocQueryPortalActivity"> 
      <label language="zh_CN">待阅公文(portalMore)</label> 
    </static-activity>  
    <has-action action="queryOA_DC_DocAction" access-permission="public"/>  
    <has-action action="queryReadDocAction" access-permission="public"/>  
    <has-action action="createOA_DC_DocExecuteAction" access-permission="public"/>  
    <has-action action="queryOA_DC_DocExecuteAction" access-permission="public"/>  
    <has-action action="saveOA_DC_DocExecuteAction" access-permission="public"/>  
    <has-action action="recordReadedAction" access-permission="public"/>  
    <has-action action="createOA_DC_ReaderOpinionAction" access-permission="public"/>  
    <has-action action="queryOA_DC_ReaderOpinionAction" access-permission="public"/>  
    <has-action action="saveOA_DC_ReaderOpinionAction" access-permission="public"/>  
    <has-action action="getMeetingPsnIDsAction" access-permission="public"/>  
    <has-action action="setReaderOpinionToTaskAction" access-permission="public"/> 
  </process> 
</model>
