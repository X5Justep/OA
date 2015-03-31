<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <concept name="OA_WM_LeaveType" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">请假类型</label>  
    <has-relation relation="fTypeCode" data-type="String" size="64"> 
      <label language="zh_CN">类型编码</label> 
    </has-relation>  
    <has-relation relation="fTypeName" data-type="String" size="64"> 
      <label language="zh_CN">类型名称</label> 
    </has-relation>  
    <has-relation relation="fIsSalary" data-type="Integer" default-value-expr="1"> 
      <label language="zh_CN">是否扣薪</label> 
    </has-relation>  
    <has-relation relation="fSalaryRule" data-type="String" size="64"> 
      <label language="zh_CN">扣薪规则</label> 
    </has-relation>  
    <has-relation relation="fIsReducHoliday" data-type="Integer"> 
      <label language="zh_CN">是否启用销假</label> 
    </has-relation>  
    <has-relation relation="fUseStatus" data-type="Integer" default-value-expr="0"> 
      <label language="zh_CN">启用标识</label> 
    </has-relation>  
    <has-relation relation="fUseStatusName" data-type="String" default-value-expr="'未启用'"
      size="64"> 
      <label language="zh_CN">启用标识名称</label> 
    </has-relation>  
    <has-relation relation="fCreatePerID" data-type="SA_OPPerson" default-value-expr="currentPersonID()"
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
    <has-relation relation="fRemark" data-type="String" size="1024"> 
      <label language="zh_CN">备注</label> 
    </has-relation>  
    <has-relation relation="fSequence" data-type="Integer"> 
      <label language="zh_CN">序号</label> 
    </has-relation>  
    <has-relation relation="fUseTime">
      <label language="zh_CN">启用时间</label> 
    </has-relation>  
    <has-relation relation="fStopTime">
      <label language="zh_CN">停用时间</label> 
    </has-relation> 
  </concept>  
  <relation name="fTypeCode" data-type="String"> 
    <label language="zh_CN">类型编码</label> 
  </relation>  
  <relation name="fTypeName" data-type="String"> 
    <label language="zh_CN">类型名称</label> 
  </relation>  
  <relation name="fIsSalary" data-type="Integer"> 
    <label language="zh_CN">是否扣薪</label> 
  </relation>  
  <relation name="fSalaryRule" data-type="String"> 
    <label language="zh_CN">扣薪规则</label> 
  </relation> 
</model>
