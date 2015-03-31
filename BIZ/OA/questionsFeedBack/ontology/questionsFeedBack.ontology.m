<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <concept name="OA_QB_QuestionsFeedBack" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">问题反馈</label>  
    <has-relation relation="fNO" default-value-expr="nextSeqString(format('%s%s','WTFK-',format('%1$tY%1$tm%1$td', currentDateTime())),'000')"
      size="64"> 
      <label language="zh_CN">单据号</label> 
    </has-relation>  
    <has-relation relation="fQuestions" data-type="Text"> 
      <label language="zh_CN">问题</label> 
    </has-relation>  
    <has-relation relation="fProjectName" data-type="String" size="64"> 
      <label language="zh_CN">项目名称</label> 
    </has-relation>  
    <has-relation relation="fQuestionsTypeID" data-type="String" size="32"> 
      <label language="zh_CN">问题分类</label> 
    </has-relation>  
    <has-relation relation="fQuestionsType" data-type="String" size="64"> 
      <label language="zh_CN">问题分类</label> 
    </has-relation>  
    <has-relation relation="fFunModule" data-type="String" size="64"> 
      <label language="zh_CN">功能模块</label> 
    </has-relation>  
    <has-relation relation="fRequestTime" data-type="DateTime"> 
      <label language="zh_CN">希望完成时间</label> 
    </has-relation>  
    <has-relation relation="fWorkTime" data-type="Decimal" size="8" scale="2"> 
      <label language="zh_CN">工作量</label> 
    </has-relation>  
    <has-relation relation="fQuestionsAttch" data-type="Text"> 
      <label language="zh_CN">问题附件</label> 
    </has-relation>  
    <has-relation relation="fApplyPsnID" size="32" default-value-expr="operatorID()"> 
      <label language="zh_CN">申请人员ID</label> 
    </has-relation>  
    <has-relation relation="fApplyPsnName" size="64" default-value-expr="operatorName()"> 
      <label language="zh_CN">申请人员</label> 
    </has-relation>  
    <has-relation relation="fApplyPsnFID" size="512" default-value-expr="currentPersonMemberFID()"> 
      <label language="zh_CN">申请人员FullID</label> 
    </has-relation>  
    <has-relation relation="fApplyPsnFName" size="1024" default-value-expr="currentPersonMemberFName()"> 
      <label language="zh_CN">申请人员FullName</label> 
    </has-relation>  
    <has-relation relation="fApplyTime" data-type="Date" default-value-expr="currentDate()"> 
      <label language="zh_CN">申请日期</label> 
    </has-relation>  
    <has-relation relation="fAuditPsnID" data-type="String" size="32"> 
      <label language="zh_CN">审核人ID</label> 
    </has-relation>  
    <has-relation relation="fAuditPsnName" data-type="String" size="64"> 
      <label language="zh_CN">审核人</label> 
    </has-relation>  
    <has-relation relation="fIsAuditBy" data-type="Integer" default-value-expr="0"> 
      <label language="zh_CN">是否审核通过</label> 
    </has-relation>  
    <has-relation relation="fSolutions" data-type="Text"> 
      <label language="zh_CN">解决情况</label> 
    </has-relation>  
    <has-relation relation="fBeginTime"> 
      <label language="zh_CN">开始时间</label> 
    </has-relation>  
    <has-relation relation="fExpectedTime" data-type="DateTime"> 
      <label language="zh_CN">完成时间</label> 
    </has-relation>  
    <has-relation relation="fDealStatus" data-type="Integer" default-value-expr="0"> 
      <label language="zh_CN">问题处理状态</label> 
    </has-relation>  
    <has-relation relation="fDealStatusName" data-type="String" default-value-expr="'未处理'"
      size="32"> 
      <label language="zh_CN">问题处理状态</label> 
    </has-relation>  
    <has-relation relation="fRemark" data-type="Text"> 
      <label language="zh_CN">备注</label> 
    </has-relation>  
    <has-relation relation="fActualTime" data-type="DateTime"> 
      <label language="zh_CN">实际完成时间</label> 
    </has-relation>  
    <has-relation relation="fFinishStatus" data-type="Integer" default-value-expr="0"> 
      <label language="zh_CN">完成状态</label> 
    </has-relation>  
    <has-relation relation="fFinishStatusName" data-type="String" size="32" default-value-expr="'未完成'"> 
      <label language="zh_CN">完成状态</label> 
    </has-relation>  
    <has-relation relation="fEnsurePsnID" data-type="String" size="32"> 
      <label language="zh_CN">确认人</label> 
    </has-relation>  
    <has-relation relation="fEnsurePsnName" data-type="String" size="64"> 
      <label language="zh_CN">确认人</label> 
    </has-relation>  
    <has-relation relation="fEnsureTime" data-type="DateTime">
      <label language="zh_CN">确认时间</label> 
    </has-relation>  
    <has-relation relation="fBizState" default-value-expr="'bsEditing'" size="32"> 
      <label language="zh_CN">业务流程状态编码</label> 
    </has-relation>  
    <has-relation relation="fBizStateName" size="32" default-value-expr="'编辑中'"> 
      <label language="zh_CN">业务流程状态</label> 
    </has-relation>  
    <has-relation relation="fCurrentActivities" size="128"> 
      <label language="zh_CN">当前环节</label> 
    </has-relation>  
    <has-relation relation="fCurrentExecutors" size="128"> 
      <label language="zh_CN">当前执行者</label> 
    </has-relation>  
    <has-relation relation="fCreateOgnID" size="32" default-value-expr="currentOgnID()"> 
      <label language="zh_CN">提交机构ID</label> 
    </has-relation>  
    <has-relation relation="fCreateOgnName" size="64" default-value-expr="currentOgnName()"> 
      <label language="zh_CN">提交机构</label> 
    </has-relation>  
    <has-relation relation="fCreateDeptID" size="32" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"> 
      <label language="zh_CN">提交部门ID</label> 
    </has-relation>  
    <has-relation relation="fCreateDeptName" size="64" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"> 
      <label language="zh_CN">提交部门</label> 
    </has-relation>  
    <has-relation relation="fCreatePosID" size="32" default-value-expr="currentPosID()"> 
      <label language="zh_CN">提交岗位ID</label> 
    </has-relation>  
    <has-relation relation="fCreatePosName" size="64" default-value-expr="currentPosName()"> 
      <label language="zh_CN">提交岗位</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnID" size="32" default-value-expr="operatorID()"> 
      <label language="zh_CN">提交人员ID</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnName" size="64" default-value-expr="operatorName()"> 
      <label language="zh_CN">提交人员</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnFID" size="512" default-value-expr="currentPersonMemberFID()"> 
      <label language="zh_CN">提交人员FullID</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnFName" size="1024" default-value-expr="currentPersonMemberFName()"> 
      <label language="zh_CN">提交人员FullName</label> 
    </has-relation>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"> 
      <label language="zh_CN">提交时间</label> 
    </has-relation>  
    <has-relation relation="fUpdatePsnID" size="32" default-value-expr="operatorID()"> 
      <label language="zh_CN">修改人员ID</label> 
    </has-relation>  
    <has-relation relation="fUpdatePsnName" size="64" default-value-expr="operatorName()"> 
      <label language="zh_CN">修改人员</label> 
    </has-relation>  
    <has-relation relation="fUpdateTime" default-value-expr="currentDateTime()"> 
      <label language="zh_CN">修改时间</label> 
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
  <relation name="fQuestions" data-type="Text"> 
    <label language="zh_CN">问题</label> 
  </relation>  
  <relation name="fProjectID" data-type="String"> 
    <label language="zh_CN">项目ID</label> 
  </relation>  
  <relation name="fProjectName" data-type="String"> 
    <label language="zh_CN">项目名称</label> 
  </relation>  
  <relation name="fQuestionsType" data-type="String"> 
    <label language="zh_CN">问题分类</label> 
  </relation>  
  <relation name="fFunModule" data-type="String"> 
    <label language="zh_CN">功能模块</label> 
  </relation>  
  <relation name="fRequestTime" data-type="DateTime"> 
    <label language="zh_CN">希望完成时间</label> 
  </relation>  
  <relation name="fQuestionsAttch" data-type="Text"> 
    <label language="zh_CN">问题附件</label> 
  </relation>  
  <relation name="fApplyTime" data-type="DateTime"> 
    <label language="zh_CN">申请时间</label> 
  </relation>  
  <relation name="fAuditPsnID" data-type="String"> 
    <label language="zh_CN">审核人ID</label> 
  </relation>  
  <relation name="fAuditPsnName" data-type="String"> 
    <label language="zh_CN">审核人</label> 
  </relation>  
  <relation name="fIsAuditBy" data-type="Integer"> 
    <label language="zh_CN">是否审核通过</label> 
  </relation>  
  <relation name="fSolutions" data-type="Text"> 
    <label language="zh_CN">解决方案</label> 
  </relation>  
  <relation name="fExpectedTime" data-type="DateTime"> 
    <label language="zh_CN">预计完成时间</label> 
  </relation>  
  <relation name="fActualTime" data-type="DateTime"> 
    <label language="zh_CN">实际完成时间</label> 
  </relation>  
  <relation name="fDealStatus" data-type="Integer"> 
    <label language="zh_CN">问题处理状态</label> 
  </relation>  
  <relation name="fDealStatusName" data-type="String"> 
    <label language="zh_CN">问题处理状态</label> 
  </relation>  
  <relation name="fResultAttach" data-type="Text"> 
    <label language="zh_CN">处理相关附件</label> 
  </relation>  
  <relation name="fWorkTime" data-type="Decimal"> 
    <label language="zh_CN">工作量</label> 
  </relation>  
  <concept name="OA_QB_Modules" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">项目功能模块维护</label>  
    <has-relation relation="fProjectName" size="64"> 
      <label language="zh_CN">项目名称</label> 
    </has-relation>  
    <has-relation relation="fModuleName" data-type="String" size="64"> 
      <label language="zh_CN">模块名称</label> 
    </has-relation>  
    <has-relation relation="fDutyPsnName" data-type="String" size="64"> 
      <label language="zh_CN">责任人</label> 
    </has-relation>  
    <has-relation relation="fCreateOgnID" size="32" default-value-expr="currentOgnID()"> 
      <label language="zh_CN">提交机构ID</label> 
    </has-relation>  
    <has-relation relation="fCreateOgnName" size="64" default-value-expr="currentOgnName()"> 
      <label language="zh_CN">提交机构</label> 
    </has-relation>  
    <has-relation relation="fCreateDeptID" size="32" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"> 
      <label language="zh_CN">提交部门ID</label> 
    </has-relation>  
    <has-relation relation="fCreateDeptName" size="64" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"> 
      <label language="zh_CN">提交部门</label> 
    </has-relation>  
    <has-relation relation="fCreatePosID" size="32" default-value-expr="currentPosID()"> 
      <label language="zh_CN">提交岗位ID</label> 
    </has-relation>  
    <has-relation relation="fCreatePosName" size="64" default-value-expr="currentPosName()"> 
      <label language="zh_CN">提交岗位</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnID" size="32" default-value-expr="operatorID()"> 
      <label language="zh_CN">提交人员ID</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnName" size="64" default-value-expr="operatorName()"> 
      <label language="zh_CN">提交人员</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnFID" size="512" default-value-expr="currentPersonMemberFID()"> 
      <label language="zh_CN">提交人员FullID</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnFName" size="1024" default-value-expr="currentPersonMemberFName()"> 
      <label language="zh_CN">提交人员FullName</label> 
    </has-relation>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"> 
      <label language="zh_CN">提交时间</label> 
    </has-relation> 
  </concept>  
  <concept name="OA_QB_Execute" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">处理表</label>  
    <has-relation relation="fMasterID" data-type="OA_QB_QuestionsFeedBack" size="32"/>  
    <has-relation relation="fTaskID" size="32"/>  
    <has-relation relation="fActivityFName" size="512"/>  
    <has-relation relation="fActivityLabel" size="64"/>  
    <has-relation relation="fOpinion" data-type="String"/>  
    <has-relation relation="fVerdict" size="36"/>  
    <has-relation relation="fState" size="36"/>  
    <has-relation relation="fStateName" size="64"/>  
    <has-relation relation="fCreateOgnID" size="32"/>  
    <has-relation relation="fCreateOgnName" size="64"/>  
    <has-relation relation="fCreateDeptID" size="32"/>  
    <has-relation relation="fCreateDeptName" size="64"/>  
    <has-relation relation="fCreatePosID" size="32"/>  
    <has-relation relation="fCreatePosName" size="64"/>  
    <has-relation relation="fCreatePsnID" size="32"/>  
    <has-relation relation="fCreatePsnName" size="128"/>  
    <has-relation relation="fCreatePsnFID" size="512"/>  
    <has-relation relation="fCreatePsnFName" size="1024"/>  
    <has-relation relation="fCreateTime"/>  
    <has-relation relation="fUpdatePsnID" size="32"/>  
    <has-relation relation="fUpdatePsnName" size="128"/>  
    <has-relation relation="fUpdateTime"/> 
  </concept>  
  <relation name="fModuleName" data-type="String"> 
    <label language="zh_CN">模块名称</label> 
  </relation>  
  <relation name="fDutyPsnName" data-type="String"> 
    <label language="zh_CN">责任人</label> 
  </relation>  
  <relation name="fQuestionsTypeID" data-type="String"> 
    <label language="zh_CN">问题分类</label> 
  </relation>  
    
  <relation name="fFinishStatus" data-type="Integer"> 
    <label language="zh_CN">完成状态</label> 
  </relation>  
  <relation name="fFinishStatusName" data-type="String"> 
    <label language="zh_CN">完成状态</label> 
  </relation>  
  <relation name="fEnsurePsnID" data-type="String"> 
    <label language="zh_CN">确认人</label> 
  </relation>  
  <relation name="fEnsurePsnName" data-type="String"> 
    <label language="zh_CN">确认人</label> 
  </relation>  
  <relation name="fEnsureTime" data-type="DateTime">
    <label language="zh_CN">确认时间</label> 
  </relation> 
</model>
