<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">  
  <store name="OA_overtime_EXECUTE"/>  
  <store name="OA_WM_OvertimeApply"/>  
  <mapping concept="OA_WM_OvertimeApply"> 
    <table name="OA_WM_OvertimeApply" type="owner-table"> 
      <key field="fID" type="String"/>  
      <item field="version" relation="version"/>  
      <item field="fNO" relation="fNO"/>  
      <item field="fApplyPersonID" relation="fApplyPersonID"/>  
      <item field="fApplyPersonName" relation="fApplyPersonName"/>  
      <item field="fApplyDeptID" relation="fApplyDeptID"/>  
      <item field="fApplyDeptName" relation="fApplyDeptName"/>  
      <item field="fApplyDate" relation="fApplyDate"/>  
      <item field="fSTARTTIME" relation="fSTARTTIME"/>  
      <item field="fENDTIME" relation="fENDTIME"/>  
      <item field="fDAYS" relation="fDAYS"/>  
      <item field="fHOURS" relation="fHOURS"/>  
      <item field="fTIME" relation="fTIME"/>  
      <item field="fREASON" relation="fREASON"/>  
      <item field="fType" relation="fType"/>  
      <item field="fBizState" relation="fBizState"/>  
      <item field="fBizStateName" relation="fBizStateName"/>  
      <item field="fCreateDeptID" relation="fCreateDeptID"/>  
      <item field="fCreateDeptName" relation="fCreateDeptName"/>  
      <item field="fCreatePerID" relation="fCreatePerID"/>  
      <item field="fCreatePerName" relation="fCreatePerName"/>  
      <item field="fCreateTime" relation="fCreateTime"/>  
      <item field="fUpdateDeptID" relation="fUpdateDeptID"/>  
      <item field="fUpdateDeptName" relation="fUpdateDeptName"/>  
      <item field="fUpdatePerID" relation="fUpdatePerID"/>  
      <item field="fUpdatePerName" relation="fUpdatePerName"/>  
      <item field="fUpdateTime" relation="fUpdateTime"/>  
      <item field="fCurrentActivities" relation="fCurrentActivities"/>  
      <item field="fCurrentExecutors" relation="fCurrentExecutors"/> 
    </table> 
  </mapping>  
  <mapping concept="OA_overtime_EXECUTE"> 
    <table name="OA_PUB_EXECUTE" type="owner-table"> 
      <key field="fID" type="String"/>  
      <discriminator field="fBizKind" value="加班申请"/> 
    </table> 
  </mapping> 
</model>