<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:463px;top:331px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dialogData"
      autoLoad="true" autoNew="false" concept="OA_LS_LicenseManage" columns="" isTree="false"
      limit="-1"> 
      <reader action="/OA/license/logic/action/queryLSLicenseManageAction"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="top:2px;left:606px;" onReceive="windowReceiverReceive"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top container-fluid" xid="top2"> 
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row2" style="height:100%;"> 
        <div class="col col-xs-6 col-md-4" xid="col4" style="height:100%;padding-left: 0;"> 
          <div component="$UI/system/components/justep/smartFilter/smartFilter"
            xid="smartFilter1" filterData="dialogData" filterCols="fUseStatusName,fSerialNumber,fLicenseNo,fLicenseName,fLicenseNo,fIsCopyName,fReleaseDeptName,fReleaseDate,fValidityDate"> 
            <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
              bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
              xid="input1"/> 
          </div> 
        </div>  
        <div class="col col-xs-6 col-md-8" xid="col3" style="height:100%;"> 
          <div class="pull-right"/>  
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content container-fluid" xid="content1"> 
      <div class="x-bordered" style="height:100%;" xid="searchDiv"> 
        <div component="$UI/system/components/justep/dataTables/dataTables"
          flexibleWidth="false" data="dialogData" rowActiveClass="active" class="table table-hover hidder-xs"
          xid="searchGrid" scrollCollapse="false" ordering="false" 
          lengthMenu="20" multiSelect="true" showRowNumber="false" responsive="true"> 
          <columns> 
            <column label="状态" name="fUseStatusName"/>  
            <column label="编号" name="fSerialNumber"/>  
            <column label="证照名称" name="fLicenseName"/>  
            <column label="证照号" name="fLicenseNo"/>  
            <column label="标示" name="fIsCopyName"/>  
            <column label="颁布部门" name="fReleaseDeptName"/>  
            <column label="颁发日期" name="fReleaseDate"/>  
            <column label="有效期" name="fValidityDate"/> 
          </columns> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1" height="42"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
        label="取消" xid="cancelBtn" onClick="{&quot;operation&quot;:&quot;windowReceiver.windowCancel&quot;}"> 
        <i xid="i2"/>  
        <span xid="span2">取消</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button"
        label="确定" xid="OKBtn" onClick="OKBtnClick"> 
        <i xid="i1"/>  
        <span xid="span1">确定</span> 
      </a> 
    </div> 
  </div> 
</div>
