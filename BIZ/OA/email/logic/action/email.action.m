<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action name="queryOA_EM_SendEmailAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="OA_EM_SendEmail"/>  
    <private name="select" type="String" value="OA_EM_SendEmail.*"/>  
    <private name="from" type="String" value="OA_EM_SendEmail OA_EM_SendEmail"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/email/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_EM_SendEmail"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveOA_EM_SendEmailAction" procedure="bizSaveProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="OA_EM_SendEmail"/>  
    <private name="dataModel" type="String" value="/OA/email/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createOA_EM_SendEmailAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="OA_EM_SendEmail"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryOA_EM_ReceiveEmailAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="OA_EM_ReceiveEmail"/>  
    <private name="select" type="String" value="OA_EM_ReceiveEmail.*"/>  
    <private name="from" type="String" value="OA_EM_ReceiveEmail OA_EM_ReceiveEmail"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/email/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_EM_ReceiveEmail"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveOA_EM_ReceiveEmailAction" procedure="bizSaveProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="OA_EM_ReceiveEmail"/>  
    <private name="dataModel" type="String" value="/OA/email/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createOA_EM_ReceiveEmailAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="OA_EM_ReceiveEmail"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryV_rosebypersonAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="v_rosebyperson"/>  
    <private name="select" type="String" value="v_rosebyperson.*"/>  
    <private name="from" type="String" value="v_rosebyperson v_rosebyperson"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/email/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="v_rosebyperson"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveV_rosebypersonAction" procedure="bizSaveProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="v_rosebyperson"/>  
    <private name="dataModel" type="String" value="/OA/email/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createV_rosebypersonAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="v_rosebyperson"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryOA_RTX_BaseAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="OA_RTX_Base"/>  
    <private name="select" type="String" value="OA_RTX_Base.*"/>  
    <private name="from" type="String" value="OA_RTX_Base OA_RTX_Base"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/email/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_RTX_Base"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveOA_RTX_BaseAction" procedure="bizSaveProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="OA_RTX_Base"/>  
    <private name="dataModel" type="String" value="/OA/email/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createOA_RTX_BaseAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="OA_RTX_Base"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryNotReadAction" global="false" procedure="queryNotReadProcedure"> 
    <label language="zh_CN">查询未读</label> 
  </action>  
  <action name="sendEmailAction" global="false" procedure="sendEmailProcedure"> 
    <label language="zh_CN">发送邮件</label>  
      
      
      
      
      
      
      
      
     
  










<public type="String" name="dataJson"></public>
</action> 
</model>
