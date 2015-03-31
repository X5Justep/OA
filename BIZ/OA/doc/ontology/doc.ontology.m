<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <relation name="fDocID" data-type="OA_DC_Doc" single-valued="true"> 
    <label language="zh_CN">公文ID</label> 
  </relation>  
  <relation name="fDocType" data-type="String" single-valued="true"> 
    <label language="zh_CN">类型</label> 
  </relation>  
  <relation name="fDocTypeName" data-type="String" single-valued="true"> 
    <label language="zh_CN">类型</label> 
  </relation>  
  <relation name="fKeyword" data-type="String" single-valued="true"> 
    <label language="zh_CN">主题词</label> 
  </relation>  
  <relation name="fDocNumber" data-type="String" single-valued="true"> 
    <label language="zh_CN">文号</label> 
  </relation>  
  <relation name="fSourceDeptID" data-type="String" single-valued="true"> 
    <label language="zh_CN">来文单位</label> 
  </relation>  
  <relation name="fSourceDept" data-type="String" single-valued="true"> 
    <label language="zh_CN">来文单位</label> 
  </relation>  
  <relation name="fSourceDocNumber" data-type="String" single-valued="true"> 
    <label language="zh_CN">来文文号</label> 
  </relation>  
  <relation name="fDocExigenceLevel" data-type="String" single-valued="true"> 
    <label language="zh_CN">紧急程度</label> 
  </relation>  
  <relation name="fDocExigenceLevelCode" data-type="String" single-valued="true"> 
    <label language="zh_CN">紧急程度编码</label> 
  </relation>  
  <relation name="fDocExigenceLevelName" data-type="String" single-valued="true"> 
    <label language="zh_CN">紧急程度名称</label> 
  </relation>  
  <relation name="fDocKind" data-type="String" single-valued="true"> 
    <label language="zh_CN">文种</label> 
  </relation>  
  <relation name="fDocKindCode" data-type="String" single-valued="true"> 
    <label language="zh_CN">文种编码</label> 
  </relation>  
  <relation name="fDocKindName" data-type="String" single-valued="true"> 
    <label language="zh_CN">文种名称</label> 
  </relation>  
  <relation name="fSendDirect" data-type="String" single-valued="true"> 
    <label language="zh_CN">行文方向</label> 
  </relation>  
  <relation name="fSendDirectCode" data-type="String" single-valued="true"> 
    <label language="zh_CN">行文方向编码</label> 
  </relation>  
  <relation name="fSendDirectName" data-type="String" single-valued="true"> 
    <label language="zh_CN">行文方向名称</label> 
  </relation>  
  <relation name="fDocSecretLevel" data-type="String" single-valued="true"> 
    <label language="zh_CN">公文密级</label> 
  </relation>  
  <relation name="fDocSecretLevelCode" data-type="String" single-valued="true"> 
    <label language="zh_CN">公文密级编码</label> 
  </relation>  
  <relation name="fDocSecretLevelName" data-type="String" single-valued="true"> 
    <label language="zh_CN">公文密级名称</label> 
  </relation>  
  <relation name="fOrgLetter" data-type="String" single-valued="true"> 
    <label language="zh_CN">发文机关代字</label> 
  </relation>  
  <relation name="fOrgLetterCode" data-type="String" single-valued="true"> 
    <label language="zh_CN">发文机关代字编码</label> 
  </relation>  
  <relation name="fOrgLetterName" data-type="String" single-valued="true"> 
    <label language="zh_CN">发文机关代字名称</label> 
  </relation>  
  <relation name="fSourceSort" data-type="String" single-valued="true"> 
    <label language="zh_CN">来文类别</label> 
  </relation>  
  <relation name="fSourceSortCode" data-type="String" single-valued="true"> 
    <label language="zh_CN">来文类别编码</label> 
  </relation>  
  <relation name="fSourceSortName" data-type="String" single-valued="true"> 
    <label language="zh_CN">来文类别名称</label> 
  </relation>  
  <relation name="fIssueDate" data-type="DateTime" single-valued="true"> 
    <label language="zh_CN">发文日期</label> 
  </relation>  
  <relation name="fCopies" data-type="Integer" single-valued="true"> 
    <label language="zh_CN">份数</label> 
  </relation>  
  <relation name="fPages" data-type="Integer" single-valued="true"> 
    <label language="zh_CN">页数</label> 
  </relation>  
  <relation name="fMainDestDeptID" data-type="String" single-valued="true"> 
    <label language="zh_CN">主送单位</label> 
  </relation>  
  <relation name="fMainDestDept" data-type="String" single-valued="true"> 
    <label language="zh_CN">主送单位</label> 
  </relation>  
  <relation name="fCopyDestDeptID" data-type="String" single-valued="true"> 
    <label language="zh_CN">抄送单位</label> 
  </relation>  
  <relation name="fCopyDestDept" data-type="String" single-valued="true"> 
    <label language="zh_CN">抄送单位</label> 
  </relation>  
  <relation name="fDraftPerID" data-type="String" single-valued="true"> 
    <label language="zh_CN">拟稿人</label> 
  </relation>  
  <relation name="fDraftPerName" data-type="String" single-valued="true"> 
    <label language="zh_CN">拟稿人</label> 
  </relation>  
  <relation name="fDraftPerPhone" data-type="String" single-valued="true"> 
    <label language="zh_CN">拟稿人电话</label> 
  </relation>  
  <relation name="fDraftTime" data-type="DateTime" single-valued="true"> 
    <label language="zh_CN">拟稿时间</label> 
  </relation>  
  <relation name="fCheckPerID" data-type="String" single-valued="true"> 
    <label language="zh_CN">核搞人</label> 
  </relation>  
  <relation name="fCheckPerName" data-type="String" single-valued="true"> 
    <label language="zh_CN">核搞人</label> 
  </relation>  
  <relation name="fCheckTime" data-type="DateTime" single-valued="true"> 
    <label language="zh_CN">核搞时间</label> 
  </relation>  
  <relation name="fEndorseID" data-type="String" single-valued="true"> 
    <label language="zh_CN">批转人</label> 
  </relation>  
  <relation name="fEndorseName" data-type="String" single-valued="true"> 
    <label language="zh_CN">批转人</label> 
  </relation>  
  <relation name="fEndorseTime" data-type="DateTime" single-valued="true"> 
    <label language="zh_CN">批转时间</label> 
  </relation>  
  <relation name="fEndorseOpinion" data-type="Text" single-valued="true"> 
    <label language="zh_CN">批转意见</label> 
  </relation>  
  <relation name="fSignPerID" data-type="String" single-valued="true"> 
    <label language="zh_CN">签发人</label> 
  </relation>  
  <relation name="fSignPerName" data-type="String" single-valued="true"> 
    <label language="zh_CN">签发人</label> 
  </relation>  
  <relation name="fSignOpinion" data-type="Text" single-valued="true"> 
    <label language="zh_CN">签发意见</label> 
  </relation>  
  <relation name="fSignTime" data-type="DateTime" single-valued="true"> 
    <label language="zh_CN">签发时间</label> 
  </relation>  
  <relation name="fSponsorDeptID" data-type="String" single-valued="true"> 
    <label language="zh_CN">主办单位</label> 
  </relation>  
  <relation name="fSponsorDept" data-type="String" single-valued="true"> 
    <label language="zh_CN">主办单位</label> 
  </relation>  
  <relation name="fDeptLeadID" data-type="String" single-valued="true"> 
    <label language="zh_CN">部门领导</label> 
  </relation>  
  <relation name="fDeptLeadName" data-type="String" single-valued="true"> 
    <label language="zh_CN">部门领导</label> 
  </relation>  
  <relation name="fTypePerID" data-type="String" single-valued="true"> 
    <label language="zh_CN">打字人</label> 
  </relation>  
  <relation name="fTypePerName" data-type="String" single-valued="true"> 
    <label language="zh_CN">打字人</label> 
  </relation>  
  <relation name="fTypeTime" data-type="DateTime" single-valued="true"> 
    <label language="zh_CN">打字时间</label> 
  </relation>  
  <relation name="fTypeOpinion" data-type="Text" single-valued="true"> 
    <label language="zh_CN">打字意见</label> 
  </relation>  
  <relation name="fProofReaderID" data-type="String" single-valued="true"> 
    <label language="zh_CN">校对人</label> 
  </relation>  
  <relation name="fProofReader" data-type="String" single-valued="true"> 
    <label language="zh_CN">校对人</label> 
  </relation>  
  <relation name="fProofTime" data-type="DateTime" single-valued="true"> 
    <label language="zh_CN">校对时间</label> 
  </relation>  
  <relation name="fProofOpinion" data-type="Text" single-valued="true"> 
    <label language="zh_CN">校对意见</label> 
  </relation>  
  <relation name="fDespachoID" data-type="String" single-valued="true"> 
    <label language="zh_CN">批示人</label> 
  </relation>  
  <relation name="fDespachoName" data-type="String" single-valued="true"> 
    <label language="zh_CN">批示人</label> 
  </relation>  
  <relation name="fDespachoTime" data-type="DateTime" single-valued="true"> 
    <label language="zh_CN">批示时间</label> 
  </relation>  
  <relation name="fDespachoOpinion" data-type="Text" single-valued="true"> 
    <label language="zh_CN">批示意见</label> 
  </relation>  
  <relation name="fCounterSignID" data-type="String" single-valued="true"> 
    <label language="zh_CN">会签人</label> 
  </relation>  
  <relation name="fCounterSigner" data-type="String" single-valued="true"> 
    <label language="zh_CN">会签人</label> 
  </relation>  
  <relation name="fMeetingTime" data-type="DateTime" single-valued="true"> 
    <label language="zh_CN">会签时间</label> 
  </relation>  
  <relation name="fMeetingOpinion" data-type="Text" single-valued="true"> 
    <label language="zh_CN">会签意见</label> 
  </relation>  
  <relation name="fSourceDate" data-type="DateTime" single-valued="true"> 
    <label language="zh_CN">来文日期</label> 
  </relation>  
  <relation name="fArchivingDate" data-type="DateTime" single-valued="true"> 
    <label language="zh_CN">归档日期</label> 
  </relation>  
  <relation name="fDraftContent" data-type="Text" single-valued="true"> 
    <label language="zh_CN">拟办</label> 
  </relation>  
  <relation name="fIssueState" data-type="String" single-valued="true"> 
    <label language="zh_CN">发布状态</label> 
  </relation>  
  <relation name="fAttachment" data-type="Text" single-valued="true"> 
    <label language="zh_CN">附件</label> 
  </relation>  
  <relation name="fArchivalID" data-type="String" single-valued="true"> 
    <label language="zh_CN">归档ID</label> 
  </relation>  
  <concept name="OA_DC_Doc" default-value-expr="guid()"> 
    <label language="zh_CN">公文</label>  
    <has-relation relation="fDocType" size="36"/>  
    <has-relation relation="fDocTypeName" size="64"/>  
    <has-relation relation="fTitle" size="255"> 
      <label language="zh_CN">文件标题</label> 
    </has-relation>  
    <has-relation relation="fKeyword" size="128"/>  
    <has-relation relation="fDocNumber" size="128"/>  
    <has-relation relation="fSourceDeptID" size="512"/>  
    <has-relation relation="fSourceDept" size="1024"/>  
    <has-relation relation="fSourceDocNumber" size="128"/>  
    <has-relation relation="fSponsorDeptID" size="512"/>  
    <has-relation relation="fSponsorDept" size="1024"/>  
    <has-relation relation="fDocExigenceLevel" size="36"/>  
    <has-relation relation="fDocExigenceLevelCode" size="64"/>  
    <has-relation relation="fDocExigenceLevelName" size="64"/>  
    <has-relation relation="fDocSecretLevel" size="36"/>  
    <has-relation relation="fDocSecretLevelCode" size="64"/>  
    <has-relation relation="fDocSecretLevelName" size="64"/>  
    <has-relation relation="fOrgLetter" size="36"/>  
    <has-relation relation="fOrgLetterCode" size="64"/>  
    <has-relation relation="fOrgLetterName" size="64"/>  
    <has-relation relation="fSourceSort" size="36"/>  
    <has-relation relation="fSourceSortCode" size="64"/>  
    <has-relation relation="fSourceSortName" size="64"/>  
    <has-relation relation="fIssueDate" data-type="Date"/>  
    <has-relation relation="fCopies"/>  
    <has-relation relation="fPages"/>  
    <has-relation relation="fContent" data-type="String"/>  
    <has-relation relation="fMainDestDeptID" size="1024"/>  
    <has-relation relation="fMainDestDept" size="1024"/>  
    <has-relation relation="fCopyDestDeptID" size="1024"/>  
    <has-relation relation="fCopyDestDept" size="1024"/>  
    <has-relation relation="fDeptLeadID" size="36"/>  
    <has-relation relation="fDeptLeadName" size="64"/>  
    <has-relation relation="fDraftPerID" default-value-expr="operatorID()" size="36"/>  
    <has-relation relation="fDraftPerName" default-value-expr="currentPersonMemberNameWithAgent()"
      size="64"/>  
    <has-relation relation="fDraftPerPhone" size="36"/>  
    <has-relation relation="fDraftTime" data-type="Date" default-value-expr="currentDate()"/>  
    <has-relation relation="fCheckPerID" size="36"/>  
    <has-relation relation="fCheckPerName" size="64"/>  
    <has-relation relation="fCheckTime" data-type="DateTime"/>  
    <has-relation relation="fEndorseID" size="36"/>  
    <has-relation relation="fEndorseName" size="64"/>  
    <has-relation relation="fEndorseTime" data-type="DateTime"/>  
    <has-relation relation="fEndorseOpinion" data-type="String"/>  
    <has-relation relation="fSignPerID" size="36"/>  
    <has-relation relation="fSignPerName" size="64"/>  
    <has-relation relation="fSignOpinion" data-type="String"/>  
    <has-relation relation="fSignTime" data-type="DateTime"/>  
    <has-relation relation="fTypePerID" size="36"/>  
    <has-relation relation="fTypePerName" size="64"/>  
    <has-relation relation="fTypeTime" data-type="DateTime"/>  
    <has-relation relation="fTypeOpinion" data-type="String"/>  
    <has-relation relation="fProofReaderID" size="36"/>  
    <has-relation relation="fProofReader" size="64"/>  
    <has-relation relation="fProofTime" data-type="DateTime"/>  
    <has-relation relation="fProofOpinion" data-type="String"/>  
    <has-relation relation="fDespachoID" size="36"/>  
    <has-relation relation="fDespachoName" size="64"/>  
    <has-relation relation="fDespachoTime"/>  
    <has-relation relation="fDespachoOpinion" data-type="String"/>  
    <has-relation relation="fCounterSignID" size="36"/>  
    <has-relation relation="fCounterSigner" size="64"/>  
    <has-relation relation="fMeetingTime"/>  
    <has-relation relation="fMeetingOpinion" data-type="String"/>  
    <has-relation relation="fSourceDate" data-type="Date"/>  
    <has-relation relation="fArchivingDate"/>  
    <has-relation relation="fBizState" default-value-expr="'bsEditing'" size="36"/>  
    <has-relation relation="fBizStateName" default-value-expr="'编辑中'" size="64"/>  
    <has-relation relation="fCreateOgnID" default-value-expr="currentOgnID()" size="36"/>  
    <has-relation relation="fCreateOgnName" default-value-expr="currentOgnName()" size="64"/>  
    <has-relation relation="fCreateDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"
      size="36"/>  
    <has-relation relation="fCreateDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"
      size="64"/>  
    <has-relation relation="fCreatePosID" default-value-expr="currentPosID()" size="36"/>  
    <has-relation relation="fCreatePosName" default-value-expr="currentPosName()" size="64"/>  
    <has-relation relation="fCreatePsnID" default-value-expr="operatorID()" size="36"/>  
    <has-relation relation="fCreatePsnName" size="64" default-value-expr="currentPersonMemberNameWithAgent()"/>  
    <has-relation relation="fCreatePsnFID" default-value-expr="currentPersonMemberFID()"
      size="512"/>  
    <has-relation relation="fCreatePsnFName" default-value-expr="currentPersonMemberFNameWithAgent()"
      size="1024"/>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fUpdatePsnID" default-value-expr="operatorID()" size="36"/>  
    <has-relation relation="fUpdatePsnName" default-value-expr="operatorName()" size="64"/>  
    <has-relation relation="fUpdateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fIssueState" default-value-expr="'0'" size="36"/>  
    <has-relation relation="version" default-value-expr="0"/>  
    <has-relation relation="fAttachment" data-type="String"/>  
    <has-relation relation="fDocKind"/>  
    <has-relation relation="fDocKindCode"/>  
    <has-relation relation="fDocKindName"/>  
    <has-relation relation="fYear" data-type="String"/>  
    <has-relation relation="fMonth" data-type="String"/>  
    <has-relation relation="fDraftContent" data-type="String"/>  
    <has-relation relation="fDay" data-type="String"/>  
    <has-relation relation="fOrgYear" data-type="String"/>  
    <has-relation relation="fOrgNum" data-type="String"/>  
    <has-relation relation="fTemplate" data-type="String"/>  
    <has-relation relation="fAttachmentName" data-type="String"/>  
    <has-relation relation="fSendDocID" size="36"/>  
    <has-relation relation="fRelevanceID" size="36"/>  
    <has-relation relation="fRelevanceName"/>  
    <has-relation relation="fHasProcess"/>  
    <has-relation relation="fHasReaders"/>  
    <has-relation relation="fReaderIDs" data-type="String"/>  
    <has-relation relation="fReceiveOgnIDs" data-type="String"/>  
    <has-relation relation="fCurrentActivities" size="128"/>  
    <has-relation relation="fCurrentExecutors" size="128"/>  
    <has-relation relation="fHasReceivers"/>  
    <has-relation relation="fArchivalID"/>  
    <has-relation relation="fAttachmentPaper" data-type="String"> 
      <label language="zh_CN">发文稿纸</label> 
    </has-relation>  
    <has-relation relation="fReason" data-type="String"> 
      <label language="zh_CN">事由</label> 
    </has-relation>  
    <has-relation relation="fCopyReportDeptID" data-type="String" size="1024"> 
      <label language="zh_CN">抄报单位ID</label> 
    </has-relation>  
    <has-relation relation="fCopyReportDept" data-type="String" size="1024"> 
      <label language="zh_CN">抄报单位</label> 
    </has-relation>  
    <has-relation relation="fCheckOpinion" data-type="String"> 
      <label language="zh_CN">核稿意见</label> 
    </has-relation>  
    <has-relation relation="fInternalSendDeptID" data-type="String" size="1024"> 
      <label language="zh_CN">内发单位ID</label> 
    </has-relation>  
    <has-relation relation="fInternalSendDeptName" data-type="String" size="1024"> 
      <label language="zh_CN">内发单位</label> 
    </has-relation>  
    <has-relation relation="fSuperPrintPsnID" data-type="String" size="32"> 
      <label language="zh_CN">监印人ID</label> 
    </has-relation>  
    <has-relation relation="fSuperPrintPsnName" data-type="String" size="64"> 
      <label language="zh_CN">监印人</label> 
    </has-relation>  
    <has-relation relation="fExtendStr1" data-type="String" size="64" default-value-expr="nextSeqString(format('%1$tY%1$tm',currentDate()), '0000')"> 
      <label language="zh_CN">流水号</label> 
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
    <has-relation relation="fExtendDate5" data-type="Date" required="true"> 
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
    <has-relation relation="fNO"> 
      <label language="zh_CN">审批单号</label> 
    </has-relation>  
    <has-relation relation="fExtendPsnIDs1" data-type="String" size="512"> 
      <label language="zh_CN">人员IDs扩展字段1</label> 
    </has-relation>  
    <has-relation relation="fExtendPsnNames1" data-type="String" size="1024"> 
      <label language="zh_CN">人员Names扩展字段1</label> 
    </has-relation>  
    <has-relation relation="fExtendPsnIDs2" data-type="String" size="512"> 
      <label language="zh_CN">人员IDs扩展字段2</label> 
    </has-relation>  
    <has-relation relation="fExtendPsnNames2" data-type="String" size="1024"> 
      <label language="zh_CN">人员Names扩展字段2</label> 
    </has-relation>  
    <has-relation relation="fExtendPsnIDs3" data-type="String" size="512"> 
      <label language="zh_CN">人员IDs扩展字段3</label> 
    </has-relation>  
    <has-relation relation="fExtendPsnNames3" data-type="String" size="1024"> 
      <label language="zh_CN">人员Names扩展字段3</label> 
    </has-relation>  
    <has-relation relation="fExtendPsnIDs4" data-type="String" size="512"> 
      <label language="zh_CN">人员IDs扩展字段4</label> 
    </has-relation>  
    <has-relation relation="fExtendPsnNames4" data-type="String" size="1024"> 
      <label language="zh_CN">人员Names扩展字段4</label> 
    </has-relation> 
  </concept>  
  <relation name="fRangeURL" data-type="String" single-valued="true"> 
    <label language="zh_CN">组织机构路径</label> 
  </relation>  
  <relation name="fRangeURLName" data-type="String" single-valued="true"> 
    <label language="zh_CN">组织机构路径</label> 
  </relation>  
  <relation name="fOrgTreeID" data-type="String" single-valued="true"> 
    <label language="zh_CN">组织机构节点ID</label> 
  </relation>  
  <concept name="OA_DC_ReaderRange" default-value-expr="guid()"> 
    <has-relation relation="fMasterID" data-type="OA_DC_Doc" size="36"/>  
    <has-relation relation="fOrgTreeID" size="36"/>  
    <has-relation relation="fCreatePsnID" default-value-expr="operatorID()" size="36"/>  
    <has-relation relation="fCreatePsnName" default-value-expr="currentPersonMemberNameWithAgent()"
      size="64"/>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fOrgKind" size="36"/>  
    <has-relation relation="fOrgID" size="36"/>  
    <has-relation relation="fOrgName" size="64"/>  
    <has-relation relation="fPersonID" size="36"/>  
    <has-relation relation="fPersonName" size="64"/>  
    <has-relation relation="fRangeURL" size="512"/>  
    <has-relation relation="fRangeURLName" size="1024"/>  
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">阅文范围</label> 
  </concept>  
  <relation name="fDay" data-type="Integer" single-valued="true"> 
    <label language="zh_CN">日期</label> 
  </relation>  
  <relation name="fOrgYear" data-type="Integer" single-valued="true"> 
    <label language="zh_CN">年号</label> 
  </relation>  
  <relation name="fOrgNum" data-type="Integer" single-valued="true"> 
    <label language="zh_CN">编号</label> 
  </relation>  
    
  <relation name="fUpdateDeptID" data-type="String" single-valued="true"> 
    <label language="zh_CN">修改部门ID</label> 
  </relation>  
  <relation name="fUpdateDeptName" data-type="String" single-valued="true"> 
    <label language="zh_CN">修改部门</label> 
  </relation>  
  <relation name="fPicture" data-type="String" single-valued="true"> 
    <label language="zh_CN">图片</label> 
  </relation>  
  <relation name="fTemplate" data-type="Text" single-valued="true"> 
    <label language="zh_CN">模板</label> 
  </relation>  
  <relation name="fAttachmentName" data-type="Text" single-valued="true"> 
    <label language="zh_CN">附件名称</label> 
  </relation>  
  <relation name="fSendDocID" data-type="String" single-valued="true"> 
    <label language="zh_CN">发文ID</label> 
  </relation>  
  <relation name="fRelevanceID" data-type="String" single-valued="true"> 
    <label language="zh_CN">关联ID</label> 
  </relation>  
  <relation name="fProcessState" data-type="String" single-valued="true"> 
    <label language="zh_CN">处理状态</label> 
  </relation>  
  <relation name="fProcessStateName" data-type="String" single-valued="true"> 
    <label language="zh_CN">处理状态名称</label> 
  </relation>  
  <relation name="fRelevanceName" data-type="String" single-valued="true"> 
    <label language="zh_CN">关联名称</label> 
  </relation>  
  <concept name="OA_DC_ReaderOpinion" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">公文处理意见表</label>  
      
    <has-relation relation="fTaskID" size="512"/>  
    <has-relation relation="fActivityFName" size="1024"/>  
    <has-relation relation="fActivityLabel" size="64"/>  
    <has-relation relation="fOpinion" data-type="String"/>  
    <has-relation relation="fVerdict" size="36"/>  
    <has-relation relation="fState" default-value-expr="'psProcessing'" size="36"/>  
    <has-relation relation="fStateName" default-value-expr="'处理中'" size="64"/>  
    <has-relation relation="fCreateOgnID" default-value-expr="currentOgnID()" size="36"/>  
    <has-relation relation="fCreateOgnName" default-value-expr="currentOgnName()" size="64"/>  
    <has-relation relation="fCreateDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"
      size="36"/>  
    <has-relation relation="fCreateDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"
      size="64"/>  
    <has-relation relation="fCreatePosID" default-value-expr="currentPosID()" size="36"/>  
    <has-relation relation="fCreatePosName" default-value-expr="currentPosName()" size="64"/>  
    <has-relation relation="fCreatePsnID" default-value-expr="operatorID()" size="36"/>  
    <has-relation relation="fCreatePsnName" default-value-expr="currentPersonMemberNameWithAgent()"
      size="64"/>  
    <has-relation relation="fCreatePsnFID" default-value-expr="currentPersonMemberFID()"
      size="512"/>  
    <has-relation relation="fCreatePsnFName" default-value-expr="currentPersonMemberFNameWithAgent()"
      size="1024"/>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fUpdatePsnID" default-value-expr="operatorID()" size="36"/>  
    <has-relation relation="fUpdatePsnName" default-value-expr="currentPersonMemberNameWithAgent()"
      size="64"/>  
    <has-relation relation="fUpdateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fMasterID" size="36"/> 
  </concept>  
  <!--<relation name="fHasProcess" data-type="OA_DC_ReaderOpinion" inverse-of="fMasterID">
    <label language="zh_CN">fHasProcess</label>
  </relation>-->  
  <relation name="fHasProcess" data-type="OA_DC_ReaderOpinion"> 
    <label language="zh_CN">fHasProcess</label> 
  </relation>  
  <!--<relation name="fHasReaders" data-type="OA_DC_ReaderRange" inverse-of="fMasterID">
    <label language="zh_CN">公文阅文范围</label>
  </relation>-->  
  <relation name="fHasReaders" data-type="OA_DC_ReaderRange"> 
    <label language="zh_CN">公文阅文范围</label> 
  </relation>  
  <concept name="OA_DC_ReceiveRange" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">外单位收文范围</label>  
    <has-relation relation="fMasterID" size="36"/>  
    <has-relation relation="fRangeURL" size="512"/>  
    <has-relation relation="fRangeURLName" size="1024"/>  
    <has-relation relation="fCreatePsnID" default-value-expr="operatorID()" size="36"/>  
    <has-relation relation="fCreatePsnName" default-value-expr="currentPersonMemberNameWithAgent()"
      size="64"/>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/> 
  </concept>  
  <relation name="fReaderIDs" data-type="Text" single-valued="true"> 
    <label language="zh_CN">阅文人IDs</label> 
  </relation>  
  <relation name="fReceiveOgnIDs" data-type="Text" single-valued="true"> 
    <label language="zh_CN">收文机构IDs</label> 
  </relation>  
  <concept name="OA_DC_DocExecute" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">处理表</label>  
    <has-relation relation="fMasterID" data-type="OA_DC_Doc" size="36"/>  
    <has-relation relation="fTaskID" size="36"/>  
    <has-relation relation="fActivityFName" size="512"/>  
    <has-relation relation="fActivityLabel" size="64"/>  
    <has-relation relation="fOpinion" data-type="String"/>  
    <has-relation relation="fVerdict" size="36"/>  
    <has-relation relation="fState" default-value-expr="'psProcessing'" size="36"/>  
    <has-relation relation="fStateName" default-value-expr="'处理中'" size="64"/>  
    <has-relation relation="fCreateOgnID" default-value-expr="currentOgnID()" size="36"/>  
    <has-relation relation="fCreateOgnName" default-value-expr="currentOgnName()" size="64"/>  
    <has-relation relation="fCreateDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"
      size="36"/>  
    <has-relation relation="fCreateDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"
      size="64"/>  
    <has-relation relation="fCreatePosID" default-value-expr="currentPosID()" size="36"/>  
    <has-relation relation="fCreatePosName" default-value-expr="currentPosName()" size="64"/>  
    <has-relation relation="fCreatePsnID" default-value-expr="operatorID()" size="36"/>  
    <has-relation relation="fCreatePsnName" default-value-expr="currentPersonMemberNameWithAgent()"
      size="64"/>  
    <has-relation relation="fCreatePsnFID" default-value-expr="currentPersonMemberFID()"
      size="512"/>  
    <has-relation relation="fCreatePsnFName" default-value-expr="currentPersonMemberFNameWithAgent()"
      size="1024"/>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fUpdatePsnID" default-value-expr="operatorID()" size="36"/>  
    <has-relation relation="fUpdatePsnName" default-value-expr="currentPersonMemberNameWithAgent()"
      size="64"/>  
    <has-relation relation="fUpdateTime" default-value-expr="currentDateTime()"/> 
  </concept>  
  <relation name="fHasReceivers" data-type="OA_DC_ReceiveRange" single-valued="true"> 
    <label language="zh_CN">公文收文范围</label> 
  </relation>  
  <relation name="fMastID" data-type="String" single-valued="true"> 
    <label language="zh_CN">fMastID</label> 
  </relation>  
  <relation name="fAttachmentPaper" data-type="String"> 
    <label language="zh_CN">发文稿纸</label> 
  </relation>  
  <relation name="fReason" data-type="String"> 
    <label language="zh_CN">事由</label> 
  </relation>  
  <relation name="fCopyReportDeptID" data-type="String"> 
    <label language="zh_CN">抄报单位ID</label> 
  </relation>  
  <relation name="fCopyReportDept" data-type="String"> 
    <label language="zh_CN">抄报单位</label> 
  </relation>  
  <relation name="fCheckOpinion" data-type="String"> 
    <label language="zh_CN">核稿意见</label> 
  </relation>  
  <relation name="fInternalSendDeptID" data-type="String"> 
    <label language="zh_CN">内发单位ID</label> 
  </relation>  
  <relation name="fInternalSendDeptName" data-type="String"> 
    <label language="zh_CN">内发单位</label> 
  </relation>  
  <relation name="fSuperPrintPsnID" data-type="String"> 
    <label language="zh_CN">监印人ID</label> 
  </relation>  
  <relation name="fSuperPrintPsnName" data-type="String"> 
    <label language="zh_CN">监印人</label> 
  </relation>  
  <relation name="fExtendPsnIDs1" data-type="String"> 
    <label language="zh_CN">人员IDs扩展字段1</label> 
  </relation>  
  <relation name="fExtendPsnNames1" data-type="String"> 
    <label language="zh_CN">人员Names扩展字段1</label> 
  </relation>  
  <relation name="fExtendPsnIDs2" data-type="String"> 
    <label language="zh_CN">人员IDs扩展字段2</label> 
  </relation>  
  <relation name="fExtendPsnNames2" data-type="String"> 
    <label language="zh_CN">人员Names扩展字段2</label> 
  </relation>  
  <relation name="fExtendPsnIDs3" data-type="String"> 
    <label language="zh_CN">人员IDs扩展字段3</label> 
  </relation>  
  <relation name="fExtendPsnNames3" data-type="String"> 
    <label language="zh_CN">人员Names扩展字段3</label> 
  </relation>  
  <relation name="fExtendPsnIDs4" data-type="String"> 
    <label language="zh_CN">人员IDs扩展字段4</label> 
  </relation>  
  <relation name="fExtendPsnNames4" data-type="String"> 
    <label language="zh_CN">人员Names扩展字段4</label> 
  </relation>  
  <concept name="OA_DC_SignPsn" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">公文会签人员</label>  
    <has-relation relation="fMasterID" data-type="String"> 
      <label language="zh_CN">主数据ID</label> 
    </has-relation>  
    <has-relation relation="fCounterSignID"> 
      <label language="zh_CN">会签人ID</label> 
    </has-relation>  
    <has-relation relation="fCounterSigner"> 
      <label language="zh_CN">会签人</label> 
    </has-relation>  
    <has-relation relation="fCounterSignFID" data-type="String"> 
      <label language="zh_CN">会签人FID</label> 
    </has-relation>  
    <has-relation relation="fCounterSignFName" data-type="String"> 
      <label language="zh_CN">会签人FNAME</label> 
    </has-relation>  
    <has-relation relation="fActivity" data-type="String"> 
      <label language="zh_CN">环节名称</label> 
    </has-relation>  
    <has-relation relation="fSignState" data-type="String"> 
      <label language="zh_CN">会签状态</label> 
    </has-relation>  
    <has-relation relation="fSignStateName" data-type="String"> 
      <label language="zh_CN">会签状态</label> 
    </has-relation> 
  </concept>  
  <concept name="V_OA_DC_ReadOpinion" default-value-expr="guid()"> 
    <label language="zh_CN">阅文处理情况</label>  
    <has-relation relation="fMasterID">
      <label language="zh_CN">主数据ID</label> 
    </has-relation>  
    <has-relation relation="fPersonID">
      <label language="zh_CN">人员ID</label> 
    </has-relation>  
    <has-relation relation="fPersonName">
      <label language="zh_CN">人员</label> 
    </has-relation>  
    <has-relation relation="fUpdateTime">
      <label language="zh_CN">修改时间</label> 
    </has-relation>  
    <has-relation relation="fActivityFName">
      <label language="zh_CN">环节路径</label> 
    </has-relation>  
    <has-relation relation="fOpinion">
      <label language="zh_CN">处理意见</label> 
    </has-relation>  
    <has-relation relation="fState">
      <label language="zh_CN">处理状态编码</label> 
    </has-relation> 
  </concept>   
  <relation name="fCounterSignFID" data-type="String"> 
    <label language="zh_CN">会签人FID</label> 
  </relation>  
  <relation name="fCounterSignFName" data-type="String"> 
    <label language="zh_CN">会签人FNAME</label> 
  </relation>  
  <relation name="fActivity" data-type="String"> 
    <label language="zh_CN">环节名称</label> 
  </relation>  
  <relation name="fSignState" data-type="String"> 
    <label language="zh_CN">会签状态</label> 
  </relation>  
  <relation name="fSignStateName" data-type="String"> 
    <label language="zh_CN">会签状态</label> 
  </relation> 
</model>
