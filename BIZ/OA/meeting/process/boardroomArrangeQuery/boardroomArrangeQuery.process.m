<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="boardroomArrangeQueryProcess"> 
    <label language="zh_CN">会议室安排查询</label>  
    <static-activity name="startActivity"> 
      <label language="zh_CN">startActivity</label> 
    </static-activity> 
    <static-activity name="mbListActivity"><label language="zh_CN">移动会议查询</label>
</static-activity> 
    <has-action action="queryMTBOARDROOMAction" access-permission="public"/>  
    <has-action action="queryMTRoomArrangeAction" access-permission="public"/>  
    <has-action action="createMTUSEAPPLYAction" access-permission="public"/>  
    <has-action action="queryMTUSEAPPLYAction" access-permission="public"/>  
    <has-action action="saveMTUSEAPPLYAction" access-permission="public"/>  
    <has-action action="createMTUSEAPPLYPSNSAction" access-permission="public"/>  
    <has-action action="queryMTUSEAPPLYPSNSAction" access-permission="public"/>  
    <has-action action="saveMTUSEAPPLYPSNSAction" access-permission="public"/>  
    <has-action action="queryOA_Pub_BaseCodeAction" access-permission="public"/>  
    <has-action action="checkBoardroomUsedAction" access-permission="public"/>  
    <has-action action="queryDom" access-permission="public"/>  
    <has-action action="sqlQueryAction" access-permission="public">
      <public name="dataModel" type="String" value="/OA/meeting/data"/> 
    </has-action>  
    <has-action action="getDateQueryDataAction" access-permission="public"/>  
    <has-action action="getRoomQueryDataAction" access-permission="public"/>  
    <has-action action="ksqlQueryAction" access-permission="public">
      <public name="ksql" type="String"/>  
      <public name="dataModel" type="String" value="/OA/meeting/data"/> 
    </has-action> 
    <has-action action="queryMTARRANGEPSNSAction" access-permission="public"></has-action>
  </process> 
</model>
