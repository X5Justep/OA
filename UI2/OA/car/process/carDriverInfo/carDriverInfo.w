<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:204px;top:225px;">
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_CA_DriverBasicInfo" limit="10" columns=""
      autoNew="false" onSaveCommit="dataSaveCommit"> 
      <reader action="/OA/car/logic/action/queryCADriverBasicInfoAction"/>  
      <writer action="/OA/car/logic/action/saveCADriverBasicInfoAction"/>  
      <creator action="/OA/car/logic/action/createCADriverBasicInfoAction"/>  
    <calculateRelation relation="driverNO" xid="calculateRelation1" type="Integer"></calculateRelation>
  <rule xid="rule1">
   <col name="driverNO" xid="ruleCol1">
    <calculate xid="calculate1">
     <expr xid="default5"><![CDATA[$row.index()+1]]></expr></calculate> </col> </rule></div>
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
    xid="bar"> 
    <a component="$UI/system/components/justep/button/button" label=" 新建"
      class="btn btn-link btn-icon-left" icon="icon-plus" onClick="addBtn"
      xid="newBtn"> 
      <i class="icon-plus"/>  
      <span>新建</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="编辑" xid="editBtn" icon="icon-edit" onClick="editBtnClick"> 
      <i xid="i1" class="icon-edit"/>  
      <span xid="span1">编辑</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="保存" xid="saveBtn" onClick='{"operation":"mainData.save"}'> 
      <i xid="i3"/>  
      <span xid="label7">保存</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="删除" xid="deleteBtn" onClick='{"operation":"mainData.delete"}'> 
      <i xid="i4"/>  
      <span xid="span7">删除</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="refreshBtn" onClick='{"operation":"mainData.refresh"}' label="刷新"> 
      <i xid="i2"/>  
      <span xid="span2">刷新</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="查询" xid="filterBtn" icon="icon-android-search" onClick='{"operation":"filter.menu"}'> 
      <i xid="i5" class="icon-android-search"/>  
      <span xid="span8">查询</span> 
    </a>
    <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter"
      filterData="mainData" filterCols="fCode,fName,fDrivingLicence,fSendLicenceDate,fCarLicenceLife,fCarKindName,fDrivingYears,fMobilePhone,fRemark,fUseStatusName" class="pull-right"> 
      <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
        bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
        xid="input1"/> 
    </div> 
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="启用" xid="trgStartUse" icon="icon-ios7-play" onClick="trgStartUseClick">
   <i xid="i8" class="icon-ios7-play"></i>
   <span xid="span12">启用</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="全部启用" xid="trgAllUse" icon="icon-ios7-skipforward" onClick="trgAllUseClick">
   <i xid="i9" class="icon-ios7-skipforward"></i>
   <span xid="span13">全部启用</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="停用" xid="trgStopUse" icon="icon-ios7-pause" onClick="trgStopUseClick">
   <i xid="i10" class="icon-ios7-pause"></i>
   <span xid="span14">停用</span></a></div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="filter"
    filterData="mainData"/>  
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
    rowActiveClass="active" class="table table-hover table-striped" xid="list"
    data="mainData" onRowDblClick="editBtnClick"> 
    <columns xid="column">
      <column name="driverNO" label="编码"/>
      <column name="fCode" label="编码" xid="column2"></column><column name="fName" label="名称"/>
      <column name="fDrivingLicence" label="驾驶证号"/>
      <column name="fSendLicenceDate" label="发证日期"/>
      <column name="fCarLicenceLife" label="证件有效期"/>
      <column name="fCarKindName" label="车辆类型"/>
      <column name="fDrivingYears" label="驾龄"/>
      <column name="fMobilePhone" label="手机号码"/>
      <column name="fRemark" label="备注"/>
      <column name="fUseStatusName" label="启用标识"/>
    </columns> 
  </div>  
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
    xid="pagerBar" data="mainData"> 
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
    title="详细" status="normal" showTitle="true" height="90%" width="90%" src="carDriverInfoDetail.w"
    onReceive="windowDialogReceive"/>
</div>