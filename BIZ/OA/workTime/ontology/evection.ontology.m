<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <concept name="OA_WM_EvecApply" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">出差申请</label>  
    <has-relation relation="fNO" size="64" default-value-expr="nextSeqString(format('%s%s','CCSQ-',format('%1$tY%1$tm%1$td', currentDateTime())),'000')"> 
      <label language="zh_CN">单据号</label> 
    </has-relation>  
    <has-relation relation="fAPPLYPERSONID" data-type="String" default-value-expr="currentPersonID()"
      size="36"> 
      <label language="zh_CN">申请人ID</label> 
    </has-relation>  
    <has-relation relation="fAPPLYPERSONNAME" default-value-expr="currentPersonName()"
      size="64"> 
      <label language="zh_CN">申请人</label> 
    </has-relation>  
    <has-relation relation="fAPPLYDATE" data-type="Date" default-value-expr="currentDate()"> 
      <label language="zh_CN">申请日期</label> 
    </has-relation>  
    <has-relation relation="fDEPTPATH" size="512"> 
      <label language="zh_CN">部门path</label> 
    </has-relation>  

    <has-relation relation="fAPPLYDEPTID" data-type="String" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"
      size="36"> 
      <label language="zh_CN">申请部门</label> 
    </has-relation>  
    <has-relation relation="fAPPLYDEPTNAME" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"
      size="64"> 
      <label language="zh_CN">申请部门名称</label> 
    </has-relation>  
    <has-relation relation="fERPTM" size="64"> 
      <label language="zh_CN">所在岗位</label> 
    </has-relation>  
    <has-relation relation="fPLANID" size="36"> 
      <label language="zh_CN">计划ID</label> 
    </has-relation>  
    <has-relation relation="fPLANNAME" size="64"> 
      <label language="zh_CN">计划名称</label> 
    </has-relation>  
    <has-relation relation="fPROJECTID" size="36"> 
      <label language="zh_CN">项目ID</label> 
    </has-relation>  
    <has-relation relation="fPROJECTNAME" size="64"> 
      <label language="zh_CN">项目名称</label> 
    </has-relation>  
    <has-relation relation="fCLIENTERID" size="36"> 
      <label language="zh_CN">客户ID</label> 
    </has-relation>  
    <has-relation relation="fCLIENTERNAME" size="64"> 
      <label language="zh_CN">客户名称</label> 
    </has-relation>  
    <has-relation relation="fSTARTTIME" data-type="Date"> 
      <label language="zh_CN">开始时间</label> 
    </has-relation>  
    <has-relation relation="fENDTIME" data-type="Date"> 
      <label language="zh_CN">结束时间</label> 
    </has-relation>  
    <has-relation relation="fDAYS" data-type="Integer"> 
      <label language="zh_CN">申请天数</label> 
    </has-relation>  
    <has-relation relation="fHOURS" data-type="Float"> 
      <label language="zh_CN">小时</label> 
    </has-relation>  
    <has-relation relation="fTIME" data-type="Integer"> 
      <label language="zh_CN">申请时长</label> 
    </has-relation>  
    <has-relation relation="fREASON" size="1024"> 
      <label language="zh_CN">事由</label> 
    </has-relation>  
    <has-relation relation="fRemark" size="1024"> 
      <label language="zh_CN">备注</label> 
    </has-relation>  
    <has-relation relation="fISSURE" data-type="Integer"> 
      <label language="zh_CN">是否确认</label> 
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
    <has-relation relation="fPERSONNEL" size="64"> 
      <label language="zh_CN">人员</label> 
    </has-relation>  
    <has-relation relation="fCARDTIME"> 
      <label language="zh_CN">打卡时间</label> 
    </has-relation>  
    <has-relation relation="fSQUAD" size="64"> 
      <label language="zh_CN">所属排班</label> 
    </has-relation>  
    <has-relation relation="fPLACE" size="512"> 
      <label language="zh_CN">地点</label> 
    </has-relation>  
    <has-relation relation="fMODEID" size="36"> 
      <label language="zh_CN">出行方式</label> 
    </has-relation>  
    <has-relation relation="fMODENAME" size="64"> 
      <label language="zh_CN">出行方式</label> 
    </has-relation>  
    <has-relation relation="fARRANGE" size="64"> 
      <label language="zh_CN">行程安排</label> 
    </has-relation>  
    <has-relation relation="fMONEY" data-type="Float"> 
      <label language="zh_CN">出差备用金</label> 
    </has-relation>  
    <has-relation relation="fEXPLAIN" size="1024"> 
      <label language="zh_CN">用途说明</label> 
    </has-relation>  
    <has-relation relation="fFACTSTARTTIME" data-type="Date"> 
      <label language="zh_CN">实际开始时间</label> 
    </has-relation>  
    <has-relation relation="fFACTENDTIME" data-type="Date"> 
      <label language="zh_CN">实际结束时间</label> 
    </has-relation>  
    <has-relation relation="fFACTDAYS" data-type="Integer"> 
      <label language="zh_CN">实际天数</label> 
    </has-relation>  
    <has-relation relation="fFACTHOURS" data-type="Float"> 
      <label language="zh_CN">实际小时数</label> 
    </has-relation>  
    <has-relation relation="fCREATEDEPTID" data-type="String" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"
      size="36"> 
      <label language="zh_CN">提交部门ID</label> 
    </has-relation>  
    <has-relation relation="fCREATEDEPTNAME" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"
      size="64"> 
      <label language="zh_CN">提交部门</label> 
    </has-relation>  
    <has-relation relation="fCreatePerID" data-type="String" default-value-expr="currentPersonID()"
      size="36"> 
      <label language="zh_CN">提交人ID</label> 
    </has-relation>  
    <has-relation relation="fCreatePerName" default-value-expr="currentPersonName()"
      size="64"> 
      <label language="zh_CN">提交人</label> 
    </has-relation>  
    <has-relation relation="fCreateTime" data-type="DateTime" default-value-expr="currentDateTime()"> 
      <label language="zh_CN">提交时间</label> 
    </has-relation>  
    <has-relation relation="fUPDATEDEPTID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"
      size="36"> 
      <label language="zh_CN">修改部门ID</label> 
    </has-relation>  
    <has-relation relation="fUPDATEDEPTNAME" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"
      size="64"> 
      <label language="zh_CN">修改部门</label> 
    </has-relation>  
    <has-relation relation="fUPDATEPERID" data-type="String" default-value-expr="currentPersonID()"
      size="36"> 
      <label language="zh_CN">修改人ID</label> 
    </has-relation>  
    <has-relation relation="fUPDATEPERNAME" default-value-expr="currentPersonName()"
      size="64"> 
      <label language="zh_CN">修改人</label> 
    </has-relation>  
    <has-relation relation="fUPDATETIME" data-type="DateTime" default-value-expr="currentDateTime()"> 
      <label language="zh_CN">修改时间</label> 
    </has-relation>  
    <has-relation relation="fBizState" default-value-expr="'bsEditing'" size="36"> 
      <label language="zh_CN">流程状态</label> 
    </has-relation>  
    <has-relation relation="fBizStateName" default-value-expr="'编辑中'" size="64"> 
      <label language="zh_CN">流程状态名称</label> 
    </has-relation>  
 
    <has-relation relation="fCANCELHOLSPERSONID" size="36"> 
      <label language="zh_CN">确认人ID</label> 
    </has-relation>  
    <has-relation relation="fCANCELHOLSDEPTID" size="36"> 
      <label language="zh_CN">确认部门ID</label> 
    </has-relation>  
      
    <has-relation relation="fBrefExplain" data-type="String" size="1024"> 
      <label language="zh_CN">简要说明</label> 
    </has-relation> 
  <has-relation relation="fURL" default-value-expr="currentPersonMemberFID()" size="1024"><label language="zh_CN">路径</label>
