<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
    
  <concept name="OA_BK_BookInfo" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">图书信息</label>  
    <has-relation relation="fBooksNumber" data-type="String"> 
      <label language="zh_CN">图书编号</label> 
    </has-relation>  
    <has-relation relation="fBooksName" data-type="String"> 
      <label language="zh_CN">图书名称</label> 
    </has-relation>  
    <has-relation relation="fBooksTypeID" data-type="String"> 
      <label language="zh_CN">图书类别ID</label> 
    </has-relation>  
    <has-relation relation="fBooksTypeName" data-type="String"> 
      <label language="zh_CN">图书类别</label> 
    </has-relation>  
    <has-relation relation="fBooksNo" data-type="String"> 
      <label language="zh_CN">书号</label> 
    </has-relation>  
    <has-relation relation="fISBN" data-type="String"> 
      <label language="zh_CN">fISBN</label> 
    </has-relation>  
    <has-relation relation="fBookConcern" data-type="String"> 
      <label language="zh_CN">出版社</label> 
    </has-relation>  
    <has-relation relation="fAuthor" data-type="String"> 
      <label language="zh_CN">作者</label> 
    </has-relation>  
    <has-relation relation="fEditionOrder" data-type="String"> 
      <label language="zh_CN">版次</label> 
    </has-relation>  
    <has-relation relation="fFormat" data-type="String"> 
      <label language="zh_CN">开本</label> 
    </has-relation>  
    <has-relation relation="fPageNum" data-type="Integer"> 
      <label language="zh_CN">页数</label> 
    </has-relation>  
    <has-relation relation="fPrice" data-type="Decimal"> 
      <label language="zh_CN">价格</label> 
    </has-relation>  
    <has-relation relation="fBuyDate" data-type="Date" default-value-expr="currentDate()"> 
      <label language="zh_CN">购书日期</label> 
    </has-relation>  
    <has-relation relation="fPertainGoods" data-type="String"> 
      <label language="zh_CN">附属物品</label> 
    </has-relation>  
    <has-relation relation="fCatalog" data-type="String"> 
      <label language="zh_CN">目录</label> 
    </has-relation>  
    <has-relation relation="fBriefIntro" data-type="String"> 
      <label language="zh_CN">简介</label> 
    </has-relation>  
    <has-relation relation="fPhoto" data-type="String"> 
      <label language="zh_CN">照片</label> 
    </has-relation>  
    <has-relation relation="fLoanID" data-type="String" default-value-expr="'0'"> 
      <label language="zh_CN">借出标志ID</label> 
    </has-relation>  
    <has-relation relation="fLoanName" data-type="String" default-value-expr="'闲置'"> 
      <label language="zh_CN">借出标志</label> 
    </has-relation>  
    <has-relation relation="fLoanReadDeptID" data-type="String"> 
      <label language="zh_CN">借阅人部门ID</label> 
    </has-relation>  
    <has-relation relation="fLoanReadDeptName" data-type="String"> 
      <label language="zh_CN">借阅人部门</label> 
    </has-relation>  
    <has-relation relation="fLoanReadPerID" data-type="String"> 
      <label language="zh_CN">借阅人ID</label> 
    </has-relation>  
    <has-relation relation="fLoanReadPerName" data-type="String"> 
      <label language="zh_CN">借阅人</label> 
    </has-relation>  
    <has-relation relation="fCreateOgnID" data-type="String" default-value-expr="currentOgnID()"> 
      <label language="zh_CN">提交机构ID</label> 
    </has-relation>  
    <has-relation relation="fCreateOgnName" data-type="String" default-value-expr="currentOgnName()"> 
      <label language="zh_CN">提交机构</label> 
    </has-relation>  
    <has-relation relation="fCreateDeptID" data-type="String" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"> 
      <label language="zh_CN">提交部门ID</label> 
    </has-relation>  
    <has-relation relation="fCreateDeptName" data-type="String" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"> 
      <label language="zh_CN">提交部门</label> 
    </has-relation>  
    <has-relation relation="fCreatePosID" data-type="String" default-value-expr="currentPosID()"> 
      <label language="zh_CN">提交岗位ID</label> 
    </has-relation>  
    <has-relation relation="fCreatePosName" data-type="String" default-value-expr="currentPosName()"> 
      <label language="zh_CN">提交岗位</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnID" data-type="String" default-value-expr="currentPersonID()"> 
      <label language="zh_CN">提交人员ID</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnName" data-type="String" default-value-expr="currentPersonName()"> 
      <label language="zh_CN">提交人员</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnFullID" data-type="String" default-value-expr="currentPersonID()"> 
      <label language="zh_CN">提交人员FullID</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnFullName" data-type="String" default-value-expr="currentPersonName()"> 
      <label language="zh_CN">提交人员FullName</label> 
    </has-relation>  
    <has-relation relation="fCreateTime" data-type="DateTime" default-value-expr="currentDateTime()"> 
      <label language="zh_CN">提交时间</label> 
    </has-relation>  
    <has-relation relation="fUpdatePsnID" data-type="String" default-value-expr="currentPersonID()"> 
      <label language="zh_CN">修改人员ID</label> 
    </has-relation>  
    <has-relation relation="fUpdatePsnName" data-type="String" default-value-expr="currentPersonName()"> 
      <label language="zh_CN">修改人员</label> 
    </has-relation>  
    <has-relation relation="fUpdateTime" data-type="DateTime" default-value-expr="currentDateTime()"> 
      <label language="zh_CN">修改时间</label> 
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
  <relation name="fBooksNumber" data-type="String"> 
    <label language="zh_CN">图书编号</label> 
  </relation>  
  <relation name="fBooksName" data-type="String"> 
    <label language="zh_CN">图书名称</label> 
  </relation>  
  <relation name="fBooksTypeName" data-type="String"> 
    <label language="zh_CN">图书类别</label> 
  </relation>  
  <relation name="fBooksNo" data-type="String"> 
    <label language="zh_CN">书号</label> 
  </relation>  
  <relation name="fISBN" data-type="String"> 
    <label language="zh_CN">fISBN</label> 
  </relation>  
  <relation name="fBookConcern" data-type="String"> 
    <label language="zh_CN">出版社</label> 
  </relation>  
  <relation name="fAuthor" data-type="String"> 
    <label language="zh_CN">作者</label> 
  </relation>  
  <relation name="fEditionOrder" data-type="String"> 
    <label language="zh_CN">版次</label> 
  </relation>  
  <relation name="fFormat" data-type="String"> 
    <label language="zh_CN">开本</label> 
  </relation>  
  <relation name="fPageNum" data-type="Integer"> 
    <label language="zh_CN">页数</label> 
  </relation>  
  <relation name="fBuyDate" data-type="Date"> 
    <label language="zh_CN">购书日期</label> 
  </relation>  
  <relation name="fPertainGoods" data-type="String"> 
    <label language="zh_CN">附属物品</label> 
  </relation>  
  <relation name="fCatalog" data-type="String"> 
    <label language="zh_CN">目录</label> 
  </relation>  
  <relation name="fBriefIntro" data-type="String"> 
    <label language="zh_CN">简介</label> 
  </relation>  
  <relation name="fPhoto" data-type="String"> 
    <label language="zh_CN">照片</label> 
  </relation>  
  <relation name="fLoanID" data-type="String"> 
    <label language="zh_CN">借出标志ID</label> 
  </relation>  
  <relation name="fLoanName" data-type="String"> 
    <label language="zh_CN">借出标志</label> 
  </relation>  
  <relation name="fLoanReadDeptID" data-type="String"> 
    <label language="zh_CN">借阅人部门ID</label> 
  </relation>  
  <relation name="fLoanReadDeptName" data-type="String"> 
    <label language="zh_CN">借阅人部门</label> 
  </relation>  
  <relation name="fLoanReadPerID" data-type="String"> 
    <label language="zh_CN">借阅人ID</label> 
  </relation>  
  <relation name="fLoanReadPerName" data-type="String"> 
    <label language="zh_CN">借阅人</label> 
  </relation>  
  <relation name="fLoanReadPerFullName" data-type="String"> 
    <label language="zh_CN">借阅人FullID</label> 
  </relation>  
  <relation name="fCreatePsnFullID" data-type="String"> 
    <label language="zh_CN">提交人员FullID</label> 
  </relation>  
  <relation name="fCreatePsnFullName" data-type="String"> 
    <label language="zh_CN">提交人员FullName</label> 
  </relation>  
  <concept name="OA_BK_BookApplyM" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">图书借阅申请(主表)</label>  
    <has-relation relation="fNO" data-type="String" default-value-expr="nextSeqString(format('%s%s', 'TUJYSQ-',format('%1$tY%1$tm%1$td',currentDateTime())), '000')"> 
      <label language="zh_CN">单据号</label> 
    </has-relation>  
    <has-relation relation="fIntendStartDate" data-type="DateTime"> 
      <label language="zh_CN">预计开始时间</label> 
    </has-relation>  
    <has-relation relation="fIntendEndDate" data-type="DateTime"> 
      <label language="zh_CN">预计结束时间</label> 
    </has-relation>  
    <has-relation relation="fRemark" data-type="String"> 
      <label language="zh_CN">备注</label> 
    </has-relation>  
    <has-relation relation="fApplyOgnID" data-type="String"> 
      <label language="zh_CN">申请机构ID</label> 
    </has-relation>  
    <has-relation relation="fApplyOgnName" data-type="String"> 
      <label language="zh_CN">申请机构</label> 
    </has-relation>  
    <has-relation relation="fApplyDeptID" data-type="String" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"> 
      <label language="zh_CN">申请部门ID</label> 
    </has-relation>  
    <has-relation relation="fApplyDeptName" data-type="String" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"> 
      <label language="zh_CN">申请部门</label> 
    </has-relation>  
    <has-relation relation="fApplyPosID" data-type="String"> 
      <label language="zh_CN">申请岗位ID</label> 
    </has-relation>  
    <has-relation relation="fApplyPosName" data-type="String"> 
      <label language="zh_CN">申请岗位</label> 
    </has-relation>  
    <has-relation relation="fApplyPsnID" data-type="String" default-value-expr="currentPersonID()"> 
      <label language="zh_CN">申请人员ID</label> 
    </has-relation>  
    <has-relation relation="fApplyPsnName" data-type="String" default-value-expr="currentPersonName()"> 
      <label language="zh_CN">申请人员</label> 
    </has-relation>  
    <has-relation relation="fApplyDate" data-type="Date" default-value-expr="currentDate()"> 
      <label language="zh_CN">申请日期</label> 
    </has-relation>  
    <has-relation relation="fBizState" data-type="String" default-value-expr="'bsEditing'"> 
      <label language="zh_CN">业务流程状态编码</label> 
    </has-relation>  
    <has-relation relation="fBizStateName" data-type="String" default-value-expr="'编辑中'"> 
      <label language="zh_CN">业务流程状态</label> 
    </has-relation>  
    <has-relation relation="fCreateOgnID" data-type="String" default-value-expr="currentOgnID()" size="36"/>  
    <has-relation relation="fCreateOgnName" data-type="String" default-value-expr="currentOgnName()" size="64"/>  
    <has-relation relation="fCreateDeptID" data-type="String" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())" size="36"/>  
    <has-relation relation="fCreateDeptName" data-type="String" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())" size="64"/>  
    <has-relation relation="fCreatePosID" data-type="String" default-value-expr="currentPosID()" size="36"/>  
    <has-relation relation="fCreatePosName" data-type="String" default-value-expr="currentPosName()" size="64"/>  
    <has-relation relation="fCreatePsnID" data-type="String" default-value-expr="operatorID()" size="36"/>  
    <has-relation relation="fCreatePsnName" data-type="String" default-value-expr="operatorName()" size="128"/>  
    <has-relation relation="fCreatePsnFID" data-type="String" default-value-expr="currentPersonMemberFID()" size="512"/>  
    <has-relation relation="fCreatePsnFName" data-type="String" default-value-expr="currentPersonMemberFName()"> 
      <label language="zh_CN">提交人员FullName</label> 
    </has-relation>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fUpdatePsnID" default-value-expr="operatorID()" size="36"/>  
    <has-relation relation="fUpdatePsnName" default-value-expr="operatorName()" size="128"/>  
    <has-relation relation="fUpdateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fCurrentActivities" data-type="String">
      <label language="zh_CN">当前环节</label> 
    </has-relation>  
    <has-relation relation="fCurrentExecutors" data-type="String">
      <label language="zh_CN">当前执行者</label> 
    </has-relation>  
    <has-relation relation="fApplyPsnFID" data-type="String" size="512" default-value-expr="currentPersonMemberFID()">
      <label language="zh_CN">申请人员FullID</label> 
    </has-relation>  
    <has-relation relation="fApplyPsnFName" data-type="String" size="1024" default-value-expr="currentPersonMemberFName()">
      <label language="zh_CN">申请人员FullName</label> 
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
  <relation name="fTopic" data-type="String"> 
    <label language="zh_CN">主题</label> 
  </relation>  
  <concept name="OA_BK_BookApplyD" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">图书借阅申请(从表)</label>  
    <has-relation relation="fMasterID" data-type="OA_BK_BookApplyM"> 
      <label language="zh_CN">主数据ID</label> 
    </has-relation>
    <has-relation relation="fBookID" data-type="String">
      <label language="zh_CN">图书ID</label> 
    </has-relation>  
    <has-relation relation="fBooksNumber" data-type="String"> 
      <label language="zh_CN">图书编号</label> 
    </has-relation>  
    <has-relation relation="fBooksName" data-type="String"> 
      <label language="zh_CN">图书名称</label> 
    </has-relation>
    <has-relation relation="fBooksTypeID" data-type="String">
      <label language="zh_CN">图书类别ID</label> 
    </has-relation>
    <has-relation relation="fBooksTypeName" data-type="String"> 
      <label language="zh_CN">图书类别</label> 
    </has-relation>  
    <has-relation relation="fBooksNo" data-type="String"> 
      <label language="zh_CN">书号</label> 
    </has-relation>  
    <has-relation relation="fBookConcern" data-type="String"> 
      <label language="zh_CN">出版社</label> 
    </has-relation>  
    <has-relation relation="fAuthor" data-type="String"> 
      <label language="zh_CN">作者</label> 
    </has-relation>  
    <has-relation relation="fPageNum" data-type="Integer">
      <label language="zh_CN">页数</label> 
    </has-relation>  
    <has-relation relation="fRemark">
      <label language="zh_CN">备注</label> 
    </has-relation>  
    <has-relation relation="fPrice">
      <label language="zh_CN">价格</label> 
    </has-relation> 
  <has-relation relation="fLoanID"><label language="zh_CN">借出标志ID</label>
