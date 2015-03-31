<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <concept name="OA_Pub_BaseCode" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0"/>
    <label language="zh_CN">OA公共基础编码表</label>
    <has-relation relation="fScope"/>
    <has-relation relation="fCode"/>
    <has-relation relation="fName"/>
    <has-relation relation="fDescription"/>
    <has-relation relation="fSequence" data-type="String"/>
    <has-relation relation="fUseStatus" default-value-expr="'0'"/>
    <has-relation relation="fUseStatusName" default-value-expr="'未启用'"/>
    <has-relation relation="fParentCode"/>
    <has-relation relation="fLevel" data-type="Integer"/>
    <has-relation relation="fURL"/>
    <has-relation relation="fCreateOgnID" default-value-expr="currentOgnID()"/>
    <has-relation relation="fCreateOgnName" default-value-expr="currentOgnName()"/>
    <has-relation relation="fCreateDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"/>
    <has-relation relation="fCreateDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"/>
    <has-relation relation="fCreatePsnID" default-value-expr="currentPersonID()"/>
    <has-relation relation="fCreatePsnName" default-value-expr="currentPersonMemberNameWithAgent()"/>
    <has-relation relation="fCreatePsnFID" default-value-expr="currentPersonMemberFID()"/>
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/>
    <has-relation relation="fUpdatePsnID" default-value-expr="currentPersonID()"/>
    <has-relation relation="fUpdatePsnName" default-value-expr="currentPersonMemberNameWithAgent()"/>
    <has-relation relation="fUpdateTime" default-value-expr="currentDateTime()"/>
  </concept>
</model>
