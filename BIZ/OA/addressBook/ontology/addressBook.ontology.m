<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <concept name="OA_AB_AddressBook" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0"/>
    <label language="zh_CN">通讯录</label>
    <has-relation relation="fName">
      <label language="zh_CN">姓名</label>
    </has-relation>
    <has-relation relation="fSex"/>
    <has-relation relation="fCountry" default-value-expr="'中国'">
      <label language="zh_CN">国家／地区</label>
    </has-relation>
    <has-relation relation="fProvince"/>
    <has-relation relation="fCity"/>
    <has-relation relation="fLanguage"/>
    <has-relation relation="fCompanyName"/>
    <has-relation relation="fDeptName"/>
    <has-relation relation="fPostName"/>
    <has-relation relation="fIndustry"/>
    <has-relation relation="fMobilePhone"/>
    <has-relation relation="fMail"/>
    <has-relation relation="fPhone"/>
    <has-relation relation="fFax"/>
    <has-relation relation="fMsn"/>
    <has-relation relation="fQQ"/>
    <has-relation relation="fAddress">
      <label language="zh_CN">家庭地址</label>
    </has-relation>
    <has-relation relation="fPostCode"/>
    <has-relation relation="fRemark"/>
    <has-relation relation="fCreateDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"/>
    <has-relation relation="fCreateDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"/>
    <has-relation relation="fCreatePosID" default-value-expr="currentPosID()"/>
    <has-relation relation="fCreatePosName" default-value-expr="currentPosName()"/>
    <has-relation relation="fCreatePsnID" default-value-expr="operatorID()"/>
    <has-relation relation="fCreatePsnName" default-value-expr="operatorName()"/>
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/>
    <has-relation relation="fCreatePsnFID" default-value-expr="currentPersonMemberFID()"/>
    <has-relation relation="fCreatePsnFName" default-value-expr="currentPersonMemberFName()"/>
    <has-relation relation="fGroup"/>
    <has-relation relation="fSharePsnID"/>
    <has-relation relation="fSharePsnName"/>
    <has-relation relation="fCompanyAddress"/>
    <has-relation relation="fCompanyPhone"/>
    <has-relation relation="fCustomerType"/>
  <has-relation relation="fBirthday"><label language="zh_CN">出生日期</label>
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
  <relation name="fCompanyName" data-type="String" single-valued="true">
    <label language="zh_CN">公司名称</label>
  </relation>
  <relation name="fIndustry" data-type="String" single-valued="true">
    <label language="zh_CN">行业</label>
  </relation>
  <relation name="fLanguage" data-type="String" single-valued="true">
    <label language="zh_CN">语言</label>
  </relation>
  <relation name="fGroup" data-type="String" single-valued="true">
    <label language="zh_CN">分组名称</label>
  </relation>
  <relation name="fSharePsnName" data-type="String" single-valued="true">
    <label language="zh_CN">分享人姓名</label>
  </relation>
  <relation name="fSharePsnID" data-type="String" single-valued="true">
    <label language="zh_CN">分享人ID</label>
  </relation>
  <relation name="fSharedOgnID" data-type="String" single-valued="true">
    <label language="zh_CN">共享机构ID</label>
  </relation>
  <relation name="fSharedOgnName" data-type="String" single-valued="true">
    <label language="zh_CN">共享机构</label>
  </relation>
  <relation name="fSharedDeptID" data-type="String" single-valued="true">
    <label language="zh_CN">共享部门ID</label>
  </relation>
  <relation name="fSharedDeptName" data-type="String" single-valued="true">
    <label language="zh_CN">共享人部门</label>
  </relation>
  <relation name="fSharedPosID" data-type="String" single-valued="true">
    <label language="zh_CN">共享人岗位ID</label>
  </relation>
  <relation name="fSharedPosName" data-type="String" single-valued="true">
    <label language="zh_CN">共享人岗位</label>
  </relation>
  <relation name="fSharedPsnID" data-type="String" single-valued="true">
    <label language="zh_CN">共享人员ID</label>
  </relation>
  <relation name="fSharedPsnName" data-type="String" single-valued="true">
    <label language="zh_CN">共享人员姓名</label>
  </relation>
  <relation name="fSharedPsnFID" data-type="String" single-valued="true">
    <label language="zh_CN">共享人员FullID</label>
  </relation>
  <relation name="fSharedPsnFName" data-type="String" single-valued="true">
    <label language="zh_CN">共享人员FullName</label>
  </relation>
  <relation name="fSharedTime" data-type="DateTime" single-valued="true">
    <label language="zh_CN">共享时间</label>
  </relation>
  <concept name="OA_AB_AddressBookShare" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0"/>
    <label language="zh_CN">通讯录共享表</label>
    <has-relation relation="fSharePsnName" default-value-expr="operatorID()"/>
    <has-relation relation="fSharePsnID" default-value-expr="operatorName()"/>
    <has-relation relation="fSharedOgnID"/>
    <has-relation relation="fSharedOgnName"/>
    <has-relation relation="fSharedDeptID"/>
    <has-relation relation="fSharedDeptName"/>
    <has-relation relation="fSharedPosID"/>
    <has-relation relation="fSharedPosName"/>
    <has-relation relation="fSharedPsnID"/>
    <has-relation relation="fSharedPsnName"/>
    <has-relation relation="fSharedPsnFID"/>
    <has-relation relation="fSharedPsnFName"/>
    <has-relation relation="fSharedTime" default-value-expr="currentDateTime()"/>
    <has-relation relation="fMasterID" data-type="OA_AB_AddressBook"/>
  </concept>
  <relation name="fCompanyAddress" data-type="String" single-valued="true">
    <label language="zh_CN">公司地址</label>
  </relation>
  <relation name="fCompanyPhone" data-type="String" single-valued="true">
    <label language="zh_CN">工作电话</label>
  </relation>
  <relation name="fCustomerType" data-type="String" single-valued="true">
    <label language="zh_CN">客户类型</label>
  </relation>
</model>
