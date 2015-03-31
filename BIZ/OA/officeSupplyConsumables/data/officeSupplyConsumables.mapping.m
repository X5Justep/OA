<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">    
    
    
  <store name="OA_OSC_BaseInfo"/>  
  <store name="OA_OSC_BuyApplyM"/>  
  <store name="OA_OSC_BuyApplyD"/>  
  <store name="OA_OSC_UseApplyM"/>  
  <store name="OA_OSC_UseApplyD"/>  
  <store name="OA_OSC_BuyExecute"/>  
  <store name="OA_OSC_UseExecute"/>  
    
    
  <mapping concept="OA_OSC_BaseInfo"> 
    <table name="OA_OSC_BaseInfo" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_OSC_BuyApplyM"> 
    <table name="OA_OSC_BuyApplyM" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_OSC_BuyApplyD"> 
    <table name="OA_OSC_BuyApplyD" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_OSC_UseApplyM"> 
    <table name="OA_OSC_UseApplyM" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_OSC_UseApplyD"> 
    <table name="OA_OSC_UseApplyD" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_OSC_BuyExecute"> 
    <table name="OA_PUB_Execute" type="owner-table"> 
      <key field="fID" type="String"/>  
      <discriminator field="fBizKind" value="办公用品请购申请"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_OSC_UseExecute"> 
    <table name="OA_PUB_Execute" type="owner-table"> 
      <key field="fID" type="String"/>  
      <discriminator field="fBizKind" value="办公用品领用申请"/> 
    </table> 
  </mapping>    
</model>