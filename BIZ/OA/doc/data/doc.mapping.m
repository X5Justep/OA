<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">

  <store name="OA_DC_ReaderOpinion"/>
  <store name="OA_DC_ReceiveRange"/>  
  <store name="OA_DC_DocExecute"/>  
    
  <store name="OA_DC_ReaderRange"/>  
  <store name="OA_DC_Doc"/> 
  <store name="OA_DC_SignPsn"/> 
  <store name="V_OA_DC_ReadOpinion"/> 
    
  <mapping concept="OA_DC_ReaderRange"> 
    <table name="OA_DC_ReaderRange" type="owner-table"> 
      <key field="fID" type="String"/>  
      <item field="fMasterID" relation="fMasterID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_DC_ReceiveRange"> 
    <table name="OA_DC_ReceiveRange" type="owner-table"> 
      <key field="fID" type="String"/>  
      <item field="fMasterID" relation="fMasterID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_DC_DocExecute"> 
    <table name="OA_PUB_Execute" type="owner-table"> 
      <key field="fID" type="String"/>  
      <item field="fMasterID" relation="fMasterID" type="String"/>  
      <discriminator field="fBizKind" value="公文业务流程"/> 
    </table> 
  </mapping> 
  <mapping concept="OA_DC_Doc"> 
    <table name="OA_DC_Doc" type="owner-table"> 
      <key field="fID" type="String"/>  
      <item field="fHasProcess" relation="fHasProcess" type="String"/>  
      <item field="fHasReaders" relation="fHasReaders" type="String"/>  
      <item field="fHasReceivers" relation="fHasReceivers" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_DC_ReaderOpinion"> 
    <table name="OA_PUB_Execute" type="owner-table"> 
      <key field="fID" type="String"/>  
      <item field="fMasterID" relation="fMasterID" type="String"/>  
      <discriminator field="fBizKind" value="阅文意见"/> 
    </table> 
  </mapping> 
</model>