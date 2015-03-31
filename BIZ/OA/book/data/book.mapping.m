<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">  
  <store name="OA_Pub_BaseCode"/>  
  <store name="OA_BK_BookApplyExecute"/>  
  <store name="OA_BK_BookApplyD"/>  
  <store name="OA_BK_BookApplyM"/>  
  <store name="OA_BK_BookInfo"/>  
    
  <store name="V_OA_Book_ApplyStatus"/>  
  <mapping concept="OA_BK_BookInfo"> 
    <table name="OA_BK_BookInfo" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
    
  <mapping concept="OA_BK_BookApplyM"> 
    <table name="OA_BK_BookApplyM" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_BK_BookApplyD"> 
    <table name="OA_BK_BookApplyD" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="V_OA_Book_ApplyStatus"> 
    <table name="V_OA_Book_ApplyStatus" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_BK_BookApplyExecute"> 
    <table name="OA_PUB_Execute" type="owner-table"> 
      <key field="fID" type="String"/>  
      <discriminator field="fBizKind" value="图书借阅申请"/> 
    </table> 
  </mapping>  
</model>