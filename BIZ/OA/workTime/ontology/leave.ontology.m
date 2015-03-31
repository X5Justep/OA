<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <concept name="OA_WM_LeaveApply" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">请假申请</label>  
    <has-relation relation="fNO" default-value-expr="nextSeqString(format('%s%s','QJSQ-',format('%1$tY%1$tm%1$td', currentDateTime())),'000')"
      size="100"> 
      <label language="zh_CN">单据号</label> 
    </has-relation>  
    <has-relation relation="fApplyPersonID" data-type="String" default-value-expr="currentPersonID()"
      size="36"> 
      <label language="zh_CN">申请人</label> 
    </has-relation>  
    <has-relation relation="fApplyPersonName" data-type="String" default-value-expr="currentPersonName()"
      size="64"> 
      <label language="zh_CN">申请人</label> 
    </has-relation>  
    <has-relation relation="fApplyDate" data-type="Date" default-value-expr="currentDate()"> 
      <label language="zh_CN">申请日期</label> 
    </has-relation>  
    <has-relation relation="fApplyDeptID" data-type="String" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"
      size="36"> 
      <label language="zh_CN">申请部门</label> 
    </has-relation>  
    <has-relation relation="fApplyDeptName" data-type="String" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"
      size="64"> 
      <label language="zh_CN">申请部门</label> 
    </has-relation>  
    <has-relation relation="fDeptPath" data-type="String" default-value-expr="currentDeptFID()"
      size="1024"> 
      <label language="zh_CN">部门path</label> 
    </has-relation>  
    <has-relation relation="fURL" data-type="String" default-value-expr="currentPersonMemberFID()"
      size="1024"> 
      <label language="zh_CN">路径</label> 
    </has-relation>  
    <has-relation relation="fLeaveReason" data-type="String" size="1024"> 
      <label language="zh_CN">请假事由</label> 
    </has-relation>  
    <has-relation relation="fPlanID" data-type="String" size="36"> 
      <label language="zh_CN">计划ID</label> 
    </has-relation>  
    <has-relation relation="fPlanName" data-type="String" size="64"> 
      <label language="zh_CN">计划名称</label> 
    </has-relation>  
    <has-relation relation="fProjectID" data-type="String" size="36"> 
      <label language="zh_CN">项目ID</label> 
    </has-relation>  
    <has-relation relation="fProjectName" data-type="String" size="64"> 
      <label language="zh_CN">项目名称</label> 
    </has-relation>  
    <has-relation relation="fClienterID" data-type="String" size="36"> 
      <label language="zh_CN">客户ID</label> 
    </has-relation>  
    <has-relation relation="fClienterName" data-type="String" size="64"> 
      <label language="zh_CN">客户名称</label> 
    </has-relation>  
    <has-relation relation="fStartTime" data-type="DateTime"> 
      <label language="zh_CN">开始时间</label> 
    </has-relation>  
    <has-relation relation="fEndTime" data-type="DateTime"> 
      <label language="zh_CN">结束时间</label> 
    </has-relation>  
    <has-relation relation="fLeaveDays" data-type="Integer"> 
      <label language="zh_CN">请假天数</label> 
    </has-relation>  
    <has-relation relation="fLeaveHours" data-type="Float" default-value-expr="0"> 
      <label language="zh_CN">请假小时数</label> 
    </has-relation>  
    <has-relation relation="fLeaveTime" data-type="Float"> 
      <label language="zh_CN">请假时长</label> 
    </has-relation>  
    <has-relation relation="fLeaveTypeName" data-type="String" size="63"> 
      <label language="zh_CN">请假类型</label> 
    </has-relation>  
    <has-relation relation="fLeaveTypeID" data-type="OA_WM_LeaveType" size="36"> 
      <label language="zh_CN">请假类型</label> 
    </has-relation>  
    <has-relation relation="fRelationTel" data-type="String" size="36"> 
      <label language="zh_CN">联系电话</label> 
    </has-relation>  
    <has-relation relation="fWorkConnectPersonID" data-type="String" size="36"> 
      <label language="zh_CN">工作暂接人</label> 
    </has-relation>  
    <has-relation relation="fWorkConnectPersonName" data-type="String" size="64"> 
      <label language="zh_CN">工作暂接人</label> 
    </has-relation>  
    <has-relation relation="fWorkExplain" data-type="String" size="512"> 
      <label language="zh_CN">工作安排说明</label> 
    </has-relation>  
    <has-relation relation="fIsReducHoliday" data-type="Integer" default-value-expr="0"> 
      <label language="zh_CN">是否启用销假</label> 
    </has-relation>  
    <has-relation relation="fFactStartTime" data-type="DateTime"> 
      <label language="zh_CN">实际开始时间</label> 
    </has-relation>  
    <has-relation relation="fFactEndTime" data-type="DateTime"> 
      <label language="zh_CN">实际结束时间</label> 
    </has-relation>  
    <has-relation relation="fFactDays" data-type="Integer"> 
      <label language="zh_CN">实际天数</label> 
    </has-relation>  
    <has-relation relation="fFactTime" data-type="Float"> 
      <label language="zh_CN">实际时长</label> 
    </has-relation>   
    <has-relation relation="fCancelHolsDeptName" data-type="String" size="64"> 
      <label language="zh_CN">确认部门</label> 
    </has-relation>  
    <has-relation relation="fCancelHolsPersonName" data-type="String" size="64"> 
      <label language="zh_CN">确认人</label> 
    </has-relation>  
    <has-relation relation="fCancelHolsDate" data-type="DateTime"> 
      <label language="zh_CN">确认日期</label> 
    </has-relation>  
    <has-relation relation="fRemark" data-type="String" size="1024"> 
      <label language="zh_CN">备注</label> 
    </has-relation>  
    <has-relation relation="fCreateDeptID" data-type="String" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"
      size="36"> 
      <label language="zh_CN">提交部门ID</label> 
    </has-relation>  
    <has-relation relation="fCreateDeptName" data-type="String" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"
      size="64"> 
      <label language="zh_CN">提交部门</label> 
    </has-relation>  
    <has-relation relation="fCreatePerID" data-type="String" default-value-expr="currentPersonID()"
      size="36"> 
      <label language="zh_CN">提交人ID</label> 
    </has-relation>  
    <has-relation relation="fCreatePerName" data-type="String" default-value-expr="currentPersonName()"
      size="64"> 
      <label language="zh_CN">提交人</label> 
    </has-relation>  
    <has-relation relation="fCreateTime" data-type="DateTime" default-value-expr="currentDateTime()"> 
      <label language="zh_CN">提交时间</label> 
    </has-relation>  
    <has-relation relation="fUpdateDeptID" data-type="String" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"
      size="36"> 
      <label language="zh_CN">修改部门ID</label> 
    </has-relation>  
    <has-relation relation="fUpdateDeptName" data-type="String" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"
      size="64"> 
      <label language="zh_CN">修改部门</label> 
    </has-relation>  
    <has-relation relation="fUpdatePerID" data-type="String" default-value-expr="currentPersonID()"
      size="36"> 
      <label language="zh_CN">修改人ID</label> 
    </has-relation>  
    <has-relation relation="fUpdatePerName" data-type="String" default-value-expr="currentPersonName()"
      size="64"> 
      <label language="zh_CN">修改人</label> 
    </has-relation>  
    <has-relation relation="fUpdateTime" data-type="DateTime" default-value-expr="currentDateTime()"> 
      <label language="zh_CN">修改时间</label> 
    </has-relation>  
    <has-relation relation="fFactHours" data-type="Float" default-value-expr="0"> 
      <label language="zh_CN">实际小时数</label> 
    </has-relation>  
    <has-relation relation="fBizState" data-type="String" size="36" default-value-expr="'bsEditing'"> 
      <label language="zh_CN">业务流程状态编码</label> 
    </has-relation>  
    <has-relation relation="fBizStateName" data-type="String" size="64" default-value-expr="'编辑中'"> 
      <label language="zh_CN">业务流程状态</label> 
    </has-relation>  
    <has-relation relation="fIsSalary"> 
      <label language="zh_CN">是否扣薪</label> 
    </has-relation>  
    <has-relation relation="fCurrentActivities" data-type="String" size="64"> 
      <label language="zh_CN">当前环节</label> 
    </has-relation>  
    <has-relation relation="fCurrentExecutors" data-type="String" size="64"> 
      <label language="zh_CN">当前执行者</label> 
    </has-relation>  
    <has-relation relation="fPLACE" size="512"> 
      <label language="zh_CN">地点</label> 
    </has-relation>  
    <has-relation relation="fTransport" data-type="String" size="64"> 
      <label language="zh_CN">交通工具</label> 
    </has-relation> 
  </concept>  
  <relation name="fApplyPersonID" data-type="String"> 
    <label language="zh_CN">申请人</label> 
  </relation>  
  <relation name="fApplyPersonName" data-type="String"> 
    <label language="zh_CN">申请人</label> 
  </relation>         
  <relation name="fLeaveReason" data-type="String"> 
    <label language="zh_CN">请假事由</label> 
  </relation>  
  <relation name="fPlanID" data-type="String"> 
    <label language="zh_CN">计划ID</label> 
  </relation>  
  <relation name="fPlanName" data-type="String"> 
    <label language="zh_CN">计划名称</label> 
  </relation>  
  <relation name="fProjectID" data-type="String"> 
    <label language="zh_CN">项目ID</label> 
  </relation>  
  <relation name="fProjectName" data-type="String"> 
    <label language="zh_CN">项目名称</label> 
  </relation>  
  <relation name="fClienterID" data-type="String"> 
    <label language="zh_CN">客户ID</label> 
  </relation>  
  <relation name="fClienterName" data-type="String"> 
    <label language="zh_CN">客户名称</label> 
  </relation>  
  <relation name="fStartTime" data-type="String"> 
    <label language="zh_CN">开始时间</label> 
  </relation>    
  <relation name="fLeaveDays" data-type="Integer"> 
    <label language="zh_CN">请假天数</label> 
  </relation>  
  <relation name="fLeaveHours" data-type="Float"> 
    <label language="zh_CN">请假小时数</label> 
  </relation>  
  <relation name="fLeaveTime" data-type="String"> 
    <label language="zh_CN">请假时长</label> 
  </relation>  
  <relation name="fLeaveTypeName" data-type="String"> 
    <label language="zh_CN">请假类型</label> 
  </relation>  
  <relation name="fLeaveTypeID" data-type="String"> 
    <label language="zh_CN">请假类型</label> 
  </relation>  
  <relation name="fRelationTel" data-type="String"> 
    <label language="zh_CN">联系电话</label> 
  </relation>  
  <relation name="fWorkConnectPersonID" data-type="String"> 
    <label language="zh_CN">工作暂接人</label> 
  </relation>  
  <relation name="fWorkConnectPersonName" data-type="String"> 
    <label language="zh_CN">工作暂接人</label> 
  </relation>  
  <relation name="fWorkExplain" data-type="String"> 
    <label language="zh_CN">工作安排说明</label> 
  </relation>  
  <relation name="fIsReducHoliday" data-type="Integer"> 
    <label language="zh_CN">是否启用销假</label> 
  </relation>  
  <relation name="fFactStartTime" data-type="Date"> 
    <label language="zh_CN">实际开始时间</label> 
  </relation>  
  <relation name="fFactEndTime" data-type="Date"> 
    <label language="zh_CN">实际结束时间</label> 
  </relation>  
  <relation name="fFactDays" data-type="Integer"> 
    <label language="zh_CN">实际天数</label> 
  </relation>  
  <relation name="fFactHours" data-type="Float"> 
    <label language="zh_CN">实际小时数</label> 
  </relation>  
  <relation name="fSFKX" data-type="Integer"> 
    <label language="zh_CN">是否扣薪</label> 
  </relation>   
  <relation name="fCancelHolsDeptName" data-type="String"> 
    <label language="zh_CN">确认部门</label> 
  </relation>  
  <relation name="fCancelHolsPersonName" data-type="String"> 
    <label language="zh_CN">确认人</label> 
  </relation>  
  <relation name="fCancelHolsDate" data-type="DateTime"> 
    <label language="zh_CN">确认日期</label> 
  </relation>      
  <relation name="fCreatePerID" data-type="String"> 
    <label language="zh_CN">提交人ID</label> 
  </relation>  
  <relation name="fCreatePerName" data-type="String"> 
    <label language="zh_CN">提交人</label> 
  </relation>    
  <relation name="fUpdateDeptID" data-type="String"> 
    <label language="zh_CN">修改部门ID</label> 
  </relation>  
  <relation name="fUpdateDeptName" data-type="String"> 
    <label language="zh_CN">修改部门</label> 
  </relation>  
  <relation name="fUpdatePerID" data-type="String"> 
    <label language="zh_CN">修改人ID</label> 
  </relation>  
  <relation name="fUpdatePerName" data-type="String"> 
    <label language="zh_CN">修改人</label> 
  </relation>   
  <relation name="fLeaveApplyID" data-type="String"> 
    <label language="zh_CN">请假申请处理</label> 
  </relation>       
  <relation name="fProcessState" data-type="String"> 
    <label language="zh_CN">处理状态</label> 
  </relation>  
  <relation name="fProcessStateName" data-type="String"> 
    <label language="zh_CN">处理状态Name</label> 
  </relation>       
  <relation name="fCreateURL" data-type="String"> 
    <label language="zh_CN">提交人员URL</label> 
  </relation>  
  <relation name="fCreateURLName" data-type="String"> 
    <label language="zh_CN">提交人员URL</label> 
  </relation>                           
  <relation name="fmainID" data-type="String"> 
    <label language="zh_CN">请假申请ID</label> 
  </relation>   
  <relation name="fBIZKIND" data-type="String"/>  
  <relation name="fFactTime" data-type="Float"> 
    <label language="zh_CN">实际时长</label> 
  </relation>                                                 
  <concept name="OA_WM_LeaveApplyPC" default-value-expr="guid()"> 
    <has-relation relation="fSIGN"/>  
    <has-relation relation="version" size="10"/>  
    <has-relation relation="fBIZKINDNAME" size="64"/>  
    <has-relation relation="fCREATEURLNAME" size="1024"/>  
    <label language="zh_CN">请假审批意见</label>  
    <has-relation relation="fCREATEPSNFID"> 
      <label language="zh_CN">部门名称</label> 
    </has-relation>  
    <has-relation relation="fMasterID" data-type="OA_WM_LeaveApply"> 
      <label language="zh_CN">主数据ID</label> 
    </has-relation>  
      
    <has-relation relation="fNodeID"> 
      <label language="zh_CN">环节ID</label> 
    </has-relation>  
    <has-relation relation="fNodeName"> 
      <label language="zh_CN">环节名称</label> 
    </has-relation>  
    <has-relation relation="fNODEBIZKIND"> 
      <label language="zh_CN">部门名称</label> 
    </has-relation>  
    <has-relation relation="fTaskID"> 
      <label language="zh_CN">任务ID</label> 
    </has-relation>  
    <has-relation relation="fTASKMSGID"> 
      <label language="zh_CN">部门名称</label> 
    </has-relation>  
    <has-relation relation="fDEPTID"> 
      <label language="zh_CN">部门名称</label> 
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
    <has-relation relation="fDATE"> 
      <label language="zh_CN">部门名称</label> 
    </has-relation>  
    <has-relation relation="fVerdict"> 
      <label language="zh_CN">处理结论</label> 
    </has-relation>  
    <has-relation relation="fOpinion"> 
      <label language="zh_CN">处理意见</label> 
    </has-relation>  
    <has-relation relation="fRemark"> 
      <label language="zh_CN">备注</label> 
    </has-relation>  
    <has-relation relation="fProcessState"> 
      <label language="zh_CN">处理状态</label> 
    </has-relation>  
    <has-relation relation="fProcessStateName"> 
      <label language="zh_CN">处理状态Name</label> 
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
    <has-relation relation="fCreatePerID"> 
      <label language="zh_CN">提交人ID</label> 
    </has-relation>  
    <has-relation relation="fCreatePerName"> 
      <label language="zh_CN">提交人</label> 
    </has-relation>  
    <has-relation relation="fCreateTime"> 
      <label language="zh_CN">提交时间</label> 
    </has-relation>  
    <has-relation relation="fUpdateDeptID"> 
      <label language="zh_CN">修改部门ID</label> 
    </has-relation>  
    <has-relation relation="fUpdateDeptName"> 
      <label language="zh_CN">修改部门</label> 
    </has-relation>  
    <has-relation relation="fUpdatePerID"> 
      <label language="zh_CN">修改人员ID</label> 
    </has-relation>  
    <has-relation relation="fFUPDATEPOSID" data-type="String"> 
      <label language="zh_CN">fupdatePosID</label> 
    </has-relation>  
    <has-relation relation="fUpdatePerName"> 
      <label language="zh_CN">修改人</label> 
    </has-relation>  
    <has-relation relation="fUpdateTime"> 
      <label language="zh_CN">修改时间</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnFID"> 
      <label language="zh_CN">提交人员FullID</label> 
    </has-relation>  
    <has-relation relation="fActivityFName"> 
      <label language="zh_CN">环节路径</label> 
    </has-relation>  
    <has-relation relation="fActivityLabel"> 
      <label language="zh_CN">环节名称</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnID"> 
      <label language="zh_CN">提交人员ID</label> 
    </has-relation>   
    <has-relation relation="fCreateOgnName"> 
      <label language="zh_CN">提交机构</label> 
    </has-relation>  
    <has-relation relation="fCreateOgnID"> 
      <label language="zh_CN">提交机构ID</label> 
    </has-relation>  
    <has-relation relation="fUpdatePsnName"> 
      <label language="zh_CN">修改人员</label> 
    </has-relation>  
    <has-relation relation="fUpdatePsnID"> 
      <label language="zh_CN">修改人员ID</label> 
    </has-relation>  
    <has-relation relation="fStateName"> 
      <label language="zh_CN">处理状态</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnFName"> 
      <label language="zh_CN">提交人员FullName</label> 
    </has-relation>  
    <has-relation relation="fState"> 
      <label language="zh_CN">处理状态编码</label> 
    </has-relation>  
    <has-relation relation="fCreatePosName"> 
      <label language="zh_CN">提交岗位</label> 
    </has-relation> 
  </concept>  
  <relation name="fTASKMSGID" data-type="String"/>  
  <relation name="fDEPTNAME" data-type="String"/>  
  <relation name="fDATE" data-type="DateTime"/>  
  <relation name="fNODEBIZKIND" data-type="String"/>  
  <relation name="fNODENAME" data-type="String"/>  
  <relation name="fPROCESSSTATENAME" data-type="String"/>  
  <relation name="fPOSITIONID" data-type="String"/>  
  <relation name="fBIZKINDNAME" data-type="String"/>  
  <relation name="fCREATEURLNAME" data-type="String"/>  
  <relation name="fUPDATEPOSID" data-type="String"/>  
  <relation name="fPERSONID" data-type="String"/>  
  <relation name="fPROCESSSTATE" data-type="String"/>  
  <relation name="fPERSONNAME" data-type="String"/>  
  <relation name="fSIGN" data-type="Blob"/>  
  <relation name="fNODEID" data-type="String"/>  
  <relation name="fDEPTID" data-type="String"/>  
  <relation name="fFUPDATEPOSID" data-type="String"> 
    <label language="zh_CN">fupdatePosID</label> 
  </relation>  
  <relation name="fCREATEPSNFID" data-type="String"/>   
  <relation name="fCREATEPSNID" data-type="String"> 
    <label language="zh_CN">FCREATEPSNID</label> 
  </relation>   
  <relation name="fTransport" data-type="String"> 
    <label language="zh_CN">交通工具</label> 
  </relation> 
</model>
