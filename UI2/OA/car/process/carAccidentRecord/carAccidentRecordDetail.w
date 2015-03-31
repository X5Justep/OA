<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:476px;top:53px;">
    <div component="$UI/system/components/justep/data/bizData" xid="dCarAccidentRecord"
      directDelete="true" autoLoad="true" concept="OA_CA_AccidentRecord"
      columns="" autoNew="false"> 
      <reader action="/OA/car/logic/action/queryCAAccidentRecordAction"/>  
      <writer action="/OA/car/logic/action/saveCAAccidentRecordAction"/>  
      <creator action="/OA/car/logic/action/createCAAccidentRecordAction"/>  
      <calculateRelation relation="calcCheckBox"/>
    </div>
  </div>  
    
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive" style="left:403px;top:73px;"/>
<div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dCarAccidentRecord.save'}" xid="button1">
   <i xid="i2"></i>
   <span xid="span3"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dCarAccidentRecord.delete'}" xid="button2">
   <i xid="i3"></i>
   <span xid="span4"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dCarAccidentRecord.new'}" xid="button3">
   <i xid="i4"></i>
   <span xid="span5"></span></a></div>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="基本信息" xid="controlGroup1">
   <div class="x-control-group-title" xid="controlGroupTitle1">
    <span xid="span2"><![CDATA[基本信息]]></span></div> <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form">
    <div class="form-group"> 
      <div class="col-sm-2"> 
        <label class="control-label" bind-text=' $model.dCarAccidentRecord.label("fCode")' /> 
      </div>  
      <div class="col-sm-3">
        <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarAccidentRecord" bind-ref="dCarAccidentRecord.ref('fCode')" />
      </div>  
      <div class="col-sm-1" xid="col29"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" xid="selectCar" icon="icon-android-search" onClick="selectCarClick">
   <i xid="i5" class="icon-android-search"></i>
   <span xid="span6"></span></a></div><div class="col-sm-2"> 
        <label class="control-label" bind-text=' $model.dCarAccidentRecord.label("fName")' /> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarAccidentRecord" bind-ref="dCarAccidentRecord.ref('fName')" />
      </div> 
    </div> 
    <div class="form-group"> 
      <div class="col-sm-2"> 
        <label class="control-label" bind-text=' $model.dCarAccidentRecord.label("fType")' /> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarAccidentRecord" bind-ref="dCarAccidentRecord.ref('fType')" />
      </div>  
      <div class="col-sm-2"> 
        <label class="control-label" bind-text=' $model.dCarAccidentRecord.label("fCarKindName")' /> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarAccidentRecord" bind-ref="dCarAccidentRecord.ref('fCarKindName')" />
      </div> 
    </div> 
    <div class="form-group"> 
      <div class="col-sm-2"> 
        <label class="control-label" bind-text=' $model.dCarAccidentRecord.label("fAccidentDeptName")' /> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarAccidentRecord" bind-ref="dCarAccidentRecord.ref('fAccidentDeptName')" />
      </div> 
    <div class="col-sm-2" xid="col15">
   <label class="control-label" bind-text=' $model.dCarAccidentRecord.label("fAccidentPerName")' xid="controlLabel6"></label></div>
  <div class="col-sm-4" xid="col16">
   <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarAccidentRecord" bind-ref="dCarAccidentRecord.ref('fAccidentPerName')" xid="input6"></input></div></div> 
    
     
  <div class="form-group" xid="formGroup4">
   <div class="col-sm-2" xid="col19">
    <label class="control-label" bind-text=' $model.dCarAccidentRecord.label("fAccidentTime")' xid="controlLabel8"></label></div> 
   <div class="col-sm-4" xid="col20">
    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarAccidentRecord" bind-ref="dCarAccidentRecord.ref('fAccidentTime')" xid="input8"></input></div> 
   <div class="col-sm-2" xid="col18">
    <label class="control-label" bind-text=' $model.dCarAccidentRecord.label("fAccidentSite")' xid="controlLabel7"></label></div> 
   <div class="col-sm-4" xid="col17">
    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarAccidentRecord" bind-ref="dCarAccidentRecord.ref('fAccidentSite')" xid="input1"></input></div> </div>
  <div class="form-group" xid="formGroup5">
   <div class="col-sm-2" xid="col23">
    <label class="control-label" bind-text=' $model.dCarAccidentRecord.label("fAcccidentBurden")' xid="controlLabel10"></label></div> 
   <div class="col-sm-4" xid="col24">
    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarAccidentRecord" bind-ref="dCarAccidentRecord.ref('fAcccidentBurden')" xid="input10"></input></div> 
   <div class="col-sm-2" xid="col22">
    <label class="control-label" bind-text=' $model.dCarAccidentRecord.label("fWoundedDetail")' xid="controlLabel9"></label></div> 
   <div class="col-sm-4" xid="col21">
    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarAccidentRecord" bind-ref="dCarAccidentRecord.ref('fWoundedDetail')" xid="input9"></input></div> </div>
  <div class="form-group" xid="formGroup6">
   <div class="col-sm-2" xid="col25"><label class="control-label" bind-text=' $model.dCarAccidentRecord.label("fEconomyLoss")' xid="controlLabel11"></label></div>
   <div class="col-sm-4" xid="col26"><input class="form-control" component="$UI/system/components/justep/input/input" data="dCarAccidentRecord" bind-ref="dCarAccidentRecord.ref('fEconomyLoss')" xid="input2"></input></div>
   <div class="col-sm-2" xid="col2">
   <label class="control-label" bind-text=' $model.dCarAccidentRecord.label("fAmerce")' xid="controlLabel1"></label></div>
  <div class="col-sm-4" xid="col1">
   <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarAccidentRecord" bind-ref="dCarAccidentRecord.ref('fAmerce')" xid="input3"></input></div></div>
  <div class="form-group" xid="formGroup1">
   <div class="col-sm-2" xid="col6">
    <label class="control-label" bind-text=' $model.dCarAccidentRecord.label("fFactPayment")' xid="controlLabel2"></label></div> 
   <div class="col-sm-4" xid="col5">
    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarAccidentRecord" bind-ref="dCarAccidentRecord.ref('fFactPayment')" xid="input5"></input></div> 
   <div class="col-sm-2" xid="col4">
    <label class="control-label" bind-text=' $model.dCarAccidentRecord.label("fPayDifference")' xid="controlLabel3"></label></div> 
   <div class="col-sm-4" xid="col3">
    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarAccidentRecord" bind-ref="dCarAccidentRecord.ref('fPayDifference')" xid="input4"></input></div> </div>
  <div class="form-group" xid="formGroup2">
   <div class="col-sm-2" xid="col7"><label class="control-label" bind-text=' $model.dCarAccidentRecord.label("fAccidentPass")' xid="controlLabel4"></label></div>
   <div class="col-sm-10" xid="col10"><textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea3" bind-ref="dCarAccidentRecord.ref('fAccidentPass')"></textarea></div></div>
  <div class="form-group" xid="formGroup3">
   <div class="col-sm-2" xid="col11">
    <label class="control-label" bind-text=' $model.dCarAccidentRecord.label("fPhoto")' xid="controlLabel5"></label></div> 
   <div class="col-sm-10" xid="col12">
    <div component="$UI/system/components/justep/attachment/attachmentImage" access="duud" xid="fPhoto" bind-ref="dCarAccidentRecord.ref('fPhoto')">
   <div class="x-attachment x-attachment-image" xid="div1">
    <div data-bind="foreach:$attachmentItems,event:{mouseover:function(){$model.$state.set('remove')},mouseout:function(){$model.$state.set('browse')}}" xid="div2">
     <img class="x-item-attachment-img" data-bind="attr:{src:$model.getPictureUrl($object)},click:$model.showInfullScreen.bind($model,$object)" xid="image1"></img>
     <a data-bind="visible:$model.$state.get() == 'remove',click:$model.previewOrRemoveItem.bind($model),enable:$model.$access.get() % 4 &gt;= 2" class="x-remove-barget" xid="a1"></a></div> 
    <div class="x-doc-process" xid="div3">
     <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="div4"></div></div> 
    <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; (1 &gt; $attachmentItems.get().length)" xid="div5">
     <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256" xid="div6"></div></div> </div> </div></div> </div></div><div class="x-panel-bottom" xid="bottom1" height="42"> 
      <a class="btn btn-link btn-only-label x-dialog-button" component="$UI/system/components/justep/button/button" label="取    消" onClick="cancelBtnClick" style="margin-left:30px;width:80px;" xid="cancelBtn"> 
        <i xid="i4_1" />  
        <span xid="span4_1">取 消</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button" label="确定" xid="OKBtn" onClick="okBtnClick"> 
        <i xid="i1" />  
        <span xid="span1">确定</span> 
      </a> 
    </div></div>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgSelectCars" style="left:149px;top:53px;" src="$UI/OA/car/process/dialog/selcetCarsDialog/selectCarsDialog.w" onReceive="dlgSelectCarsReceive" status="normal" width="90%" height="90%"></span></div>