<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:476px;top:53px;">
    <div component="$UI/system/components/justep/data/bizData" xid="dCarPeccancyRecord"
      directDelete="true" autoLoad="true" concept="OA_CA_PeccancyRecord"
      columns="" autoNew="false"> 
      <reader action="/OA/car/logic/action/queryCAPeccancyRecordAction"/>  
      <writer action="/OA/car/logic/action/saveCAPeccancyRecordAction"/>  
      <creator action="/OA/car/logic/action/createCAPeccancyRecordAction"/>  
      <calculateRelation relation="calcCheckBox"/>
    </div>
  <div component="$UI/system/components/justep/data/bizData" xid="dPeccancyKind" concept="OA_Pub_BaseCode" limit="-1"><reader xid="default1" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"></reader></div></div>  
    
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive" style="left:403px;top:73px;"/>
<div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dCarPeccancyRecord.save'}" xid="button1">
   <i xid="i2"></i>
   <span xid="span3"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dCarPeccancyRecord.delete'}" xid="button2">
   <i xid="i3"></i>
   <span xid="span4"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dCarPeccancyRecord.new'}" xid="button3">
   <i xid="i4"></i>
   <span xid="span5"></span></a></div>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="基本信息" xid="controlGroup1">
   <div class="x-control-group-title" xid="controlGroupTitle1">
    <span xid="span2"><![CDATA[基本信息]]></span></div> <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form">
    <div class="form-group"> 
      <div class="col-sm-2"> 
        <label class="control-label" bind-text=' $model.dCarPeccancyRecord.label("fCode")' /> 
      </div>  
      <div class="col-sm-3">
        <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarPeccancyRecord" bind-ref="dCarPeccancyRecord.ref('fCode')" />
      </div>  
      <div class="col-sm-1" xid="col29"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" xid="selectCar" icon="icon-android-search" onClick="selectCarClick">
   <i xid="i5" class="icon-android-search"></i>
   <span xid="span6"></span></a></div><div class="col-sm-2"> 
        <label class="control-label" bind-text=' $model.dCarPeccancyRecord.label("fName")' /> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarPeccancyRecord" bind-ref="dCarPeccancyRecord.ref('fName')" />
      </div> 
    </div> 
    <div class="form-group"> 
      <div class="col-sm-2"> 
        <label class="control-label" bind-text=' $model.dCarPeccancyRecord.label("fType")' /> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarPeccancyRecord" bind-ref="dCarPeccancyRecord.ref('fType')" />
      </div>  
      <div class="col-sm-2"> 
        <label class="control-label" bind-text=' $model.dCarPeccancyRecord.label("fCarKindName")' /> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarPeccancyRecord" bind-ref="dCarPeccancyRecord.ref('fCarKindName')" />
      </div> 
    </div> 
    <div class="form-group"> 
      <div class="col-sm-2"> 
        <label class="control-label" bind-text=' $model.dCarPeccancyRecord.label("fPeccancyTime")' /> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarPeccancyRecord" bind-ref="dCarPeccancyRecord.ref('fPeccancyTime')" />
      </div> 
    <div class="col-sm-2" xid="col15">
   <label class="control-label" bind-text=' $model.dCarPeccancyRecord.label("fPeccancyPerName")' xid="controlLabel6"></label></div>
  <div class="col-sm-4" xid="col16">
   <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarPeccancyRecord" bind-ref="dCarPeccancyRecord.ref('fPeccancyPerName')" xid="input6"></input></div></div> 
    
     
  <div class="form-group" xid="formGroup4">
   <div class="col-sm-2" xid="col19">
    <label class="control-label" bind-text=' $model.dCarPeccancyRecord.label("fPeccancySite")' xid="controlLabel8"></label></div> 
   <div class="col-sm-4" xid="col20">
    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarPeccancyRecord" bind-ref="dCarPeccancyRecord.ref('fPeccancySite')" xid="input8"></input></div> 
   <div class="col-sm-2" xid="col18">
    <label class="control-label" bind-text=' $model.dCarPeccancyRecord.label("fPeccancyType")' xid="controlLabel7"></label></div> 
   <div class="col-sm-4" xid="col17">
    <select component="$UI/system/components/justep/select/select" class="form-control" xid="select1" bind-ref="dCarPeccancyRecord.ref('fPeccancyTypeID')" bind-labelRef="dCarPeccancyRecord.ref('fPeccancyType')" bind-options="dPeccancyKind" bind-optionsValue="fCode" bind-optionsLabel="fName"></select></div> </div>
  <div class="form-group" xid="formGroup5">
   <div class="col-sm-2" xid="col23">
    <label class="control-label" bind-text=' $model.dCarPeccancyRecord.label("fPeccancyPay")' xid="controlLabel10"></label></div> 
   <div class="col-sm-4" xid="col24">
    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarPeccancyRecord" bind-ref="dCarPeccancyRecord.ref('fPeccancyPay')" xid="input10"></input></div> 
   <div class="col-sm-2" xid="col22">
    <label class="control-label" bind-text=' $model.dCarPeccancyRecord.label("fPeccancyScore")' xid="controlLabel9"></label></div> 
   <div class="col-sm-4" xid="col21">
    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarPeccancyRecord" bind-ref="dCarPeccancyRecord.ref('fPeccancyScore')" xid="input9"></input></div> </div>
  <div class="form-group" xid="formGroup6">
   <div class="col-sm-2" xid="col25"><label class="control-label" bind-text=' $model.dCarPeccancyRecord.label("fRemark")' xid="controlLabel11"></label></div>
   <div class="col-sm-10" xid="col26"><textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea1" bind-ref="dCarPeccancyRecord.ref('fRemark')"></textarea></div>
   </div></div><div class="x-panel-bottom" xid="bottom1" height="42"> 
      <a class="btn btn-link btn-only-label x-dialog-button" component="$UI/system/components/justep/button/button" label="取    消" onClick="cancelBtnClick" style="margin-left:30px;width:80px;" xid="cancelBtn"> 
        <i xid="i4_1" />  
        <span xid="span4_1">取 消</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button" label="确定" xid="OKBtn" onClick="okBtnClick"> 
        <i xid="i1" />  
        <span xid="span1">确定</span> 
      </a> 
    </div></div>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgSelectCars" style="left:149px;top:53px;" src="$UI/OA/car/process/dialog/selcetCarsDialog/selectCarsDialog.w" onReceive="dlgSelectCarsReceive" width="90%" height="90%" status="normal"></span></div>