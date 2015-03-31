<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <concept name="OA_WM_outApply" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">外出申请</label>  
    <has-relation relation="fNO" size="36" default-value-expr="nextSeqString(format('%s%s','CCSQ-',format('%1$tY%1$tm%1$td', currentDateTime())),'000')"> 
      <label language="zh_CN">单据编号</label> 
    </has-relation>  
    <has-relation relation="fAPPLYPERSONNAME" default-value-expr="currentPersonName()"
      size="64"> 
      <label language="zh_CN">申请人</label> 
    </has-relation>  
    <has-relation relation="fAPPLYPERSONID" default-value-expr="currentPersonID()" size="36"> 
      <label language="zh_CN">申请人ID</label> 
    </has-relation>  
    <has-relation relation="fAPPLYDEPTID" default-value-expr="currentOrgID()" size="36"> 
      <label language="zh_CN">申请部门ID</label> 
    </has-relation>  
    <has-relation relation="fAPPLYDEPTNAME" default-value-expr="currentOrgName()" size="64"> 
      <label language="zh_CN">申请部门</label> 
    </has-relation>  
    <has-relation relation="fDAYS" data-type="Integer"> 
      <label language="zh_CN">预计天数</label> 
    </has-relation>  
    <has-relation relation="fHOURS" data-type="Float"> 
      <label language="zh_CN">预计小时数</label> 
    </has-relation>  
    <has-relation relation="fNUMBER" data-type="Integer"> 
      <label language="zh_CN">外出人数</label> 
    </has-relation>  
    <has-relation relation="fPERSONNEL" size="64"> 
      <label language="zh_CN">人员</label> 
    </has-relation>  
    <has-relation relation="fREASON" size="64"> 
      <label language="zh_CN">外出事由</label> 
    </has-relation>  
    <has-relation relation="fRemark" size="64"> 
      <label language="zh_CN">备注</label> 
    </has-relation>  
    <has-relation relation="fTIME" data-type="Integer" default-value-expr="0"> 
      <label language="zh_CN">申请时长</label> 
    </has-relation>  
    <has-relation relation="fFACTHOURS" data-type="Float" default-value-expr="0"> 
      <label language="zh_CN">实际小时数</label> 
    </has-relation>  
    <has-relation relation="fFACTENDTIME"> 
      <label language="zh_CN">实际结束时间</label> 
    </has-relation>  
    <has-relation relation="fFACTSTARTTIME"> 
      <label language="zh_CN">实际开始时间</label> 
    </has-relation>  
    <has-relation relation="fFACTDAYS" data-type="Integer"> 
      <label language="zh_CN">实际天数</label> 
    </has-relation>  
    <has-relation relation="fCreatePerID" default-value-expr="currentPersonID()" size="36"> 
      <label language="zh_CN">提交人ID</label> 
    </has-relation>  
    <has-relation relation="fCreatePerName" default-value-expr="currentPersonName()"
      size="64"> 
      <label language="zh_CN">提交人</label> 
    </has-relation>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()" data-type="DateTime"> 
      <label language="zh_CN">提交时间</label> 
    </has-relation>  
    <has-relation relation="fCREATEDEPTID" default-value-expr="currentOrgID()" size="36"> 
      <label language="zh_CN">提交部门ID</label> 
    </has-relation>  
    <has-relation relation="fCREATEDEPTNAME" default-value-expr="currentOrgName()" size="64"> 
      <label language="zh_CN">提交部门</label> 
    </has-relation>  
    <has-relation relation="fUPDATEDEPTID" default-value-expr="currentOrgID()" size="36"> 
      <label language="zh_CN">修改部门ID</label> 
    </has-relation>  
    <has-relation relation="fUPDATEPERNAME" default-value-expr="currentPersonName()"
      size="64"> 
      <label language="zh_CN">修改人</label> 
    </has-relation>  
    <has-relation relation="fUPDATEDEPTNAME" default-value-expr="currentOrgName()" size="64"> 
      <label language="zh_CN">修改部门</label> 
    </has-relation>  
    <has-relation relation="fUPDATETIME" default-value-expr="currentDateTime()"> 
      <label language="zh_CN">修改时间</label> 
    </has-relation>  
    <has-relation relation="fUPDATEPERID" default-value-expr="currentPersonID()" size="36"> 
      <label language="zh_CN">修改人ID</label> 
    </has-relation>  
    <has-relation relation="fBizState" default-value-expr="'bsEditing'" size="36"> 
      <label language="zh_CN">流程状态</label> 
    </has-relation>  
    <has-relation relation="fBizStateName" default-value-expr="'编辑中'" size="64"> 
      <label language="zh_CN">流程状态名称</label> 
    </has-relation>  
    <has-relation relation="fCurrentExecutors" size="64"> 
      <label language="zh_CN">流程处理人</label> 
    </has-relation>  
    <has-relation relation="fCurrentActivities" size="64"> 
      <label language="zh_CN">流程节点名称</label> 
    </has-relation>  
    <has-relation relation="fISSURE" data-type="Integer" default-value-expr="0"> 
      <label language="zh_CN">是否确认</label> 
    </has-relation>  
    <has-relation relation="fCANCELHOLSPERSONID" size="36"> 
      <label language="zh_CN">确认人ID</label> 
    </has-relation>  
    <has-relation relation="fCANCELHOLSPERSONNAME" size="64"> 
      <label language="zh_CN">确认人</label> 
    </has-relation>  
    <has-relation relation="fCANCELHOLSDATE"> 
      <label language="zh_CN">确认日期</label> 
    </has-relation>  
    <has-relation relation="fCANCELHOLSDEPTNAME" size="64"> 
      <label language="zh_CN">确认部门</label> 
    </has-relation>  
    <has-relation relation="fCANCELHOLSDEPTID" size="36"> 
      <label language="zh_CN">确认部门ID</label> 
    </has-relation>  
    <has-relation relation="fAPPLYDATE" default-value-expr="currentDate()" data-type="Date"> 
      <label language="zh_CN">申请日期</label> 
    </has-relation>  
    <has-relation relation="fPLANNAME" size="64"> 
      <label language="zh_CN">计划</label> 
    </has-relation>  
    <has-relation relation="fPLANID" size="36"> 
      <label language="zh_CN">计划ID</label> 
    </has-relation>  
    <has-relation relation="fPROJECTNAME" size="64"> 
      <label language="zh_CN">项目</label> 
    </has-relation>  
    <has-relation relation="fPROJECTID" size="36"> 
      <label language="zh_CN">项目ID</label> 
    </has-relation>  
    <has-relation relation="fCLIENTERNAME" size="64"> 
      <label language="zh_CN">客户</label> 
    </has-relation>  
    <has-relation relation="fCLIENTERID" size="36"> 
      <label language="zh_CN">客户ID</label> 
    </has-relation>  
    <has-relation relation="fSTARTTIME"> 
      <label language="zh_CN">开始时间</label> 
    </has-relation>  
    <has-relation relation="fENDTIME"> 
      <label language="zh_CN">结束时间</label> 
    </has-relation>  
    <has-relation relation="fExplain" data-type="String" size="1024"> 
      <label language="zh_CN">简要说明</label> 
    </has-relation>  
    <has-relation relation="fURL" default-value-expr="currentPersonMemberFID()" size="512"> 
      <label language="zh_CN">组织路径</label> 
    </has-relation>  
      
    <has-relation relation="fFactTime" data-type="Float"> 
      <label language="zh_CN">实际时长</label> 
    </has-relation> 
  </concept>  
  <concept name="OA_out_EXECUTE" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">外出申请处理</label>  
    <has-relation relation="fTaskID"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <has-relation relation="fMasterID"> 
      <label language="zh_CN">fMasterID</label> 
    </has-relation>  
    <has-relation relation="fActivityFName"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <has-relation relation="fActivityLabel"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <has-relation relation="fOpinion" data-type="String"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <has-relation relation="fVerdict"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <has-relation relation="fStateName"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <has-relation relation="fState"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <has-relation relation="fCreateOgnID"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <has-relation relation="fCreateOgnName"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <has-relation relation="fCreatePosName"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <has-relation relation="fCreatePosID"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <has-relation relation="fCreateDeptID"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <has-relation relation="fCreateDeptName"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnName"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnID"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnFID"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnFName"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <has-relation relation="fCreateTime" data-type="DateTime"> 
      <label language="zh_CN">提交时间</label> 
    </has-relation>  
    <has-relation relation="fUpdateTime"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <has-relation relation="fUpdatePsnName"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <has-relation relation="fUpdatePsnID"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
     
  </concept>  
  <relation name="fExplain" data-type="String"> 
    <label language="zh_CN">简要说明</label> 
  </relation>  
  <concept name="OA_WM_outMember" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">外出人员</label>  
    <has-relation relation="fDeptID" data-type="String" size="36"> 
      <label language="zh_CN">部门ID</label> 
    </has-relation>  
    <has-relation relation="fDeptName" data-type="String" size="64"> 
      <label language="zh_CN">部门名称</label> 
    </has-relation>  
    <has-relation relation="fPositionID" data-type="String" size="36"> 
      <label language="zh_CN">岗位</label> 
    </has-relation>  
    <has-relation relation="fPersonName" data-type="String" local-name="fPersonName"
      size="64"> 
      <label language="zh_CN">人员</label> 
    </has-relation>  
    <has-relation relation="fOrgURL" data-type="String" size="512"> 
      <label language="zh_CN">组织机构URL</label> 
    </has-relation>  
    <has-relation relation="fIsNotify" data-type="Integer" default-value-expr="0"> 
      <label language="zh_CN">是否已经通知</label> 
    </has-relation>  
    <has-relation relation="fNotifyMode" data-type="String" size="64"> 
      <label language="zh_CN">通知方式</label> 
    </has-relation>  
    <has-relation relation="fNotifyTime" data-type="String" size="64"> 
      <label language="zh_CN">通知时间</label> 
    </has-relation>  
    <has-relation relation="fOrgKind" data-type="String" size="64"> 
      <label language="zh_CN">组织机构类型</label> 
    </has-relation>  
    <has-relation relation="fPersonID" data-type="String" size="36"> 
      <label language="zh_CN">人员ID</label> 
    </has-relation>  
    <has-relation relation="fMasterID" data-type="OA_WM_outApply" size="36"> 
      <label language="zh_CN">外出申请外键</label> 
    </has-relation> 
  </concept>  
  <relation name="fOutApplyID" data-type="String"> 
    <label language="zh_CN">外出申请外键</label> 
  </relation>     
  <relation name="fOrgURL" data-type="String"> 
    <label language="zh_CN">组织机构URL</label> 
  </relation>  
  <relation name="fIsNotify" data-type="String"> 
    <label language="zh_CN">是否已经通知</label> 
  </relation>  
  <relation name="fNotifyMode" data-type="String"> 
    <label language="zh_CN">通知方式</label> 
  </relation>  
  <relation name="fNotifyTime" data-type="String"> 
    <label language="zh_CN">通知时间</label> 
  </relation>     
</model>
