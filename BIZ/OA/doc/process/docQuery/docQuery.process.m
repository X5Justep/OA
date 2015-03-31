<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="docQueryProcess"> 
    <label language="zh_CN">公文查询</label>  
    <static-activity name="docQueryActivity"> 
      <label language="zh_CN">公文查询</label> 
    </static-activity>  
    <has-action action="createOA_DC_DocAction" access-permission="public"/>  
    <has-action action="queryOA_DC_DocAction" access-permission="public"/>  
    <has-action action="saveOA_DC_DocAction" access-permission="public"/>  
    <has-action action="queryOA_DC_ReceiveRangeAction" access-permission="public"/>  
    <has-action action="addRelevanceAction" access-permission="public"/>  
    <has-action action="deleteRelevanceAction" access-permission="public"/>  
    <has-action action="updateRelevanceAction" access-permission="public"/>  
    <has-action action="getDocReaderRangeAction" access-permission="public"/>  
    <has-action action="setDocReaderRangeAction" access-permission="public"/>  
    <has-action action="getDocReceiveRangeAction" access-permission="public"/>  
    <has-action action="setDocReceiveRangeAction" access-permission="public"/>  
    <has-action action="isPublishedByBizAction" access-permission="public"/>  
    <has-action action="deleteKWInfoAction" access-permission="public"/>  
    <has-action action="getPublishedRangeByBizAction" access-permission="public"/>  
    <has-action action="publishKnowledgeInterfaceAction" access-permission="public"/>  
    <has-action action="queryOA_DC_DocExecuteAction" access-permission="public"/>  
    <has-action action="getMeetingPsnIDsAction" access-permission="public"/>  
    <has-action action="sqlQueryAction" access-permission="public">
      <public name="dataModel" type="String" value="/OA/doc/data"/> 
    </has-action>  
    <has-action action="queryV_OA_DC_ReadOpinionAction" access-permission="public"/> 
    <has-action action="docQueryFlowTrackAction" access-permission="public"/> 
    <has-action action="docQueryDetailFlowTrackAction" access-permission="public"/> 
    <static-activity name="docSendQueryActivity"><label language="zh_CN">发文查询</label>
</static-activity>
<static-activity name="docRecvQueryActivity"><label language="zh_CN">收文查询</label>
</static-activity>
  </process> 
</model>
