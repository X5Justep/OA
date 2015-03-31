<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <concept name="OA_WM_OvertimeApply" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">加班申请</label>  
    <has-relation relation="fNO" default-value-expr="nextSeqString(format('%s%s','JBSQ-',format('%1$tY%1$tm%1$td', currentDateTime())),'000')"
      size="36"> 
      <label language="zh_CN">单据号</label> 
    </has-relation>  
    <has-relation relation="fApplyPersonID" default-value-expr="currentPersonID()" size="36"> 
      <label language="zh_CN">申请人</label> 
    </has-relation>  
    <has-relation relation="fApplyPersonName" default-value-expr="currentPersonName()"
      size="64"> 
      <label language="zh_CN">申请人</label> 
    </has-relation>  
    <has-relation relation="fApplyDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"
      size="36"> 
      <label language="zh_CN">申请部门</label> 
    </has-relation>  
    <has-relation relation="fApplyDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"
      size="64"> 
      <label language="zh_CN">申请部门</label> 
    </has-relation>  
    <has-relation relation="fApplyDate" data-type="DateTime" default-value-expr="currentDateTime()"> 
      <label language="zh_CN">申请日期</label> 
    </has-relation>  
    <has-relation relation="fSTARTTIME" data-type="DateTime"> 
      <label language="zh_CN">开始时间</label> 
    </has-relation>  
    <has-relation relation="fENDTIME"> 
      <label language="zh_CN">结束时间</label> 
    </has-relation>  
    <has-relation relation="fDAYS" data-type="Integer"> 
      <label language="zh_CN">申请天数</label> 
    </has-relation>  
    <has-relation relation="fHOURS" data-type="Integer"> 
      <label language="zh_CN">申请小时</label> 
    </has-relation>  
    <has-relation relation="fTIME"> 
      <label language="zh_CN">申请时长</label> 
    </has-relation>  
    <has-relation relation="fREASON" size="1024"> 
      <label language="zh_CN">加班事由</label> 
    </has-relation>  
    <has-relation relation="fType" default-value-expr="'kqOverApply'" size="64"> 
      <label language="zh_CN">鉴别列</label> 
    </has-relation>  
    <has-relation relation="fBizState" default-value-expr="'bsEditing'" size="36"> 
      <label language="zh_CN">流程状态</label> 
    </has-relation>  
    <has-relation relation="fBizStateName" default-value-expr="'编辑中'" size="64"> 
      <label language="zh_CN">流程状态名称</label> 
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
    <has-relation relation="fCurrentActivities" size="36"> 
      <label language="zh_CN">当前环节</label> 
    </has-relation>  
    <has-relation relation="fCurrentExecutors" size="64"> 
      <label language="zh_CN">当前执行者</label> 
    </has-relation> 
  </concept>  
  <concept name="OA_overtime_EXECUTE" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">加班申请处理</label>  
    <has-relation relation="fMasterID" data-type="OA_WM_OvertimeApply"> 
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
</model>
