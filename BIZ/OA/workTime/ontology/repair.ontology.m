<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <concept name="OA_WM_repairApply" default-value-expr="guid()"> 
    <has-relation relation="fNO" size="32" default-value-expr="nextSeqString(format('%s%s','BQSQ-',format('%1$tY%1$tm%1$td', currentDateTime())),'000')"> 
      <label language="zh_CN">单据号</label> 
    </has-relation>  
    <has-relation relation="fTYPEID" size="36"> 
      <label language="zh_CN">补签类型ID</label> 
    </has-relation>  
    <has-relation relation="fTYPENAME" size="128"> 
      <label language="zh_CN">类型名称</label> 
    </has-relation>  
    <has-relation relation="fAPPLYPERSONID" size="64" default-value-expr="currentPersonID()"> 
      <label language="zh_CN">申请人ID</label> 
    </has-relation>  
    <has-relation relation="fAPPLYPERSONNAME" size="64" default-value-expr="currentPersonName()"> 
      <label language="zh_CN">申请人</label> 
    </has-relation>  
    <has-relation relation="fAPPLYDATE" default-value-expr="currentDateTime()"> 
      <label language="zh_CN">申请日期</label> 
    </has-relation>  
    <has-relation relation="fAPPLYDEPTID" size="64" default-value-expr="currentOrgID()"> 
      <label language="zh_CN">申请部门ID</label> 
    </has-relation>  
    <has-relation relation="fAPPLYDEPTNAME" size="64" default-value-expr="currentOrgName()"> 
      <label language="zh_CN">申请部门</label> 
    </has-relation>  
    <has-relation relation="fERPTM" size="64"> 
      <label language="zh_CN">所在岗位</label> 
    </has-relation>  
    <has-relation relation="fPLANID" size="36"> 
      <label language="zh_CN">计划ID</label> 
    </has-relation>  
    <has-relation relation="fPLANNAME" size="128"> 
      <label language="zh_CN">计划名称</label> 
    </has-relation>  
    <has-relation relation="fPROJECTID" size="36"> 
      <label language="zh_CN">项目ID</label> 
    </has-relation>  
    <has-relation relation="fPROJECTNAME" size="128"> 
      <label language="zh_CN">项目名称</label> 
    </has-relation>  
    <has-relation relation="fCLIENTERID" size="36"> 
      <label language="zh_CN">客户ID</label> 
    </has-relation>  
    <has-relation relation="fCLIENTERNAME" size="128"> 
      <label language="zh_CN">客户名称</label> 
    </has-relation>  
    <has-relation relation="fSTARTTIME"> 
      <label language="zh_CN">开始时间</label> 
    </has-relation>  
    <has-relation relation="fENDTIME"> 
      <label language="zh_CN">结束时间</label> 
    </has-relation>  
    <has-relation relation="fDAYS" data-type="Integer"> 
      <label language="zh_CN">申请天数</label> 
    </has-relation>  
    <has-relation relation="fHOURS" data-type="Float"> 
      <label language="zh_CN">小时</label> 
    </has-relation>  
    <has-relation relation="fTIME" data-type="Float"> 
      <label language="zh_CN">申请时长</label> 
    </has-relation>  
    <has-relation relation="fREASON" size="1024"> 
      <label language="zh_CN">事由</label> 
    </has-relation>  
    <has-relation relation="fREMARK" size="1024"> 
      <label language="zh_CN">备注</label> 
    </has-relation>  
    <has-relation relation="fISSURE" data-type="Integer"> 
      <label language="zh_CN">是否确认</label> 
    </has-relation>  
    <has-relation relation="fCANCELHOLSDEPTID" size="64"> 
      <label language="zh_CN">确认部门ID</label> 
    </has-relation>  
    <has-relation relation="fCANCELHOLSDEPTNAME" size="64"> 
      <label language="zh_CN">确认部门</label> 
    </has-relation>  
    <has-relation relation="fCANCELHOLSPERSONNAME" size="64"> 
      <label language="zh_CN">确认人</label> 
    </has-relation>  
    <has-relation relation="fCANCELHOLSDATE"> 
      <label language="zh_CN">确认日期</label> 
    </has-relation>  
    <has-relation relation="fNUMBER" data-type="Integer"> 
      <label language="zh_CN">人数</label> 
    </has-relation>  
    <has-relation relation="fPERSONNEL" size="1024"> 
      <label language="zh_CN">人员</label> 
    </has-relation>  
    <has-relation relation="fCARDTIME" default-value-expr="currentDateTime()"> 
      <label language="zh_CN">打卡时间</label> 
    </has-relation>  
    <has-relation relation="fSQUADID" size="36"> 
      <label language="zh_CN">班次ID</label> 
    </has-relation>  
    <has-relation relation="fSQUAD" size="32"> 
      <label language="zh_CN">所属排班</label> 
    </has-relation>  
    <has-relation relation="fPLACE" size="32"> 
      <label language="zh_CN">地点</label> 
    </has-relation>  
    <has-relation relation="fMODEID" size="32"> 
      <label language="zh_CN">出行方式ID</label> 
    </has-relation>  
    <has-relation relation="fMODENAME" size="64"> 
      <label language="zh_CN">出行方式</label> 
    </has-relation>  
    <has-relation relation="fARRANGE" size="200"> 
      <label language="zh_CN">行程安排</label> 
    </has-relation>  
    <has-relation relation="fMONEY" data-type="Float"> 
      <label language="zh_CN">出差备用金</label> 
    </has-relation>  
    <has-relation relation="fEXPLAIN" size="1024"> 
      <label language="zh_CN">用途说明</label> 
    </has-relation>  
    <has-relation relation="fFACTSTARTTIME"> 
      <label language="zh_CN">实际开始时间</label> 
    </has-relation>  
    <has-relation relation="fFACTENDTIME"> 
      <label language="zh_CN">实际结束时间</label> 
    </has-relation>  
    <has-relation relation="fFACTDAYS" data-type="String"> 
      <label language="zh_CN">实际天数</label> 
    </has-relation>  
    <has-relation relation="fFACTHOURS" scale="2" data-type="Float"> 
      <label language="zh_CN">实际小时数</label> 
    </has-relation>  
    <has-relation relation="fCREATEDEPTID" size="36" default-value-expr="currentOrgID()"> 
      <label language="zh_CN">提交部门ID</label> 
    </has-relation>  
    <has-relation relation="fCREATEDEPTNAME" size="128" default-value-expr="currentOrgName()"> 
      <label language="zh_CN">提交部门</label> 
    </has-relation>  
    <has-relation relation="fCREATEPERID" size="36" default-value-expr="currentPersonID()"> 
      <label language="zh_CN">提交人ID</label> 
    </has-relation>  
    <has-relation relation="fCREATEPERNAME" size="64" default-value-expr="currentPersonName()"> 
      <label language="zh_CN">提交人</label> 
    </has-relation>  
    <has-relation relation="fCREATETIME" default-value-expr="currentDateTime()"> 
      <label language="zh_CN">提交时间</label> 
    </has-relation>  
    <has-relation relation="fUPDATEDEPTID" size="36" default-value-expr="currentOrgID()"> 
      <label language="zh_CN">修改部门ID</label> 
    </has-relation>  
    <has-relation relation="fUPDATEDEPTNAME" size="128" default-value-expr="currentOrgName()"> 
      <label language="zh_CN">修改部门</label> 
    </has-relation>  
    <has-relation relation="fUPDATEPERID" size="36" default-value-expr="currentPersonID()"> 
      <label language="zh_CN">修改人ID</label> 
    </has-relation>  
    <has-relation relation="fUPDATEPERNAME" size="64" default-value-expr="currentPersonName()"> 
      <label language="zh_CN">修改人</label> 
    </has-relation>  
    <has-relation relation="fUPDATETIME" default-value-expr="currentDateTime()"> 
      <label language="zh_CN">修改时间</label> 
    </has-relation>  
    <has-relation relation="version"/>  
    <has-relation relation="fDEPTPATH" size="1024" default-value-expr="currentOrgFID()"> 
      <label language="zh_CN">部门path</label> 
    </has-relation>  
    <has-relation relation="fURL" size="1024" default-value-expr="currentPersonMemberFID()"> 
      <label language="zh_CN">路径</label> 
    </has-relation>  
    <label language="zh_CN">补签申请</label>  
    <has-relation relation="fBizState" data-type="String" size="36" default-value-expr="'bsEditing'"> 
      <label language="zh_CN">流程状态</label> 
    </has-relation>  
    <has-relation relation="fBizStateName" data-type="String" default-value-expr="'编辑中'"
      size="64"> 
      <label language="zh_CN">流程状态名称</label> 
    </has-relation>  
    <has-relation relation="fCurrentExecutors" data-type="String" size="36"> 
      <label language="zh_CN">流程处理人</label> 
    </has-relation>  
    <has-relation relation="fCurrentActivities" data-type="String" size="128"> 
      <label language="zh_CN">流程节点名称</label> 
    </has-relation>  
      
    <has-relation relation="fFactTime" data-type="Float"> 
      <label language="zh_CN">实际时长</label> 
    </has-relation>  
    <has-relation relation="fBrefExplain" size="1024"> 
      <label language="zh_CN">简要说明</label> 
    </has-relation>  
    <has-relation relation="fCANCELHOLSPERSONID"> 
      <label language="zh_CN">fCANCELHOLSPERSONID</label> 
    </has-relation> 
  </concept>  
  <relation name="fAPPLYTYPEID" data-type="String"/>  
  <relation name="fREMARK" data-type="String"/>  
  <relation name="fAPPLYPERSONNAME" data-type="String"/>  
  <relation name="fCREATEURL" data-type="String"/>  
  <relation name="fCANCELHOLSPERSONID" data-type="String"/>  
  <relation name="fPLANNAME" data-type="String"/>  
  <relation name="fHOURS" data-type="Decimal"/>  
  <relation name="fUPDATEDEPTID" data-type="String"/>  
  <relation name="fCANCELHOLSPERSONNAME" data-type="String"/>  
  <relation name="fNUMBER" data-type="Decimal"/>  
  <relation name="fCREATETIME" data-type="DateTime"/>  
  <relation name="fSQUAD" data-type="String"/>  
  <relation name="fREASON" data-type="String"/>  
  <relation name="fCREATEDEPTID" data-type="String"/>  
  <relation name="fTYPEID" data-type="String"/>  
  <relation name="fCANCELHOLSDATE" data-type="DateTime"/>  
  <relation name="fCANCELHOLSDEPTNAME" data-type="String"/>  
  <relation name="fCLIENTERNAME" data-type="String"/>  
  <relation name="fFACTHOURS" data-type="Decimal"/>  
  <relation name="fAPPLYPERSONID" data-type="String"/>  
  <relation name="fDEPTURL" data-type="String"/>  
  <relation name="fFACTENDTIME" data-type="DateTime"/>  
  <relation name="fCREATEORGANID" data-type="String"/>  
  <relation name="fFACTSTARTTIME" data-type="DateTime"/>  
  <relation name="fDEPTPATH" data-type="String"/>  
  <relation name="fUPDATEPERNAME" data-type="String"/>  
  <relation name="fISSURE" data-type="Decimal"/>  
  <relation name="fDAYS" data-type="Decimal"/>  
  <relation name="fCARDTIME" data-type="DateTime"/>  
  <relation name="fCREATEPERNAME" data-type="String"/>  
  <relation name="fUPDATEDEPTNAME" data-type="String"/>  
  <relation name="fBREFEXPLAIN" data-type="String"/>  
  <relation name="fPROJECTNAME" data-type="String"/>  
  <relation name="fUPDATETIME" data-type="DateTime"/>  
  <relation name="fPLANID" data-type="String"/>  
  <relation name="fERPTM" data-type="String"/>  
  <relation name="fTIME" data-type="Decimal"/>  
  <relation name="fCANCELHOLSDEPTID" data-type="String"/>  
  <relation name="fAPPLYDEPTID" data-type="String"/>  
  <relation name="fBIZSTATENAME" data-type="String"/>  
  <relation name="fPLACE" data-type="String"/>  
  <relation name="fMONEY" data-type="Decimal"/>  
  <relation name="fUPDATEPERID" data-type="String"/>  
  <relation name="fFACTDAYS" data-type="Decimal"/>  
  <relation name="fAPPLYTYPENAME" data-type="String"/>  
  <relation name="fAPPLYDATE" data-type="DateTime"/>  
  <relation name="fSQUADID" data-type="String"/>  
  <relation name="fBIZSTATE" data-type="String"/>  
  <relation name="fPERSONNEL" data-type="String"/>  
  <relation name="fCANCELHOLSPOS" data-type="String"/>  
  <relation name="fPROJECTID" data-type="String"/>  
  <relation name="fAPPLYDEPTNAME" data-type="String"/>  
  <relation name="fTYPENAME" data-type="String"/>  
  <relation name="fARRANGE" data-type="String"/>  
  <relation name="fCLIENTERID" data-type="String"/>  
  <relation name="fENDTIME" data-type="DateTime"/>  
  <relation name="fEXPLAIN" data-type="String"/>  
  <relation name="fCREATEPERID" data-type="String"/>  
  <relation name="fMODENAME" data-type="String"/>  
  <relation name="fCREATEDEPTNAME" data-type="String"/>  
  <relation name="fMODEID" data-type="String"/>  
  <relation name="fSTARTTIME" data-type="DateTime"/>  
  <concept name="OA_repair_EXECUTE" default-value-expr="guid()"> 
    <has-relation relation="fTaskID" size="36"/>  
    <has-relation relation="fActivityFName" size="512"/>  
    <has-relation relation="fActivityLabel" size="64"/>  
    <has-relation relation="fOpinion" data-type="String" size="1024"/>  
    <has-relation relation="fVerdict" size="36"/>  
    <has-relation relation="fState" size="36"/>  
    <has-relation relation="fStateName" size="64"/>  
    <has-relation relation="fCreateOgnID" size="36"/>  
    <has-relation relation="fCreateOgnName" size="64"/>  
    <has-relation relation="fCreateDeptID" size="36"/>  
    <has-relation relation="fCreateDeptName" size="64"/>  
    <has-relation relation="fCreatePosID" size="36"/>  
    <has-relation relation="fCreatePosName" size="64"/>  
    <has-relation relation="fCreatePsnID" size="36"/>  
    <has-relation relation="fCreatePsnName" size="64"/>  
    <has-relation relation="fCreatePsnFID" size="512"/>  
    <has-relation relation="fCreatePsnFName" size="1024"/>  
    <has-relation relation="fCreateTime" data-type="DateTime"/>  
    <has-relation relation="fUpdatePsnID" size="36"/>  
    <has-relation relation="fUpdatePsnName" size="64"/>  
    <has-relation relation="fUpdateTime"/>  
    <has-relation relation="version" size="22"/>  
      
    <label language="zh_CN">补签申请处理</label>  
    <has-relation relation="fMasterID" data-type="String" size="36"> 
      <label language="zh_CN">fMasterID</label> 
    </has-relation> 
  </concept>  
  <relation name="fFMASTERID" data-type="String"> 
    <label language="zh_CN">fMasterID</label> 
  </relation>     
  <relation name="fLCJDMC" data-type="String"> 
    <label language="zh_CN">流程节点名称</label> 
  </relation>    
  <relation name="fType" data-type="String"> 
    <label language="zh_CN">鉴别列</label> 
  </relation> 
</model>
