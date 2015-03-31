<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">  
  <store name="OA_CA_FeesRegister"/>  
  <store name="OA_AS_Card"/>  
    
  <store name="OA_CA_CarRecordFeeDetail"/>  
  <store name="OA_CA_CarRecord"/>  
  <store name="OA_CA_AccidentRecord"/>  
  <store name="OA_CA_PeccancyRecord"/>  
  <store name="OA_CA_CarManageArrange"/>  
  <store name="OA_CA_CarManage"/>  
  <store name="OA_CA_CarUseArrange"/>  
  <store name="OA_CA_CarUseExecute"/>  
  <store name="OA_CA_CarUseApply"/>  
  <store name="OA_CA_CarSafetyInfo"/>  
  <store name="OA_CA_CarYearCheckInfo"/>  
  <store name="OA_CA_DriverBasicInfo"/>  
  <store name="OA_CA_CarBasicInfo"/>  
    
    
    
    
    
  <mapping concept="OA_CA_FeesRegister"> 
    <table name="OA_CA_FeesRegister" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
    
    
    
    
    
  <mapping concept="OA_CA_CarBasicInfo"> 
    <table name="OA_CA_CarBasicInfo" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_CA_DriverBasicInfo"> 
    <table name="OA_CA_DriverBasicInfo" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_CA_CarYearCheckInfo"> 
    <table name="OA_CA_CarYearCheckInfo" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_CA_CarSafetyInfo"> 
    <table name="OA_CA_CarSafetyInfo" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_CA_CarUseApply"> 
    <table name="OA_CA_CarUseApply" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_CA_CarUseExecute"> 
    <table name="OA_PUB_Execute" type="owner-table"> 
      <key field="fID" type="String"/>  
      <item field="fMasterID" relation="fMasterID" type="String"/>  
      <discriminator field="fBizKind" value="车辆使用申请"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_CA_CarUseArrange"> 
    <table name="OA_CA_CarUseArrange" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_CA_CarManage"> 
    <table name="OA_CA_CarManage" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_CA_CarManageArrange"> 
    <table name="OA_CA_CarManageArrange" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_CA_PeccancyRecord"> 
    <table name="OA_CA_PeccancyRecord" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_CA_AccidentRecord"> 
    <table name="OA_CA_AccidentRecord" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_CA_CarRecord"> 
    <table name="OA_CA_CarRecord" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_CA_CarRecordFeeDetail"> 
    <table name="OA_CA_CarRecordFeeDetail" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping>  
    
  <mapping concept="OA_AS_Card"> 
    <table name="OA_AS_Card" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping> 
</model>