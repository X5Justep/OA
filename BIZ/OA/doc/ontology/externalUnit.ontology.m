<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <relation name="fLinkMan" data-type="String" single-valued="true"> 
    <label language="zh_CN">外部单位联系人</label> 
  </relation>  
  <relation name="fLinkPhone" data-type="String" single-valued="true"> 
    <label language="zh_CN">外部单位联系电话</label> 
  </relation>  
  <concept name="OA_DC_ExternalUnit" default-value-expr="guid()"> 
    <has-relation relation="fCode" size="36"/>  
    <has-relation relation="fName" size="64"/>  
    <has-relation relation="fLinkMan" size="64"/>  
    <has-relation relation="fLinkPhone" size="64"/>  
    <has-relation relation="fParent" data-type="OA_DC_ExternalUnit"> 
      <label language="zh_CN">父</label> 
    </has-relation>  
    <has-relation relation="fParentName" data-type="String" size="64">
      <label language="zh_CN">父名称</label> 
    </has-relation>  
    <has-relation relation="fOrgID" data-type="String" size="32"> 
      <label language="zh_CN">组织机构ID</label> 
    </has-relation>  
    <has-relation relation="fOrgURL" data-type="String" size="512"> 
      <label language="zh_CN">组织机构URL</label> 
    </has-relation>  
    <has-relation relation="fOrgURLName" data-type="String" size="1024"> 
      <label language="zh_CN">组织机构路径</label> 
    </has-relation>  
    <has-relation relation="fRemark" data-type="Text"/>  
    <label language="zh_CN">公文往来单位</label>  
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
    <has-relation relation="fDisUseTime"/>  
    <has-relation relation="fUseStatus" default-value-expr="'0'" size="36"/>  
    <has-relation relation="fUseStatusName" default-value-expr="'未启用'" size="64"/>  
    <has-relation relation="version" default-value-expr="0"/>  
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
  <relation name="fOrgURL" data-type="String"> 
    <label language="zh_CN">组织机构URL</label> 
  </relation>  
  <relation name="fOrgURLName" data-type="String"> 
    <label language="zh_CN">组织机构路径</label> 
  </relation>  
  <relation name="fParentName" data-type="String">
    <label language="zh_CN">父名称</label> 
  </relation> 
</model>
