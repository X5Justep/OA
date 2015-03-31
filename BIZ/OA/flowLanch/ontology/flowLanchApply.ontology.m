<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <concept name="OA_FL_FlowLanchApply" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0"/>
    <label language="zh_CN">事务办理申请</label>
    <has-relation relation="fNO" default-value-expr="nextSeqString(format('%s%s', 'ZYL-', format('%1$tY%1$tm%1$td',currentDateTime())), '000')"/>
    <has-relation relation="fBizState" default-value-expr="'bsEditing'"/>
    <has-relation relation="fBizStateName" default-value-expr="'编辑中'"/>
    <has-relation relation="fRemark"/>
    <has-relation relation="fApplyOgnID" default-value-expr="currentOgnID()"/>
    <has-relation relation="fApplyOgnName" default-value-expr="currentOgnName()"/>
    <has-relation relation="fApplyDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"/>
    <has-relation relation="fApplyDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"/>
    <has-relation relation="fApplyPosID" default-value-expr="currentPosID()"/>
    <has-relation relation="fApplyPosName" default-value-expr="currentPosName()"/>
    <has-relation relation="fApplyPsnID" default-value-expr="currentPersonID()"/>
    <has-relation relation="fApplyPsnName" default-value-expr="currentPersonName()"/>
    <has-relation relation="fApplyPsnFID" default-value-expr="currentPersonMemberFID()"/>
    <has-relation relation="fApplyPsnFName" default-value-expr="currentPersonMemberFName()"/>
    <has-relation relation="fApplyDate" default-value-expr="currentDateTime()"/>
    <has-relation relation="fCreateOgnID" default-value-expr="currentOgnID()"/>
    <has-relation relation="fCreateOgnName" default-value-expr="currentOgnName()"/>
    <has-relation relation="fCreateDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"/>
    <has-relation relation="fCreateDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"/>
    <has-relation relation="fCreatePosID" default-value-expr="currentPosID()"/>
    <has-relation relation="fCreatePosName" default-value-expr="currentPosName()"/>
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
    <has-relation relation="fTitle"/>
    <has-relation relation="fAttachment"/>
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
  <concept name="OA_FL_FlowLanchExecute" default-value-expr="guid()">
    <has-relation relation="fMasterID" data-type="OA_FL_FlowLanchApply"/>
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
    <label language="zh_CN">事务办理申请(处理表)</label>
  </concept>
  <relation name="fAttachment" data-type="String" single-valued="true">
    <label language="zh_CN">附件</label>
  </relation>
</model>
