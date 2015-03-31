<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:437px;top:24px;">
    <div component="$UI/system/components/justep/data/bizData" xid="dCarUseRecord"
      directDelete="true" autoLoad="true" concept="OA_CA_CarRecord"
      columns="" autoNew="false"> 
      <reader action="/OA/car/logic/action/queryCACarRecordAction"/>  
      <writer action="/OA/car/logic/action/saveCACarRecordAction"/>  
      <creator action="/OA/car/logic/action/createCACarRecordAction"/>  
      <calculateRelation relation="calcCheckBox"/>
    </div>
  <div component="$UI/system/components/justep/data/bizData" xid="dCarUseRecordFeeDetail" concept="OA_CA_CarRecordFeeDetail" autoLoad="true"><reader xid="default1" action="/OA/car/logic/action/queryCACarRecordFeeDetailAction"></reader>
  <writer xid="default2" action="/OA/car/logic/action/saveCACarRecordFeeDetailAction"></writer>
  <creator xid="default3" action="/OA/car/logic/action/createCACarRecordFeeDetailAction"></creator>
  <calculateRelation relation="recordNO" xid="calculateRelation1" type="Integer"></calculateRelation>
  <rule xid="rule1">
   <col name="recordNO" xid="ruleCol1">
    <calculate xid="calculate1">
     <expr xid="default4"><![CDATA[$row.index()+1]]></expr></calculate> </col> </rule></div></div>  
    
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive"/>
<span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog" style="left:348px;top:37px;" src="$UI/OA/car/process/dialog/selectCarUseApplyDialog/selectCarUseApplyDialog.w" onReceive="windowDialogReceive" status="normal" width="90%" height="90%"></span><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-top" xid="top1"><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dCarUseRecord.save'}" xid="button7">
   <i xid="i7"></i>
   <span xid="span9"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dCarUseRecord.delete'}" xid="button8">
   <i xid="i8"></i>
   <span xid="span10"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dCarUseRecord.new'}" xid="button9">
   <i xid="i9"></i>
   <span xid="span11"></span></a></div></div>
   <div class="x-panel-content" xid="content1">
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="基本信息" xid="controlGroup1">
   <div class="x-control-group-title" xid="controlGroupTitle1">
    <span xid="span4"><![CDATA[基本信息]]></span></div> <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form">
    <div class="form-group"> 
      <div class="col-sm-2"> 
        <label class="control-label" bind-text=' $model.dCarUseRecord.label("fNO")' /> 
      </div>  
      <div class="col-sm-3">
        <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseRecord" bind-ref="dCarUseRecord.ref('fNO')" readonly="true"/>
      </div>  
      <div class="col-sm-1" xid="col1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" xid="selectCarUseApply" icon="icon-android-search" onClick="selectCarUseApplyClick">
   <i xid="i10" class="icon-android-search"></i>
   <span xid="span12"></span></a></div><div class="col-sm-2"> 
        <label class="control-label" bind-text=' $model.dCarUseRecord.label("fCode")' /> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseRecord" bind-ref="dCarUseRecord.ref('fCode')" readonly="true"/>
      </div> 
    </div> 
    <div class="form-group"> 
      <div class="col-sm-2"> 
        <label class="control-label" bind-text=' $model.dCarUseRecord.label("fName")' /> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseRecord" bind-ref="dCarUseRecord.ref('fName')" readonly="true"/>
      </div>  
      <div class="col-sm-2"> 
        <label class="control-label" bind-text=' $model.dCarUseRecord.label("fCarDriverName")' /> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseRecord" bind-ref="dCarUseRecord.ref('fCarDriverName')" readonly="true"/>
      </div> 
    </div> 
    
     
  <div class="form-group" xid="formGroup2">
   <div class="col-sm-2" xid="col5">
    <label class="control-label" bind-text=' $model.dCarUseRecord.label("fApplyDeptName")' xid="controlLabel1"></label></div> 
   <div class="col-sm-4" xid="col6">
    <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC1" bind-ref="dCarUseRecord.ref('fApplyDeptID')" bind-labelRef="dCarUseRecord.ref('fApplyDeptName')">
   <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dOrg" limit="-1"></div>
   <option xid="option1">
    <columns xid="columns2">
     <column name="sName" xid="column5"></column></columns> </option> </div></div> 
   <div class="col-sm-2" xid="col7">
    <label class="control-label" bind-text=' $model.dCarUseRecord.label("fApplyPsnName")' xid="controlLabel2"></label></div> 
   <div class="col-sm-4" xid="col8">
    <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="treeSltPsm" bind-ref="dCarUseRecord.ref('fApplyDeptID')" bind-labelRef="dCarUseRecord.ref('fApplyDeptName')">
   <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dPsm" limit="-1"><treeOption xid="default5" rootFilter="1=1"></treeOption></div>
   <option xid="option2">
    <columns xid="columns3">
     <column name="sName" xid="column6"></column></columns> </option> </div></div> </div>
  <div class="form-group" xid="formGroup3">
   <div class="col-sm-2" xid="col9">
    <label class="control-label" bind-text=' $model.dCarUseRecord.label("fBeginTime")' xid="controlLabel3"></label></div> 
   <div class="col-sm-4" xid="col11">
    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseRecord" bind-ref="dCarUseRecord.ref('fBeginTime')" xid="input4"></input></div> 
   <div class="col-sm-2" xid="col10">
    <label class="control-label" bind-text=' $model.dCarUseRecord.label("fEndTime")' xid="controlLabel4"></label></div> 
   <div class="col-sm-4" xid="col12">
    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseRecord" bind-ref="dCarUseRecord.ref('fEndTime')" xid="input3"></input></div> </div>
  <div class="form-group" xid="formGroup4">
   <div class="col-sm-2" xid="col13">
    <label class="control-label" bind-text=' $model.dCarUseRecord.label("fBeginMileage")' xid="controlLabel5"></label></div> 
   <div class="col-sm-4" xid="col15">
    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseRecord" bind-ref="dCarUseRecord.ref('fBeginMileage')" xid="input6"></input></div> 
   <div class="col-sm-2" xid="col14">
    <label class="control-label" bind-text=' $model.dCarUseRecord.label("fEndMileage")' xid="controlLabel6"></label></div> 
   <div class="col-sm-4" xid="col16">
    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseRecord" bind-ref="dCarUseRecord.ref('fEndMileage')" xid="input5"></input></div> </div>
  <div class="form-group" xid="formGroup5">
   <div class="col-sm-2" xid="col18">
    <label class="control-label" bind-text=' $model.dCarUseRecord.label("fMileage")' xid="controlLabel7"></label></div> 
   <div class="col-sm-4" xid="col20">
    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseRecord" bind-ref="dCarUseRecord.ref('fMileage')" xid="input8"></input></div> 
   <div class="col-sm-2" xid="col17">
    <label class="control-label" bind-text=' $model.dCarUseRecord.label("fTotalCharge")' xid="controlLabel8"></label></div> 
   <div class="col-sm-4" xid="col19">
    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseRecord" bind-ref="dCarUseRecord.ref('fTotalCharge')" xid="input7"></input></div> </div>
  <div class="form-group" xid="formGroup6">
   <div class="col-sm-2" xid="col21"><label class="control-label" bind-text=' $model.dCarUseRecord.label("fRemark")' xid="controlLabel9"></label></div>
   <div class="col-sm-10" xid="col22"><textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea1" bind-ref="dCarUseRecord.ref('fRemark')"></textarea></div>
   </div>
  <div class="form-group" xid="formGroup1">
   <div class="col-sm-2" xid="col4">
    <label class="control-label" bind-text=' $model.dCarUseRecord.label("fCreatePsnName")' xid="controlLabel10"></label></div> 
   <div class="col-sm-4" xid="col3">
    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseRecord" bind-ref="dCarUseRecord.ref('fCreatePsnName')" xid="input2" readonly="true"></input></div> 
   <div class="col-sm-2" xid="col23">
    <label class="control-label" bind-text=' $model.dCarUseRecord.label("fCreateTime")' xid="controlLabel11"></label></div> 
   <div class="col-sm-4" xid="col2">
    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseRecord" bind-ref="dCarUseRecord.ref('fCreateTime')" xid="input1" readonly="true"></input></div> </div></div></div>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="title" xid="controlGroup2">
   <div class="x-control-group-title" xid="controlGroupTitle2">
    <span xid="span5">title</span></div> 
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar2"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dCarUseRecordFeeDetail.save'}" xid="button3">
   <i xid="i1"></i>
   <span xid="span1"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dCarUseRecordFeeDetail.delete'}" xid="button4">
   <i xid="i4"></i>
   <span xid="span6"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dCarUseRecordFeeDetail.new'}" xid="button5">
   <i xid="i5"></i>
   <span xid="span7"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dCarUseRecordFeeDetail.refresh'}" xid="button6">
   <i xid="i6"></i>
   <span xid="span8"></span></a></div>
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1" data="dCarUseRecordFeeDetail">
   <columns xid="columns1"><column name="recordNO" xid="column4"></column><column name="fChargeTypeName" xid="column1"></column>
  <column name="fAmount" xid="column2"></column>
  <column name="fDescription" xid="column3"></column>
  </columns></div></div></div>
   <div class="x-panel-bottom" xid="bottom2"><a class="btn btn-link btn-only-label x-dialog-button" component="$UI/system/components/justep/button/button" label="取    消" onClick="cancelBtnClick" style="margin-left:30px;width:80px;" xid="button2">
   <i xid="i2"></i>
   <span xid="span2">取 消</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button" label="确定" xid="button1" onClick="okBtnClick">
   <i xid="i3"></i>
   <span xid="span3">确定</span></a></div></div></div>