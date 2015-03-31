<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:160px;top:198px;">
    <div component="$UI/system/components/justep/data/bizData" xid="dBookInfo"
      concept="OA_BK_BookInfo" autoLoad="true">
      <reader xid="default1" action="/OA/book/logic/action/queryBKBookInfoAction"/>  
      <writer xid="default2" action="/OA/book/logic/action/saveBKBookInfoAction"/>  
      <creator xid="default3" action="/OA/book/logic/action/createBKBookInfoAction"/>
    </div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="conditionData" idColumn="id">
   <data xid="default7">[{&quot;id&quot;:&quot;id&quot;}]</data>
   <column label="id" name="id" type="String" xid="column5"></column>
   <column label="状态" name="status" type="String" xid="column2"></column>
   <column label="条件" name="text" type="String" xid="default6"></column>
   <column label="状态名称" name="statusLabel" type="String" xid="default8"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="statusData" idColumn="id">
   <column label="id" name="id" type="String" xid="column3"></column>
   <column label="name" name="name" type="String" xid="column4"></column>
   <data xid="default9">[{&quot;id&quot;:&quot;0&quot;,&quot;name&quot;:&quot;闲置&quot;},{&quot;id&quot;:&quot;1&quot;,&quot;name&quot;:&quot;借出&quot;}]</data></div></div> 
  
   <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"> 
      
   
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="refreshBtn" label="刷新" onClick="{operation:'dBookInfo.refresh'}"> 
      <i xid="i2"/>  
      <span xid="span2">刷新</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="查询" xid="filterBtn" icon="icon-android-search" onClick="{operation:'dataFilter.menu'}"> 
      <i xid="i5" class="icon-android-search"/>  
      <span xid="span8">查询</span> 
    </a> 
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="申请借阅" xid="btnApply" icon="icon-android-add" onClick="btnApplyClick">
   <i xid="i1" class="icon-android-add"></i>
   <span xid="span7">申请借阅</span></a><div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="statusSelect" bind-ref="conditionData.ref('status')" bind-labelRef="conditionData.ref('statusLabel')" style="width:100px;" multiselect="true" onUpdateValue="statusSelectUpdateValue">
   <option xid="option1" data="statusData" value="id" label="name"></option></div><div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter1" filterData="dBookInfo" filterCols="fBooksNumber,fBooksName,fBooksTypeName,fBooksNo,fBookConcern,fEditionOrder,fPageNum,fPrice" class="x-smartFilter-clear-hide input-group"> 
      <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input1" /> 
    </div>
  </div>  
   <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
    rowActiveClass="active" class="table table-hover table-striped" xid="maindataTables"
    data="dBookInfo" showRowNumber="true" onRowDblClick="maindataTablesRowDblClick" multiSelect="true"> 
    <columns xid="columns1">
      <column name="fLoanName" xid="column1"></column><column name="fBooksNumber" xid="column10"/>  
      <column name="fBooksName" xid="column11"/>  
      <column name="fBooksTypeName" xid="column12"/>  
      <column name="fBooksNo" xid="column13"/>  
      <column name="fBookConcern" xid="column14"/>  
      <column name="fAuthor" xid="column15"/>  
      <column name="fPageNum" xid="column16"/>  
      <column name="fPrice" xid="column17"/>  
      <column name="fBuyDate" xid="column18"/>
    </columns>
  </div>
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="dataFilter"
    filterData="dBookInfo" style="left:28px;top:290px;"/>  
    <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
    xid="pagerBar1" data="dBookInfo"> 
    <div class="row" xid="div1"> 
      <div class="col-sm-3" xid="div2"> 
        <div class="x-pagerbar-length" xid="div3"> 
          <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
            class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
            <span xid="span1">显示</span>  
            <select component="$UI/system/components/justep/select/select" class="form-control input-sm"
              xid="select1"> 
              <option value="10" xid="default2">10</option>  
              <option value="20" xid="default3">20</option>  
              <option value="50" xid="default4">50</option>  
              <option value="100" xid="default5">100</option> 
            </select>  
            <span xid="span3">条</span> 
          </label> 
        </div> 
      </div>  
      <div class="col-sm-3" xid="div4"> 
        <div class="x-pagerbar-info" xid="div5">当前显示1-10条，共16条</div> 
      </div>  
      <div class="col-sm-6" xid="div6"> 
        <div class="x-pagerbar-pagination" xid="div7"> 
          <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
            xid="pagination1"> 
            <li class="prev" xid="li1"> 
              <a href="#" xid="a1"> 
                <span aria-hidden="true" xid="span4">«</span>  
                <span class="sr-only" xid="span5">Previous</span> 
              </a> 
            </li>  
            <li class="next" xid="li2"> 
              <a href="#" xid="a2"> 
                <span aria-hidden="true" xid="span6">»</span>  
                <span class="sr-only" xid="span9">Next</span> 
              </a> 
            </li> 
          </ul> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
