<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
    
    
    
    
    
  <concept name="OA_CA_CarBasicInfo" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">车辆信息</label>  
    <has-relation relation="fCode"/>  
    <has-relation relation="fName"/>  
    <has-relation relation="fType"/>  
    <has-relation relation="fCarKindID"/>  
    <has-relation relation="fCarKindName"/>  
    <has-relation relation="fCheckPsnNum"/>  
    <has-relation relation="fCheckLoad"/>  
    <has-relation relation="fCheckOilConsumption"/>  
    <has-relation relation="fDisplacement"/>  
    <has-relation relation="fOilGrade"/>  
    <has-relation relation="fCarFrameNo"/>  
    <has-relation relation="fCarEngineNo"/>  
    <has-relation relation="fUseKindID"/>  
    <has-relation relation="fUseKindName"/>  
    <has-relation relation="fCarDriverID"/>  
    <has-relation relation="fCarDriverName"/>  
    <has-relation relation="fCarAppendix"/>  
    <has-relation relation="fDutyOgnID" default-value-expr="currentOgnID()"/>  
    <has-relation relation="fDutyOgnName" default-value-expr="currentOgnName()"/>  
    <has-relation relation="fDutyDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"/>  
    <has-relation relation="fDutyDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"/>  
    <has-relation relation="fDutyPsnID" default-value-expr="currentPersonID()"/>  
    <has-relation relation="fDutyPsnName" default-value-expr="currentPersonName()"/>  
    <has-relation relation="fDutyPsnFullID" default-value-expr="currentPersonMemberFID()"/>  
    <has-relation relation="fDutyPsnFullName" default-value-expr="currentPersonMemberFName()"/>  
    <has-relation relation="fCreateOgnID" default-value-expr="currentOgnID()"/>  
    <has-relation relation="fCreateOgnName" default-value-expr="currentOgnName()"/>  
    <has-relation relation="fCreateDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"/>  
    <has-relation relation="fCreateDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"/>  
    <has-relation relation="fCreatePosID" default-value-expr="currentPosID()"/>  
    <has-relation relation="fCreatePosName" default-value-expr="currentPosName()"/>  
    <has-relation relation="fCreatePsnID" default-value-expr="operatorID()"/>  
    <has-relation relation="fCreatePsnName" default-value-expr="operatorName()"/>  
    <has-relation relation="fCreatePsnFID" default-value-expr="currentPersonMemberFID()"/>  
    <has-relation relation="fCreatePsnFName" default-value-expr="currentPersonMemberFName()"/>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fUpdatePsnID" default-value-expr="operatorID()"/>  
    <has-relation relation="fUpdatePsnName" default-value-expr="operatorName()"/>  
    <has-relation relation="fUpdateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fPhoto" data-type="String"/>  
    <has-relation relation="fUseStatus" data-type="Integer" default-value-expr="0"/>  
    <has-relation relation="fUseStatusName" default-value-expr="'未启用'"/>  
    <has-relation relation="fDisUseTime"/>  
    <has-relation relation="fEquipmentNo"/>  
    <has-relation relation="fOriginValue" data-type="Decimal"/>  
    <has-relation relation="fRemainValue" data-type="Decimal"/>  
    <has-relation relation="fRemark"/>  
    <has-relation relation="fEquipmentID"/> 
  </concept>  
  <concept name="OA_CA_DriverBasicInfo" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">司机信息</label>  
    <has-relation relation="fCode" default-value-expr="nextSeqString(format('%1$tY%1$tm%1$td', currentDateTime()),'000')"/>  
    <has-relation relation="fName"/>  
    <has-relation relation="fBirthday" data-type="Date"/>  
    <has-relation relation="fAge"/>  
    <has-relation relation="fSex"/>  
    <has-relation relation="fDrivingLicence"/>  
    <has-relation relation="fSendLicenceDate" data-type="Date"/>  
    <has-relation relation="fCarLicenceLife" data-type="Date"/>  
    <has-relation relation="fCarKindID"/>  
    <has-relation relation="fCarKindName"/>  
    <has-relation relation="fDrivingYears"/>  
    <has-relation relation="fTelephone"/>  
    <has-relation relation="fMobilePhone"/>  
    <has-relation relation="fAddress"/>  
    <has-relation relation="fWorkUnits"/>  
    <has-relation relation="fWorkHistory"/>  
    <has-relation relation="fRemark"/>  
    <has-relation relation="fCreateOgnID" default-value-expr="currentOgnID()"/>  
    <has-relation relation="fCreateOgnName" default-value-expr="currentOgnName()"/>  
    <has-relation relation="fCreateDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"/>  
    <has-relation relation="fCreateDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"/>  
    <has-relation relation="fCreatePosID" default-value-expr="currentPosID()"/>  
    <has-relation relation="fCreatePosName" default-value-expr="currentPosName()"/>  
    <has-relation relation="fCreatePsnID" default-value-expr="operatorID()"/>  
    <has-relation relation="fCreatePsnName" default-value-expr="operatorName()"/>  
    <has-relation relation="fCreatePsnFID" default-value-expr="currentPersonMemberFID()"/>  
    <has-relation relation="fCreatePsnFName" default-value-expr="currentPersonMemberFName()"/>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fUpdatePsnID" default-value-expr="operatorID()"/>  
    <has-relation relation="fUpdatePsnName" default-value-expr="operatorName()"/>  
    <has-relation relation="fUpdateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fPhoto" data-type="String"/>  
    <has-relation relation="fUseStatus" data-type="Integer" default-value-expr="0"/>  
    <has-relation relation="fUseStatusName" default-value-expr="'未启用'"/>  
    <has-relation relation="fDisUseTime"/> 
  </concept>  
  <concept name="OA_CA_CarYearCheckInfo" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">年检情况</label>  
    <has-relation relation="fMasterID"/>  
    <has-relation relation="fYearCensorDate" data-type="Date"/>  
    <has-relation relation="fYearCensorItem"/>  
    <has-relation relation="fYearCensorCircs"/>  
    <has-relation relation="fNextYearCensorDate" data-type="Date"/>  
    <has-relation relation="fRemark" data-type="String"/>  
    <has-relation relation="fYearCensorItemID"/> 
  </concept>  
  <concept name="OA_CA_CarSafetyInfo" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">保险情况</label>  
    <has-relation relation="fMasterID"/>  
    <has-relation relation="fJoinSafetyDate" data-type="Date"/>  
    <has-relation relation="fInsurer"/>  
    <has-relation relation="fPolicyHolderCircs"/>  
    <has-relation relation="fOutSafetyDate" data-type="Date"/>  
    <has-relation relation="fRemark" data-type="String"/> 
  </concept>  
    
  <concept name="OA_AS_Card" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">资产卡片</label>  
    <has-relation relation="fCode"/>  
    <has-relation relation="fName"/>  
    <has-relation relation="fStatus"/>  
    <has-relation relation="fStatusName"/>  
    <has-relation relation="fKindID"/>  
    <has-relation relation="fKind"/>  
    <has-relation relation="fOriginValue" data-type="Decimal"/>  
    <has-relation relation="fRemainValue" data-type="Decimal"/>  
    <has-relation relation="fRemark" data-type="String"/> 
  </concept>  
  <concept name="OA_CA_CarUseApply" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">用车申请(主表)</label>  
    <has-relation relation="fNO" default-value-expr="nextSeqString(format('YCSQ%1$tY%1$tm%1$td', currentDateTime()),'000')"/>  
    <has-relation relation="fApplyOgnID" default-value-expr="currentOgnID()"/>  
    <has-relation relation="fApplyOgnName" default-value-expr="currentOgnName()"/>  
    <has-relation relation="fApplyDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"/>  
    <has-relation relation="fApplyDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"/>  
    <has-relation relation="fApplyPosID" default-value-expr="currentPosID()"/>  
    <has-relation relation="fApplyPosName" default-value-expr="currentPosName()"/>  
    <has-relation relation="fApplyPsnID" default-value-expr="operatorID()"/>  
    <has-relation relation="fApplyPsnName" default-value-expr="operatorName()"/>  
    <has-relation relation="fApplyPsnFID" default-value-expr="currentPersonMemberFID()"/>  
    <has-relation relation="fApplyPsnFName" default-value-expr="currentPersonMemberFName()"/>  
    <has-relation relation="fApplyDate" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fPersonCount"/>  
    <has-relation relation="fDestination"/>  
    <has-relation relation="fTelephone"/>  
    <has-relation relation="fBeginTime"/>  
    <has-relation relation="fEndTime"/>  
    <has-relation relation="fIsRoundtrip"/>  
    <has-relation relation="fApplyReason"/>  
    <has-relation relation="fDriveCircuit"/>  
    <has-relation relation="fRemark" data-type="String"/>  
    <has-relation relation="fBizState" default-value-expr="'bsEditing'"/>  
    <has-relation relation="fBizStateName" default-value-expr="'编辑中'"/>  
    <has-relation relation="fCreateOgnID" default-value-expr="currentOgnID()"/>  
    <has-relation relation="fCreateOgnName" default-value-expr="currentOgnName()"/>  
    <has-relation relation="fCreateDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"/>  
    <has-relation relation="fCreateDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"/>  
    <has-relation relation="fCreatePosID" default-value-expr="currentPosID()"/>  
    <has-relation relation="fCreatePosName" default-value-expr="currentPosName()"/>  
    <has-relation relation="fCreatePsnID" default-value-expr="operatorID()"/>  
    <has-relation relation="fCreatePsnName" default-value-expr="operatorName()"/>  
    <has-relation relation="fCreatePsnFID" default-value-expr="currentPersonMemberFID()"/>  
    <has-relation relation="fCreatePsnFName" default-value-expr="currentPersonMemberFName()"/>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fUpdatePsnID" default-value-expr="operatorID()"/>  
    <has-relation relation="fUpdatePsnName" default-value-expr="operatorName()"/>  
    <has-relation relation="fUpdateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fCurrentActivities"/>  
    <has-relation relation="fCurrentExecutors"/>  
    <has-relation relation="fIsArrange" data-type="Integer" default-value-expr="0"/> 
  </concept>  
  <concept name="OA_CA_CarUseExecute" default-value-expr="guid()"> 
    <has-relation relation="fMasterID" data-type="OA_CA_CarUseApply"/>  
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
    <label language="zh_CN">用车申请(处理表)</label> 
  </concept>  
  <concept name="OA_CA_CarUseArrange" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">用车申请(安排)</label>  
    <has-relation relation="fMasterID"/>  
    <has-relation relation="fCarDriverID"/>  
    <has-relation relation="fCarDriverName"/>  
    <has-relation relation="fCode"> 
      <label language="zh_CN">车牌号</label> 
    </has-relation>  
    <has-relation relation="fName"> 
      <label language="zh_CN">品牌</label> 
    </has-relation>  
    <has-relation relation="fCarKindID"/>  
    <has-relation relation="fCarKindName"/>  
    <has-relation relation="fTelephone"/>  
    <has-relation relation="fArgnPsnID" default-value-expr="operatorID()"/>  
    <has-relation relation="fArgnPsnName" default-value-expr="operatorName()"/>  
    <has-relation relation="fCarID"/> 
  </concept>  
  <concept name="OA_CA_CarManage" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">用车管理</label>  
    <has-relation relation="fNO" default-value-expr="nextSeqString(format('YCAP%1$tY%1$tm%1$td', currentDateTime()),'000')"/>  
    <has-relation relation="fApplyOgnID" default-value-expr="currentOgnID()"/>  
    <has-relation relation="fApplyOgnName" default-value-expr="currentOgnName()"/>  
    <has-relation relation="fApplyDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"/>  
    <has-relation relation="fApplyDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"/>  
    <has-relation relation="fApplyPosID" default-value-expr="currentPosID()"/>  
    <has-relation relation="fApplyPosName" default-value-expr="currentPosName()"/>  
    <has-relation relation="fApplyPsnID" default-value-expr="operatorID()"/>  
    <has-relation relation="fApplyPsnName" default-value-expr="operatorName()"/>  
    <has-relation relation="fApplyPsnFID" default-value-expr="currentPersonMemberFID()"/>  
    <has-relation relation="fApplyPsnFName" default-value-expr="currentPersonMemberFName()"/>  
    <has-relation relation="fApplyDate" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fPersonCount"/>  
    <has-relation relation="fDestination"/>  
    <has-relation relation="fTelephone"/>  
    <has-relation relation="fBeginTime"/>  
    <has-relation relation="fEndTime"/>  
    <has-relation relation="fIsRoundtrip"/>  
    <has-relation relation="fApplyReason"/>  
    <has-relation relation="fDriveCircuit"/>  
    <has-relation relation="fRemark" data-type="String"/>  
    <has-relation relation="fCreateOgnID" default-value-expr="currentOgnID()"/>  
    <has-relation relation="fCreateOgnName" default-value-expr="currentOgnName()"/>  
    <has-relation relation="fCreateDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"/>  
    <has-relation relation="fCreateDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"/>  
    <has-relation relation="fCreatePosID" default-value-expr="currentPosID()"/>  
    <has-relation relation="fCreatePosName" default-value-expr="currentPosName()"/>  
    <has-relation relation="fCreatePsnID" default-value-expr="operatorID()"/>  
    <has-relation relation="fCreatePsnName" default-value-expr="operatorName()"/>  
    <has-relation relation="fCreatePsnFID" default-value-expr="currentPersonMemberFID()"/>  
    <has-relation relation="fCreatePsnFName" default-value-expr="currentPersonMemberFName()"/>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fUpdatePsnID" default-value-expr="operatorID()"/>  
    <has-relation relation="fUpdatePsnName" default-value-expr="operatorName()"/>  
    <has-relation relation="fUpdateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fIsFlow" default-value-expr="0"/> 
  </concept>  
  <concept name="OA_CA_CarManageArrange" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">用车管理安排</label>  
    <has-relation relation="fMasterID"/>  
    <has-relation relation="fCarDriverID"/>  
    <has-relation relation="fCarDriverName"/>  
    <has-relation relation="fCode"> 
      <label language="zh_CN">车牌号</label> 
    </has-relation>  
    <has-relation relation="fName"> 
      <label language="zh_CN">品牌</label> 
    </has-relation>  
    <has-relation relation="fCarKindID"/>  
    <has-relation relation="fCarKindName"/>  
    <has-relation relation="fTelephone"/>  
    <has-relation relation="fArgnPsnID" default-value-expr="operatorID()"/>  
    <has-relation relation="fArgnPsnName" default-value-expr="operatorName()"/>  
    <has-relation relation="fCarID"/>  
    <has-relation relation="fEffect"/> 
  </concept>  
  <concept name="OA_CA_PeccancyRecord" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">违章登记</label>  
    <has-relation relation="fCode" unique="true"> 
      <label language="zh_CN">车牌号码</label> 
    </has-relation>  
    <has-relation relation="fName"> 
      <label language="zh_CN">品牌</label> 
    </has-relation>  
    <has-relation relation="fType"/>  
    <has-relation relation="fCarKindID"/>  
    <has-relation relation="fCarKindName"/>  
    <has-relation relation="fPeccancyTime" default-value-expr="currentDateTime()" data-type="DateTime"/>  
    <has-relation relation="fPeccancyPerID"/>  
    <has-relation relation="fPeccancyPerName"/>  
    <has-relation relation="fPeccancySite"/>  
    <has-relation relation="fPeccancyTypeID"/>  
    <has-relation relation="fPeccancyType"/>  
    <has-relation relation="fPeccancyPay" data-type="Decimal"/>  
    <has-relation relation="fPeccancyScore" data-type="Decimal"/>  
    <has-relation relation="fRemark" data-type="String"> 
      <label language="zh_CN">情况说明</label> 
    </has-relation>  
    <has-relation relation="fCreateOgnID" default-value-expr="currentOgnID()"/>  
    <has-relation relation="fCreateOgnName" default-value-expr="currentOgnName()"/>  
    <has-relation relation="fCreateDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"/>  
    <has-relation relation="fCreateDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"/>  
    <has-relation relation="fCreatePosID" default-value-expr="currentPosID()"/>  
    <has-relation relation="fCreatePosName" default-value-expr="currentPosName()"/>  
    <has-relation relation="fCreatePsnID" default-value-expr="operatorID()"/>  
    <has-relation relation="fCreatePsnName" default-value-expr="operatorName()"/>  
    <has-relation relation="fCreatePsnFID" default-value-expr="currentPersonMemberFID()"/>  
    <has-relation relation="fCreatePsnFName" default-value-expr="currentPersonMemberFName()"/>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fUpdatePsnID" default-value-expr="operatorID()"/>  
    <has-relation relation="fUpdatePsnName" default-value-expr="operatorName()"/>  
    <has-relation relation="fUpdateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fCarID"/> 
  </concept>  
  <concept name="OA_CA_AccidentRecord" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">事故登记</label>  
    <has-relation relation="fCode"> 
      <label language="zh_CN">车牌号</label> 
    </has-relation>  
    <has-relation relation="fName"> 
      <label language="zh_CN">品牌</label> 
    </has-relation>  
    <has-relation relation="fType"/>  
    <has-relation relation="fCarKindID"/>  
    <has-relation relation="fCarKindName"/>  
    <has-relation relation="fAccidentDeptID"/>  
    <has-relation relation="fAccidentDeptName"> 
      <label language="zh_CN">肇事单位</label> 
    </has-relation>  
    <has-relation relation="fAccidentPerID"/>  
    <has-relation relation="fAccidentPerName"/>  
    <has-relation relation="fAccidentTime" data-type="DateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fAccidentSite"/>  
    <has-relation relation="fAcccidentBurden"/>  
    <has-relation relation="fWoundedDetail"/>  
    <has-relation relation="fEconomyLoss" data-type="Decimal"/>  
    <has-relation relation="fAmerce" data-type="Decimal"/>  
    <has-relation relation="fFactPayment" data-type="Decimal"/>  
    <has-relation relation="fPayDifference" data-type="Decimal"/>  
    <has-relation relation="fAccidentPass"/>  
    <has-relation relation="fPhoto" data-type="String"> 
      <label language="zh_CN">现场照片</label> 
    </has-relation>  
    <has-relation relation="fCreateOgnID" default-value-expr="currentOgnID()"/>  
    <has-relation relation="fCreateOgnName" default-value-expr="currentOgnName()"/>  
    <has-relation relation="fCreateDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"/>  
    <has-relation relation="fCreateDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"/>  
    <has-relation relation="fCreatePosID" default-value-expr="currentPosID()"/>  
    <has-relation relation="fCreatePosName" default-value-expr="currentPosName()"/>  
    <has-relation relation="fCreatePsnID" default-value-expr="operatorID()"/>  
    <has-relation relation="fCreatePsnName" default-value-expr="operatorName()"/>  
    <has-relation relation="fCreatePsnFID" default-value-expr="currentPersonMemberFID()"/>  
    <has-relation relation="fCreatePsnFName" default-value-expr="currentPersonMemberFName()"/>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fUpdatePsnID" default-value-expr="operatorID()"/>  
    <has-relation relation="fUpdatePsnName" default-value-expr="operatorName()"/>  
    <has-relation relation="fUpdateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fCarID"/> 
  </concept>  
  <concept name="OA_CA_CarRecord" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">用车登记</label>  
    <has-relation relation="fUseApplyID"/>  
    <has-relation relation="fCarID"/>  
    <has-relation relation="fCode"> 
      <label language="zh_CN">车牌号</label> 
    </has-relation>  
    <has-relation relation="fName"> 
      <label language="zh_CN">品牌型号</label> 
    </has-relation>  
    <has-relation relation="fCarDriverID"/>  
    <has-relation relation="fCarDriverName"/>  
    <has-relation relation="fApplyDeptID"/>  
    <has-relation relation="fApplyDeptName"/>  
    <has-relation relation="fApplyPsnID"/>  
    <has-relation relation="fApplyPsnName"/>  
    <has-relation relation="fBeginTime"/>  
    <has-relation relation="fEndTime"/>  
    <has-relation relation="fBeginMileage" default-value-expr="0.0" data-type="Decimal"/>  
    <has-relation relation="fEndMileage" default-value-expr="0.0" data-type="Decimal"/>  
    <has-relation relation="fMileage" default-value-expr="0.0" data-type="Decimal"/>  
    <has-relation relation="fTotalCharge" data-type="Decimal" default-value-expr="0.0"/>  
    <has-relation relation="fRemark" data-type="String"/>  
    <has-relation relation="fCreateOgnID" default-value-expr="currentOgnID()"/>  
    <has-relation relation="fCreateOgnName" default-value-expr="currentOgnName()"/>  
    <has-relation relation="fCreateDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"/>  
    <has-relation relation="fCreateDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"/>  
    <has-relation relation="fCreatePosID" default-value-expr="currentPosID()"/>  
    <has-relation relation="fCreatePosName" default-value-expr="currentPosName()"/>  
    <has-relation relation="fCreatePsnID" default-value-expr="operatorID()"/>  
    <has-relation relation="fCreatePsnName" default-value-expr="operatorName()"/>  
    <has-relation relation="fCreatePsnFID" default-value-expr="currentPersonMemberFID()"/>  
    <has-relation relation="fCreatePsnFName" default-value-expr="currentPersonMemberFName()"/>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fUpdatePsnID" default-value-expr="operatorID()"/>  
    <has-relation relation="fUpdatePsnName" default-value-expr="operatorName()"/>  
    <has-relation relation="fUpdateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fNO"/>  
    <has-relation relation="fStatus" default-value-expr="0"> 
      <label language="zh_CN">状态</label> 
    </has-relation>  
    <has-relation relation="fStatusName" default-value-expr="'已提交'"> 
      <label language="zh_CN">状态名称</label> 
    </has-relation> 
  </concept>  
  <concept name="OA_CA_CarRecordFeeDetail" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">费用明细</label>  
    <has-relation relation="fMasterID"/>  
    <has-relation relation="fChargeTypeID"/>  
    <has-relation relation="fChargeTypeName"/>  
    <has-relation relation="fAmount" data-type="Decimal"/>  
    <has-relation relation="fDescription"/> 
  </concept>  
  <relation name="fDrivingLicence" data-type="String" single-valued="true"> 
    <label language="zh_CN">驾驶证号</label> 
  </relation>  
  <relation name="fSendLicenceDate" data-type="Date" single-valued="true"> 
    <label language="zh_CN">发证日期</label> 
  </relation>  
  <relation name="fCarLicenceLife" data-type="Date" single-valued="true"> 
    <label language="zh_CN">证件有效期</label> 
  </relation>  
  <relation name="fCarKindID" data-type="String" single-valued="true"> 
    <label language="zh_CN">车辆类型ID</label> 
  </relation>  
  <relation name="fCarKindName" data-type="String" single-valued="true"> 
    <label language="zh_CN">车辆类型</label> 
  </relation>  
  <relation name="fDrivingYears" data-type="String" single-valued="true"> 
    <label language="zh_CN">驾龄</label> 
  </relation>  
  <relation name="fWorkUnits" data-type="String" single-valued="true"> 
    <label language="zh_CN">单位</label> 
  </relation>  
  <relation name="fWorkHistory" data-type="String" single-valued="true"> 
    <label language="zh_CN">工作经验</label> 
  </relation>  
  <relation name="fPhoto" data-type="String" single-valued="true"> 
    <label language="zh_CN">图片</label> 
  </relation>  
  <relation name="fType" data-type="String" single-valued="true"> 
    <label language="zh_CN">型号</label> 
  </relation>  
  <relation name="fCheckPsnNum" data-type="Integer" single-valued="true"> 
    <label language="zh_CN">核定载人</label> 
  </relation>  
  <relation name="fCheckLoad" data-type="String" single-valued="true"> 
    <label language="zh_CN">核定载重</label> 
  </relation>  
  <relation name="fCheckOilConsumption" data-type="String" single-valued="true"> 
    <label language="zh_CN">核定油耗</label> 
  </relation>  
  <relation name="fDisplacement" data-type="String" single-valued="true"> 
    <label language="zh_CN">排气量</label> 
  </relation>  
  <relation name="fOilGrade" data-type="String" single-valued="true"> 
    <label language="zh_CN">用油标号</label> 
  </relation>  
  <relation name="fCarFrameNo" data-type="String" single-valued="true"> 
    <label language="zh_CN">车架号码</label> 
  </relation>  
  <relation name="fCarEngineNo" data-type="String" single-valued="true"> 
    <label language="zh_CN">发动机号</label> 
  </relation>  
  <relation name="fUseKindID" data-type="String" single-valued="true"> 
    <label language="zh_CN">使用性质ID</label> 
  </relation>  
  <relation name="fUseKindName" data-type="String" single-valued="true"> 
    <label language="zh_CN">使用性质</label> 
  </relation>  
  <relation name="fCarDriverID" data-type="String" single-valued="true"> 
    <label language="zh_CN">司机ID</label> 
  </relation>  
  <relation name="fCarDriverName" data-type="String" single-valued="true"> 
    <label language="zh_CN">司机</label> 
  </relation>  
  <relation name="fCarAppendix" data-type="String" single-valued="true"> 
    <label language="zh_CN">车内附属物品</label> 
  </relation>  
  <relation name="fDutyOgnID" data-type="String" single-valued="true"> 
    <label language="zh_CN">所属机构ID</label> 
  </relation>  
  <relation name="fDutyOgnName" data-type="String" single-valued="true"> 
    <label language="zh_CN">所属机构</label> 
  </relation>  
  <relation name="fDutyDeptID" data-type="String" single-valued="true"> 
    <label language="zh_CN">责任部门ID</label> 
  </relation>  
  <relation name="fDutyDeptName" data-type="String" single-valued="true"> 
    <label language="zh_CN">责任部门</label> 
  </relation>  
  <relation name="fDutyPsnID" data-type="String" single-valued="true"> 
    <label language="zh_CN">责任人ID</label> 
  </relation>  
  <relation name="fDutyPsnName" data-type="String" single-valued="true"> 
    <label language="zh_CN">责任人</label> 
  </relation>  
  <relation name="fDutyPsnFullID" data-type="String" single-valued="true"> 
    <label language="zh_CN">责任人FullID</label> 
  </relation>  
  <relation name="fDutyPsnFullName" data-type="String" single-valued="true"> 
    <label language="zh_CN">责任人FullName</label> 
  </relation>  
  <relation name="fEquipmentNo" data-type="String" single-valued="true"> 
    <label language="zh_CN">资产编号</label> 
  </relation>  
  <relation name="fOriginValue" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">资产原值</label> 
  </relation>  
  <relation name="fRemainValue" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">资产净值</label> 
  </relation>  
  <relation name="fYearCensorDate" data-type="Date" single-valued="true"> 
    <label language="zh_CN">年审日期</label> 
  </relation>  
  <relation name="fYearCensorItem" data-type="String" single-valued="true"> 
    <label language="zh_CN">年审项目</label> 
  </relation>  
  <relation name="fYearCensorCircs" data-type="String" single-valued="true"> 
    <label language="zh_CN">年审情况</label> 
  </relation>  
  <relation name="fNextYearCensorDate" data-type="Date" single-valued="true"> 
    <label language="zh_CN">下次年审日期</label> 
  </relation>  
  <relation name="fJoinSafetyDate" data-type="Date" single-valued="true"> 
    <label language="zh_CN">入保日期</label> 
  </relation>  
  <relation name="fInsurer" data-type="String" single-valued="true"> 
    <label language="zh_CN">保险公司</label> 
  </relation>  
  <relation name="fPolicyHolderCircs" data-type="String" single-valued="true"> 
    <label language="zh_CN">投保情况</label> 
  </relation>  
  <relation name="fOutSafetyDate" data-type="Date" single-valued="true"> 
    <label language="zh_CN">出保日期</label> 
  </relation>  
  <relation name="fEquipmentID" data-type="String" single-valued="true"> 
    <label language="zh_CN">资产ID</label> 
  </relation>  
  <relation name="fStatus" data-type="Integer" single-valued="true"> 
    <label language="zh_CN">状态</label> 
  </relation>  
  <relation name="fStatusName" data-type="String" single-valued="true"> 
    <label language="zh_CN">状态</label> 
  </relation>  
  <relation name="fPersonCount" data-type="Integer" single-valued="true"> 
    <label language="zh_CN">乘车人数</label> 
  </relation>  
  <relation name="fDestination" data-type="String" single-valued="true"> 
    <label language="zh_CN">目的地</label> 
  </relation>  
  <relation name="fIsRoundtrip" data-type="String" single-valued="true"> 
    <label language="zh_CN">是否往返</label> 
  </relation>  
  <relation name="fApplyReason" data-type="String" single-valued="true"> 
    <label language="zh_CN">用车事由</label> 
  </relation>  
  <relation name="fDriveCircuit" data-type="String" single-valued="true"> 
    <label language="zh_CN">行车路线</label> 
  </relation>  
  <relation name="fKindID" data-type="String" single-valued="true"> 
    <label language="zh_CN">资产类别ID</label> 
  </relation>  
  <relation name="fKind" data-type="String" single-valued="true"> 
    <label language="zh_CN">资产类别</label> 
  </relation>  
  <relation name="fYearCensorItemID" data-type="String" single-valued="true"> 
    <label language="zh_CN">年审项目ID</label> 
  </relation>  
  <relation name="fArgnPsnID" data-type="String" single-valued="true"> 
    <label language="zh_CN">派车人ID</label> 
  </relation>  
  <relation name="fArgnPsnName" data-type="String" single-valued="true"> 
    <label language="zh_CN">派车人</label> 
  </relation>  
  <relation name="fPeccancyTime" data-type="DateTime" single-valued="true"> 
    <label language="zh_CN">违章时间</label> 
  </relation>  
  <relation name="fPeccancyPerID" data-type="String" single-valued="true"> 
    <label language="zh_CN">违章人ID</label> 
  </relation>  
  <relation name="fPeccancyPerName" data-type="String" single-valued="true"> 
    <label language="zh_CN">违章人</label> 
  </relation>  
  <relation name="fPeccancySite" data-type="String" single-valued="true"> 
    <label language="zh_CN">违章地点</label> 
  </relation>  
  <relation name="fPeccancyTypeID" data-type="String" single-valued="true"> 
    <label language="zh_CN">违章类型ID</label> 
  </relation>  
  <relation name="fPeccancyType" data-type="String" single-valued="true"> 
    <label language="zh_CN">违章类型</label> 
  </relation>  
  <relation name="fPeccancyPay" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">罚款金额</label> 
  </relation>  
  <relation name="fPeccancyScore" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">扣分</label> 
  </relation>  
  <relation name="fAccidentDeptID" data-type="String" single-valued="true"> 
    <label language="zh_CN">肇事单位ID</label> 
  </relation>  
  <relation name="fAccidentDeptName" data-type="String" single-valued="true"> 
    <label language="zh_CN">肇事单位名称</label> 
  </relation>  
  <relation name="fAccidentPerID" data-type="String" single-valued="true"> 
    <label language="zh_CN">肇事人ID</label> 
  </relation>  
  <relation name="fAccidentPerName" data-type="String" single-valued="true"> 
    <label language="zh_CN">肇事人</label> 
  </relation>  
  <relation name="fAccidentTime" data-type="String" single-valued="true"> 
    <label language="zh_CN">肇事时间</label> 
  </relation>  
  <relation name="fAccidentSite" data-type="String" single-valued="true"> 
    <label language="zh_CN">肇事地点</label> 
  </relation>  
  <relation name="fAcccidentBurden" data-type="String" single-valued="true"> 
    <label language="zh_CN">事故责任</label> 
  </relation>  
  <relation name="fWoundedDetail" data-type="String" single-valued="true"> 
    <label language="zh_CN">伤亡情况</label> 
  </relation>  
  <relation name="fEconomyLoss" data-type="String" single-valued="true"> 
    <label language="zh_CN">经济损失</label> 
  </relation>  
  <relation name="fAmerce" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">罚款</label> 
  </relation>  
  <relation name="fFactPayment" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">实际赔偿费</label> 
  </relation>  
  <relation name="fPayDifference" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">索赔差额</label> 
  </relation>  
  <relation name="fAccidentPass" data-type="String" single-valued="true"> 
    <label language="zh_CN">事故经过</label> 
  </relation>  
  <relation name="fCardID" data-type="String" single-valued="true"> 
    <label language="zh_CN">车辆ID</label> 
  </relation>  
  <relation name="fIsFlow" data-type="Integer" single-valued="true"> 
    <label language="zh_CN">是否流程</label> 
  </relation>  
  <relation name="fCarID" data-type="String" single-valued="true"> 
    <label language="zh_CN">车辆ID</label> 
  </relation>  
  <relation name="fEffect" data-type="Integer" single-valued="true"> 
    <label language="zh_CN">是否有效</label> 
  </relation>  
  <relation name="fUseApplyID" data-type="String" single-valued="true"> 
    <label language="zh_CN">用车申请ID</label> 
  </relation>  
  <relation name="fBeginMileage" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">起始公里数</label> 
  </relation>  
  <relation name="fEndMileage" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">结束公里数</label> 
  </relation>  
  <relation name="fMileage" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">本次公里数</label> 
  </relation>  
  <relation name="fTotalCharge" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">总费用</label> 
  </relation>  
  <relation name="fChargeTypeID" data-type="String" single-valued="true"> 
    <label language="zh_CN">费用类型ID</label> 
  </relation>  
  <relation name="fChargeTypeName" data-type="String" single-valued="true"> 
    <label language="zh_CN">费用类型</label> 
  </relation>  
  <relation name="fIsArrange" data-type="Integer" single-valued="true"> 
    <label language="zh_CN">是否安排</label> 
  </relation>  
  <concept name="OA_CA_FeesRegister" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0">
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">用车费用登记</label>  
    <has-relation relation="fYear" data-type="Integer" default-value-expr="yearOf(currentDate())">
      <label language="zh_CN">年份</label> 
    </has-relation>  
    <has-relation relation="fMonth" data-type="Integer" default-value-expr="monthOf(currentDate())">
      <label language="zh_CN">月份</label> 
    </has-relation>  
    <has-relation relation="fCarID" data-type="String" size="32">
      <label language="zh_CN">车辆ID</label> 
    </has-relation>  
    <has-relation relation="fCarName" data-type="String" size="64">
      <label language="zh_CN">车辆名称</label> 
    </has-relation>  
    <has-relation relation="fCarNO" data-type="String" size="32">
      <label language="zh_CN">车牌号</label> 
    </has-relation>  
    <has-relation relation="fFixedParkFee" data-type="Float" size="10" scale="2">
      <label language="zh_CN">固定停车费</label> 
    </has-relation>  
    <has-relation relation="fTempParkFee" data-type="Float" size="10" scale="2">
      <label language="zh_CN">临时停车费</label> 
    </has-relation>  
    <has-relation relation="fReimbLoadToll" data-type="Float" size="10" scale="2">
      <label language="zh_CN">报销路桥费</label> 
    </has-relation>  
    <has-relation relation="fETCRoadToll" data-type="Float" size="10" scale="2">
      <label language="zh_CN">ETC路桥费</label> 
    </has-relation>  
    <has-relation relation="fDriverRepairFee" data-type="Float" size="10" scale="2">
      <label language="zh_CN">司机修理费</label> 
    </has-relation>  
    <has-relation relation="fManagerFee" data-type="Float" size="10" scale="2">
      <label language="zh_CN">管理费</label> 
    </has-relation>  
    <has-relation relation="fOilFee" data-type="Float" size="10" scale="2">
      <label language="zh_CN">油费</label> 
    </has-relation>  
    <has-relation relation="fLiters" data-type="Float" size="10" scale="2">
      <label language="zh_CN">升</label> 
    </has-relation>  
    <has-relation relation="fVehicleFee" data-type="Float" size="10" scale="2">
      <label language="zh_CN">验车费</label> 
    </has-relation>  
    <has-relation relation="fReimbFee" data-type="Float" size="10" scale="2">
      <label language="zh_CN">报销费</label> 
    </has-relation>  
    <has-relation relation="fPassageFee" data-type="Float" size="10" scale="2">
      <label language="zh_CN">通行费</label> 
    </has-relation>  
    <has-relation relation="fVehicleTax" data-type="Float" size="10" scale="2">
      <label language="zh_CN">车辆税</label> 
    </has-relation>  
    <has-relation relation="fTransportFee" data-type="Float" size="10" scale="2">
      <label language="zh_CN">交通费</label> 
    </has-relation>  
    <has-relation relation="fMedicalExamFee" data-type="Float" size="10" scale="2">
      <label language="zh_CN">体检费</label> 
    </has-relation>  
    <has-relation relation="fOfficeFee" data-type="Float" size="10" scale="2">
      <label language="zh_CN">办公费</label> 
    </has-relation>  
    <has-relation relation="fCommunicatFee" data-type="Float" size="10" scale="2">
      <label language="zh_CN">通讯费</label> 
    </has-relation>  
    <has-relation relation="fAccidentInsurance" data-type="Float" size="10" scale="2">
      <label language="zh_CN">意外保险</label> 
    </has-relation>  
    <has-relation relation="fOverTimeDays" data-type="Float" size="10" scale="2">
      <label language="zh_CN">加班天数</label> 
    </has-relation>  
    <has-relation relation="fOtherFees" data-type="Float" size="10" scale="2">
      <label language="zh_CN">其它</label> 
    </has-relation>  
    <has-relation relation="fHundredKmOilFeul" data-type="Float" size="10" scale="2">
      <label language="zh_CN">百公里油耗</label> 
    </has-relation>  
    <has-relation relation="fUsersID" data-type="String">
      <label language="zh_CN">使用者ID</label> 
    </has-relation>  
    <has-relation relation="fUsersName" data-type="String">
      <label language="zh_CN">使用者</label> 
    </has-relation>  
    <has-relation relation="fRemark" data-type="String">
      <label language="zh_CN">备注</label> 
    </has-relation>  
    <has-relation relation="fCreateOgnID" default-value-expr="currentOgnID()" size="32">
      <label language="zh_CN">提交机构ID</label> 
    </has-relation>  
    <has-relation relation="fCreateOgnName" default-value-expr="currentOgnName()" size="64">
      <label language="zh_CN">提交机构</label> 
    </has-relation>  
    <has-relation relation="fCreateDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"
      size="32">
      <label language="zh_CN">提交部门ID</label> 
    </has-relation>  
    <has-relation relation="fCreateDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"
      size="64">
      <label language="zh_CN">提交部门</label> 
    </has-relation>  
    <has-relation relation="fCreatePosID" default-value-expr="currentPosID()" size="32">
      <label language="zh_CN">提交岗位ID</label> 
    </has-relation>  
    <has-relation relation="fCreatePosName" default-value-expr="currentPosName()" size="64">
      <label language="zh_CN">提交岗位</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnID" default-value-expr="operatorID()" size="32">
      <label language="zh_CN">提交人员ID</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnName" default-value-expr="operatorName()" size="64">
      <label language="zh_CN">提交人员</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnFID" default-value-expr="currentPersonMemberFID()"
      size="512">
      <label language="zh_CN">提交人员FullID</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnFName" default-value-expr="currentPersonMemberFName()"
      size="1024">
      <label language="zh_CN">提交人员FullName</label> 
    </has-relation>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()">
      <label language="zh_CN">提交时间</label> 
    </has-relation>  
    <has-relation relation="fUpdatePsnID" default-value-expr="operatorID()" size="32">
      <label language="zh_CN">修改人员ID</label> 
    </has-relation>  
    <has-relation relation="fUpdatePsnName" default-value-expr="operatorName()" size="64">
      <label language="zh_CN">修改人员</label> 
    </has-relation>  
    <has-relation relation="fUpdateTime" default-value-expr="currentDateTime()">
      <label language="zh_CN">修改时间</label> 
    </has-relation> 
  </concept>       
  <relation name="fCarName" data-type="String">
    <label language="zh_CN">车辆名称</label> 
  </relation>  
  <relation name="fCarNO" data-type="String">
    <label language="zh_CN">车牌号</label> 
  </relation>  
  <relation name="fGDTCF" data-type="String">
    <label language="zh_CN">固定停车费</label> 
  </relation>  
  <relation name="fFixedParkFee" data-type="Float">
    <label language="zh_CN">固定停车费</label> 
  </relation>  
  <relation name="fTempParkFee" data-type="Float">
    <label language="zh_CN">临时停车费</label> 
  </relation>  
  <relation name="fReimbLoadToll" data-type="Float">
    <label language="zh_CN">报销路桥费</label> 
  </relation>  
  <relation name="fETCRoadToll" data-type="Float">
    <label language="zh_CN">ETC路桥费</label> 
  </relation>  
  <relation name="fDriverRepairFee" data-type="Float">
    <label language="zh_CN">司机修理费</label> 
  </relation>  
  <relation name="fManagerFee" data-type="Float">
    <label language="zh_CN">管理费</label> 
  </relation>  
  <relation name="fOilFee" data-type="Float">
    <label language="zh_CN">油费</label> 
  </relation>  
  <relation name="fLiters" data-type="Float">
    <label language="zh_CN">升</label> 
  </relation>  
  <relation name="fVehicleFee" data-type="Float">
    <label language="zh_CN">验车费</label> 
  </relation>  
  <relation name="fReimbFee" data-type="String">
    <label language="zh_CN">报销费</label> 
  </relation>  
  <relation name="fPassageFee" data-type="Float">
    <label language="zh_CN">通行费</label> 
  </relation>  
  <relation name="fVehicleTax" data-type="Float">
    <label language="zh_CN">车辆税</label> 
  </relation>  
  <relation name="fTransportFee" data-type="Float">
    <label language="zh_CN">交通费</label> 
  </relation>  
  <relation name="fMedicalExamFee" data-type="Float">
    <label language="zh_CN">体检费</label> 
  </relation>  
  <relation name="fOfficeFee" data-type="Float">
    <label language="zh_CN">办公费</label> 
  </relation>  
  <relation name="fCommunicatFee" data-type="Float">
    <label language="zh_CN">通讯费</label> 
  </relation>  
  <relation name="fAccidentInsurance" data-type="Float">
    <label language="zh_CN">意外保险</label> 
  </relation>  
  <relation name="fOverTimeDays" data-type="Float">
    <label language="zh_CN">加班天数</label> 
  </relation>  
  <relation name="fOtherFees" data-type="Float">
    <label language="zh_CN">其它</label> 
  </relation>  
  <relation name="fHundredKmOilFeul" data-type="Float">
    <label language="zh_CN">百公里油耗</label> 
  </relation>  
  <relation name="fUsersID" data-type="String">
    <label language="zh_CN">使用者ID</label> 
  </relation>  
  <relation name="fUsersName" data-type="String">
    <label language="zh_CN">使用者</label> 
  </relation>   
</model>
