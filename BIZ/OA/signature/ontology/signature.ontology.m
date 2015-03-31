<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <!--(DEFCONCEPT OA_SL_SignatureType(?x)
 :AXIOMS(AND
		(HAS-RELATION OA_SL_SignatureType version)
		(LABEL OA_SL_SignatureType "印章类别" "zh_CN")
		(HAS-RELATION OA_SL_SignatureType fScope)
		(HAS-RELATION OA_SL_SignatureType fCode)
		(HAS-RELATION OA_SL_SignatureType fName)
		(HAS-RELATION OA_SL_SignatureType fDescription)
		(HAS-RELATION OA_SL_SignatureType fSequence)
		(HAS-RELATION OA_SL_SignatureType fUseStatus)
		(HAS-RELATION OA_SL_SignatureType fUseStatusName)
		(HAS-RELATION OA_SL_SignatureType fParentCode)
		(HAS-RELATION OA_SL_SignatureType fLevel)
		(HAS-RELATION OA_SL_SignatureType fURL)
		(HAS-RELATION OA_SL_SignatureType fCreateOgnID)
		(HAS-RELATION OA_SL_SignatureType fCreateOgnName)
		(HAS-RELATION OA_SL_SignatureType fCreateDeptID)
		(HAS-RELATION OA_SL_SignatureType fCreateDeptName)
		(HAS-RELATION OA_SL_SignatureType fCreatePsnID)
		(HAS-RELATION OA_SL_SignatureType fCreatePsnName)
		(HAS-RELATION OA_SL_SignatureType fCreatePsnFID)
		(HAS-RELATION OA_SL_SignatureType fCreateTime)
		(HAS-RELATION OA_SL_SignatureType fUpdatePsnID)
		(HAS-RELATION OA_SL_SignatureType fUpdatePsnName)
		(HAS-RELATION OA_SL_SignatureType fUpdateTime)
		(RANGE-TYPE OA_SL_SignatureType fSequence String)
		(SIZE OA_SL_SignatureType fScope 64)
		(SIZE OA_SL_SignatureType fCode 64)
		(SIZE OA_SL_SignatureType fName 64)
		(SIZE OA_SL_SignatureType fDescription 512)
		(SIZE OA_SL_SignatureType fSequence 10)
		(SIZE OA_SL_SignatureType fUseStatus 36)
		(SIZE OA_SL_SignatureType fUseStatusName 64)
		(SIZE OA_SL_SignatureType fParentCode 64)
		(SIZE OA_SL_SignatureType fURL 512)
		(SIZE OA_SL_SignatureType fCreateOgnID 36)
		(SIZE OA_SL_SignatureType fCreateOgnName 64)
		(SIZE OA_SL_SignatureType fCreateDeptID 36)
		(SIZE OA_SL_SignatureType fCreateDeptName 64)
		(SIZE OA_SL_SignatureType fCreatePsnID 36)
		(SIZE OA_SL_SignatureType fCreatePsnName 64)
		(SIZE OA_SL_SignatureType fCreatePsnFID 512)
		(SIZE OA_SL_SignatureType fUpdatePsnID 36)
		(SIZE OA_SL_SignatureType fUpdatePsnName 64)
       (HAS-RELATION OA_SL_SignatureType fID )))-->  
    
  <!--(DEFCONCEPT OA_SL_Signature (?x)
  :AXIOMS (AND  (HAS-RELATION OA_SL_Signature version )
       (LABEL OA_SL_Signature "印章申请表" "zh_CN" )
       (HAS-RELATION OA_SL_Signature fNO )
       (HAS-RELATION OA_SL_Signature fSignatureTypeID )
       (HAS-RELATION OA_SL_Signature fSake )
       (HAS-RELATION OA_SL_Signature fIndianID )
       (RANGE-TYPE OA_SL_Signature fIndianID String )
       (HAS-RELATION OA_SL_Signature fIndianName )
       (HAS-RELATION OA_SL_Signature fUseDate )
       (LOCAL-LABEL OA_SL_Signature fSignatureTypeID "印章类别ID" "zh_CN" )
       (HAS-RELATION OA_SL_Signature fSignatureTypeName )
       (HAS-RELATION OA_SL_Signature fRemark )
       (HAS-RELATION OA_SL_Signature fBizState )
       (HAS-RELATION OA_SL_Signature fBizStateName )
       (HAS-RELATION OA_SL_Signature fDeptLeadershipID )
       (HAS-RELATION OA_SL_Signature fDepLeaderAdvice )
       (HAS-RELATION OA_SL_Signature fCheckDate )
       (HAS-RELATION OA_SL_Signature fLeaderID )
       (HAS-RELATION OA_SL_Signature fLeaderAdvice )
       (HAS-RELATION OA_SL_Signature fGreeDate )
       (HAS-RELATION OA_SL_Signature fApplyOgnID )
       (HAS-RELATION OA_SL_Signature fApplyOgnName )
       (HAS-RELATION OA_SL_Signature fApplyDeptID )
       (HAS-RELATION OA_SL_Signature fApplyDeptName )
       (HAS-RELATION OA_SL_Signature fApplyPsnID )
       (HAS-RELATION OA_SL_Signature fApplyPsnName )
       (HAS-RELATION OA_SL_Signature fApplyPsnFID )
       (HAS-RELATION OA_SL_Signature fApplyPsnFName )
       (HAS-RELATION OA_SL_Signature fApplyDate )
       (HAS-RELATION OA_SL_Signature fCreateOgnID )
       (HAS-RELATION OA_SL_Signature fCreateOgnName )
       (HAS-RELATION OA_SL_Signature fCreateDeptID )
       (HAS-RELATION OA_SL_Signature fCreateDeptName )
       (HAS-RELATION OA_SL_Signature fCreatePsnID )
       (HAS-RELATION OA_SL_Signature fCreatePsnName )
       (HAS-RELATION OA_SL_Signature fCreatePsnFID )
       (HAS-RELATION OA_SL_Signature fCreatePsnFName )
       (HAS-RELATION OA_SL_Signature fCreateTime )
       (HAS-RELATION OA_SL_Signature fUpdatePsnID )
       (HAS-RELATION OA_SL_Signature fUpdatePsnName )
       (HAS-RELATION OA_SL_Signature fUpdateTime )
       (SIZE OA_SL_Signature fSake 512 )
       (SIZE OA_SL_Signature fIndianName 64 )
       (SIZE OA_SL_Signature fSignatureTypeName 64 )
       (SIZE OA_SL_Signature fDepLeaderAdvice 512 )
       (SIZE OA_SL_Signature fDeptLeadershipID 36 )
       (SIZE OA_SL_Signature fLeaderID 36 )
       (SIZE OA_SL_Signature fLeaderAdvice 512 )
       (SIZE OA_SL_Signature fApplyOgnID 36 )
       (SIZE OA_SL_Signature fApplyOgnName 64 )
       (SIZE OA_SL_Signature fApplyDeptID 36 )
       (SIZE OA_SL_Signature fApplyDeptName 64 )
       (SIZE OA_SL_Signature fApplyPsnID 36 )
       (SIZE OA_SL_Signature fApplyPsnName 64 )
       (SIZE OA_SL_Signature fApplyPsnFID 512 )
       (SIZE OA_SL_Signature fApplyPsnFName 1024 )
       (SIZE OA_SL_Signature fCreateOgnID 36 )
       (SIZE OA_SL_Signature fCreateOgnName 64 )
       (SIZE OA_SL_Signature fCreateDeptID 36 )
       (SIZE OA_SL_Signature fCreateDeptName 64 )
       (SIZE OA_SL_Signature fCreatePsnID 36 )
       (SIZE OA_SL_Signature fCreatePsnName 64 )
       (SIZE OA_SL_Signature fCreatePsnFID 512 )
       (SIZE OA_SL_Signature fCreatePsnFName 1024 )
       (SIZE OA_SL_Signature fUpdatePsnID 36 )
       (SIZE OA_SL_Signature fUpdatePsnName 64 )
       (RANGE-TYPE OA_SL_Signature fSignatureTypeID OA_SL_SignatureType )
       (LOCAL-LABEL OA_SL_Signature fSignatureTypeName "印章类别名称" "zh_CN" )
       (HAS-RELATION OA_SL_Signature fCurrentActivities )
       (HAS-RELATION OA_SL_Signature fCurrentExecutors )))-->  
  <concept name="OA_SL_Signature" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">印章申请表</label>  
    <has-relation relation="fNO" default-value-expr="nextSeqString(format('%s%s','YZSQ',format('%1$tY%1$tm%1$td', currentDateTime())),'000')"/>  
    <has-relation relation="fSignatureTypeID" data-type="String"> 
      <label language="zh_CN">印章类别ID</label> 
    </has-relation>  
    <has-relation relation="fSake" size="512"/>  
    <has-relation relation="fIndianID" data-type="String" size="36"/>  
    <has-relation relation="fIndianName" size="64"/>  
    <has-relation relation="fUseDate" default-value-expr="currentDateTime()" data-type="DateTime"/>  
    <has-relation relation="fSignatureTypeName" size="64"> 
      <label language="zh_CN">印章类别名称</label> 
    </has-relation>  
    <has-relation relation="fRemark"/>  
    <has-relation relation="fBizState" default-value-expr="'bsEditing'" size="36"/>  
    <has-relation relation="fBizStateName" default-value-expr="'编辑中'" size="64"/>  
    <has-relation relation="fDeptLeadershipID" size="36"/>  
    <has-relation relation="fDepLeaderAdvice" size="64"/>  
    <has-relation relation="fCheckDate" data-type="DateTime"/>  
    <has-relation relation="fLeaderID" size="36"/>  
    <has-relation relation="fLeaderAdvice" size="64"/>  
    <has-relation relation="fGreeDate" data-type="DateTime"/>  
    <has-relation relation="fApplyOgnID" default-value-expr="currentOgnID()" size="36"/>  
    <has-relation relation="fApplyOgnName" default-value-expr="currentOgnName()" size="64"/>  
    <has-relation relation="fApplyDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())" size="36"/>  
    <has-relation relation="fApplyDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())" size="64"/>  
    <has-relation relation="fApplyPsnID" default-value-expr="operatorID()" size="36"/>  
    <has-relation relation="fApplyPsnName" default-value-expr="currentPersonMemberNameWithAgent()" size="64"/>  
    <has-relation relation="fApplyPsnFID" default-value-expr="currentPersonMemberFID()" size="512"/>  
    <has-relation relation="fApplyPsnFName" default-value-expr="currentPersonMemberFNameWithAgent()" size="1024"/>  
    <has-relation relation="fApplyDate" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fCreateOgnID" default-value-expr="currentOgnID()" size="36"/>  
    <has-relation relation="fCreateOgnName" default-value-expr="currentOgnName()" size="64"/>  
    <has-relation relation="fCreateDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())" size="36"/>  
    <has-relation relation="fCreateDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())" size="64"/>  
    <has-relation relation="fCreatePsnID" default-value-expr="operatorID()" size="36"/>  
    <has-relation relation="fCreatePsnName" default-value-expr="currentPersonMemberNameWithAgent()" size="64"/>  
    <has-relation relation="fCreatePsnFID" default-value-expr="currentPersonMemberFID()" size="512"/>  
    <has-relation relation="fCreatePsnFName" default-value-expr="currentPersonMemberFNameWithAgent()" size="1024"/>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fUpdatePsnID" default-value-expr="operatorID()" size="36"/>  
    <has-relation relation="fUpdatePsnName" default-value-expr="currentPersonMemberNameWithAgent()" size="64"/>  
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
  <relation name="fSignatureTypeID" data-type="String" single-valued="true"> 
    <label language="zh_CN">印章类别ID</label> 
  </relation>   
  <relation name="fSake" data-type="String" single-valued="true"> 
    <label language="zh_CN">用印文件及事由</label> 
  </relation>  
  <relation name="fIndianID" data-type="String" single-valued="true"> 
    <label language="zh_CN">印管人ID</label> 
  </relation>   
  <relation name="fIndianName" data-type="String" single-valued="true"> 
    <label language="zh_CN">印管人名称</label> 
  </relation>   
  <relation name="fSignatureTypeName" data-type="String" single-valued="true"> 
    <label language="zh_CN">印签类别名称</label> 
  </relation>   
  <relation name="fRatLeadershipID" data-type="String" single-valued="true"> 
    <label language="zh_CN">审核部门经理</label> 
  </relation>  
  <relation name="fDepLeaderAdvice" data-type="String" single-valued="true"> 
    <label language="zh_CN">部门经理意见</label> 
  </relation>   
  <relation name="fDeptLeadershipID" data-type="String" single-valued="true"> 
    <label language="zh_CN">审核部门经理</label> 
  </relation>  
  <relation name="fLeaderID" data-type="String" single-valued="true"> 
    <label language="zh_CN">审批领导</label> 
  </relation>    
  <relation name="fLeaderAdvice" data-type="String" single-valued="true"> 
    <label language="zh_CN">领导意见</label> 
  </relation>   
  <relation name="fCheckDate" data-type="DateTime" single-valued="true"> 
    <label language="zh_CN">审核时间</label> 
  </relation>   
  <relation name="fGreeDate" data-type="DateTime" single-valued="true"> 
    <label language="zh_CN">审批时间</label> 
  </relation>   
  <relation name="fUseDate" data-type="DateTime" single-valued="true"> 
    <label language="zh_CN">用印时间</label> 
  </relation>   
  <concept name="OA_SL_UseExecute" default-value-expr="guid()"> 
    <has-relation relation="fMasterID" data-type="OA_SL_Signature" size="36"/>  
    <has-relation relation="fTaskID" size="36"/>  
    <has-relation relation="fActivityFName" size="512"/>  
    <has-relation relation="fActivityLabel" size="64"/>  
    <has-relation relation="fOpinion"/>  
    <has-relation relation="fVerdict" size="36" default-value-expr="'1'"/>  
    <has-relation relation="fState" size="36" default-value-expr="'psProcessing'"/>  
    <has-relation relation="fStateName" default-value-expr="'处理中'" size="64"/>  
    <has-relation relation="fCreateOgnID" default-value-expr="currentOgnID()" size="36"/>  
    <has-relation relation="fCreateOgnName" default-value-expr="currentOgnName()" size="64"/>  
    <has-relation relation="fCreateDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())" size="36"/>  
    <has-relation relation="fCreateDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())" size="64"/>  
    <has-relation relation="fCreatePosID" default-value-expr="currentPosID()" size="36"/>  
    <has-relation relation="fCreatePosName" default-value-expr="currentPosName()" size="64"/>  
    <has-relation relation="fCreatePsnID" default-value-expr="operatorID()" size="36"/>  
    <has-relation relation="fCreatePsnName" default-value-expr="currentPersonMemberNameWithAgent()" size="64"/>  
    <has-relation relation="fCreatePsnFID" default-value-expr="currentPersonMemberFID()" size="512"/>  
    <has-relation relation="fCreatePsnFName" default-value-expr="currentPersonMemberFNameWithAgent()" size="1024"/>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fUpdatePsnID" default-value-expr="operatorID()" size="36"/>  
    <has-relation relation="fUpdatePsnName" default-value-expr="currentPersonMemberNameWithAgent()" size="64"/>  
    <has-relation relation="fUpdateTime"/>  
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">印章使用申请(处理表)</label> 
  </concept> 
</model>
