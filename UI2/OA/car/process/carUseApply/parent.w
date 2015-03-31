<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:449px;top:22px;" onModelConstructDone="modelModelConstructDone">
    <div component="$UI/system/components/justep/data/bizData" xid="dCarUseApply"
      directDelete="true" autoLoad="false" concept="OA_CA_CarUseApply" orderBy=""
      columns="" autoNew="false"> 
      <reader action="/OA/car/logic/action/queryCACarUseApplyAction"/>  
      <writer action="/OA/car/logic/action/saveCACarUseApplyAction"/>  
      <creator action="/OA/car/logic/action/createCACarUseApplyAction"/> 
    </div>
  <div component="$UI/system/components/justep/data/bizData" xid="dCarUseArrange" concept="OA_CA_CarUseArrange"><reader xid="default1" action="/OA/car/logic/action/queryCACarUseArrangeAction"></reader>
  <writer xid="default2" action="/OA/car/logic/action/saveCACarUseArrangeAction"></writer>
  <creator xid="default3" action="/OA/car/logic/action/createCACarUseArrangeAction"></creator>
  <master xid="default8" data="dCarUseApply" relation="fMasterID"></master></div>
  <div component="$UI/system/components/justep/data/bizData" xid="dDriverInfo" concept="OA_CA_DriverBasicInfo"><reader xid="default4" action="/OA/car/logic/action/queryCADriverBasicInfoAction"></reader></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="isRoundtripData" idColumn="isRoundtrip"><column label="是否往返" name="isRoundtrip" type="String" xid="default6"></column>
  <data xid="default7">[{&quot;isRoundtrip&quot;:&quot;单程&quot;},{&quot;isRoundtrip&quot;:&quot;双程&quot;}]</data></div></div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="dCarUseApply"/>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="moreMenu" opacity="0" anchor="moreBtn" direction="left-bottom"> 
    <div class="x-popMenu-overlay" xid="moreMenuOverlay"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="moreContent"> 
      <li class="x-menu-item" xid="backItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="backBtn" onClick="{operation:'process.back'}"> 
          <i xid="i8"/>  
          <span xid="span6"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="suspendItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="suspendBtn" onClick="{operation:'process.suspend'}"> 
          <i xid="i3"/>  
          <span xid="span3"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="abortItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="abortBtn" onClick="{operation:'process.abort'}"> 
          <i xid="i4"/>  
          <span xid="span4"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="chartItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
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
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgSelectCars" src="$UI/OA/car/process/dialog/selcetCarsDialog/selectCarsDialog.w" onReceive="dlgSelectCarsReceive" status="normal"></span>
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver"></span><div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="mainBar"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="advanceBtn" onClick="{operation:'process.advance'}"> 
          <i xid="i2"/>  
          <span xid="span2"/> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="saveBtn" onClick="{operation:'dCarUseApply.save'}"> 
          <i xid="i1"/>  
          <span xid="span1"/> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-only-label"
          label="更多" xid="moreBtn" onClick="{operation:'moreMenu.show'}" icon="icon-ios7-more"> 
          <i xid="i15" class="icon-ios7-more"/>  
          <span xid="span15">更多</span> 
        </a> 
    </div>  
    <div xid="content"> 
      <h1 xid="h11" class="text-center">用车申请单</h1>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="基本信息" xid="controlGroup1">
   <div class="x-control-group-title" xid="controlGroupTitle1">
    <span xid="span7"><![CDATA[基本信息]]></span></div> <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"> 
        <div xid="formGroup8" class="form-group">
   <div xid="col1" class="col-sm-2">
    <label xid="controlLabel1" class="control-label" bind-text=' $model.dCarUseApply.label("fNO")'></label></div> 
   <div xid="col3" class="col-sm-4">
    <input class="form-control" component="$UI/system/components/justep/input/input" bind-ref="dCarUseApply.ref('fNO')" xid="input2" readonly="true"></input></div> 
   
   <div xid="col4" class="col-sm-2">
   <label xid="controlLabel2" class="control-label" bind-text=' $model.dCarUseApply.label("fIsRoundtrip")'></label></div>
  <div xid="col2" class="col-sm-4">
   <select component="$UI/system/components/justep/select/select" class="form-control" xid="fIsRoundtrip" bind-ref="dCarUseApply.ref('fIsRoundtrip')" bind-labelRef="dCarUseApply.ref('fIsRoundtrip')" bind-options="isRoundtripData" bind-optionsValue="isRoundtrip" bind-optionsLabel="isRoundtrip"></select></div></div><div xid="formGroup1" class="form-group"> 
          <div xid="col11" class="col-sm-2"> 
            <label xid="fApplyDeptNameLable" class="control-label" bind-text=' $model.dCarUseApply.label("fApplyDeptName")' /> 
          </div>  
          <div xid="col12" class="col-sm-4">
            <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="treeSltDept" bind-ref="dCarUseApply.ref('fApplyDeptID')" bind-labelRef="dCarUseApply.ref('fApplyDeptName')">
   <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dOrg" limit="-1"></div>
   <option xid="option1">
    <columns xid="columns1">
     <column name="sName" xid="column1"></column></columns> </option> </div></div>  
          <div xid="col13" class="col-sm-2"> 
            <label xid="fApplyPsnNameLable" class="control-label" bind-text=' $model.dCarUseApply.label("fApplyPsnName")' /> 
          </div>  
          <div xid="col14" class="col-sm-4">
            <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="treeSltPsm" bind-ref="dCarUseApply.ref('fApplyPsnID')" bind-labelRef="dCarUseApply.ref('fApplyPsnName')">
   <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dPsm" limit="-1"><treeOption xid="default5" rootFilter="1=1"></treeOption></div>
   <option xid="option2">
    <columns xid="columns2">
     <column name="sName" xid="column2"></column></columns> </option> </div></div> 
        </div>  
        <div xid="formGroup2" class="form-group"> 
          <div xid="col21" class="col-sm-2"> 
            <label xid="fApplyDateLable" class="control-label" bind-text=' $model.dCarUseApply.label("fApplyDate")' /> 
          </div>  
          <div xid="col22" class="col-sm-4">
            <input class="form-control" component="$UI/system/components/justep/input/input" bind-ref="dCarUseApply.ref('fApplyDate')" />
          </div>  
          <div xid="col23" class="col-sm-2"> 
            <label xid="fPersonCountLable" class="control-label" bind-text=' $model.dCarUseApply.label("fPersonCount")' /> 
          </div>  
          <div xid="col24" class="col-sm-4">
            <input xid="fApplyDate" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="dCarUseApply.ref('fPersonCount')" />
          </div> 
        </div>  
        <div xid="formGroup3" class="form-group"> 
          <div xid="col31" class="col-sm-2"> 
            <label xid="fDestinationLable" class="control-label" bind-text=' $model.dCarUseApply.label("fDestination")' /> 
          </div>  
          <div xid="col32" class="col-sm-4">
            <input class="form-control" component="$UI/system/components/justep/input/input" bind-ref="dCarUseApply.ref('fDestination')" />
          </div>  
          <div xid="col33" class="col-sm-2"> 
            <label xid="fTelephoneLable" class="control-label" bind-text=' $model.dCarUseApply.label("fTelephone")' /> 
          </div>  
          <div xid="col34" class="col-sm-4">
            <input xid="fDestination" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="dCarUseApply.ref('fTelephone')" />
          </div> 
        </div>  
        <div xid="formGroup4" class="form-group"> 
          <div xid="col41" class="col-sm-2"> 
            <label xid="fBeginTimeLable" class="control-label" bind-text=' $model.dCarUseApply.label("fBeginTime")' /> 
          </div>  
          <div xid="col42" class="col-sm-4">
            <input class="form-control" component="$UI/system/components/justep/input/input" bind-ref="dCarUseApply.ref('fBeginTime')" />
          </div>  
          <div xid="col43" class="col-sm-2"> 
            <label xid="fEndTimeLable" class="control-label" bind-text=' $model.dCarUseApply.label("fEndTime")' /> 
          </div>  
          <div xid="col44" class="col-sm-4">
            <input xid="fBeginTime" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="dCarUseApply.ref('fEndTime')" />
          </div> 
        </div>  
        <div xid="formGroup5" class="form-group"> 
          <div xid="col53" class="col-sm-2"> 
            <label xid="fApplyReasonLable" class="control-label" bind-text=' $model.dCarUseApply.label("fApplyReason")' /> 
          </div>  
          <div xid="col54" class="col-sm-10">
            <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea1" bind-ref="dCarUseApply.ref('fApplyReason')"></textarea></div> 
        </div>  
        <div xid="formGroup6" class="form-group"> 
          <div xid="col61" class="col-sm-2"> 
            <label xid="fDriveCircuitLa" class="control-label" bind-text=' $model.dCarUseApply.label("fDriveCircuit")' /> 
          </div>  
          <div xid="col62" class="col-sm-10">
            <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea2" bind-ref="dCarUseApply.ref('fDriveCircuit')"></textarea></div>  
          </div>  
        <div xid="formGroup7" class="form-group"> 
          <div xid="col71" class="col-sm-2"> 
            <label xid="fRemarkL" class="control-label" bind-text="dCarUseApply.label('fRemark')" /> 
          </div>  
          <div xid="col72" class="col-sm-10">
            <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea3" bind-ref="dCarUseApply.ref('fRemark')"></textarea></div> 
        </div> 
      </div></div> 
    </div> 
  </div> 
</div>