</has-relation>
<has-relation relation="fCurrentActivities" size="64"><label language="zh_CN">当前环节</label>
</has-relation>
<has-relation relation="fCurrentExecutors" size="64"><label language="zh_CN">当前执行者</label>
</has-relation>
</concept>  
  <relation name="fEvecApplyID" data-type="String"> 
    <label language="zh_CN">请假申请主键</label> 
  </relation>  
  <relation name="fBMID" data-type="String"> 
    <label language="zh_CN">部门ID</label> 
  </relation>  
  <concept name="OA_evection_EXECUTE" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">出差申请处理</label>  
    <has-relation relation="fMasterID" data-type="String"> 
      <label language="zh_CN">主数据ID</label> 
    </has-relation>  
    <has-relation relation="fTaskID"> 
      <label language="zh_CN">任务ID</label> 
    </has-relation>  
    <has-relation relation="fActivityFName"> 
      <label language="zh_CN">环节路径</label> 
    </has-relation>  
    <has-relation relation="fActivityLabel"> 
      <label language="zh_CN">环节名称</label> 
    </has-relation>  
    <has-relation relation="fOpinion"> 
      <label language="zh_CN">处理意见</label> 
    </has-relation>  
    <has-relation relation="fVerdict"> 
      <label language="zh_CN">处理结论</label> 
    </has-relation>  
    <has-relation relation="fState"> 
      <label language="zh_CN">处理状态编码</label> 
    </has-relation>  
    <has-relation relation="fStateName"> 
      <label language="zh_CN">处理状态</label> 
    </has-relation>  
    <has-relation relation="fCreateOgnID"> 
      <label language="zh_CN">提交机构ID</label> 
    </has-relation>  
    <has-relation relation="fCreateOgnName"> 
      <label language="zh_CN">提交机构</label> 
    </has-relation>  
    <has-relation relation="fCreateDeptID"> 
      <label language="zh_CN">提交部门ID</label> 
    </has-relation>  
    <has-relation relation="fCreateDeptName"> 
      <label language="zh_CN">提交部门</label> 
    </has-relation>  
    <has-relation relation="fCreatePosID"> 
      <label language="zh_CN">提交岗位ID</label> 
    </has-relation>  
    <has-relation relation="fCreatePosName"> 
      <label language="zh_CN">提交岗位</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnID"> 
      <label language="zh_CN">提交人员ID</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnName"> 
      <label language="zh_CN">提交人员</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnFID"> 
      <label language="zh_CN">提交人员FullID</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnFName"> 
      <label language="zh_CN">提交人员FullName</label> 
    </has-relation>  
    <has-relation relation="fCreateTime"> 
      <label language="zh_CN">提交时间</label> 
    </has-relation>  
    <has-relation relation="fUpdatePsnID"> 
      <label language="zh_CN">修改人员ID</label> 
    </has-relation>  
    <has-relation relation="fUpdatePsnName"> 
      <label language="zh_CN">修改人员</label> 
    </has-relation>  
    <has-relation relation="fUpdateTime"> 
      <label language="zh_CN">修改时间</label> 
    </has-relation>  
     
  </concept>  
  <concept name="OA_WM_eveMember" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">出差人员</label>  
    <has-relation relation="fDeptID"> 
      <label language="zh_CN">部门ID</label> 
    </has-relation>  
    <has-relation relation="fDeptName"> 
      <label language="zh_CN">部门名称</label> 
    </has-relation>  
    <has-relation relation="fPositionID"> 
      <label language="zh_CN">岗位</label> 
    </has-relation>  
    <has-relation relation="fPersonName"> 
      <label language="zh_CN">人员名称</label> 
    </has-relation>  
    <has-relation relation="fOrgURL"> 
      <label language="zh_CN">组织机构URL</label> 
    </has-relation>  
    <has-relation relation="fIsNotify" default-value-expr="'0'"> 
      <label language="zh_CN">是否已经通知</label> 
    </has-relation>  
    <has-relation relation="fNotifyMode" data-type="String"> 
      <label language="zh_CN">通知方式</label> 
    </has-relation>  
    <has-relation relation="fNotifyTime" data-type="String"> 
      <label language="zh_CN">通知时间</label> 
    </has-relation>  
    <has-relation relation="fOrgKind"> 
      <label language="zh_CN">组织机构类型</label> 
    </has-relation>  
    <has-relation relation="fPersonID" data-type="String"> 
      <label language="zh_CN">人员ID</label> 
    </has-relation>  
    <has-relation relation="fMasterID" data-type="OA_WM_EvecApply"> 
      <label language="zh_CN">出差申请外键</label> 
    </has-relation>  
    <has-relation relation="fExtendStr1" data-type="String" size="64"> 
      <label language="zh_CN">扩展字段</label> 
    </has-relation>  
    <has-relation relation="fExtendStr2" data-type="String" size="64"> 
      <label language="zh_CN">扩展字段</label> 
    </has-relation>  
    <has-relation relation="fExtendStr3" data-type="String" size="64"> 
      <label language="zh_CN">扩展字段</label> 
    </has-relation>  
    <has-relation relation="fExtendStr4" data-type="String" size="64"> 
      <label language="zh_CN">扩展字段</label> 
    </has-relation>  
    <has-relation relation="fExtendStr5" data-type="String" size="64"> 
      <label language="zh_CN">扩展字段</label> 
    </has-relation>  
    <has-relation relation="fExtendStr6" data-type="String" size="255"> 
      <label language="zh_CN">扩展字段</label> 
    </has-relation>  
    <has-relation relation="fExtendStr7" data-type="String" size="255"> 
      <label language="zh_CN">扩展字段</label> 
    </has-relation>  
    <has-relation relation="fExtendStr8" data-type="String" size="255"> 
      <label language="zh_CN">扩展字段</label> 
    </has-relation>  
    <has-relation relation="fExtendStr9" data-type="String" size="1024"> 
      <label language="zh_CN">扩展字段</label> 
    </has-relation>  
    <has-relation relation="fExtendDate1" data-type="Date"> 
      <label language="zh_CN">扩展字段</label> 
    </has-relation>  
    <has-relation relation="fExtendDate2" data-type="Date"> 
      <label language="zh_CN">扩展字段</label> 
    </has-relation>  
    <has-relation relation="fExtendDate3" data-type="Date"> 
      <label language="zh_CN">扩展字段</label> 
    </has-relation>  
    <has-relation relation="fExtendDate4" data-type="Date"> 
      <label language="zh_CN">扩展字段</label> 
    </has-relation>  
    <has-relation relation="fExtendDate5" data-type="Date"> 
      <label language="zh_CN">扩展字段</label> 
    </has-relation>  
    <has-relation relation="fExtendNum1" data-type="Decimal" size="15" scale="2"> 
      <label language="zh_CN">扩展字段</label> 
    </has-relation>  
    <has-relation relation="fExtendNum2" data-type="Decimal" size="15" scale="2"> 
      <label language="zh_CN">扩展字段</label> 
    </has-relation>  
    <has-relation relation="fExtendNum3" data-type="Decimal" size="15" scale="2"> 
      <label language="zh_CN">扩展字段</label> 
    </has-relation>  
    <has-relation relation="fExtendNum4" data-type="Decimal" size="18" scale="4"> 
      <label language="zh_CN">扩展字段</label> 
    </has-relation>  
    <has-relation relation="fExtendNum5" data-type="Decimal" size="18" scale="4"> 
      <label language="zh_CN">扩展字段</label> 
    </has-relation> 
  </concept>  
  <concept name="COMM_UseMode_D" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">出行方式</label>  
    <has-relation relation="fName" data-type="String"> 
      <label language="zh_CN">出行方式</label> 
    </has-relation> 
  </concept>  
  <relation name="fBrefExplain" data-type="String"> 
    <label language="zh_CN">简要说明</label> 
  </relation> 
</model>
