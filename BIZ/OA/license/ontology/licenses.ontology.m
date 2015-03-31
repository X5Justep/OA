<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <concept name="OA_LS_LicenseManage" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">证照管理</label>  
    <has-relation relation="fUseStatus" default-value-expr="'Unused'"> 
      <label language="zh_CN">使用状态</label> 
    </has-relation>  
    <has-relation relation="fUseStatusName" default-value-expr="'闲置'"> 
      <label language="zh_CN">使用状态</label> 
    </has-relation>  
    <has-relation relation="fLicenseNo"/>  
    <has-relation relation="fSerialNumber"/>  
    <has-relation relation="fLicenseName"/>  
    <has-relation relation="fReleaseDeptID"/>  
    <has-relation relation="fReleaseDeptName"/>  
    <has-relation relation="fReleaseDate"/>  
    <has-relation relation="fValidityDate"/>  
    <has-relation relation="fExamPeriod"/>  
    <has-relation relation="fExamWebsite"/>  
    <has-relation relation="fNextExamDate"/>  
    <has-relation relation="fExamDeptID"/>  
    <has-relation relation="fExamDeptName"/>  
    <has-relation relation="fExamData" data-type="String"/>  
    <has-relation relation="fWebSoft"/>  
    <has-relation relation="fIsCopy"/>  
    <has-relation relation="fIsCopyName"/>  
    <has-relation relation="fSafekeepDeptID" data-type="String"/>  
    <has-relation relation="fSafekeepDeptName"/>  
    <has-relation relation="fKeeperID"/>  
    <has-relation relation="fKeeperName" data-type="String"/>  
    <has-relation relation="fRemark"/>  
    <has-relation relation="fExamRec" data-type="String"/>  
    <has-relation relation="fOperatorName" default-value-expr="currentPersonName()"/>  
    <has-relation relation="fOperatorID" default-value-expr="currentPersonID()"/>  
    <has-relation relation="fOperateDate" default-value-expr="currentDate()"/>  
    <has-relation relation="fAttachment" data-type="String"/> 
    <has-relation relation="fExtendStr1" data-type="String" size="64"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendStr2" data-type="String" size="64"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendStr3" data-type="String" size="64"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendStr4" data-type="String" size="64"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendStr5" data-type="String" size="64"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendStr6" data-type="String" size="255"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendStr7" data-type="String" size="255"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendStr8" data-type="String" size="255"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendStr9" data-type="String" size="1024"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendDate1" data-type="Date"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendDate2" data-type="Date"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendDate3" data-type="Date"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendDate4" data-type="Date"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendDate5" data-type="Date"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendNum1" data-type="Decimal" size="15" scale="2"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendNum2" data-type="Decimal" size="15" scale="2"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendNum3" data-type="Decimal" size="15" scale="2"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendNum4" data-type="Decimal" size="18" scale="4"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendNum5" data-type="Decimal" size="18" scale="4"><label language="zh_CN">扩展字段</label>
</has-relation>  
  </concept>  
  <concept name="OA_LS_LicenseApplyM" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">证照申请(主表)</label>  
    <has-relation relation="fNO" default-value-expr="nextSeqString(format('ZZSQ-%1$tY%1$tm%1$td', currentDateTime()),'000')"/>  
    <has-relation relation="fRetDate"/>  
    <has-relation relation="fRemark"/>  
    <has-relation relation="fCreateOgnID" default-value-expr="currentOgnID()"/>  
    <has-relation relation="fCreateOgnName" default-value-expr="currentOgnName()"/>  
    <has-relation relation="fCreatePosID" default-value-expr="currentPosID()"/>  
    <has-relation relation="fCreatePosName" default-value-expr="currentPosName()"/>  
    <has-relation relation="fBizState" default-value-expr="'bsEditing'"/>  
    <has-relation relation="fBizStateName" default-value-expr="'编辑中'"/>  
    <has-relation relation="fCreateDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"/>  
    <has-relation relation="fCreateDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"/>  
    <has-relation relation="fCreatePsnID" default-value-expr="currentPersonID()"/>  
    <has-relation relation="fCreatePsnName" default-value-expr="currentPersonName()"/>  
    <has-relation relation="fCreatePsnFID" default-value-expr="currentPersonMemberFID()"/>  
    <has-relation relation="fCreatePsnFName" default-value-expr="currentPersonMemberFName()"/>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fUpdatePsnID" default-value-expr="currentPersonID()"/>  
    <has-relation relation="fUpdatePsnName" default-value-expr="currentPersonName()"/>  
    <has-relation relation="fUpdateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fCurrentActivities"/>  
    <has-relation relation="fCurrentExecutors"/> 
    <has-relation relation="fExtendStr1" data-type="String" size="64"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendStr2" data-type="String" size="64"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendStr3" data-type="String" size="64"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendStr4" data-type="String" size="64"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendStr5" data-type="String" size="64"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendStr6" data-type="String" size="255"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendStr7" data-type="String" size="255"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendStr8" data-type="String" size="255"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendStr9" data-type="String" size="1024"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendDate1" data-type="Date"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendDate2" data-type="Date"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendDate3" data-type="Date"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendDate4" data-type="Date"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendDate5" data-type="Date"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendNum1" data-type="Decimal" size="15" scale="2"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendNum2" data-type="Decimal" size="15" scale="2"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendNum3" data-type="Decimal" size="15" scale="2"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendNum4" data-type="Decimal" size="18" scale="4"><label language="zh_CN">扩展字段</label>
