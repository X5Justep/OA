<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">  
  <store name="COMM_UseMode_D"/>  
  <store name="OA_WM_eveMember"/>  
  <store name="OA_evection_EXECUTE"/>  
  <store name="OA_WM_EvecApply"/>
  <mapping concept="OA_evection_EXECUTE">
    <table name="OA_PUB_EXECUTE" type="owner-table">
      <key field="fID" type="String"/>  
      <discriminator field="fBizKind" value="出差申请"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_WM_EvecApply">
    <table name="OA_WM_OtherApply" type="owner-table">
      <key field="fID" type="String"/> 
    <discriminator field="fType" value="出差申请"/>
</table> 
  </mapping> 
</model>