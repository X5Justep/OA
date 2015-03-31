<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">  
  <store name="OA_LS_LicenseView"/>  
  <store name="OA_LS_ApplyExecute"/>  
  <store name="OA_LS_LicenseApplyD"/>  
  <store name="OA_LS_LicenseApplyM"/>  
  <store name="OA_LS_LicenseManage"/>  
  <mapping concept="OA_LS_LicenseManage"> 
    <table name="OA_LS_LicenseManage" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_LS_LicenseApplyM"> 
    <table name="OA_LS_LicenseApplyM" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_LS_LicenseApplyD"> 
    <table name="OA_LS_LicenseApplyD" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_LS_ApplyExecute"> 
    <table name="OA_PUB_Execute" type="owner-table"> 
      <key field="fID" type="String"/>  
      <discriminator field="fBizKind" value="证照借用申请"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_LS_LicenseView"> 
    <table name="OA_LS_LicenseView" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping> 
</model>