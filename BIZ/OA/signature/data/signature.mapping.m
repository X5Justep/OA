<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">
<store name="OA_Pub_BaseCode"/>

<store name="OA_SL_Signature"/>
<store name="OA_SL_UseExecute"/>
  
  <mapping concept="OA_SL_Signature">
    <table name="OA_SL_Signature" type="owner-table">
      <key field="fID" type="String"/>
    </table>
  </mapping>
  <mapping concept="OA_SL_UseExecute">
    <table name="OA_PUB_Execute" type="owner-table">
      <key field="fID" type="String"/>
      <discriminator field="fBizKind" value="印章使用申请"/>
    <item field="fMasterID" relation="fMasterID" type="String"/>
</table>
  </mapping>
<mapping concept="OA_Pub_BaseCode"><table name="OA_Pub_BaseCode" type="owner-table"><key field="fID" type="String"/>
</table>
</mapping>
</model>