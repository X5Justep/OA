<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
    
    
    
  <concept name="OA_FC_LoanApply" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">借款申请(主表)</label>  
    <has-relation relation="fNO" default-value-expr="nextSeqString(format('LA-%1$tY%1$tm%1$td-', currentDateTime()),'0000')"/>  
    <has-relation relation="fBizState" default-value-expr="'bsEditing'"/>  
    <has-relation relation="fBizStateName" default-value-expr="'编辑中'"/>  
    <has-relation relation="fLoanOgnID" default-value-expr="currentOgnID()"> 
      <label language="zh_CN">借款机构ID</label> 
    </has-relation>  
    <has-relation relation="fLoanOgnName" default-value-expr="currentOgnName()"> 
      <label language="zh_CN">借款机构</label> 
    </has-relation>  
    <has-relation relation="fLoanDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"> 
      <label language="zh_CN">借款部门ID</label> 
    </has-relation>  
    <has-relation relation="fLoanDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"> 
      <label language="zh_CN">借款部门</label> 
    </has-relation>  
    <has-relation relation="fLoanPosID" default-value-expr="currentPosID()"> 
      <label language="zh_CN">借款岗位ID</label> 
    </has-relation>  
    <has-relation relation="fLoanPosName" default-value-expr="currentPosName()"> 
      <label language="zh_CN">借款岗位</label> 
    </has-relation>  
    <has-relation relation="fLoanPsnID" default-value-expr="currentPersonID()"> 
      <label language="zh_CN">借款人员ID</label> 
    </has-relation>  
    <has-relation relation="fLoanPsnName" default-value-expr="currentPersonName()"> 
      <label language="zh_CN">借款人员</label> 
    </has-relation>  
    <has-relation relation="fLoanPsnFullID" default-value-expr="currentPersonMemberFID()"> 
      <label language="zh_CN">借款人员FullID</label> 
    </has-relation>  
    <has-relation relation="fLoanPsnFullName" default-value-expr="currentPersonMemberFName()"> 
      <label language="zh_CN">借款人员FullName</label> 
    </has-relation>  
    <has-relation relation="fLoanDate" data-type="Date"> 
      <label language="zh_CN">借款日期</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnID" default-value-expr="currentPersonID()"/>  
    <has-relation relation="fCreatePsnName" default-value-expr="currentPersonName()"/>  
    <has-relation relation="fCreatePsnFID" default-value-expr="currentPersonMemberFID()"/>  
    <has-relation relation="fCreatePsnFName" default-value-expr="currentPersonMemberFName()"/>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fUpdatePsnID" default-value-expr="currentPersonID()"/>  
    <has-relation relation="fUpdatePsnName" default-value-expr="currentPersonName()"/>  
    <has-relation relation="fUpdateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fClienter"/>  
    <has-relation relation="fLoanAmt" data-type="Decimal" default-value-expr="0.0"/>  
    <has-relation relation="fLoanType"/>  
    <has-relation relation="fLoanTypeName"/>  
    <has-relation relation="fLoanTypeCode"/>  
    <has-relation relation="fReturnDate" data-type="Date"/>  
    <has-relation relation="fLoanPurpose" data-type="String"/>  
    <has-relation relation="fRemark" data-type="String"/>  
    <has-relation relation="fCreateOgnID" default-value-expr="currentOgnID()"/>  
    <has-relation relation="fCreateOgnName" default-value-expr="currentOgnName()"/>  
    <has-relation relation="fCreateDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"/>  
    <has-relation relation="fCreateDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"/>  
    <has-relation relation="fCreatePosID" default-value-expr="currentPosID()"/>  
    <has-relation relation="fCreatePosName" default-value-expr="currentPosName()"/>  
    <has-relation relation="fCreateDate" default-value-expr="currentDate()" data-type="Date"/>  
    <has-relation relation="fFactAmount" data-type="Decimal"/>  
    <has-relation relation="fStatus" data-type="Integer" default-value-expr="0"/>  
    <has-relation relation="fStatusName" default-value-expr="'未归还'"/>  
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
  <concept name="OA_FC_LoanExecute" default-value-expr="guid()"> 
    <has-relation relation="fMasterID" data-type="OA_FC_LoanApply"/>  
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
    <label language="zh_CN">借款申请(处理表)</label> 
  </concept>  
  <concept name="OA_FC_ReimbApplyM" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <has-relation relation="fNO" default-value-expr="nextSeqString(format('BXSQ-%1$tY%1$tm%1$td-', currentDateTime()),'0000')"/>  
    <label language="zh_CN">报销申请(主表)</label>  
    <has-relation relation="fLoanOgnID" default-value-expr="currentOgnID()"> 
      <label language="zh_CN">报销机构ID</label>  
    </has-relation>  
    <has-relation relation="fLoanOgnName" default-value-expr="currentOgnName()"> 
      <label language="zh_CN">报销机构</label>  
    </has-relation>  
    <has-relation relation="fLoanDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"> 
      <label language="zh_CN">报销部门ID</label>  
    </has-relation>  
    <has-relation relation="fLoanDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"> 
      <label language="zh_CN">报销部门</label>  
    </has-relation>  
    <has-relation relation="fLoanPosID" default-value-expr="currentPosID()"> 
      <label language="zh_CN">报销岗位ID</label>  
    </has-relation>  
    <has-relation relation="fLoanPosName" default-value-expr="currentPosName()"> 
      <label language="zh_CN">报销岗位</label> 
    </has-relation>  
    <has-relation relation="fLoanPsnID" default-value-expr="currentPersonID()"> 
      <label language="zh_CN">报销人员ID</label> 
    </has-relation>  
    <has-relation relation="fLoanPsnName" default-value-expr="currentPersonName()"> 
      <label language="zh_CN">报销人员</label> 
    </has-relation>  
    <has-relation relation="fLoanPsnFullID" default-value-expr="currentPersonMemberFID()"> 
      <label language="zh_CN">报销人员FullID</label> 
    </has-relation>  
    <has-relation relation="fLoanPsnFullName" default-value-expr="currentPersonMemberFName()"> 
      <label language="zh_CN">报销人员FullName</label> 
    </has-relation>  
    <has-relation relation="fLoanDate" default-value-expr="currentDate()" data-type="Date"> 
      <label language="zh_CN">报销日期</label> 
    </has-relation>  
    <has-relation relation="fClienter"/>  
    <has-relation relation="fReimAmt" data-type="Decimal" default-value-expr="0.0"/>  
    <has-relation relation="fMustReimAmt" data-type="Decimal" default-value-expr="0.0"> 
      <label language="zh_CN">实报金额</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnID" default-value-expr="currentPersonID()"/>  
    <has-relation relation="fCreatePsnName" default-value-expr="currentPersonName()"/>  
    <has-relation relation="fCreatePsnFID" default-value-expr="currentPersonMemberFID()"/>  
    <has-relation relation="fCreatePsnFName" default-value-expr="currentPersonMemberFName()"/>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fReiBeginDate" data-type="Date"> 
      <label language="zh_CN">出差开始日期</label> 
    </has-relation>  
    <has-relation relation="fReiBackDate" data-type="Date"/>  
    <has-relation relation="fReiEvent" data-type="String"/>  
    <has-relation relation="fReiAllowance" data-type="Decimal" default-value-expr="0.0"/>  
    <has-relation relation="fRemark"/>  
    <has-relation relation="fIsPreLoan"/>  
    <has-relation relation="fLoanAmt" default-value-expr="0.0" data-type="Decimal"/>  
    <has-relation relation="fBizState" default-value-expr="'bsEditing'"/>  
    <has-relation relation="fBizStateName" default-value-expr="'编辑中'"/>  
    <has-relation relation="fCreateOgnID" default-value-expr="currentOgnID()"/>  
    <has-relation relation="fCreateOgnName" default-value-expr="currentOgnName()"/>  
    <has-relation relation="fCreateDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"/>  
    <has-relation relation="fCreateDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"/>  
    <has-relation relation="fCreatePosID" default-value-expr="currentPosID()"/>  
    <has-relation relation="fCreatePosName" default-value-expr="currentPosName()"/>  
    <has-relation relation="fFactAmount" default-value-expr="0.0" data-type="Decimal"/>  
    <has-relation relation="fCurrentActivities"/>  
    <has-relation relation="fCurrentExecutors"/> 
  <has-relation relation="fOughtReimbAmtCn" data-type="String"><label language="zh_CN">实报金额大写</label>
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
  <concept name="OA_FC_ReimbApplyD" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">报销申请(从表)</label>  
    <has-relation relation="fCostType" data-type="String"/>  
    <has-relation relation="fCostTypeCode"/>  
    <has-relation relation="fCostTypeName"/>  
    <has-relation relation="fBeginTime" data-type="Date" default-value-expr="currentDate()"/>  
    <has-relation relation="fEndTime" data-type="Date" default-value-expr="currentDate()"/>  
    <has-relation relation="fCostBillNum"/>  
    <has-relation relation="fSimpleDeclara"/>  
    <has-relation relation="fCostAmt" data-type="Decimal"/>  
    <has-relation relation="fReimFID" data-type="OA_FC_ReimbApplyM"/>  
    <has-relation relation="fFactAmount" data-type="Decimal"/>  
    <has-relation relation="fReiAllowancem" default-value-expr="0.0" data-type="Decimal"/> 
  </concept>  
  <concept name="OA_FC_ReimbBadgutD" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">报销申请(从表)</label>  
    <has-relation relation="fCostType" data-type="String"/>  
    <has-relation relation="fCostTypeCode"/>  
    <has-relation relation="fCostTypeName"/>  
    <has-relation relation="fCostCenterID"/>  
    <has-relation relation="fCostCenterName"/>  
    <has-relation relation="fAccountID"/>  
    <has-relation relation="fAccountName"/>  
    <has-relation relation="fBeginTime" data-type="Date" default-value-expr="currentDate()"/>  
    <has-relation relation="fEndTime" data-type="Date" default-value-expr="currentDate()"/>  
    <has-relation relation="fCostBillNum"/>  
    <has-relation relation="fSimpleDeclara"/>  
    <has-relation relation="fCostAmt" data-type="Decimal" default-value-expr="0.0"/>  
    <has-relation relation="fReimFID" data-type="OA_FC_ReimbApplyM"/>  
    <has-relation relation="fFactAmount" data-type="Decimal" default-value-expr="0.0"/>  
    <has-relation relation="fReiAllowancem" default-value-expr="0.0" data-type="Decimal"/> 
  </concept>  
  <concept name="OA_FC_ReimbrseExecute" default-value-expr="guid()"> 
    <has-relation relation="fMasterID" data-type="OA_FC_ReimbApplyM"/>  
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
    <label language="zh_CN">报销申请(处理表)</label> 
  </concept>  
  <relation name="fLoanOgnID" data-type="String" single-valued="true"> 
    <label language="zh_CN">申请机构ID</label> 
  </relation>  
  <relation name="fLoanOgnName" data-type="String" single-valued="true"> 
    <label language="zh_CN">申请机构</label> 
  </relation>  
  <relation name="fLoanDeptID" data-type="String" single-valued="true"> 
    <label language="zh_CN">申请部门ID</label> 
  </relation>  
  <relation name="fLoanDeptName" data-type="String" single-valued="true"> 
    <label language="zh_CN">申请部门</label> 
  </relation>  
  <relation name="fLoanPosID" data-type="String" single-valued="true"> 
    <label language="zh_CN">申请岗位ID</label> 
  </relation>  
  <relation name="fLoanPosName" data-type="String" single-valued="true"> 
    <label language="zh_CN">申请岗位</label> 
  </relation>  
  <relation name="fLoanPsnID" data-type="String" single-valued="true"> 
    <label language="zh_CN">申请人员ID</label> 
  </relation>  
  <relation name="fLoanPsnName" data-type="String" single-valued="true"> 
    <label language="zh_CN">申请人员</label> 
  </relation>  
  <relation name="fLoanPsnFullID" data-type="String" single-valued="true"> 
    <label language="zh_CN">申请人员FullID</label> 
  </relation>  
  <relation name="fLoanPsnFullName" data-type="String" single-valued="true"> 
    <label language="zh_CN">申请人员FullName</label> 
  </relation>  
  <relation name="fLoanDate" data-type="Date" single-valued="true"> 
    <label language="zh_CN">申请日期</label> 
  </relation>  
  <relation name="fClienter" data-type="String" single-valued="true"> 
    <label language="zh_CN">客户</label> 
  </relation>  
  <relation name="fLoanAmt" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">借款金额</label> 
  </relation>  
  <relation name="fLoanType" data-type="String" single-valued="true"> 
    <label language="zh_CN">借款类型</label> 
  </relation>  
  <relation name="fLoanTypeName" data-type="String" single-valued="true"> 
    <label language="zh_CN">借款类型名称</label> 
  </relation>  
  <relation name="fLoanTypeCode" data-type="String" single-valued="true"> 
    <label language="zh_CN">借款类型编码</label> 
  </relation>  
  <relation name="fReturnDate" data-type="Date" single-valued="true"> 
    <label language="zh_CN">归还日期</label> 
  </relation>  
  <relation name="fLoanPurpose" data-type="String" single-valued="true"> 
    <label language="zh_CN">借款用途</label> 
  </relation>  
  <relation name="fBXJE" data-type="String" single-valued="true"> 
    <label language="zh_CN">报销金额</label> 
  </relation>  
  <relation name="fReimAmt" data-type="String" single-valued="true"> 
    <label language="zh_CN">报销金额</label> 
  </relation>  
  <relation name="fMustReimAmt" data-type="String" single-valued="true"> 
    <label language="zh_CN">应报金额</label> 
  </relation>  
  <relation name="fReiBeginDate" data-type="String" single-valued="true"> 
    <label language="zh_CN">出差开始时间</label> 
  </relation>  
  <relation name="fReiBackDate" data-type="String" single-valued="true"> 
    <label language="zh_CN">出差终止日期</label> 
  </relation>  
  <relation name="fReiEvent" data-type="String" single-valued="true"> 
    <label language="zh_CN">报销事项</label> 
  </relation>  
  <relation name="fReiAllowance" data-type="Integer" single-valued="true"> 
    <label language="zh_CN">出差补助</label> 
  </relation>  
  <relation name="fIsPreLoan" data-type="String" single-valued="true"> 
    <label language="zh_CN">是否预借款</label> 
  </relation>  
  <relation name="fCostType" data-type="String" single-valued="true"> 
    <label language="zh_CN">费用类别</label> 
  </relation>  
  <relation name="fCostTypeCode" data-type="String" single-valued="true"> 
    <label language="zh_CN">费用类别ID</label> 
  </relation>  
  <relation name="fCostTypeName" data-type="String" single-valued="true"> 
    <label language="zh_CN">费用类别名称</label> 
  </relation>  
  <relation name="fCostBillNum" data-type="Integer" single-valued="true"> 
    <label language="zh_CN">单据张数</label> 
  </relation>  
  <relation name="fSimpleDeclara" data-type="String" single-valued="true"> 
    <label language="zh_CN">简要说明</label> 
  </relation>  
  <relation name="fCostAmt" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">金额</label> 
  </relation>  
  <relation name="fReimFID" data-type="String" single-valued="true"> 
    <label language="zh_CN">报销申请发fID</label> 
  </relation>  
  <relation name="fCreateDate" data-type="Date" single-valued="true"> 
    <label language="zh_CN">提交日期</label> 
  </relation>  
  <relation name="fFactAmount" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">合计</label> 
  </relation>  
  <relation name="fReiAllowancem" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">出差补助</label> 
  </relation>  
  <relation name="fStatus" data-type="String" single-valued="true"> 
    <label language="zh_CN">归还状态</label> 
  </relation>  
  <relation name="fStatusName" data-type="String" single-valued="true"> 
    <label language="zh_CN">归还状态名称</label> 
  </relation> 
<relation name="fOughtReimbAmtCn" data-type="String"><label language="zh_CN">实报金额大写</label>
</relation>
</model>
