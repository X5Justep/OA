<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xu="http://www.xmldb.org/xupdate"
  xmlns:xui="http://www.justep.com/xui" __id="id_1" component="$UI/system/components/justep/window/window" extends="$UI/OA/car/process/dialog/parent/listSingleTemplete.w"
  xid="window" class="window" design="device:pc">  
  <div xid="dataTables1" xui:update-mode="delete"/>  
  <div xid="mainData" columns="fCode,fName,fType,fCarKindID,fCarKindName,fUseKindName,fCheckPsnNum,fCarDriverID,fCarDriverName"
    concept="OA_CA_CarBasicInfo" orderBy="fCode:asc" xui:update-mode="merge"/>  
  <reader xid="default1" action="/OA/car/logic/action/queryCACarBasicInfoAction"
    xui:update-mode="merge"/>  
  <div class="table table-hover table-striped" component="$UI/system/components/justep/dataTables/dataTables"
    data="mainData" flexibleWidth="true" rowActiveClass="active" xid="dataTables11_3"
    xui:before="pagerBar1" xui:parent="content1" xui:update-mode="insert"> 
    <columns xid="columns11_3"> 
      <column name="fCode" xid="column1"/>  
      <column name="fName" xid="column2"/>  
      <column name="fType" xid="column3"/>  
      <column name="fCarKindName" xid="column4"/>  
      <column name="fCheckPsnNum" xid="column5"/>  
      <column name="fUseKindName" xid="column6"/>  
      <column name="fCarDriverName" xid="column7"/>  
      <column name="carsNO" xid="column8"/> 
    </columns> 
  </div> 
</div>
