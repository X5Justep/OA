<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action name="staffStateQueryAction" global="false" procedure="staffStateQueryProc"> 
    <label language="zh_CN">人员状态信息查询</label>  
    <public type="String" name="begin" required="true"/>  
    <public type="String" required="true" name="end"/>
    <public name="searchPersonName" type="String"/>
    <public name="searchOrgName" type="String"/> 
  </action>  
  <action name="getStaffStateAction" procedure="getStaffStateProcedure"/>  
  <procedure name="getStaffStateProcedure" code="StaffState.getStaffState" code-model="/OA/staffState/logic/code"/> 
  
  <action name="getStaffStateByDeptAction" procedure="getStaffStateByDeptProcedure">
  	<public name="deptNames" type="String"/>
  </action>  
  <procedure name="getStaffStateByDeptProcedure" code="StaffState.getStaffStateByDept" code-model="/OA/staffState/logic/code">
  	<parameter name="deptNames" type="String"/>
  </procedure>
  
  <action name="getStaffStateOfDirectlyOgnAction" procedure="getStaffStateOfDirectlyOgnProcedure">
  </action>  
  <procedure name="getStaffStateOfDirectlyOgnProcedure" code="StaffState.getStaffStateOfDirectlyOgn" code-model="/OA/staffState/logic/code">
  </procedure>
  
  <action name="getStaffStateOfDeptAction" procedure="getStaffStateOfDeptProcedure">
  </action>  
  <procedure name="getStaffStateOfDeptProcedure" code="StaffState.getStaffStateOfDept" code-model="/OA/staffState/logic/code">
  </procedure>
  
  <action name="getStaffStateOfDirectDeptAction" procedure="getStaffStateOfDirectDeptProcedure">
  </action>  
  <procedure name="getStaffStateOfDirectDeptProcedure" code="StaffState.getStaffStateOfDirectDept" code-model="/OA/staffState/logic/code">
  </procedure>
  
  <action name="getStaffStateOfOwnDeptAction" procedure="getStaffStateOfOwnDeptProcedure">
  	<public name="deptID" type="String"/>
  </action>  
  <procedure name="getStaffStateOfOwnDeptProcedure" code="StaffState.getStaffStateOfOwnDept" code-model="/OA/staffState/logic/code">
  	<parameter name="deptID" type="String"/>
  </procedure>
  
</model>
