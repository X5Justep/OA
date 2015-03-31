<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:45px;top:318px;">
    <div component="$UI/system/components/justep/data/bizData" xid="dCarUseApplyDetail"
      directDelete="true" autoLoad="false" concept="OA_CA_CarUseApply"
      columns="" autoNew="false"> 
      <reader action="/OA/car/logic/action/queryCACarUseApplyAction"/>  
      <writer action=""/>  
      <creator action=""/>  
      <calculateRelation relation="calcCheckBox"/>
    </div>
  <div component="$UI/system/components/justep/data/bizData" xid="dCarUseArrangeDetail" concept="OA_CA_CarUseArrange" limit="1" autoLoad="true"><reader xid="default1" action="/OA/car/logic/action/queryCACarUseArrangeAction"></reader></div></div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{operation:'dCarUseApplyDetail.refresh'}" xid="button1">
   <i xid="i2"></i>
   <span xid="span2"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="chart2Btn" onClick="chart2BtnClick" label="流程图" icon="icon-image">
   <i xid="i9" class="icon-image"></i>
   <span xid="span9">流程图</span></a></div>
  <div component="$UI/system/components/justep/process/process" xid="process" data="dCarUseApplyDetail"></div><div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" xid="titleBar1" title="用车申请单">
   <div class="x-titlebar-left" xid="div1"></div>
   <div class="x-titlebar-title" xid="div2">用车申请单</div>
   <div class="x-titlebar-right reverse" xid="div3"></div></div>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wdFlowchart"></span><div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="用车安排" xid="controlGroup1" collapsible="true">
   <div class="x-control-group-title" xid="controlGroupTitle1">
    <span xid="span3"><![CDATA[用车安排]]></span></div> 
  <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form1"><div class="form-group" xid="formGroup1">
   <div class="col-sm-2" xid="col1"><label class="control-label" bind-text=' $model.dCarUseArrangeDetail.label("fCode")' xid="controlLabel1"></label></div>
   <div class="col-sm-4" xid="col2"><input class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseApplyDetail" bind-ref="dCarUseArrangeDetail.ref('fCode')" xid="fCode"></input></div>
   <div class="col-sm-2" xid="col3"><label class="control-label" bind-text=' $model.dCarUseArrangeDetail.label("fCarDriverName")' xid="controlLabel2"></label></div>
   <div class="col-sm-4" xid="col4"><input class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseApplyDetail" bind-ref="dCarUseArrangeDetail.ref('fCarDriverName')" xid="input2"></input></div></div>
  <div class="form-group" xid="formGroup2">
   <div class="col-sm-2" xid="col6">
    <label class="control-label" bind-text=' $model.dCarUseArrangeDetail.label("fName")' xid="controlLabel3"></label></div> 
   <div class="col-sm-4" xid="col8">
    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseApplyDetail" bind-ref="dCarUseArrangeDetail.ref('fName')" xid="input4"></input></div> 
   <div class="col-sm-2" xid="col7">
    <label class="control-label" bind-text=' $model.dCarUseArrangeDetail.label("fCarKindName")' xid="controlLabel4"></label></div> 
   <div class="col-sm-4" xid="col5">
    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseApplyDetail" bind-ref="dCarUseArrangeDetail.ref('fCarKindName')" xid="input3"></input></div> </div>
  <div class="form-group" xid="formGroup3">
   <div class="col-sm-2" xid="col11">
    <label class="control-label" bind-text=' $model.dCarUseArrangeDetail.label("fTelephone")' xid="controlLabel5"></label></div> 
   <div class="col-sm-4" xid="col12">
    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseApplyDetail" bind-ref="dCarUseArrangeDetail.ref('fTelephone')" xid="input6"></input></div> 
   <div class="col-sm-2" xid="col10">
    <label class="control-label" bind-text=' $model.dCarUseArrangeDetail.label("fArgnPsnName")' xid="controlLabel6"></label></div> 
   <div class="col-sm-4" xid="col9">
    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseApplyDetail" bind-ref="dCarUseArrangeDetail.ref('fArgnPsnName')" xid="fArgnPsnName"></input></div> </div></div>
  </div><div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="基本信息" xid="controlGroup2" collapsible="true">
   <div class="x-control-group-title" xid="controlGroupTitle2">
    <span xid="span4"><![CDATA[基本信息]]></span></div> 
  <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form2">
   <div class="form-group" xid="formGroup5">
    <div class="col-sm-2" xid="col17">
     <label class="control-label" bind-text=' $model.dCarUseApplyDetail.label("fApplyDeptName")' xid="controlLabel7"></label></div> 
    <div class="col-sm-4" xid="col19">
     <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseApplyDetail" bind-ref="dCarUseApplyDetail.ref('fApplyDeptName')" xid="input12"></input></div> 
    <div class="col-sm-2" xid="col18">
     <label class="control-label" bind-text=' $model.dCarUseApplyDetail.label("fApplyPsnName")' xid="controlLabel8"></label></div> 
    <div class="col-sm-4" xid="col14">
     <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseApplyDetail" bind-ref="dCarUseApplyDetail.ref('fApplyPsnName')" xid="input9"></input></div> </div> 
   <div class="form-group" xid="formGroup6">
    <div class="col-sm-2" xid="col16">
     <label class="control-label" bind-text=' $model.dCarUseApplyDetail.label("fApplyDate")' xid="controlLabel9"></label></div> 
    <div class="col-sm-4" xid="col21">
     <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseApplyDetail" bind-ref="dCarUseApplyDetail.ref('fApplyDate')" xid="input10"></input></div> 
    <div class="col-sm-2" xid="col15">
     <label class="control-label" bind-text=' $model.dCarUseApplyDetail.label("fPersonCount")' xid="controlLabel10"></label></div> 
    <div class="col-sm-4" xid="col13">
     <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseApplyDetail" bind-ref="dCarUseApplyDetail.ref('fPersonCount')" xid="input7"></input></div> </div> 
   <div class="form-group" xid="formGroup4">
    <div class="col-sm-2" xid="col24">
     <label class="control-label" bind-text=' $model.dCarUseApplyDetail.label("fDestination")' xid="controlLabel11"></label></div> 
    <div class="col-sm-4" xid="col23">
     <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseApplyDetail" bind-ref="dCarUseApplyDetail.ref('fDestination')" xid="input11"></input></div> 
    <div class="col-sm-2" xid="col22">
     <label class="control-label" bind-text=' $model.dCarUseApplyDetail.label("fTelephone")' xid="controlLabel12"></label></div> 
    <div class="col-sm-4" xid="col20">
     <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseApplyDetail" bind-ref="dCarUseApplyDetail.ref('fTelephone')" xid="input8"></input></div> </div> 
  <div class="form-group" xid="formGroup7">
   <div class="col-sm-2" xid="col25"><label class="control-label" bind-text=' $model.dCarUseApplyDetail.label("fBeginTime")' xid="controlLabel13"></label></div>
   <div class="col-sm-4" xid="col26"><input class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseApplyDetail" bind-ref="dCarUseApplyDetail.ref('fBeginTime')" xid="input13"></input></div>
   <div class="col-sm-2" xid="col27"><label class="control-label" bind-text=' $model.dCarUseApplyDetail.label("fEndTime")' xid="controlLabel14"></label></div>
   <div class="col-sm-4" xid="col28"><input class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseApplyDetail" bind-ref="dCarUseApplyDetail.ref('fEndTime')" xid="input14"></input></div></div>
  <div class="form-group" xid="formGroup8">
   <div class="col-sm-2" xid="col32">
    <label class="control-label" bind-text=' $model.dCarUseApplyDetail.label("fIsRoundtrip")' xid="controlLabel15"></label></div> 
   <div class="col-sm-4" xid="col30">
    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseApplyDetail" bind-ref="dCarUseApplyDetail.ref('fIsRoundtrip')" xid="input16"></input></div> 
   </div>
  <div class="form-group" xid="formGroup11">
   <div class="col-sm-2" xid="col29">
   <label class="control-label" bind-text=' $model.dCarUseApplyDetail.label("fApplyReason")' xid="controlLabel16"></label></div>
  <div class="col-sm-10" xid="col31">
   <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="fApplyReason" bind-ref="dCarUseApplyDetail.ref('fApplyReason')"></textarea></div></div><div class="form-group" xid="formGroup9">
   <div class="col-sm-2" xid="col36">
    <label class="control-label" bind-text=' $model.dCarUseApplyDetail.label("fDriveCircuit")' xid="controlLabel17"></label></div> 
   <div class="col-sm-10" xid="col34">
    <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea3" bind-ref="dCarUseApplyDetail.ref('fDriveCircuit')"></textarea></div> 
   </div>
  <div class="form-group" xid="formGroup10">
   <div class="col-sm-2" xid="col33">
   <label class="control-label" bind-text=' $model.dCarUseApplyDetail.label("fRemark")' xid="controlLabel18"></label></div>
  <div class="col-sm-10" xid="col35">
   <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea2" bind-ref="dCarUseApplyDetail.ref('fRemark')"></textarea></div></div>
  </div></div><span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive"/>
</div>