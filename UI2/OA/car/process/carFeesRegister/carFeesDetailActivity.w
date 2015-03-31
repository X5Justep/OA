<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:484px;top:10px;"><div component="$UI/system/components/justep/data/bizData" xid="dFees" concept="OA_CA_FeesRegister" limit="1"><reader xid="default1" action="/OA/car/logic/action/queryOA_CA_FeesRegisterAction"></reader>
  <writer xid="default2" action="/OA/car/logic/action/saveOA_CA_FeesRegisterAction"></writer>
  <creator xid="default3" action="/OA/car/logic/action/createOA_CA_FeesRegisterAction"></creator></div></div> 

  <span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver" onReceive="windowReceiverReceive" style="left:362px;top:25px;"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgCarInfo" src="$UI/OA/car/process/dialog/selcetCarsDialog/selectCarsDialog.w" status="normal" width="90%" height="90%" onReceive="dlgCarInfoReceive"></span><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-top" xid="top1"><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar2"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dFees.save'}" xid="button7">
   <i xid="i5"></i>
   <span xid="span8"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dFees.delete'}" xid="button8">
   <i xid="i6"></i>
   <span xid="span9"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dFees.new'}" xid="button9">
   <i xid="i7"></i>
   <span xid="span10"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dFees.refresh'}" xid="button10">
   <i xid="i8"></i>
   <span xid="span11"></span></a></div></div>
   <div class="x-panel-content" xid="content1"><div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="基本信息" xid="controlGroup1">
   <div class="x-control-group-title" xid="controlGroupTitle1">
    <span xid="span1"><![CDATA[基本信息]]></span></div> 
  <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form1"><div class="form-group" xid="formGroup1">
   <div class="col-sm-2" xid="col1"><label class="control-label" xid="controlLabel1" bind-text=' $model.dFees.label("fYear")'>label</label></div>
   <div class="col-sm-4" xid="col2"><input component="$UI/system/components/justep/input/input" class="form-control" xid="input1" bind-ref="dFees.ref('fYear')"></input></div>
   <div class="col-sm-2" xid="col3"><label class="control-label" xid="controlLabel2" bind-text=' $model.dFees.label("fMonth")'>label</label></div>
   <div class="col-sm-4" xid="col4"><input component="$UI/system/components/justep/input/input" class="form-control" xid="input2" bind-ref="dFees.ref('fMonth')"></input></div></div>
  <div class="form-group" xid="formGroup2">
   <div class="col-sm-2" xid="col6">
    <label class="control-label" xid="controlLabel3" bind-text=' $model.dFees.label("fCarNO")'>label</label></div> 
   <div class="col-sm-3" xid="col8">
    <input component="$UI/system/components/justep/input/input" class="form-control" xid="input4" bind-ref="dFees.ref('fCarNO')"></input></div> 
   <div class="col-sm-1" xid="col21"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" xid="trgCar" icon="icon-android-search" onClick="trgCarClick">
   <i xid="i1" class="icon-android-search"></i>
   <span xid="span2"></span></a></div><div class="col-sm-2" xid="col7">
    <label class="control-label" xid="controlLabel4" bind-text=' $model.dFees.label("fCarName")'>label</label></div> 
   <div class="col-sm-4" xid="col5">
    <input component="$UI/system/components/justep/input/input" class="form-control" xid="input3" bind-ref="dFees.ref('fCarName')"></input></div> 
  </div>
  <div class="form-group" xid="formGroup3">
   <div class="col-sm-2" xid="col10">
    <label class="control-label" xid="controlLabel5" bind-text=' $model.dFees.label("fOverTimeDays")'>label</label></div> 
   <div class="col-sm-4" xid="col12">
    <input component="$UI/system/components/justep/input/input" class="form-control" xid="input6" bind-ref="dFees.ref('fOverTimeDays')"></input></div> 
   <div class="col-sm-2" xid="col11">
    <label class="control-label" xid="controlLabel6" bind-text=' $model.dFees.label("fFixedParkFee")'>label</label></div> 
   <div class="col-sm-4" xid="col9">
    <input component="$UI/system/components/justep/input/input" class="form-control" xid="input5" bind-ref="dFees.ref('fFixedParkFee')"></input></div> </div>
  <div class="form-group" xid="formGroup4">
   <div class="col-sm-2" xid="col14">
    <label class="control-label" xid="controlLabel7" bind-text=' $model.dFees.label("fTempParkFee")'>label</label></div> 
   <div class="col-sm-4" xid="col16">
    <input component="$UI/system/components/justep/input/input" class="form-control" xid="input8" bind-ref="dFees.ref('fTempParkFee')"></input></div> 
   <div class="col-sm-2" xid="col15">
    <label class="control-label" xid="controlLabel8" bind-text=' $model.dFees.label("fReimbLoadToll")'>label</label></div> 
   <div class="col-sm-4" xid="col13">
    <input component="$UI/system/components/justep/input/input" class="form-control" xid="input7" bind-ref="dFees.ref('fReimbLoadToll')"></input></div> </div>
  <div class="form-group" xid="formGroup5">
   <div class="col-sm-2" xid="col18">
    <label class="control-label" xid="controlLabel9" bind-text=' $model.dFees.label("fETCRoadToll")'>label</label></div> 
   <div class="col-sm-4" xid="col20">
    <input component="$UI/system/components/justep/input/input" class="form-control" xid="input10" bind-ref="dFees.ref('fETCRoadToll')"></input></div> 
   <div class="col-sm-2" xid="col19">
    <label class="control-label" xid="controlLabel10" bind-text=' $model.dFees.label("fDriverRepairFee")'>label</label></div> 
   <div class="col-sm-4" xid="col17">
    <input component="$UI/system/components/justep/input/input" class="form-control" xid="input9" bind-ref="dFees.ref('fDriverRepairFee')"></input></div> </div>
  <div class="form-group" xid="formGroup6">
   <div class="col-sm-2" xid="col24">
    <label class="control-label" xid="controlLabel12" bind-text=' $model.dFees.label("fManagerFee")'>label</label></div> 
   <div class="col-sm-4" xid="col23">
    <input component="$UI/system/components/justep/input/input" class="form-control" xid="input12" bind-ref="dFees.ref('fManagerFee')"></input></div> 
   <div class="col-sm-2" xid="col22">
    <label class="control-label" xid="controlLabel11" bind-text=' $model.dFees.label("fLiters")'>label</label></div> 
   <div class="col-sm-4" xid="col25">
    <input component="$UI/system/components/justep/input/input" class="form-control" xid="input11" bind-ref="dFees.ref('fLiters')"></input></div> </div>
  <div class="form-group" xid="formGroup7">
   <div class="col-sm-2" xid="col28">
    <label class="control-label" xid="controlLabel14" bind-text=' $model.dFees.label("fOilFee")'>label</label></div> 
   <div class="col-sm-4" xid="col27">
    <input component="$UI/system/components/justep/input/input" class="form-control" xid="input14" bind-ref="dFees.ref('fOilFee')"></input></div> 
   <div class="col-sm-2" xid="col26">
    <label class="control-label" xid="controlLabel13" bind-text=' $model.dFees.label("fVehicleFee")'>label</label></div> 
   <div class="col-sm-4" xid="col29">
    <input component="$UI/system/components/justep/input/input" class="form-control" xid="input13" bind-ref="dFees.ref('fVehicleFee')"></input></div> </div>
  <div class="form-group" xid="formGroup8">
   <div class="col-sm-2" xid="col32">
    <label class="control-label" xid="controlLabel16" bind-text=' $model.dFees.label("fReimbFee")'>label</label></div> 
   <div class="col-sm-4" xid="col31">
    <input component="$UI/system/components/justep/input/input" class="form-control" xid="input16" bind-ref="dFees.ref('fReimbFee')"></input></div> 
   <div class="col-sm-2" xid="col30">
    <label class="control-label" xid="controlLabel15" bind-text=' $model.dFees.label("fPassageFee")'>label</label></div> 
   <div class="col-sm-4" xid="col33">
    <input component="$UI/system/components/justep/input/input" class="form-control" xid="input15" bind-ref="dFees.ref('fPassageFee')"></input></div> </div>
  <div class="form-group" xid="formGroup9">
   <div class="col-sm-2" xid="col36">
    <label class="control-label" xid="controlLabel18" bind-text=' $model.dFees.label("fVehicleTax")'>label</label></div> 
   <div class="col-sm-4" xid="col35">
    <input component="$UI/system/components/justep/input/input" class="form-control" xid="input17" bind-ref="dFees.ref('fVehicleTax')"></input></div> 
   <div class="col-sm-2" xid="col34">
    <label class="control-label" xid="controlLabel17" bind-text=' $model.dFees.label("fTransportFee")'>label</label></div> 
   <div class="col-sm-4" xid="col37">
    <input component="$UI/system/components/justep/input/input" class="form-control" xid="input18" bind-ref="dFees.ref('fTransportFee')"></input></div> </div>
  <div class="form-group" xid="formGroup10">
   <div class="col-sm-2" xid="col40">
    <label class="control-label" xid="controlLabel20" bind-text=' $model.dFees.label("fMedicalExamFee")'>label</label></div> 
   <div class="col-sm-4" xid="col39">
    <input component="$UI/system/components/justep/input/input" class="form-control" xid="input19" bind-ref="dFees.ref('fMedicalExamFee')"></input></div> 
   <div class="col-sm-2" xid="col38">
    <label class="control-label" xid="controlLabel19" bind-text=' $model.dFees.label("fOfficeFee")'>label</label></div> 
   <div class="col-sm-4" xid="col41">
    <input component="$UI/system/components/justep/input/input" class="form-control" xid="input20" bind-ref="dFees.ref('fOfficeFee')"></input></div> </div>
  <div class="form-group" xid="formGroup11">
   <div class="col-sm-2" xid="col44">
    <label class="control-label" xid="controlLabel22" bind-text=' $model.dFees.label("fCommunicatFee")'>label</label></div> 
   <div class="col-sm-4" xid="col43">
    <input component="$UI/system/components/justep/input/input" class="form-control" xid="input21" bind-ref="dFees.ref('fCommunicatFee')"></input></div> 
   <div class="col-sm-2" xid="col42">
    <label class="control-label" xid="controlLabel21" bind-text=' $model.dFees.label("fAccidentInsurance")'>label</label></div> 
   <div class="col-sm-4" xid="col45">
    <input component="$UI/system/components/justep/input/input" class="form-control" xid="input22" bind-ref="dFees.ref('fAccidentInsurance')"></input></div> </div>
  <div class="form-group" xid="formGroup12">
   <div class="col-sm-2" xid="col48">
    <label class="control-label" xid="controlLabel24" bind-text=' $model.dFees.label("fOtherFees")'>label</label></div> 
   <div class="col-sm-4" xid="col47">
    <input component="$UI/system/components/justep/input/input" class="form-control" xid="input23" bind-ref="dFees.ref('fOtherFees')"></input></div> 
   <div class="col-sm-2" xid="col46">
    <label class="control-label" xid="controlLabel23" bind-text=' $model.dFees.label("fHundredKmOilFeul")'>label</label></div> 
   <div class="col-sm-4" xid="col49">
    <input component="$UI/system/components/justep/input/input" class="form-control" xid="input24" bind-ref="dFees.ref('fHundredKmOilFeul')"></input></div> </div>
  <div class="form-group" xid="formGroup13">
   <div class="col-sm-2" xid="col52">
    <label class="control-label" xid="controlLabel26" bind-text=' $model.dFees.label("fUsersName")'>label</label></div> 
   <div class="col-sm-4" xid="col51">
    <input component="$UI/system/components/justep/input/input" class="form-control" xid="input25" bind-ref="dFees.ref('fUsersName')"></input></div> 
   
   </div>
  <div class="form-group" xid="formGroup14">
   <div class="col-sm-2" xid="col54"><label class="control-label" xid="controlLabel27" bind-text=' $model.dFees.label("fRemark")'>label</label></div>
   <div class="col-sm-10" xid="col55"><textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea1" bind-ref="dFees.ref('fRemark')"></textarea></div>
   </div></div></div></div>
   <div class="x-panel-bottom" xid="bottom2">
   <a class="btn btn-link btn-only-label x-dialog-button" component="$UI/system/components/justep/button/button" label="取    消" onClick="cancelBtnClick" style="margin-left:30px;width:80px;" xid="button4">
    <i xid="i3"></i>
    <span xid="span4">取 消</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button" label="确定" xid="button1" onClick="okBtnClick">
    <i xid="i3"></i>
    <span xid="span5">确定</span></a> </div></div>
  </div>