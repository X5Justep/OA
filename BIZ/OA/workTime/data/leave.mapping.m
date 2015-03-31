<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">  
  <store name="OA_WM_LeaveApply"/>  
  <store name="OA_WM_LeaveApplyPC"/>  
  <mapping concept="OA_WM_LeaveApplyPC"> 
    <table name="OA_PUB_Execute" type="owner-table"> 
      <key field="fID" type="String"/>  
      <discriminator field="fBizKind" value="请假申请"/> 
    <item field="fMasterID" relation="fMasterID" type="String"/>
</table> 
  </mapping>  
  <mapping concept="OA_WM_LeaveApply"> 
    <table name="OA_WM_LeaveApply" type="owner-table"> 
      <key field="fID" type="String"/> 
    </table> 
  </mapping> 
</model>