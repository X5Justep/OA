<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
<store name="OA_Pub_BaseCode"></store>  
  <store name="OA_BG_Config"/>  
  <store name="OA_BG_CostCenter"/>  
  <store name="OA_BG_CostAccount"/>  
  <store name="OA_BG_BadgutD"/>  
  <store name="OA_BG_BadgutM"/>  
  <store name="OA_BG_AlterExecute"/>  
  <store name="OA_BG_AlterD"/>  
  <store name="OA_BG_AlterM"/>  
  <store name="OA_BG_ApplyExecute"/>  
  <store name="OA_BG_ApplyD"/>  
  <store name="OA_BG_ApplyM"/>  
  <store name="OA_BG_History"/>  
  <mapping concept="OA_BG_ApplyM"> 
    <table name="OA_BG_ApplyM" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_BG_ApplyD"> 
    <table name="OA_BG_ApplyD" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_BG_ApplyExecute"> 
    <table name="OA_PUB_Execute" type="owner-table"> 
      <key field="fID" type="String"/>  
      <discriminator field="fBizKind" value="预算计划申请"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_BG_AlterM"> 
    <table name="OA_BG_AlterM" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_BG_AlterD"> 
    <table name="OA_BG_AlterD" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_BG_AlterExecute"> 
    <table name="OA_PUB_Execute" type="owner-table"> 
      <key field="fID" type="String"/>  
      <discriminator field="fBizKind" value="预算计划变更"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_BG_History"> 
    <table name="OA_BG_History" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_BG_BadgutM"> 
    <table name="OA_BG_BadgutM" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_BG_BadgutD"> 
    <table name="OA_BG_BadgutD" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
<mapping concept="OA_Pub_BaseCode"><table name="OA_Pub_BaseCode" type="owner-table"><key field="fID" type="String"></key>
</table>
</mapping>
</model>
