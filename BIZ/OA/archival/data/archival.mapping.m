<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">
<store name="V_OA_AM_ArchivalSelect"/>
<store name="V_OA_AM_ArchivalURLInfo"/>
<store name="OA_AM_ExcelTemp"/>  
  <store name="V_SA_OPOrg"/>  
  <store name="OA_AM_BorrowExecute"/>  
  <store name="OA_AM_DistoryExecute"/>  
  <store name="OA_AM_History"/>  
  <store name="OA_AM_DistoryApplyD"/>  
  <store name="OA_AM_DistoryApplyM"/>  
  <store name="OA_AM_BorrowApplyD"/>  
  <store name="OA_AM_BorrowApplyM"/>  
  <store name="V_OA_AM_FiledCheck"/>  
  <store name="OA_AM_Archival"/>  
  <store name="OA_AM_FondsCategory"/>  
  <store name="V_OA_AM_CategorySelect"/>  
  <store name="OA_AM_Category"/>  
  <store name="OA_AM_Fonds"/>  
  <mapping concept="V_OA_AM_CategorySelect"> 
    <table name="V_OA_AM_CategorySelect" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_AM_BorrowExecute"> 
    <table name="OA_PUB_Execute" type="owner-table"> 
      <key field="fID" type="String"/>  
      <item field="fMasterID" relation="fMasterID" type="String"/>  
      <discriminator field="fBizKind" value="档案借阅申请"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_AM_DistoryExecute"> 
    <table name="OA_PUB_Execute" type="owner-table"> 
      <key field="fID" type="String"/>  
      <item field="fMasterID" relation="fMasterID" type="String"/>  
      <discriminator field="fBizKind" value="档案销毁申请"/> 
    </table> 
  </mapping>  
  <mapping concept="V_SA_OPOrg">
    <table name="V_SA_OPOrg" type="owner-table">
      <key field="sID" type="String"/>  
      <item field="sParent" relation="sParent" type="String"/> 
    </table> 
  </mapping> 
</model>