</has-relation>
<has-relation relation="fExtendNum5" data-type="Decimal" size="18" scale="4"><label language="zh_CN">扩展字段</label>
</has-relation>  
  </concept>  
  <concept name="OA_LS_LicenseApplyD" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">证照申请(从表)</label>  
    <has-relation relation="fApplyID" data-type="OA_LS_LicenseApplyM"/>  
    <has-relation relation="fLicenseID"/>  
    <has-relation relation="fLicenseName"/>  
    <has-relation relation="fLicenseNo"/>  
    <has-relation relation="fSerialNumber"/>  
    <has-relation relation="fCrossPer"/>  
    <has-relation relation="fRetDate"/>  
    <has-relation relation="fUseStatus"> 
      <label language="zh_CN">使用状态</label> 
    </has-relation>  
    <has-relation relation="fUseStatusName"> 
      <label language="zh_CN">使用状态</label> 
    </has-relation> 
  </concept>  
  <concept name="OA_LS_ApplyExecute" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">证照申请(处理表)</label>  
    <has-relation relation="fMasterID" data-type="OA_LS_LicenseApplyM"/>  
    <has-relation relation="fTaskID"/>  
    <has-relation relation="fActivityFName"/>  
    <has-relation relation="fActivityLabel"/>  
    <has-relation relation="fOpinion"/>  
    <has-relation relation="fVerdict"/>  
    <has-relation relation="fState"/>  
    <has-relation relation="fStateName"/>  
    <has-relation relation="fCreateOgnID"/>  
    <has-relation relation="fCreateOgnName"/>  
    <has-relation relation="fCreateDeptID"/>  
    <has-relation relation="fCreateDeptName"/>  
    <has-relation relation="fCreatePosID"/>  
    <has-relation relation="fCreatePosName"/>  
    <has-relation relation="fCreatePsnID"/>  
    <has-relation relation="fCreatePsnName"/>  
    <has-relation relation="fCreatePsnFID"/>  
    <has-relation relation="fCreatePsnFName"/>  
    <has-relation relation="fCreateTime"/>  
    <has-relation relation="fUpdatePsnID"/>  
    <has-relation relation="fUpdatePsnName"/>  
    <has-relation relation="fUpdateTime"/> 
  </concept>  
  <concept name="OA_LS_LicenseView" default-value-expr="guid()"> 
    <label language="zh_CN">证照申请视图</label>  
    <has-relation relation="fApplyID"/>  
    <has-relation relation="fNO"/>  
    <has-relation relation="fBizState"/>  
    <has-relation relation="fBizStateName"/>  
    <has-relation relation="fRemark"/>  
    <has-relation relation="fCrossPer"/>  
    <has-relation relation="fRetDate"/>  
    <has-relation relation="fLicenseNo"/>  
    <has-relation relation="fSerialNumber"/>  
    <has-relation relation="fCreateDeptID"/>  
    <has-relation relation="fCreateDeptName"/>  
    <has-relation relation="fCreatePosID"/>  
    <has-relation relation="fCreatePosName"/>  
    <has-relation relation="fCreatePsnID"/>  
    <has-relation relation="fCreatePsnName"/>  
    <has-relation relation="fCreateTime"/>  
    <has-relation relation="fLicenseID"/>  
    <has-relation relation="fInfoID"/>  
    <has-relation relation="fLicenseName"/>  
    <has-relation relation="fUseStatus"> 
      <label language="zh_CN">使用状态</label> 
    </has-relation>  
    <has-relation relation="fUseStatusName"> 
      <label language="zh_CN">使用状态</label> 
    </has-relation>  
    <has-relation relation="fApplyDStatus"/>  
    <has-relation relation="fApplyDStatusName"/> 
  </concept>  
  <relation name="fLicenseName" data-type="String" single-valued="true"> 
    <label language="zh_CN">证照名称</label> 
  </relation>  
  <relation name="fLicenseNo" data-type="String" single-valued="true"> 
    <label language="zh_CN">证照号</label> 
  </relation>  
  <relation name="fSerialNumber" data-type="String" single-valued="true"> 
    <label language="zh_CN">编号</label> 
  </relation>  
  <relation name="fIsCopy" data-type="String" single-valued="true"> 
    <label language="zh_CN">正副本标识</label> 
  </relation>  
  <relation name="fReleaseDate" data-type="Date" single-valued="true"> 
    <label language="zh_CN">颁发日期</label> 
  </relation>  
  <relation name="fValidityDate" data-type="Date" single-valued="true"> 
    <label language="zh_CN">有效期</label> 
  </relation>  
  <relation name="fSafekeepDeptID" data-type="String" single-valued="true"> 
    <label language="zh_CN">保管部门ID</label> 
  </relation>  
  <relation name="fKeeperName" data-type="String" single-valued="true"> 
    <label language="zh_CN">保管人名称</label> 
  </relation>  
  <relation name="fExamDeptName" data-type="String" single-valued="true"> 
    <label language="zh_CN">年检部门</label> 
  </relation>  
  <relation name="fExamPeriod" data-type="String" single-valued="true"> 
    <label language="zh_CN">年检周期</label> 
  </relation>  
  <relation name="fNextExamDate" data-type="Date" single-valued="true"> 
    <label language="zh_CN">下次年检时间</label> 
  </relation>  
  <relation name="fExamWebsite" data-type="String" single-valued="true"> 
    <label language="zh_CN">年检网址</label> 
  </relation>  
  <relation name="fWebSoft" data-type="String" single-valued="true"> 
    <label language="zh_CN">网上填报系统</label> 
  </relation>  
  <relation name="fExamData" data-type="String" single-valued="true"> 
    <label language="zh_CN">年检材料</label> 
  </relation>  
  <relation name="fOperatorName" data-type="String" single-valued="true"> 
    <label language="zh_CN">录入人</label> 
  </relation>  
  <relation name="fOperateDate" data-type="Date" single-valued="true"> 
    <label language="zh_CN">录入日期</label> 
  </relation>  
  <relation name="fExamRec" data-type="Text" single-valued="true"> 
    <label language="zh_CN">年检记录</label> 
  </relation>  
  <relation name="fApplyID" data-type="String" single-valued="true"> 
    <label language="zh_CN">申请单ID</label> 
  </relation>  
  <relation name="fLicenseID" data-type="String" single-valued="true"> 
    <label language="zh_CN">证照ID</label> 
  </relation>  
  <relation name="fCrossPer" data-type="String" single-valued="true"> 
    <label language="zh_CN">经办人</label> 
  </relation>  
  <relation name="fRetDate" data-type="Date" single-valued="true"> 
    <label language="zh_CN">归还时间</label> 
  </relation>  
  <relation name="FRemark" data-type="String" single-valued="true"> 
    <label language="zh_CN">使用说明</label> 
  </relation>  
  <relation name="fExamDeptID" data-type="String" single-valued="true"> 
    <label language="zh_CN">年检部门ID</label> 
  </relation>  
  <relation name="fKeeperID" data-type="String" single-valued="true"> 
    <label language="zh_CN">保管人ID</label> 
  </relation>  
  <relation name="fOperatorID" data-type="String" single-valued="true"> 
    <label language="zh_CN">录入人ID</label> 
  </relation>  
  <relation name="fIsCopyName" data-type="String" single-valued="true"> 
    <label language="zh_CN">正副本标示名称</label> 
  </relation>  
  <relation name="fSafekeepDeptName" data-type="String" single-valued="true"> 
    <label language="zh_CN">保管部门名称</label> 
  </relation>  
  <relation name="fInfoID" data-type="String" single-valued="true"> 
    <label language="zh_CN">证照编号</label> 
  </relation>  
  <relation name="fApplyDStatus" data-type="String" single-valued="true"> 
    <label language="zh_CN">申请明细状态</label> 
  </relation>  
  <relation name="fApplyDStatusName" data-type="String" single-valued="true"> 
    <label language="zh_CN">申请明细状态名称</label> 
  </relation>  
  <relation name="fAttachment" data-type="String" single-valued="true"> 
    <label language="zh_CN">附件</label> 
  </relation> 
</model>
