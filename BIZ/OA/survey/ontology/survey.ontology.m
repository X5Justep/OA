<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <relation name="fDescribe" data-type="String" single-valued="true"> 
    <label language="zh_CN">描述</label> 
  </relation>  
  <relation name="fPState" data-type="String" single-valued="true"> 
    <label language="zh_CN">状态</label> 
  </relation>  
  <relation name="fPublicType" data-type="String" single-valued="true"> 
    <label language="zh_CN">公开类型</label> 
  </relation>  
  <relation name="fPublicTypeName" data-type="String" single-valued="true"> 
    <label language="zh_CN">公开类型</label> 
  </relation>  
  <concept name="OA_VS_Paper" default-value-expr="guid()"> 
    <has-relation relation="fTitle"/>  
    <has-relation relation="fDescribe" data-type="String"/>  
    <has-relation relation="fRemark"/>  
    <has-relation relation="fPublicType" default-value-expr="'NoPublic'"/>  
    <has-relation relation="fPublicTypeName" default-value-expr="'不公开'"/>  
    <has-relation relation="fEndTime"/>  
    <has-relation relation="fPState" default-value-expr="'编制中'"/>  
    <has-relation relation="fCreateOgnID" default-value-expr="currentOgnID()"/>  
    <has-relation relation="fCreateOgnName" default-value-expr="currentOgnName()"/>  
    <has-relation relation="fCreateDeptID" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"/>  
    <has-relation relation="fCreateDeptName" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"/>  
    <has-relation relation="fCreatePsnID" default-value-expr="operatorID()"/>  
    <has-relation relation="fCreatePsnName" default-value-expr="operatorName()"/>  
    <has-relation relation="fCreatePsnFID" default-value-expr="currentPersonMemberFID()"/>  
    <has-relation relation="fCreatePsnFName" default-value-expr="currentPersonMemberFName()"/>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="version" default-value-expr="0"/>  
    <has-relation relation="fTaskID"/> 
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
  <relation name="fPaperID" data-type="OA_VS_Paper" single-valued="true"> 
    <label language="zh_CN">外键</label> 
  </relation>  
  <relation name="fQType" data-type="String" single-valued="true"> 
    <label language="zh_CN">题型</label> 
  </relation>  
  <relation name="fQTypeName" data-type="String" single-valued="true"> 
    <label language="zh_CN">题型</label> 
  </relation>  
  <relation name="fTemp" data-type="String" single-valued="true"> 
    <label language="zh_CN">示例</label> 
  </relation>  
  <relation name="fDetailID" data-type="String" single-valued="true"> 
  </relation>  
  <concept name="OA_VS_Question" default-value-expr="guid()"> 
    <has-relation relation="fPaperID" data-type="OA_VS_Paper"/>  
    <has-relation relation="fSequence"/>  
    <has-relation relation="fQType"/>  
    <has-relation relation="fQTypeName"/>  
    <has-relation relation="fContent"/>  
    <has-relation relation="fTemp" data-type="String"/>  
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
  <concept name="V_OA_VS_Survey"> 
    <has-relation relation="fPaperID"/>  
    <has-relation relation="fSequence"/>  
    <has-relation relation="fQType"/>  
    <has-relation relation="fQTypeName"/>  
    <has-relation relation="fContent"/>  
    <has-relation relation="fTaskID"/>  
    <has-relation relation="fSurveyID"/>  
    <has-relation relation="fSState"/>  
    <has-relation relation="fDetailID"/>  
    <has-relation relation="fAnswer"/>  
    <has-relation relation="version"/> 
  </concept>  
  <concept name="V_OA_VS_Answer"> 
    <has-relation relation="fPaperID"/>  
    <has-relation relation="fPerID"/>  
    <has-relation relation="fPerName"/>  
    <has-relation relation="fPerFID"/>  
    <has-relation relation="fPerFName"/>  
    <has-relation relation="fDeptFName"/>  
    <has-relation relation="fTaskID"/>  
    <has-relation relation="fSState"/>  
    <has-relation relation="fFinishTime"/>  
    <has-relation relation="fSendTime"/>  
    <has-relation relation="fTitle"/>  
    <has-relation relation="fEndTime"/>  
    <has-relation relation="fPState"/>  
    <has-relation relation="fCreateDeptName"/>  
    <has-relation relation="fCreatePsnName"/>  
    <has-relation relation="version"/> 
  </concept>  
  <relation name="fQuestionID" data-type="OA_VS_Question" single-valued="true"> 
    <label language="zh_CN">外键</label> 
  </relation>  
  <concept name="OA_VS_Items" default-value-expr="guid()"> 
    <has-relation relation="fQuestionID" data-type="OA_VS_Question"/>  
    <has-relation relation="fSequence" data-type="String"/>  
    <has-relation relation="fContent"/>  
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
  <concept name="V_OA_VS_Items"> 
    <has-relation relation="fQuestionID"/>  
    <has-relation relation="fSequence"/>  
    <has-relation relation="fContent"/>  
    <has-relation relation="fPaperID"/>  
    <has-relation relation="version"/> 
  </concept>  
  <relation name="fPerID" data-type="String" single-valued="true"> 
    <label language="zh_CN">人员</label> 
  </relation>  
  <relation name="fPerName" data-type="String" single-valued="true"> 
    <label language="zh_CN">人员</label> 
  </relation>  
  <relation name="fPerFID" data-type="String" single-valued="true"> 
    <label language="zh_CN">人员FID</label> 
  </relation>  
  <relation name="fPerFName" data-type="String" single-valued="true"> 
    <label language="zh_CN">人员FName</label> 
  </relation>  
  <relation name="fDeptFName" data-type="String" single-valued="true"> 
    <label language="zh_CN">组织FName</label> 
  </relation>  
  <relation name="fSState" data-type="String" single-valued="true"> 
    <label language="zh_CN">状态</label> 
  </relation>  
  <relation name="fSendTime" data-type="DateTime" single-valued="true"> 
    <label language="zh_CN">发布时间</label> 
  </relation>  
  <relation name="fFinishTime" data-type="DateTime" single-valued="true"> 
    <label language="zh_CN">完成时间</label> 
  </relation>  
  <concept name="OA_VS_Survey" default-value-expr="guid()"> 
    <has-relation relation="fPaperID" data-type="OA_VS_Paper"/>  
    <has-relation relation="fPerID"/>  
    <has-relation relation="fPerName"/>  
    <has-relation relation="fPerFID"/>  
    <has-relation relation="fPerFName"/>  
    <has-relation relation="fDeptFName"/>  
    <has-relation relation="fTaskID"/>  
    <has-relation relation="fSState" default-value-expr="'编制中'"/>  
    <has-relation relation="fFinishTime"/>  
    <has-relation relation="fSendTime"/>  
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
  <relation name="fSurveyID" data-type="OA_VS_Survey" single-valued="true"> 
    <label language="zh_CN">外键</label> 
  </relation>  
  <relation name="fAnswer" data-type="String" single-valued="true"> 
    <label language="zh_CN">回答</label> 
  </relation>  
  <concept name="OA_VS_Detail" default-value-expr="guid()"> 
    <has-relation relation="fSurveyID" data-type="OA_VS_Survey"/>  
    <has-relation relation="fQuestionID" data-type="OA_VS_Question"/>  
    <has-relation relation="fAnswer" data-type="String"/>  
    <has-relation relation="version" default-value-expr="0"/> 
  </concept>  
  <relation name="fAllNum" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">总数量</label> 
  </relation>  
  <relation name="fAnswerNum" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">回答数量</label> 
  </relation>  
  <relation name="fINum" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">选项数量</label> 
  </relation>  
  <relation name="fRate" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">比率</label> 
  </relation>  
  <concept name="V_OA_VS_SumQuestion"> 
    <has-relation relation="fPaperID"/>  
    <has-relation relation="fSequence"/>  
    <has-relation relation="fQType"/>  
    <has-relation relation="fQTypeName"/>  
    <has-relation relation="fContent"/>  
    <has-relation relation="fTemp"/>  
    <has-relation relation="fAllNum"/>  
    <has-relation relation="fAnswerNum"/>  
    <has-relation relation="fRate"/>  
    <has-relation relation="version"/> 
  </concept>  
  <concept name="V_OA_VS_SumItems"> 
    <has-relation relation="fQuestionID"/>  
    <has-relation relation="fSequence"/>  
    <has-relation relation="fContent"/>  
    <has-relation relation="fPaperID"/>  
    <has-relation relation="fAllNum"/>  
    <has-relation relation="fINum"/>  
    <has-relation relation="fRate"/>  
    <has-relation relation="version"/> 
  </concept> 
</model>
