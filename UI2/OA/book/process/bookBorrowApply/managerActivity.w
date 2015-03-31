<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  extends="$UI/OA/book/process/bookBorrowApply/mainActivity.w" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  class="window window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:mobile" >

  <div xid="detailgrid" xui:update-mode="delete"/>
    <rule xid="rule1_1" xui:parent="dBookApplyM" xui:update-mode="insert" >
<readonly xid="readonly1_1" >
<expr xid="default1_1" >
$model.datareadOnly()</expr>
</readonly>
</rule>
    <div class="table table-hover table-striped" component="$UI/system/components/justep/dataTables/dataTables" data="dBookApplyD" flexibleWidth="true" rowActiveClass="active" xid="dataTables1_3" xui:parent="productGroup" xui:update-mode="insert" >
<columns xid="columns1_3" >
<column name="fBooksNumber" xid="column1_3" />
<column name="fBooksName" xid="column2_3" />
<column name="fBooksTypeName" xid="column3_3" />
<column name="fAuthor" xid="column5_3" />
<column name="fBookConcern" xid="column4_3" />
<column name="fPrice" xid="column8_3" />
<column name="fPageNum" xid="column6_3" />
<column name="fRemark" xid="column7_3" />
</columns>
</div>
   <a xid="addBookBtn" bind-enable="$model.readOnly()"  xui:update-mode="merge"/>
   <a xid="deleteBtn" bind-enable="$model.readOnly()"  xui:update-mode="merge"/>

</div>