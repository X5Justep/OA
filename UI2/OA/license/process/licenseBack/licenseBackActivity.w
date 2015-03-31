<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:334px;top:318px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_LS_LicenseView" columns="" limit="20"> 
      <reader action="/OA/license/logic/action/queryLSLicenseViewAction"/>  
      <writer action="/OA/license/logic/action/saveLSLicenseViewAction"/>  
      <creator action="/OA/license/logic/action/createLSLicenseViewAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    </div> 
  </div>  
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="bar"> 
      <div component="$UI/system/components/justep/smartFilter/smartFilter"
        xid="smartFilter1" filterData="mainData" filterCols="fNO,fApplyDStatusName,fLicenseName,fLicenseNo,fRetDate,fRemark,fCrossPer,fCreateDeptName,fCreatePsnName,fCreateTime"
        class="pull-right"> 
        <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
          bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
          xid="input1"/> 
      </div>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="refreshBtn" onClick="{&quot;operation&quot;:&quot;mainData.refresh&quot;}" label="刷新"> 
        <i xid="i2"/>  
        <span xid="span2">刷新</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="查询" xid="filterBtn" icon="icon-android-search" onClick="{operation:'bizFilter.menu'}"> 
        <i xid="i5" class="icon-android-search"/>  
        <span xid="span8">查询</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="归还" xid="tbnBack" onClick="tbnBackClick" bind-disable=" $model.getData().count() == 0"> 
        <i xid="i1"/>  
        <span xid="span7">归还</span> 
      </a> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter"
    filterData="mainData" style="left:28px;top:290px;"/>  
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="false"
    rowActiveClass="active" class="table table-hover hidder-xs" xid="grdLicenseView"
    data="mainData" onRowDblClick="grdLicenseViewRowDblClick" responsive="true"> 
    <columns xid="columns1"> 
      <column name="fNO" xid="column1"/>  
      <column name="fApplyDStatusName" xid="column2"/>  
      <column name="fLicenseName" xid="column3"/>  
      <column name="fLicenseNo" xid="column4"/>  
      <column name="fRetDate" xid="column5"/>  
      <column name="fRemark" xid="column6"/>  
      <column name="fCrossPer" xid="column8"/>  
      <column name="fCreateDeptName" xid="column9"/>  
      <column name="fCreatePsnName" xid="column10"/>  
      <column name="fCreateTime" xid="column11"/> 
    </columns> 
  </div>  
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
    xid="pagerBar" data="mainData"> 
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
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgLicenseViewDetail"
    title="证照借用详细信息" status="normal" showTitle="true" src="$UI/OA/license/process/licenseBack/licenseViewDetail.w"
    onReceive="dlgLicenseViewDetailReceive"/>
</div>
