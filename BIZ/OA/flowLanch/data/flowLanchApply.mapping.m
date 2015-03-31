<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">
  <store name="OA_FL_FlowLanchApply"/>
  <store name="OA_FL_FlowLanchExecute"/>
  <mapping concept="OA_FL_FlowLanchApply">
    <table name="OA_FL_FlowLanchApply" type="owner-table">
      <key field="fID" type="String"/>
    </table>
  </mapping>
  <mapping concept="OA_FL_FlowLanchExecute">
    <table name="OA_PUB_Execute" type="owner-table">
      <key field="fID" type="String"/>
      <discriminator field="fBizKind" value="事务办理"/>
    <item field="fMasterID" relation="fMasterID" type="String"/>
</table>
  </mapping>
</model>