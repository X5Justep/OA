<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <concept name="OA_BG_ApplyM" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">预算计划申请(主表)</label>  
    <has-relation relation="fBizState" size="64" default-value-expr="'bsEditing'"/>  
    <has-relation relation="fBizStateName" size="64" default-value-expr="'编辑中'"/>  
    <has-relation relation="fCostCenterID" size="36"/>  
    <has-relation relation="fCostCenterCode" size="128"/>  
    <has-relation relation="fCostCenterName" size="128"/>  
    <has-relation relation="fYear"/>  
    <has-relation relation="fRemark" size="512"/>  
    <has-relation relation="fCreateOgnID" default-value-expr="currentOgnID()" size="36"/>  
    <has-relation relation="fCreateOgnName" default-value-expr="currentOgnName()" size="64"/>  
    <has-relation relation="fCreateDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"
      size="36"/>  
    <has-relation relation="fCreateDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"
      size="64"/>  
    <has-relation relation="fCreatePosID" default-value-expr="currentPosID()"/>  
    <has-relation relation="fCreatePosName" default-value-expr="currentPosName()"/>  
    <has-relation relation="fCreatePsnID" default-value-expr="operatorID()" size="36"/>  
    <has-relation relation="fCreatePsnName" default-value-expr="operatorName()" size="64"/>  
    <has-relation relation="fCreatePsnFID" default-value-expr="currentPersonMemberFID()"
      size="512"/>  
    <has-relation relation="fCreatePsnFName" default-value-expr="currentPersonMemberFName()"
      size="512"/>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fUpdatePsnID" default-value-expr="operatorID()" size="36"/>  
    <has-relation relation="fUpdatePsnName" default-value-expr="operatorName()" size="64"/>  
    <has-relation relation="fUpdateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fCurrentActivities"/>  
    <has-relation relation="fCurrentExecutors"/>  
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
  <concept name="OA_BG_ApplyD" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">预算计划申请(子表)</label>  
    <has-relation relation="fAccountID" size="32"/>  
    <has-relation relation="fAccountCode" size="128"/>  
    <has-relation relation="fAccountName" size="128"/>  
    <has-relation relation="fBGApplyID" data-type="OA_BG_ApplyM" size="32"/>  
    <has-relation relation="fPlan1" default-value-expr="0.0"/>  
    <has-relation relation="fPlan2" default-value-expr="0.0"/>  
    <has-relation relation="fPlan3" default-value-expr="0.0"/>  
    <has-relation relation="fPlan4" default-value-expr="0.0"/>  
    <has-relation relation="fPlan5" default-value-expr="0.0"/>  
    <has-relation relation="fPlan6" default-value-expr="0.0"/>  
    <has-relation relation="fPlan7" default-value-expr="0.0"/>  
    <has-relation relation="fPlan8" default-value-expr="0.0"/>  
    <has-relation relation="fPlan9" default-value-expr="0.0"/>  
    <has-relation relation="fPlan10" default-value-expr="0.0"/>  
    <has-relation relation="fPlan11" default-value-expr="0.0"/>  
    <has-relation relation="fPlan12" default-value-expr="0.0"/>  
    <has-relation relation="fPlanall" default-value-expr="0.0"/> 
  </concept>  
  <concept name="OA_BG_ApplyExecute" default-value-expr="guid()"> 
    <has-relation relation="fMasterID" data-type="OA_BG_ApplyM"/>  
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
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">预算计划申请(处理表)</label> 
  </concept>  
  <concept name="OA_BG_BadgutM" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">预算(主表)</label>  
    <has-relation relation="fCostCenterID" size="32"/>  
    <has-relation relation="fCostCenterCode" size="128"/>  
    <has-relation relation="fCostCenterName" size="128"/>  
    <has-relation relation="fYear"/>  
    <has-relation relation="fRemark" size="512"/>  
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
  <concept name="OA_BG_BadgutD" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">预算(子表)</label>  
    <has-relation relation="fAccountID" size="32"/>  
    <has-relation relation="fAccountCode" size="128"/>  
    <has-relation relation="fAccountName" size="128"/>  
    <has-relation relation="fBGBadgutID" size="32"/>  
    <has-relation relation="fPlan1" default-value-expr="0.0"/>  
    <has-relation relation="fPlan2" default-value-expr="0.0"/>  
    <has-relation relation="fPlan3" default-value-expr="0.0"/>  
    <has-relation relation="fPlan4" default-value-expr="0.0"/>  
    <has-relation relation="fPlan5" default-value-expr="0.0"/>  
    <has-relation relation="fPlan6" default-value-expr="0.0"/>  
    <has-relation relation="fPlan7" default-value-expr="0.0"/>  
    <has-relation relation="fPlan8" default-value-expr="0.0"/>  
    <has-relation relation="fPlan9" default-value-expr="0.0"/>  
    <has-relation relation="fPlan10" default-value-expr="0.0"/>  
    <has-relation relation="fPlan11" default-value-expr="0.0"/>  
    <has-relation relation="fPlan12" default-value-expr="0.0"/>  
    <has-relation relation="fPlanall" default-value-expr="0.0"/>  
    <has-relation relation="fFact1" default-value-expr="0.0"/>  
    <has-relation relation="fFact2" default-value-expr="0.0"/>  
    <has-relation relation="fFact3" default-value-expr="0.0"/>  
    <has-relation relation="fFact4" default-value-expr="0.0"/>  
    <has-relation relation="fFact5" default-value-expr="0.0"/>  
    <has-relation relation="fFact6" default-value-expr="0.0"/>  
    <has-relation relation="fFact7" default-value-expr="0.0"/>  
    <has-relation relation="fFact8" default-value-expr="0.0"/>  
    <has-relation relation="fFact9" default-value-expr="0.0"/>  
    <has-relation relation="fFact10" default-value-expr="0.0"/>  
    <has-relation relation="fFact11" default-value-expr="0.0"/>  
    <has-relation relation="fFact12" default-value-expr="0.0"/>  
    <has-relation relation="fFactall" default-value-expr="0.0"/> 
  <has-relation relation="fYear1" data-type="Decimal"></has-relation>
