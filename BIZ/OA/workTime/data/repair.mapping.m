<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">  
  <store name="OA_repair_EXECUTE"/>  
  <store name="OA_WM_repairApply"/>  
  <mapping concept="OA_WM_repairApply"> 
    <table name="OA_WM_OtherApply" type="owner-table"> 
      <key field="fID" type="String"/> 
    
<discriminator field="fType" value="补签申请"/>
</table> 
  </mapping>  
  <mapping concept="OA_repair_EXECUTE"> 
    <table name="OA_PUB_EXECUTE" type="owner-table"> 
      <key field="fID" type="String"/>  
      <discriminator field="fBizKind" value="补签申请"/>  
      <item field="fMasterID" relation="fMasterID"/> 
    </table> 
  </mapping> 
</model>