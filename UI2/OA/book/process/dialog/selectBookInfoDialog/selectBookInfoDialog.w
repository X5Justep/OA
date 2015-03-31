<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  extends="$UI/OA/common/process/pubMultySelect/pubMultySelect.w" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  class="window window window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:mobile" >

   <div xid="main" autoLoad="true" concept="OA_BK_BookInfo"  xui:update-mode="merge"/>
    <reader action="/OA/book/logic/action/queryBKBookInfoAction" xid="default1_1" xui:parent="main" xui:update-mode="insert" />
    <column name="fBooksNumber" xid="column1_1" xui:parent="columns2" xui:update-mode="insert" />
    <column name="fBooksName" xid="column2_1" xui:parent="columns2" xui:update-mode="insert" />
    <column name="fBooksTypeName" xid="column3_1" xui:parent="columns2" xui:update-mode="insert" />
    <column name="fBookConcern" xid="column4_1" xui:parent="columns2" xui:update-mode="insert" />
    <column name="fAuthor" xid="column5_1" xui:parent="columns2" xui:update-mode="insert" />
    <column name="fPageNum" xid="column6_1" xui:parent="columns2" xui:update-mode="insert" />
    <column name="fPrice" xid="column7_1" xui:parent="columns2" xui:update-mode="insert" />

</div>