<has-relation relation="fYear2" data-type="Decimal"></has-relation>
<has-relation relation="fYear3" data-type="Decimal"></has-relation>
<has-relation relation="fYear4" data-type="Decimal"></has-relation>
<has-relation relation="fYear5" data-type="Decimal"></has-relation>
<has-relation relation="fYear6" data-type="Decimal"></has-relation>
<has-relation relation="fYear7" data-type="Decimal"></has-relation>
<has-relation relation="fYear8" data-type="Decimal"></has-relation>
<has-relation relation="fYear9" data-type="Decimal"></has-relation>
<has-relation relation="fYear10" data-type="Decimal"></has-relation>
<has-relation relation="fYear11" data-type="Decimal"></has-relation>
<has-relation relation="fYear12" data-type="Decimal"></has-relation>
<has-relation relation="fYearall" data-type="Decimal"></has-relation>
</concept>  
  <concept name="OA_BG_AlterM" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">预算计划变更(主表)</label>  
    <has-relation relation="fBizState" size="64" default-value-expr="'bsEditing'"/>  
    <has-relation relation="fBizStateName" size="64" default-value-expr="'编辑中'"/>  
    <has-relation relation="fCostCenterID" size="32"/>  
    <has-relation relation="fCostCenterCode" size="128"/>  
    <has-relation relation="fCostCenterName" size="128"/>  
    <has-relation relation="fYear"/>  
    <has-relation relation="fRemark" size="512"/>  
    <has-relation relation="fCreateOgnID" default-value-expr="currentOgnID()" size="36"/>  
    <has-relation relation="fCreateOgnName" default-value-expr="currentOgnName()" size="64"/>  
    <has-relation relation="fCreateDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"
      size="36"/>  
    <has-relation relation="fCreateDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"
      size="64"/>  
    <has-relation relation="fCreatePosID" default-value-expr="currentPosID()"/>  
    <has-relation relation="fCreatePosName" default-value-expr="currentPosName()"/>  
    <has-relation relation="fCreatePsnID" default-value-expr="operatorID()" size="36"/>  
    <has-relation relation="fCreatePsnName" default-value-expr="operatorName()" size="64"/>  
    <has-relation relation="fCreatePsnFID" default-value-expr="currentPersonMemberFID()"
      size="512"/>  
    <has-relation relation="fCreatePsnFName" default-value-expr="currentPersonMemberFName()"
      size="512"/>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fUpdatePsnID" default-value-expr="operatorID()" size="36"/>  
    <has-relation relation="fUpdatePsnName" default-value-expr="operatorName()" size="64"/>  
    <has-relation relation="fUpdateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fCurrentActivities"/>  
    <has-relation relation="fCurrentExecutors"/>  
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
  <concept name="OA_BG_AlterD" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">预算计划变更(子表)</label>  
    <has-relation relation="fAccountID"/>  
    <has-relation relation="fAccountCode"/>  
    <has-relation relation="fAccountName"/>  
    <has-relation relation="fBGAlterID" data-type="OA_BG_AlterM" size="32"/>  
    <has-relation relation="fPlan1" default-value-expr="0.0"/>  
    <has-relation relation="fPlan2" default-value-expr="0.0"/>  
    <has-relation relation="fPlan3" default-value-expr="0.0"/>  
    <has-relation relation="fPlan4" default-value-expr="0.0"/>  
    <has-relation relation="fPlan5" default-value-expr="0.0"/>  
    <has-relation relation="fPlan6" default-value-expr="0.0"/>  
    <has-relation relation="fPlan7" default-value-expr="0.0"/>  
    <has-relation relation="fPlan8" default-value-expr="0.0"/>  
    <has-relation relation="fPlan9" default-value-expr="0.0"/>  
    <has-relation relation="fPlan10" default-value-expr="0.0"/>  
    <has-relation relation="fPlan11" default-value-expr="0.0"/>  
    <has-relation relation="fPlan12" default-value-expr="0.0"/>  
    <has-relation relation="fPlanall" default-value-expr="0.0"/>  
    <has-relation relation="fFact1" default-value-expr="0.0"/>  
    <has-relation relation="fFact2" default-value-expr="0.0"/>  
    <has-relation relation="fFact3" default-value-expr="0.0"/>  
    <has-relation relation="fFact4" default-value-expr="0.0"/>  
    <has-relation relation="fFact5" default-value-expr="0.0"/>  
    <has-relation relation="fFact6" default-value-expr="0.0"/>  
    <has-relation relation="fFact7" default-value-expr="0.0"/>  
    <has-relation relation="fFact8" default-value-expr="0.0"/>  
    <has-relation relation="fFact9" default-value-expr="0.0"/>  
    <has-relation relation="fFact10" default-value-expr="0.0"/>  
    <has-relation relation="fFact11" default-value-expr="0.0"/>  
    <has-relation relation="fFact12" default-value-expr="0.0"/>  
    <has-relation relation="fFactall" default-value-expr="0.0"/>  
    <has-relation relation="fAlter1" default-value-expr="0.0"/>  
    <has-relation relation="fAlter2" default-value-expr="0.0"/>  
    <has-relation relation="fAlter3" default-value-expr="0.0"/>  
    <has-relation relation="fAlter4" default-value-expr="0.0"/>  
    <has-relation relation="fAlter5" default-value-expr="0.0"/>  
    <has-relation relation="fAlter6" default-value-expr="0.0"/>  
    <has-relation relation="fAlter7" default-value-expr="0.0"/>  
    <has-relation relation="fAlter8" default-value-expr="0.0"/>  
    <has-relation relation="fAlter9" default-value-expr="0.0"/>  
    <has-relation relation="fAlter10" default-value-expr="0.0"/>  
    <has-relation relation="fAlter11" default-value-expr="0.0"/>  
    <has-relation relation="fAlter12" default-value-expr="0.0"/>  
    <has-relation relation="fAlterall" default-value-expr="0.0"/>  
    <has-relation relation="fBGDetailID" default-value-expr="0.0" size="32"/> 
  </concept>  
  <concept name="OA_BG_AlterExecute" default-value-expr="guid()"> 
    <has-relation relation="fMasterID" data-type="OA_BG_AlterM"/>  
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
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">预算计划变更(处理表)</label> 
  </concept>  
  <concept name="OA_BG_History" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">预算历史表</label>  
    <has-relation relation="fKindID"/>  
    <has-relation relation="fKindName"/>  
    <has-relation relation="fCostCenterID" size="32"/>  
    <has-relation relation="fCostCenterCode" size="128"/>  
    <has-relation relation="fCostCenterName" size="128"/>  
    <has-relation relation="fAccountID" size="32"/>  
    <has-relation relation="fAccountCode" size="128"/>  
    <has-relation relation="fAccountName" size="128"/>  
    <has-relation relation="fYear"/>  
    <has-relation relation="fMonth"/>  
    <has-relation relation="fAmount" data-type="Decimal" default-value-expr="0.0"/>  
    <has-relation relation="fSurplus" default-value-expr="0.0"/>  
    <has-relation relation="fDeptID" size="32"/>  
    <has-relation relation="fDeptName" size="64"/>  
    <has-relation relation="fPersonID" size="32"/>  
    <has-relation relation="fPersonName" size="64"/>  
    <has-relation relation="fURL" size="512"/>  
    <has-relation relation="fDateTime"/>  
    <has-relation relation="fBusinessID" size="32"/>  
    <has-relation relation="fProcess"/>  
    <has-relation relation="fActivity"/>  
    <has-relation relation="fFuncURL" size="512"/> 
  </concept>  
  <relation name="fBGBadgutID" data-type="OA_BG_BadgutM" single-valued="true"> 
    <label language="zh_CN">预算ID</label> 
  </relation>  
  <relation name="fBGDetailID" data-type="String" single-valued="true"> 
    <label language="zh_CN">预算子表ID</label> 
  </relation>  
  <relation name="fBGApplyID" data-type="OA_BG_ApplyM" single-valued="true"> 
    <label language="zh_CN">预算计划ID</label> 
  </relation>  
  <relation name="fBGAlterID" data-type="String" single-valued="true"> 
    <label language="zh_CN">预算变更ID</label> 
  </relation>  
  <relation name="fBusinessID" data-type="String" single-valued="true"> 
    <label language="zh_CN">业务ID</label> 
  </relation>  
  <relation name="fKindID" data-type="String" single-valued="true"> 
    <label language="zh_CN">方式ID</label> 
  </relation>  
  <relation name="fKindName" data-type="String" single-valued="true"> 
    <label language="zh_CN">方式名称</label> 
  </relation>  
  <relation name="fProcess" data-type="String" single-valued="true"> 
    <label language="zh_CN">process</label> 
  </relation>  
  <relation name="fActivity" data-type="String" single-valued="true"> 
    <label language="zh_CN">activity</label> 
  </relation>  
  <relation name="fFuncURL" data-type="String" single-valued="true"> 
    <label language="zh_CN">功能URL</label> 
  </relation>  
  <relation name="fSurplus" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">剩余预算</label> 
  </relation>  
  <relation name="fPlan1" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">1月计划支出</label> 
  </relation>  
  <relation name="fPlan2" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">2月计划支出</label> 
  </relation>  
  <relation name="fPlan3" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">3月计划支出</label> 
  </relation>  
  <relation name="fPlan4" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">4月计划支出</label> 
  </relation>  
  <relation name="fPlan5" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">5月计划支出</label> 
  </relation>  
  <relation name="fPlan6" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">6月计划支出</label> 
  </relation>  
  <relation name="fPlan7" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">7月计划支出</label> 
  </relation>  
  <relation name="fPlan8" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">8月计划支出</label> 
  </relation>  
  <relation name="fPlan9" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">9月计划支出</label> 
  </relation>  
  <relation name="fPlan10" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">10月计划支出</label> 
  </relation>  
  <relation name="fPlan11" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">11月计划支出</label> 
  </relation>  
  <relation name="fPlan12" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">12月计划支出</label> 
  </relation>  
  <relation name="fPlanall" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">全年计划支出</label> 
  </relation>  
  <relation name="fFact1" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">1月实际支出</label> 
  </relation>  
  <relation name="fFact2" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">2月实际支出</label> 
  </relation>  
  <relation name="fFact3" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">3月实际支出</label> 
  </relation>  
  <relation name="fFact4" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">4月实际支出</label> 
  </relation>  
  <relation name="fFact5" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">5月实际支出</label> 
  </relation>  
  <relation name="fFact6" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">6月实际支出</label> 
  </relation>  
  <relation name="fFact7" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">7月实际支出</label> 
  </relation>  
  <relation name="fFact8" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">8月实际支出</label> 
  </relation>  
  <relation name="fFact9" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">9月实际支出</label> 
  </relation>  
  <relation name="fFact10" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">10月实际支出</label> 
  </relation>  
  <relation name="fFact11" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">11月实际支出</label> 
  </relation>  
  <relation name="fFact12" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">12月实际支出</label> 
  </relation>  
  <relation name="fFactall" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">全年实际支出</label> 
  </relation>  
  <relation name="fAlter1" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">1月计划变更</label> 
  </relation>  
  <relation name="fAlter2" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">2月计划变更</label> 
  </relation>  
  <relation name="fAlter3" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">3月计划变更</label> 
  </relation>  
  <relation name="fAlter4" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">4月计划变更</label> 
  </relation>  
  <relation name="fAlter5" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">5月计划变更</label> 
  </relation>  
  <relation name="fAlter6" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">6月计划变更</label> 
  </relation>  
  <relation name="fAlter7" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">7月计划变更</label> 
  </relation>  
  <relation name="fAlter8" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">8月计划变更</label> 
  </relation>  
  <relation name="fAlter9" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">9月计划变更</label> 
  </relation>  
  <relation name="fAlter10" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">10月计划变更</label> 
  </relation>  
  <relation name="fAlter11" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">11月计划变更</label> 
  </relation>  
  <relation name="fAlter12" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">12月计划变更</label> 
  </relation>  
  <relation name="fAlterall" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">全年计划变更</label> 
  </relation> 
