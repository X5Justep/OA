<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">  
  <store name="OA_FC_ReimbrseExecute"/>  
  <store name="OA_FC_ReimbBadgutD"/>  
  <store name="OA_FC_ReimbApplyD"/>  
  <store name="OA_FC_ReimbApplyM"/>  
  <store name="OA_FC_LoanExecute"/>  
  <store name="OA_FC_LoanApply"/>  
    
    
    
  <mapping concept="OA_FC_LoanApply"> 
    <table name="OA_FC_LoanApply" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_FC_ReimbApplyM"> 
    <table name="OA_FC_ReimbApplyM" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_FC_ReimbApplyD"> 
    <table name="OA_FC_ReimbApplyD" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
    
    
  <mapping concept="OA_FC_LoanExecute"> 
    <table name="OA_PUB_Execute" type="owner-table"> 
      <key field="fID" type="String"/>  
      <item field="fMasterID" relation="fMasterID" type="String"/>  
      <discriminator field="fBizKind" value="借款申请"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_FC_ReimbrseExecute"> 
    <table name="OA_PUB_Execute" type="owner-table"> 
      <key field="fID" type="String"/>  
      <item field="fMasterID" relation="fMasterID" type="String"/>  
      <discriminator field="fBizKind" value="报销申请"/> 
    </table> 
  </mapping>  
   
</model>