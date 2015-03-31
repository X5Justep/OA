<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">  
  <store name="OA_out_EXECUTE"/>  
  <store name="OA_WM_outMember"/>  
  <store name="OA_WM_outApply"/>  
  <mapping concept="OA_out_EXECUTE"> 
    <table name="OA_PUB_EXECUTE" type="owner-table"> 
      <key field="fID" type="String"/>  
      <discriminator field="fBizKind" value="外出申请"/> 
    <item field="fMasterID" relation="fMasterID"/>
</table> 
  </mapping>  
  <mapping concept="OA_WM_outApply"> 
    <table name="OA_WM_OtherApply" type="owner-table"> 
      <key field="fID" type="String"/> 
    <discriminator field="fType" value="外出申请"/>
</table> 
  </mapping> 
<mapping concept="OA_WM_outMember"><table name="OA_WM_outMember" type="owner-table"><key field="fID" type="String"/>
<item field="fMasterID" relation="fMasterID" type="String"/>
</table>
</mapping>
</model>