<concept name="OA_BG_Config" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">预算配置表</label>
<has-relation relation="fCurrentYear" data-type="String"></has-relation>
<has-relation relation="fCurrentMonth" data-type="String"></has-relation>
<has-relation relation="fHasPassed" data-type="String"></has-relation>
</concept>
<relation name="fCurrentYear" data-type="String"><label language="zh_CN">当前年</label>
</relation>
<relation name="fCurrentMonth" data-type="String"><label language="zh_CN">当前月</label>
</relation>
<relation name="fHasPassed" data-type="String"><label language="zh_CN">fHasPassed</label>
</relation>
<relation name="fYear1" data-type="Decimal"><label language="zh_CN">fYear1</label>
</relation>
<relation name="fYear2" data-type="Decimal"><label language="zh_CN">fYear2</label>
</relation>
<relation name="fYear3" data-type="Decimal"><label language="zh_CN">fYear3</label>
</relation>
<relation name="fYear4" data-type="Decimal"><label language="zh_CN">fYear4</label>
</relation>
<relation name="fYear5" data-type="Decimal"><label language="zh_CN">fYear5</label>
</relation>
<relation name="fYear6" data-type="Decimal"><label language="zh_CN">fYear6</label>
</relation>
<relation name="fYear7" data-type="Decimal"><label language="zh_CN">fYear7</label>
</relation>
<relation name="fYear8" data-type="Decimal"><label language="zh_CN">fYear8</label>
</relation>
<relation name="fYear9" data-type="Decimal"><label language="zh_CN">fYear9</label>
</relation>
<relation name="fYear10" data-type="Decimal"><label language="zh_CN">fYear10</label>
</relation>
<relation name="fYear11" data-type="Decimal"><label language="zh_CN">fYear11</label>
</relation>
<relation name="fYear12" data-type="Decimal"><label language="zh_CN">fYear12</label>
</relation>
<relation name="fYearall" data-type="Decimal"><label language="zh_CN">fYearall</label>
</relation>
</model>
