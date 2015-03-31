<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
    
    
  <concept name="OA_OSC_BaseInfo" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">办公用品基本信息</label>  
    <!--<has-relation relation="fCode" default-value-expr="createKeyString(stringFormat('%s%s', 'BGYP-', stringFormat('%1$tY%1$tm%1$td',currentDateTime())), '000')" size="64"/>-->  
    <has-relation relation="fCode" default-value-expr="nextSeqString(format('%s%s', 'BGYP-', format('%1$tY%1$tm%1$td',currentDateTime())), '000')"
      size="64"/>  
    <has-relation relation="fName" size="64"/>  
    <has-relation relation="fSpecType" size="64"/>  
    <has-relation relation="fPrice"/>  
    <has-relation relation="fKindID" size="36"/>  
    <has-relation relation="fKindName" size="64"/>  
    <has-relation relation="fUnitID" size="36"/>  
    <has-relation relation="fUnitName" size="64"/>  
    <has-relation relation="fStock" default-value-expr="0"/>  
    <has-relation relation="fUseStatus" default-value-expr="'0'"/>  
    <has-relation relation="fUseStatusName" default-value-expr="'未启用'" size="36"/>  
    <has-relation relation="fDescription" size="255"/>  
    <has-relation relation="fCreateOgnID" default-value-expr="currentOgnID()" size="65"/>  
    <has-relation relation="fCreateOgnName" default-value-expr="currentOgnName()" size="64"/>  
    <has-relation relation="fCreateDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"
      size="65"/>  
    <has-relation relation="fCreateDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"
      size="64"/>  
    <has-relation relation="fCreatePosID" default-value-expr="currentPosID()" size="36"/>  
    <has-relation relation="fCreatePosName" default-value-expr="currentPosName()" size="64"/>  
    <has-relation relation="fCreatePsnID" default-value-expr="operatorID()" size="65"/>  
    <has-relation relation="fCreatePsnName" default-value-expr="operatorName()" size="128"/>  
    <has-relation relation="fCreatePsnFID" default-value-expr="currentPersonMemberFID()"
      size="512"/>  
    <has-relation relation="fCreatePsnFName" default-value-expr="currentPersonMemberFName()"
      size="1024"/>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fUpdatePsnID" default-value-expr="operatorID()" size="65"/>  
    <has-relation relation="fUpdatePsnName" default-value-expr="operatorName()" size="128"/>  
    <has-relation relation="fUpdateTime" default-value-expr="currentDateTime()"/> 
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
  <concept name="OA_OSC_BuyApplyM" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">办公用品请购申请（主表）</label>  
    <has-relation relation="fNO" default-value-expr="nextSeqString(format('%s%s','YPQG-',format('%1$tY%1$tm%1$td', currentDateTime())),'000')"
      size="64"/>  
    <has-relation relation="fBizState" default-value-expr="'bsEditing'" size="36"/>  
    <has-relation relation="fBizStateName" default-value-expr="'编辑中'" size="36"/>  
    <has-relation relation="fConsultAmount"/>  
    <has-relation relation="fApplyReason" data-type="String"/>  
    <has-relation relation="fRemark" data-type="String"/>  
    <has-relation relation="fApplyOgnID" default-value-expr="currentOgnID()" size="36"/>  
    <has-relation relation="fApplyOgnName" default-value-expr="currentOgnName()" size="64"/>  
    <has-relation relation="fApplyDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"
      size="36"/>  
    <has-relation relation="fApplyDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"
      size="64"/>  
    <has-relation relation="fApplyPosID" default-value-expr="currentPosID()" size="36"/>  
    <has-relation relation="fApplyPosName" default-value-expr="currentPosName()" size="64"/>  
    <has-relation relation="fApplyPsnID" default-value-expr="operatorID()" size="36"/>  
    <has-relation relation="fApplyPsnName" default-value-expr="operatorName()" size="128"/>  
    <has-relation relation="fApplyPsnFID" default-value-expr="currentPersonMemberFID()"
      size="512"/>  
    <has-relation relation="fApplyPsnFName" default-value-expr="currentPersonMemberFName()"
      size="1024"/>  
    <has-relation relation="fApplyDate" data-type="Date" default-value-expr="currentDate()"/>  
    <has-relation relation="fCreateOgnID" default-value-expr="currentOgnID()" size="36"/>  
    <has-relation relation="fCreateOgnName" default-value-expr="currentOgnName()" size="64"/>  
    <has-relation relation="fCreateDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"
      size="36"/>  
    <has-relation relation="fCreateDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"
      size="64"/>  
    <has-relation relation="fCreatePosID" default-value-expr="currentPosID()" size="36"/>  
    <has-relation relation="fCreatePosName" default-value-expr="currentPosName()" size="64"/>  
    <has-relation relation="fCreatePsnID" default-value-expr="operatorID()" size="36"/>  
    <has-relation relation="fCreatePsnName" default-value-expr="operatorName()" size="128"/>  
    <has-relation relation="fCreatePsnFID" default-value-expr="currentPersonMemberFID()"
      size="512"/>  
    <has-relation relation="fCreatePsnFName" default-value-expr="currentPersonMemberFName()"
      size="1024"/>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fUpdatePsnID" default-value-expr="operatorID()" size="36"/>  
    <has-relation relation="fUpdatePsnName" default-value-expr="operatorName()" size="128"/>  
    <has-relation relation="fUpdateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fCurrentActivities" size="128"/>  
    <has-relation relation="fCurrentExecutors" size="128"/> 
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
  <concept name="OA_OSC_BuyApplyD" default-value-expr="guid()"> 
    <has-relation relation="version" data-type="Integer" default-value-expr="0"/>  
    <label language="zh_CN">办公用品请购申请（从表）</label>  
    <has-relation relation="fMasterID" data-type="OA_OSC_BuyApplyM" size="36"/>  
    <has-relation relation="fItemID" size="36"/>  
    <has-relation relation="fName" size="64"/>  
    <has-relation relation="fCode" size="64"/>  
    <has-relation relation="fSpecType" size="64"/>  
    <has-relation relation="fKindID" size="36"/>  
    <has-relation relation="fKindName" size="64"/>  
    <has-relation relation="fUnitID" size="36"/>  
    <has-relation relation="fUnitName" size="64"/>  
    <has-relation relation="fConsultPrice"/>  
    <has-relation relation="fFactPrice">
      <label language="zh_CN">实际单价</label> 
    </has-relation>
    <has-relation relation="fDemandNum" default-value-expr="1"/>  
    <has-relation relation="fApprovalNum" data-type="Integer" default-value-expr="1">
      <label language="zh_CN">审批数量</label> 
    </has-relation>
    <has-relation relation="fFactNum" default-value-expr="1">
      <label language="zh_CN">实际数量</label> 
    </has-relation>
    <has-relation relation="fConsultAmount"/>
    <has-relation relation="fFactAmount">
      <label language="zh_CN">实际金额</label> 
    </has-relation>  
    <has-relation relation="fRemark" data-type="String"/> 
  </concept>  
  <concept name="OA_OSC_BuyExecute" default-value-expr="guid()"> 
    <has-relation relation="fMasterID" data-type="OA_OSC_BuyApplyM" size="36"/>  
    <has-relation relation="fTaskID" size="36"/>  
    <has-relation relation="fActivityFName" size="512"/>  
    <has-relation relation="fActivityLabel" size="64"/>  
    <has-relation relation="fOpinion" data-type="String"/>  
    <has-relation relation="fVerdict" size="36"/>  
    <has-relation relation="fState" size="36"/>  
    <has-relation relation="fStateName" size="64"/>  
    <has-relation relation="fCreateOgnID" size="36"/>  
    <has-relation relation="fCreateOgnName" size="64"/>  
    <has-relation relation="fCreateDeptID" size="36"/>  
    <has-relation relation="fCreateDeptName" size="64"/>  
    <has-relation relation="fCreatePosID" size="36"/>  
    <has-relation relation="fCreatePosName" size="64"/>  
    <has-relation relation="fCreatePsnID" size="36"/>  
    <has-relation relation="fCreatePsnName" size="128"/>  
    <has-relation relation="fCreatePsnFID" size="512"/>  
    <has-relation relation="fCreatePsnFName" size="1024"/>  
    <has-relation relation="fCreateTime"/>  
    <has-relation relation="fUpdatePsnID" size="36"/>  
    <has-relation relation="fUpdatePsnName" size="128"/>  
    <has-relation relation="fUpdateTime"/>  
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">办公用品请购申请(处理表)</label> 
  </concept>  
  <concept name="OA_OSC_UseApplyM" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">办公用品领用申请（主表）</label>  
    <has-relation relation="fNO" default-value-expr="nextSeqString(format('%s%s','YPLY-',format('%1$tY%1$tm%1$td', currentDateTime())),'000')"
      size="64"/>  
    <has-relation relation="fBizState" default-value-expr="'bsEditing'" size="36"/>  
    <has-relation relation="fBizStateName" default-value-expr="'编辑中'" size="36"/>  
    <has-relation relation="fConsultAmount"/>  
    <has-relation relation="fFactAmount"/>  
    <has-relation relation="fDemandDate" data-type="Date" default-value-expr="currentDate()"/>  
    <has-relation relation="fApplyReason" data-type="String"/>  
    <has-relation relation="fProvideState" default-value-expr="0"/>  
    <has-relation relation="fProvideStateName" default-value-expr="'未发放'" size="36"/>  
    <has-relation relation="fRemark" data-type="String"/>  
    <has-relation relation="fApplyOgnID" default-value-expr="currentOgnID()" size="36"/>  
    <has-relation relation="fApplyOgnName" default-value-expr="currentOgnName()" size="64"/>  
    <has-relation relation="fApplyDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"
      size="36"/>  
    <has-relation relation="fApplyDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"
      size="64"/>  
    <has-relation relation="fApplyPosID" default-value-expr="currentPosID()" size="36"/>  
    <has-relation relation="fApplyPosName" default-value-expr="currentPosName()" size="64"/>  
    <has-relation relation="fApplyPsnID" default-value-expr="operatorID()" size="36"/>  
    <has-relation relation="fApplyPsnName" default-value-expr="currentPersonName()"
      size="128"/>  
    <has-relation relation="fApplyPsnFID" default-value-expr="currentPersonMemberFID()"
      size="512"/>  
    <has-relation relation="fApplyPsnFName" default-value-expr="currentPersonMemberFName()"
      size="1024"/>  
    <has-relation relation="fApplyDate" data-type="Date" default-value-expr="currentDate()"/>  
    <has-relation relation="fCreateOgnID" default-value-expr="currentOgnID()" size="36"/>  
    <has-relation relation="fCreateOgnName" default-value-expr="currentOgnName()" size="64"/>  
    <has-relation relation="fCreateDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"
      size="36"/>  
    <has-relation relation="fCreateDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"
      size="64"/>  
    <has-relation relation="fCreatePosID" default-value-expr="currentPosID()" size="36"/>  
    <has-relation relation="fCreatePosName" default-value-expr="currentPosName()" size="64"/>  
    <has-relation relation="fCreatePsnID" default-value-expr="operatorID()" size="36"/>  
    <has-relation relation="fCreatePsnName" default-value-expr="operatorName()" size="128"/>  
    <has-relation relation="fCreatePsnFID" default-value-expr="currentPersonMemberFID()"
      size="512"/>  
    <has-relation relation="fCreatePsnFName" default-value-expr="currentPersonMemberFName()"
      size="1024"/>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fUpdatePsnID" default-value-expr="operatorID()" size="36"/>  
    <has-relation relation="fUpdatePsnName" default-value-expr="operatorName()" size="128"/>  
    <has-relation relation="fUpdateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fCurrentActivities" size="128"/>  
    <has-relation relation="fCurrentExecutors" size="128"/>  
    <has-relation relation="fIsProcess" data-type="String" size="36" default-value-expr="'1'">
      <label language="zh_CN">流程标识</label> 
    </has-relation>
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
  <concept name="OA_OSC_UseApplyD" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">办公用品领用申请（从表）</label>  
    <has-relation relation="fMasterID" data-type="OA_OSC_UseApplyM" size="36"/>  
    <has-relation relation="fItemID" size="36"/>  
    <has-relation relation="fCode" size="64"/>  
    <has-relation relation="fName" size="64"/>  
    <has-relation relation="fKindID" size="36"/>  
    <has-relation relation="fKindName" size="64"/>  
    <has-relation relation="fUnitID" size="36"/>  
    <has-relation relation="fUnitName" size="64"/>  
    <has-relation relation="fSpecType" size="64"/>  
    <has-relation relation="fConsultPrice"/>  
    <has-relation relation="fDemandNum" default-value-expr="1"/>  
    <has-relation relation="fConsultAmount"/>  
    <has-relation relation="fFactPrice"/>  
    <has-relation relation="fFactNum" default-value-expr="1"/>  
    <has-relation relation="fFactAmount"/>  
    <has-relation relation="fRemark" data-type="String"/> 
  </concept>  
  <concept name="OA_OSC_UseExecute" default-value-expr="guid()"> 
    <has-relation relation="fMasterID" data-type="OA_OSC_UseApplyM" size="36"/>  
    <has-relation relation="fTaskID" size="36"/>  
    <has-relation relation="fActivityFName" size="512"/>  
    <has-relation relation="fActivityLabel" size="64"/>  
    <has-relation relation="fOpinion" data-type="String"/>  
    <has-relation relation="fVerdict" size="36"/>  
    <has-relation relation="fState" size="36"/>  
    <has-relation relation="fStateName" size="64"/>  
    <has-relation relation="fCreateOgnID" size="36"/>  
    <has-relation relation="fCreateOgnName" size="64"/>  
    <has-relation relation="fCreateDeptID" size="36"/>  
    <has-relation relation="fCreateDeptName" size="64"/>  
    <has-relation relation="fCreatePosID" size="36"/>  
    <has-relation relation="fCreatePosName" size="64"/>  
    <has-relation relation="fCreatePsnID" size="36"/>  
    <has-relation relation="fCreatePsnName" size="128"/>  
    <has-relation relation="fCreatePsnFID" size="512"/>  
    <has-relation relation="fCreatePsnFName" size="1024"/>  
    <has-relation relation="fCreateTime"/>  
    <has-relation relation="fUpdatePsnID" size="36"/>  
    <has-relation relation="fUpdatePsnName" size="128"/>  
    <has-relation relation="fUpdateTime"/>  
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">办公用品领用申请(处理表)</label> 
  </concept>  
  <relation name="fIsProcess" data-type="String">
    <label language="zh_CN">流程标识</label> 
  </relation>  
  <relation name="fApprovalNum" data-type="Integer">
    <label language="zh_CN">审批数量</label> 
  </relation> 
</model>
