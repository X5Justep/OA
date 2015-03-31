<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">

  <relation name="fSpecType" data-type="String" single-valued="true">
    <label language="zh_CN">规格型号</label>
  </relation>

  <relation name="fKindID" data-type="String" single-valued="true">
    <label language="zh_CN">类别ID</label>
  </relation>

  <relation name="fKindName" data-type="String" single-valued="true">
    <label language="zh_CN">类别</label>
  </relation>

  <relation name="fUnitID" data-type="String" single-valued="true">
    <label language="zh_CN">计量单位ID</label>
  </relation>

  <relation name="fUnitName" data-type="String" single-valued="true">
    <label language="zh_CN">计量单位</label>
  </relation>

  <relation name="fStock" data-type="Integer" single-valued="true">
    <label language="zh_CN">库存数量</label>
  </relation>

  <relation name="fConsultPrice" data-type="Decimal" single-valued="true">
    <label language="zh_CN">参考单价</label>
  </relation>

  <relation name="fDemandNum" data-type="Integer" single-valued="true">
    <label language="zh_CN">需求数量</label>
  </relation>

  <relation name="fConsultAmount" data-type="Decimal" single-valued="true">
    <label language="zh_CN">参考金额</label>
  </relation>

  <relation name="fFactPrice" data-type="Decimal" single-valued="true">
    <label language="zh_CN">实际单价</label>
  </relation>

  <relation name="fFactNum" data-type="Integer" single-valued="true">
    <label language="zh_CN">实际数量</label>
  </relation>

  <relation name="fFactAmount" data-type="Decimal" single-valued="true">
    <label language="zh_CN">实际金额</label>
  </relation>

  <relation name="fDemandDate" data-type="DateTime" single-valued="true">
    <label language="zh_CN">需求日期</label>
  </relation>

  <relation name="fApplyReason" data-type="String" single-valued="true">
    <label language="zh_CN">申请原因</label>
  </relation>

  <relation name="fItemID" data-type="String" single-valued="true">
    <label language="zh_CN">办公用品ID</label>
  </relation>

  <relation name="fProvideState" data-type="Integer" single-valued="true">
    <label language="zh_CN">发放状态</label>
  </relation>

  <relation name="fProvideStateName" data-type="String" single-valued="true">
    <label language="zh_CN">发放状态</label>
  </relation>
</model>
