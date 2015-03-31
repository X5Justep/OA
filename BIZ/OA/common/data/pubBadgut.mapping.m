<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">  
  <store name="OA_BG_CostCenter"/>  
  <store name="OA_BG_CostAccount"/>  
    
  <mapping concept="OA_BG_CostCenter"> 
    <table name="OA_BG_CostCenter" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_BG_CostAccount"> 
    <table name="OA_BG_CostAccount" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
   
</model>