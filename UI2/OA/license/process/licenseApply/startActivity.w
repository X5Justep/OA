<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:380px;top:216px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="false" autoNew="true" concept="OA_LS_LicenseApplyM"
      orderBy="" columns="" isTree="false"> 
      <reader action="/OA/license/logic/action/queryLSLicenseApplyMAction"/>  
      <writer action="/OA/license/logic/action/saveLSLicenseApplyMAction"/>  
      <creator action="/OA/license/logic/action/createLSLicenseApplyMAction"/>  
      <rule xid="rule1"> 
        <col name="fRetDate" xid="ruleCol1"> 
          <required xid="required1"> 
            <expr xid="default10">js:true</expr>  
            <message xid="default11"/> 
          </required> 
        </col> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="detailData"
      directDelete="true" autoLoad="true" autoNew="false" concept="OA_LS_LicenseApplyD"
      orderBy="" columns="" isTree="false"> 
      <reader action="/OA/license/logic/action/queryLSLicenseApplyDAction"/>  
      <writer action="/OA/license/logic/action/saveLSLicenseApplyDAction"/>  
      <creator action="/OA/license/logic/action/createLSLicenseApplyDAction"/>  
      <master xid="default1" data="mainData" relation="fApplyID"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData" style="width:24px;height:5px;left:184px;top:769px;"/>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="moreMenu" opacity="0" anchor="moreBtn" direction="left-bottom"> 
    <div class="x-popMenu-overlay" xid="moreMenuOverlay"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="moreContent"> 
      <li class="x-menu-item" xid="backItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="backBtn" onClick="{operation:'process.back'}"> 
          <i xid="i8"/>  
          <span xid="span6"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="suspendItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="suspendBtn" onClick="{operation:'process.suspend'}"> 
          <i xid="i3"/>  
          <span xid="span3"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="abortItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="abortBtn" onClick="{operation:'process.abort'}"> 
          <i xid="i4"/>  
          <span xid="span4"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="chartItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="chartBtn" onClick="{operation:'process.showChart'}"> 
          <i xid="i5"/>  
          <span xid="span5"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="recordItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="recordBtn" onClick="{operation:'process.processRecord'}"> 
          <i xid="i55"/>  
          <span xid="span55"/> 
        </a> 
      </li> 
    </ul> 
  </div>  
  <div xid="view"> 
    <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"> 
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
        xid="processBar"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="advanceBtn" onClick="{operation:'process.advance'}"> 
          <i xid="i2"/>  
          <span xid="span2">流转</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="saveBtn" onClick="{operation:'mainData.save'}"> 
          <i xid="i1"/>  
          <span xid="span1"/> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
          label="更多" xid="moreBtn" onClick="{operation:'moreMenu.show'}"> 
          <i xid="i15"/>  
          <span xid="span15">更多</span> 
        </a> 
      </div>  
      <!--     <div xid="content1">  -->  
      <div xid="formGroup1" class="form-group"> 
        <div xid="col41" class="col-sm-2"> 
          <label xid="fCreateTimeL" class="control-label" bind-text="mainData.label('fCreateTime')"/> 
        </div>  
        <div xid="col42" class="col-sm-4"> 
          <input xid="fCreateTime" class="form-control" component="$UI/system/components/justep/input/input"
            bind-ref="mainData.ref('fCreateTime')"/> 
        </div>  
        <div xid="col31" class="col-sm-2"> 
          <label xid="fCreateDeptNameL" class="control-label" bind-text="mainData.label(&quot;fRetDate&quot;)"/> 
        </div>  
        <div xid="col32" class="col-sm-4"> 
          <input xid="fCreateDeptName" class="form-control" component="$UI/system/components/justep/input/input"
            bind-ref="mainData.ref('fRetDate')"/> 
        </div> 
      </div>  
      <div xid="formGroup3" class="form-group"> 
        <div xid="col31" class="col-sm-2"> 
          <label xid="fCreateDeptNameL" class="control-label" bind-text="mainData.label('fCreateDeptName')"/> 
        </div>  
        <div xid="col32" class="col-sm-4"> 
          <input xid="fCreateDeptName" class="form-control" component="$UI/system/components/justep/input/input"
            bind-ref="mainData.ref('fCreateDeptName')"/> 
        </div>  
        <div xid="col33" class="col-sm-2"> 
          <label xid="fCreatePsnNameL" class="control-label" bind-text="mainData.label('fCreatePsnName')"/> 
        </div>  
        <div xid="col34" class="col-sm-4"> 
          <input xid="fCreatePsnName" class="form-control" component="$UI/system/components/justep/input/input"
            bind-ref="mainData.ref('fCreatePsnName')"/> 
        </div> 
      </div>  
      <div xid="formGroup2" class="form-group"> 
        <div xid="col21" class="col-sm-2"> 
          <label xid="fRemarkL" class="control-label" bind-text="mainData.label('fRemark')"/> 
        </div>  
        <div xid="col22" class="col-sm-10"> 
          <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control"
            xid="textarea1" bind-ref="mainData.ref('fRemark')"/> 
        </div> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/controlGroup/controlGroup"
      class="x-control-group" title="详细信息" collapsible="true" xid="detailCG"> 
      <div class="x-control-group-title"> 
        <span xid="span7"><![CDATA[详细信息]]></span> 
      </div>  
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
        xid="detailBar"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="addBtn" icon="icon-plus" onClick="addBtnClick" label="添加"> 
          <i xid="i6" class="icon-plus"/>  
          <span xid="span10">添加</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="deleteBtn" onClick="{operation:'detailData.delete'}"> 
          <i xid="i7"/>  
          <span xid="span11"/> 
        </a> 
      </div>  
      <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
        xid="detail" data="detailData" width="100%" height="auto" class="x-grid-no-bordered"
        showRowNumber="true"> 
        <columns xid="column"> 
          <column name="fLicenseName" label="证照名称" editable="false"> 
            <editor xid="fLicenseNameE"> 
              <input xid="fLicenseName" component="$UI/system/components/justep/input/input"
                class="form-control" bind-ref="ref('fLicenseName')"/> 
            </editor> 
          </column>  
          <!--             <column name="fLicenseNo" label="证照号" editable="false">  -->  
          <!--               <editor xid="fLicenseNoE">  -->  
          <!--                 <input xid="fLicenseNo" component="$UI/system/components/justep/input/input" -->  
          <!--                   class="form-control" bind-ref="ref('fLicenseNo')"/>  -->  
          <!--               </editor>  -->  
          <!--             </column>   -->  
          <!--             <column name="fSerialNumber" label="编号" editable="false">  -->  
          <!--               <editor xid="fSerialNumberE">  -->  
          <!--                 <input xid="fSerialNumber" component="$UI/system/components/justep/input/input" -->  
          <!--                   class="form-control" bind-ref="ref('fSerialNumber')"/>  -->  
          <!--               </editor>  -->  
          <!--             </column>   -->  
          <column name="fCrossPer" label="经办人" editable="true"> 
            <editor xid="fCrossPerE"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input1" bind-ref="ref('fCrossPer')"/> 
            </editor> 
          </column>  
          <!--             <column name="fRetDate" label="归还时间" editable="true">  -->  
          <!--               <editor xid="fRetDateE">  -->  
          <!--                 <input xid="fRetDate" component="$UI/system/components/justep/input/input" -->  
          <!--                   class="form-control" bind-ref="ref('fRetDate')"/>  -->  
          <!--               </editor>  -->  
          <!--             </column>  --> 
        </columns> 
      </div> 
    </div>  
    <!--       </div>  -->  
    <!--     </div>  --> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgLicenseInfo"
    src="$UI/OA/license/process/licenseInfoDialog/licenseInfoDialog.w" status="normal"
    forceRefreshOnOpen="true"> 
    <result concept="detailData" operation="edit" origin="dialogData" xid="default6"> 
      <mapping from="fLicenseName" to="fLicenseName" xid="default7"/>  
      <mapping from="fLicenseNo" to="fLicenseNo" xid="default8"/>  
      <mapping from="fSerialNumber" to="fSerialNumber" xid="default9"/> 
    </result> 
  </span> 
</div>
