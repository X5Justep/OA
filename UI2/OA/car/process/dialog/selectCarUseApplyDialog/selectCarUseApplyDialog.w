<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  component="$UI/system/components/justep/window/window" 
  extends="$UI/OA/car/process/dialog/parent/listSingleTemplete.w" 
  xid="window" 
  class="window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc" >

  <div xid="dataTables1" xui:update-mode="delete"/>
   <div xid="mainData" columns="fNO,fCode,fName,fCarID,fMasterID,fCarDriverID,fCarDriverName,fApplyDeptID,fApplyDeptName,fApplyPsnID,fApplyPsnName,fBeginTime,fEndTime" concept="OA_CA_CarManageArrange" orderBy="fNO:asc"  xui:update-mode="merge"/>
   <reader xid="default1" action="/OA/car/logic/action/queryCACarManageArrangeDetailAction"  xui:update-mode="merge"/>
    <div class="table table-hover table-striped" component="$UI/system/components/justep/dataTables/dataTables" data="mainData" flexibleWidth="true" rowActiveClass="active" xid="dataTables11_2" xui:before="pagerBar1" xui:parent="content1" xui:update-mode="insert" >
<columns xid="columns11_2" >
<column name="fCarDriverName" xid="column1" />
<column name="fCode" xid="column2" />
<column name="fName" xid="column3" />
<column name="fNO" xid="column4" />
<column name="fApplyDeptName" xid="column5" />
<column name="fApplyPsnName" xid="column6" />
<column name="fBeginTime" xid="column7" />
<column name="fEndTime" xid="column8" />
<column name="carsNO" xid="column9" />
</columns>
</div>

</div>