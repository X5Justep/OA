<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:431px;top:134px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" autoNew="false" concept="OA_LS_LicenseApplyM"
      columns=""> 
      <reader action="/OA/license/logic/action/queryLSLicenseApplyMAction"/>  
      <writer action="/OA/license/logic/action/saveLSLicenseApplyMAction"/>  
      <creator action="/OA/license/logic/action/createLSLicenseApplyMAction"/>  
      <rule xid="rule2"> 
        <readonly xid="readonly1"> 
          <expr xid="default8">true</expr> 
        </readonly> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="detailData"
      directDelete="true" autoLoad="true" autoNew="false" concept="OA_LS_LicenseApplyD"
      limit="-1" columns=""> 
      <reader action="/OA/license/logic/action/queryLSLicenseApplyDAction"/>  
      <writer action="/OA/license/logic/action/saveLSLicenseApplyDAction"/>  
      <creator action="/OA/license/logic/action/createLSLicenseApplyDAction"/>  
      <master xid="default1" data="mainData" relation="fApplyID"/>  
      <rule xid="rule4"> 
        <readonly xid="readonly3"> 
          <expr xid="default12">true</expr> 
        </readonly> 
      </rule> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="filter"
    filterData="mainData"/>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData" autoClose="false" autoStart="false" autoSave="false" autoFilter="false"/>  
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs"> 
    <ul class="nav nav-tabs" xid="nav"> 
      <li class="active" xid="listLi"> 
        <a content="listContent" xid="listItem"><![CDATA[列表]]></a> 
      </li>  
      <li role="presentation" xid="detailLi"> 
        <a content="detailContent" xid="detailItem"><![CDATA[详细]]></a> 
      </li> 
    </ul>  
    <div class="tab-content" xid="content"> 
      <div class="tab-pane active container-fluid" xid="listContent"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
          xid="listBar"> 
          <div component="$UI/system/components/justep/smartFilter/smartFilter"
            xid="smartFilter1" filterData="mainData" style="float: right;" filterCols="fNO,fRetDate,fRemark,fCreateDeptName,fCreatePsnName,fCreateTime"> 
            <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
              bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
              xid="input1"/> 
          </div>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="refreshBtn" onClick="{operation:'mainData.refresh'}"> 
            <i xid="i1"/>  
            <span xid="span1"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            label="" xid="filterBtn" icon="icon-search" onClick="{operation:'filter.menu'}"> 
            <i xid="i4" class="icon-search"/>  
            <span xid="span5"/> 
          </a> 
        </div>  
        <div component="$UI/system/components/justep/dataTables/dataTables"
          flexibleWidth="true" rowActiveClass="active" class="table table-condensed table-hover"
          xid="list" data="mainData" pagingType="simple_numbers" onRowDblClick="listTablesRowDblClick"
          showRowNumber="true"> 
          <columns xid="column"> 
            <column name="fBizStateName" label="状态"/>  
            <column name="fNO" label="单据号"/>  
            <column name="fRetDate" label="归还日期"/>  
            <column name="fRemark" label="备注"/>  
            <column name="fCreateDeptName" label="提交部门"/>  
            <column name="fCreatePsnName" label="经办人"/>  
            <column name="fCreateTime" label="提交时间"/> 
          </columns> 
        </div>  
        <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
          xid="pagerBar" data="mainData"> 
          <div class="row" xid="div1"> 
            <div class="col-sm-3" xid="div2"> 
              <div class="x-pagerbar-length" xid="div4"> 
                <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
                  class="x-pagerlimitselect" xid="pagerLimitSelect2"> 
                  <span xid="span7">显示</span>  
                  <select component="$UI/system/components/justep/select/select"
                    class="form-control input-sm" xid="select2"> 
                    <option value="10" xid="default14">10</option>  
                    <option value="20" xid="default15">20</option>  
                    <option value="50" xid="default16">50</option>  
                    <option value="100" xid="default17">100</option> 
                  </select>  
                  <span xid="span10">条</span> 
                </label> 
              </div> 
            </div>  
            <div class="col-sm-3" xid="div9"> 
              <div class="x-pagerbar-info" xid="div10">当前显示1-10条，共16条</div> 
            </div>  
            <div class="col-sm-6" xid="div11"> 
              <div class="x-pagerbar-pagination" xid="div12"> 
                <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
                  xid="pagination1"> 
                  <li class="prev" xid="li3"> 
                    <a href="#" xid="a1"> 
                      <span aria-hidden="true" xid="span11">«</span>  
                      <span class="sr-only" xid="span12">Previous</span> 
                    </a> 
                  </li>  
                  <li class="next" xid="li4"> 
                    <a href="#" xid="a5"> 
                      <span aria-hidden="true" xid="span13">»</span>  
                      <span class="sr-only" xid="span14">Next</span> 
                    </a> 
                  </li> 
                </ul> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div class="tab-pane" xid="detailContent"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
          xid="detailBar"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="chart2Btn" onClick="chart2BtnClick" label="流程图" icon="icon-image"> 
            <i xid="i9" class="icon-image"/>  
            <span xid="span9">流程图</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="preBtn" onClick="{operation:'mainData.prevRow'}"> 
            <i xid="i3"/>  
            <span xid="span3"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="nextBtn" onClick="{operation:'mainData.nextRow'}"> 
            <i xid="i5"/>  
            <span xid="span4"/> 
          </a> 
        </div>  
        <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"> 
          <div xid="formGroup1" class="form-group"> 
            <div xid="col11" class="col-sm-2"> 
              <label xid="fRetDateL" class="control-label" bind-text="mainData.label('fRetDate')"/> 
            </div>  
            <div xid="col12" class="col-sm-4"> 
              <output component="$UI/system/components/justep/output/output" class="form-control"
                xid="fRetDate" bind-ref="mainData.ref('fRetDate')"/> 
            </div>  
            <div xid="col13" class="col-sm-2"> 
              <label xid="fRemarkL" class="control-label" bind-text="mainData.label('fRemark')"/> 
            </div>  
            <div xid="col14" class="col-sm-4"> 
              <output xid="fRemark" component="$UI/system/components/justep/output/output"
                class="form-control" bind-ref="mainData.ref('fRemark')"/> 
            </div> 
          </div>  
          <div xid="formGroup2" class="form-group"> 
            <div xid="col21" class="col-sm-2"> 
              <label xid="fCreateDeptNameL" class="control-label" bind-text="mainData.label('fCreateDeptName')"/> 
            </div>  
            <div xid="col22" class="col-sm-4"> 
              <output component="$UI/system/components/justep/output/output" class="form-control"
                xid="fCreateDeptName" bind-ref="mainData.ref('fCreateDeptName')"/> 
            </div>  
            <div xid="col23" class="col-sm-2"> 
              <label xid="fCreatePsnNameL" class="control-label" bind-text="mainData.label('fCreatePsnName')"/> 
            </div>  
            <div xid="col24" class="col-sm-4"> 
              <output xid="fCreatePsnName" component="$UI/system/components/justep/output/output"
                class="form-control" bind-ref="mainData.ref('fCreatePsnName')"/> 
            </div> 
          </div>  
          <div xid="formGroup3" class="form-group"> 
            <div xid="col31" class="col-sm-2"> 
              <label xid="fCreateTimeL" class="control-label" bind-text="mainData.label('fCreateTime')"/> 
            </div>  
            <div xid="col32" class="col-sm-4"> 
              <output component="$UI/system/components/justep/output/output" class="form-control"
                xid="fCreateTime" bind-ref="mainData.ref('fCreateTime')"/> 
            </div> 
          </div>  
          <div component="$UI/system/components/bootstrap/accordion/accordion"
            class="panel-group" xid="accordion2" tabbed="false"> 
            <div class="panel panel-default " component="$UI/system/components/bootstrap/panel/panel"
              xid="productPanel"> 
              <div class="panel-heading" xid="heading5"> 
                <h4 class="panel-title" xid="h45"> 
                  <a href="javascript:void(0)" xid="a2">从列表</a> 
                </h4> 
              </div>  
              <div class="panel-collapse in" xid="div3"> 
                <div component="$UI/system/components/justep/dataTables/dataTables"
                  flexibleWidth="true" class="table table-condensed table-hover" xid="detailTable"
                  data="detailData" pagingType="simple" rowActiveClass="active"> 
                  <columns xid="column"> 
                    <column name="fSerialNumber" xid="fSerialNumber" label="编号"/>  
                    <column name="fLicenseName" xid="fLicenseName" label="证照名称"/>  
                    <column name="fLicenseNo" xid="fLicenseNo" label="证照号"/>  
                    <column name="fCrossPer" xid="fCrossPer" label="经办人"/>  
                    <column name="fRetDate" xid="fRetDate" label="归还日期"/> 
                  </columns> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