</has-relation>
</concept>  
  <relation name="fIntendStartDate" data-type="DateTime"> 
    <label language="zh_CN">预计开始时间</label> 
  </relation>  
  <relation name="fIntendEndDate" data-type="DateTime"> 
    <label language="zh_CN">预计结束时间</label> 
  </relation>  
  <concept name="OA_BK_BookApplyExecute" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">图书借阅申请(处理表)</label>  
    <has-relation relation="fMasterID"> 
      <label language="zh_CN">主数据ID</label> 
    </has-relation>  
    <has-relation relation="fCreateOgnID" data-type="String" size="36"/>  
    <has-relation relation="fCreateOgnName" data-type="String" size="64"/>  
    <has-relation relation="fCreateDeptID" data-type="String" size="36"/>  
    <has-relation relation="fCreateDeptName" data-type="String" size="64"/>  
    <has-relation relation="fCreatePosID" data-type="String" size="36"/>  
    <has-relation relation="fCreatePosName" data-type="String" size="64"/>  
    <has-relation relation="fCreatePsnID" data-type="String" size="36"/>  
    <has-relation relation="fCreatePsnName" data-type="String" size="128"/>  
    <has-relation relation="fCreatePsnFID" data-type="String" size="512"/>  
    <has-relation relation="fCreateTime" data-type="DateTime"/>  
    <has-relation relation="fUpdatePsnID" data-type="String" size="36"/>  
    <has-relation relation="fUpdatePsnName" data-type="String" size="128"/>  
    <has-relation relation="fUpdateTime" data-type="DateTime"/>  
    <has-relation relation="fActivityFName" data-type="String" size="512"> 
      <label language="zh_CN">环节路径</label> 
    </has-relation>  
    <has-relation relation="fActivityLabel" data-type="String" size="64"> 
      <label language="zh_CN">环节名称</label> 
    </has-relation>  
    <has-relation relation="fOpinion" data-type="String"> 
      <label language="zh_CN">处理意见</label> 
    </has-relation>  
    <has-relation relation="fVerdict" data-type="String"> 
      <label language="zh_CN">处理结论</label> 
    </has-relation>  
    <has-relation relation="fState" data-type="String"> 
      <label language="zh_CN">处理状态编码</label> 
    </has-relation>  
    <has-relation relation="fStateName" data-type="String"> 
      <label language="zh_CN">处理状态</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnFName" data-type="String" size="1024"> 
      <label language="zh_CN">提交人员FullName</label> 
    </has-relation>  
    <has-relation relation="fTaskID" data-type="String">
      <label language="zh_CN">任务ID</label> 
    </has-relation> 
  </concept>  
  <relation name="fBookID" data-type="String">
    <label language="zh_CN">图书ID</label> 
  </relation>  
  <relation name="fBooksTypeID" data-type="String">
    <label language="zh_CN">图书类别ID</label> 
  </relation>  
  <concept name="V_OA_Book_ApplyStatus">
    <has-relation relation="version" default-value-expr="0">
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">图书申请视图</label>  
    <has-relation relation="fBookApplyMid" data-type="String">
      <label language="zh_CN">图书申请ID</label> 
    </has-relation>
    <has-relation relation="fBookID">
      <label language="zh_CN">图书ID</label> 
    </has-relation>
    <has-relation relation="fBooksNumber">
      <label language="zh_CN">图书编号</label> 
    </has-relation>  
    <has-relation relation="fBooksName">
      <label language="zh_CN">图书名称</label> 
    </has-relation>  
    <has-relation relation="fBooksTypeName">
      <label language="zh_CN">图书类别</label> 
    </has-relation>  
    <has-relation relation="fBookConcern">
      <label language="zh_CN">出版社</label> 
    </has-relation>  
    <has-relation relation="fPrice">
      <label language="zh_CN">价格</label> 
    </has-relation>  
    <has-relation relation="fAuthor">
      <label language="zh_CN">作者</label> 
    </has-relation>  
    <has-relation relation="fBookApplyStatusName" data-type="String">
      <label language="zh_CN">图书申请状态</label> 
    </has-relation>
    <has-relation relation="fBookApplyStatus" data-type="String">
      <label language="zh_CN">图书申请状态编码</label> 
    </has-relation>
    <has-relation relation="fBizState">
      <label language="zh_CN">业务流程状态编码</label> 
    </has-relation>
    <has-relation relation="fBizStateName">
      <label language="zh_CN">业务流程状态</label> 
    </has-relation>
    <has-relation relation="fApplyDeptName">
      <label language="zh_CN">申请部门</label> 
    </has-relation>  
    <has-relation relation="fApplyPsnName">
      <label language="zh_CN">申请人员</label> 
    </has-relation>  
    <has-relation relation="fApplyDate">
      <label language="zh_CN">申请日期</label> 
    </has-relation>  
    <has-relation relation="fCreateTime">
      <label language="zh_CN">提交时间</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnID">
      <label language="zh_CN">提交人员ID</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnFID">
      <label language="zh_CN">提交人员FullID</label> 
    </has-relation> 
  </concept>  
  <relation name="fBookApplyMid" data-type="String">
    <label language="zh_CN">图书申请ID</label> 
  </relation>  
  <relation name="fTSSQZTBM" data-type="String">
    <label language="zh_CN">图书申请状态编码</label> 
  </relation>  
  <relation name="fBookApplyStatusName" data-type="String">
    <label language="zh_CN">图书申请状态</label> 
  </relation>  
  <relation name="fBookApplyStatus" data-type="String">
    <label language="zh_CN">图书申请状态编码</label> 
  </relation> 
</model>
