<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:204px;top:225px;">
    <div component="$UI/system/components/justep/data/bizData" xid="dCarUseApplyQuery"
      directDelete="true" autoLoad="true" concept="OA_CA_CarUseApply" limit="10" autoNew="false"> 
      <reader action="/OA/car/logic/action/queryCACarUseApplyAction"/>  
      <writer action=""/>  
      <creator action=""/>  
    <calculateRelation relation="carUseApplyNO" xid="calculateRelation1" type="Integer"></calculateRelation>
  <rule xid="rule1">
   <col name="carUseApplyNO" xid="ruleCol1">
    <calculate xid="calculate1">
     <expr xid="default5"><![CDATA[$row.index()+1]]></expr></calculate> </col> </rule></div>
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
    xid="bar"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="refreshBtn" onClick='{"operation":"dCarUseApplyQuery.refresh"}' label="刷新"> 
      <i xid="i2"/>  
      <span xid="span2">刷新</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="查询" xid="filterBtn" icon="icon-android-search" onClick="{operation:'filter.menu'}"> 
      <i xid="i5" class="icon-android-search"/>  
      <span xid="span8">查询</span> 
    </a>
    <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter"
      filterData="dCarUseApplyQuery" filterCols="fNO,fApplyDeptName,fApplyPsnName,fApplyDate,fPersonCount,fDestination,fIsRoundtrip,fApplyReason,fBizStateName" class="pull-right"> 
      <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
        bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
        xid="input1"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
    rowActiveClass="active" class="table table-hover table-striped" xid="list"
    data="dCarUseApplyQuery" onRowDblClick="editBtnClick"> 
    <columns xid="column">
      <column name="carUseApplyNO" label="序号"/>
      <column name="fNO" label="单据号" xid="column2"></column><column name="fApplyDeptName" label="申请部门"/>
      <column name="fApplyPsnName" label="申请人员"/>
      <column name="fApplyDate" label="申请日期"/>
      <column name="fPersonCount" label="乘车人数"/>
      <column name="fDestination" label="目的地"/>
      <column name="fIsRoundtrip" label="是否往返"/>
      <column name="fApplyReason" label="用车事由"/>
      <column name="fBizStateName" label="业务流程状态"/>
    </columns> 
  </div>  
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
    xid="pagerBar" data="dCarUseApplyQuery"> 
    <div class="row" xid="div1"> 
      <div class="col-sm-3" xid="div2"> 
        <div class="x-pagerbar-length" xid="div3"> 
          <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
            class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
            <span xid="span3">显示</span>  
            <select component="$UI/system/components/justep/select/select" class="form-control input-sm"
              xid="select1"> 
              <option value="10" xid="default1">10</option>  
              <option value="20" xid="default2">20</option>  
              <option value="50" xid="default3">50</option>  
              <option value="100" xid="default4">100</option>
            </select>  
            <span xid="span4">条</span>
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
                <span aria-hidden="true" xid="span5">«</span>  
                <span class="sr-only" xid="span6">Previous</span>
              </a> 
            </li>  
            <li class="next" xid="li2"> 
              <a href="#" xid="a2"> 
                <span aria-hidden="true" xid="span9">»</span>  
                <span class="sr-only" xid="span10">Next</span>
              </a> 
            </li> 
          </ul> 
        </div> 
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog"
    title="详细" status="normal" showTitle="true" height="90%" width="90%" src="carUseApplyDetail.w"
    onReceive="windowDialogReceive"/>
<span component="$UI/system/components/justep/bizFilter/bizFilter" xid="filter" filterData="dCarUseApplyQuery"></span>
  </div>