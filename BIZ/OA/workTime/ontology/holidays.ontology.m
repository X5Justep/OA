<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <concept name="OA_WM_Vacation" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">年假</label>  
    <has-relation relation="fPersonID" size="36"> 
      <label language="zh_CN">人员ID</label> 
    </has-relation>  
    <has-relation relation="fPersonName" size="64"> 
      <label language="zh_CN">人员</label> 
    </has-relation>  
    <has-relation relation="fDeptID" size="36"> 
      <label language="zh_CN">部门ID</label> 
    </has-relation>  
    <has-relation relation="fYear"> 
      <label language="zh_CN">年度</label> 
    </has-relation>  
    <has-relation relation="fLeaveTypeName" size="64"> 
      <label language="zh_CN">类型</label> 
    </has-relation>  
    <has-relation relation="fLeaveTypeID" size="36"> 
      <label language="zh_CN">类型</label> 
    </has-relation>  
    <has-relation relation="fRemark" size="1024"> 
      <label language="zh_CN">备注</label> 
    </has-relation>  
    <has-relation relation="fPersonCode" data-type="String" size="36"> 
      <label language="zh_CN">人员编码</label> 
    </has-relation>  
    <has-relation relation="fEffectiveDate"> 
      <label language="zh_CN">生效日期</label> 
    </has-relation>  
    <has-relation relation="fExpiryDate"> 
      <label language="zh_CN">失效日期</label> 
    </has-relation>  
    <has-relation relation="fHoliday" data-type="Integer"> 
      <label language="zh_CN">当年可休天数</label> 
    </has-relation>  
    <has-relation relation="fLeavingsDay" data-type="Integer" default-value-expr="0"> 
      <label language="zh_CN">剩余休假天数</label> 
    </has-relation>  
    <has-relation relation="fJoinInWork" data-type="Date"> 
      <label language="zh_CN">参加工作日期</label> 
    </has-relation>  
    <has-relation relation="fLeavingsHour" data-type="Float" default-value-expr="0"> 
      <label language="zh_CN">剩余休假小时</label> 
    </has-relation>  
    <has-relation relation="fAlreadyDay" data-type="Integer"> 
      <label language="zh_CN">已经休假天数</label> 
    </has-relation>  
    <has-relation relation="fAlreadyHour" data-type="Float"> 
      <label language="zh_CN">已经休假小时</label> 
    </has-relation> 
  </concept>  
  <relation name="fHoliday" data-type="String"> 
    <label language="zh_CN">当年可休天数</label> 
  </relation>  
  <relation name="fLeavingsDay" data-type="String"> 
    <label language="zh_CN">剩余休假天数</label> 
  </relation>  
  <relation name="fEffectiveDate" data-type="Date"> 
    <label language="zh_CN">生效日期</label> 
  </relation>  
  <relation name="fExpiryDate" data-type="Date"> 
    <label language="zh_CN">失效日期</label> 
  </relation>  
  <relation name="fFID" data-type="String"> 
    <label language="zh_CN">全路径</label> 
  </relation>  
  <concept name="OA_WM_Holiday" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">节假日设定</label>  
    <has-relation relation="fName" size="64"> 
      <label language="zh_CN">名称</label> 
    </has-relation>  
    <has-relation relation="fBrefExplain" size="225"> 
      <label language="zh_CN">简要说明</label> 
    </has-relation>  
    <has-relation relation="fState" size="36"> 
      <label language="zh_CN">状态编码</label> 
    </has-relation>  
    <has-relation relation="fStateName" size="64"> 
      <label language="zh_CN">状态</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnName" size="64" default-value-expr="currentPersonName()"> 
      <label language="zh_CN">提交人员</label> 
    </has-relation>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"> 
      <label language="zh_CN">提交时间</label> 
    </has-relation>  
    <has-relation relation="fLeaveTypeName" size="64"> 
      <label language="zh_CN">类型</label> 
    </has-relation>  
    <has-relation relation="fLeaveTypeID" size="36"> 
      <label language="zh_CN">类型</label> 
    </has-relation>  
    <has-relation relation="fDate" data-type="Date"> 
      <label language="zh_CN">日期</label> 
    </has-relation>  
    <has-relation relation="fMultiple" data-type="Integer"> 
      <label language="zh_CN">倍数</label> 
    </has-relation>  
    <has-relation relation="fYear"> 
      <label language="zh_CN">年度</label> 
    </has-relation> 
  </concept>  
  <relation name="fJoinInWork" data-type="Date"> 
    <label language="zh_CN">参加工作日期</label> 
  </relation>  
  <relation name="fLeavingsHour" data-type="String"> 
    <label language="zh_CN">剩余休假小时</label> 
  </relation>  
  <relation name="fMultiple" data-type="String"> 
    <label language="zh_CN">倍数</label> 
  </relation>  
  <concept name="OA_WM_TimeEnactment" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">上下班时间设定</label>  
    <has-relation relation="fYear"> 
      <label language="zh_CN">年</label> 
    </has-relation>  
    <has-relation relation="fSemiAnnual" data-type="String" size="64"> 
      <label language="zh_CN">半年度</label> 
    </has-relation>  
    <has-relation relation="fSemiAnnualID" data-type="String" size="36"> 
      <label language="zh_CN">半年度</label> 
    </has-relation>  
    <has-relation relation="fMorningBeginDate" data-type="String" size="36" default-value-expr="'00:00'"> 
      <label language="zh_CN">上午开始时间</label> 
    </has-relation>  
    <has-relation relation="fMorningendDate" data-type="String" size="36" default-value-expr="'00:00'"> 
      <label language="zh_CN">上午结束时间</label> 
    </has-relation>  
    <has-relation relation="fAfternoonBeginDate" data-type="String" size="36" default-value-expr="'00:00'"> 
      <label language="zh_CN">下午开始时间</label> 
    </has-relation>  
    <has-relation relation="fAfternoonendDate" data-type="String" size="36" default-value-expr="'00:00'"> 
      <label language="zh_CN">下午结束时间</label> 
    </has-relation> 
  </concept>  
  <relation name="fMorningBeginDate" data-type="DateTime"> 
    <label language="zh_CN">上午开始时间</label> 
  </relation>  
  <relation name="fMorningendDate" data-type="DateTime"> 
    <label language="zh_CN">上午结束时间</label> 
  </relation>  
  <relation name="fAfternoonBeginDate" data-type="DateTime"> 
    <label language="zh_CN">下午开始时间</label> 
  </relation>  
  <relation name="fAfternoonendDate" data-type="DateTime"> 
    <label language="zh_CN">下午结束时间</label> 
  </relation>  
  <relation name="fSemiAnnual" data-type="String"> 
    <label language="zh_CN">半年度</label> 
  </relation>  
  <relation name="fSemiAnnualID" data-type="String"> 
    <label language="zh_CN">半年度</label> 
  </relation>  
  <relation name="fAlreadyDay" data-type="Integer"> 
    <label language="zh_CN">已经休假天数</label> 
  </relation>  
  <relation name="fAlreadyHour" data-type="Float"> 
    <label language="zh_CN">已经休假小时</label> 
  </relation> 
</model>
