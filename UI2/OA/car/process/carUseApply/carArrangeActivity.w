<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  extends="$UI/OA/car/process/carUseApply/parent.w" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  class="window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc" >

    <rule xid="rule1_3" xui:parent="dCarUseApply" xui:update-mode="insert" >
<readonly xid="readonly1_3" >
<expr xid="default1_3" >
true</expr>
</readonly>
</rule>
    <div class="x-control-group" collapsible="true" component="$UI/system/components/justep/controlGroup/controlGroup" title="用车安排" xid="controlGroup21_1" xui:before="controlGroup1" xui:parent="content" xui:update-mode="insert" >
<div class="x-control-group-title" xid="controlGroupTitle21_1" >
<span xid="span21_1" >






用车安排</span>
</div>
<div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form1" >
<div class="form-group" xid="formGroup21_1" >
<div class="col-sm-2" xid="col21_1" >
<label bind-text=" $model.dCarUseArrange.label(&quot;fCode&quot;)" class="control-label" xid="controlLabel11_1" />
</div>
<div class="col-sm-3" xid="col41_1" >
<input bind-ref="dCarUseArrange.ref('fCode')" class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseApply" xid="fCode" />
</div>
<div class="col-sm-1" xid="col1_4" >
<a class="btn btn-link btn-only-icon" component="$UI/system/components/justep/button/button" icon="icon-android-search" onClick="selectCarClick" xid="selectCar" >
<i class="icon-android-search" xid="i1_4" />
<span xid="span1_4" >
</span>
</a>
</div>
<div class="col-sm-2" xid="col31_1" >
<label bind-text=" $model.dCarUseArrange.label(&quot;fCarDriverName&quot;)" class="control-label" xid="controlLabel21_1" />
</div>
<div class="col-sm-4" xid="col11_1" >
<select bind-labelRef="dCarUseArrange.ref('fCarDriverName')" bind-options="dDriverInfo" bind-optionsLabel="fName" bind-optionsValue="fCode" bind-ref="dCarUseArrange.ref('fCarDriverID')" class="form-control" component="$UI/system/components/justep/select/select" xid="fCarDriverName" />
</div>
</div>
<div class="form-group" xid="formGroup31_1" >
<div class="col-sm-2" xid="col6" >
<label bind-text=" $model.dCarUseArrange.label(&quot;fName&quot;)" class="control-label" xid="controlLabel3" />
</div>
<div class="col-sm-4" xid="col8" >
<input bind-ref="dCarUseArrange.ref('fName')" class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseApply" xid="input4" />
</div>
<div class="col-sm-2" xid="col7" >
<label bind-text=" $model.dCarUseArrange.label(&quot;fCarKindName&quot;)" class="control-label" xid="controlLabel4" />
</div>
<div class="col-sm-4" xid="col5" >
<input bind-ref="dCarUseArrange.ref('fCarKindName')" class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseApply" xid="input3" />
</div>
</div>
<div class="form-group" xid="formGroup11_1" >
<div class="col-sm-2" xid="col61_1" >
<label bind-text=" $model.dCarUseArrange.label(&quot;fTelephone&quot;)" class="control-label" xid="controlLabel5" />
</div>
<div class="col-sm-4" xid="col51_1" >
<input bind-ref="dCarUseArrange.ref('fTelephone')" class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseApply" xid="input6" />
</div>
<div class="col-sm-2" xid="col10" >
<label bind-text=" $model.dCarUseArrange.label(&quot;fArgnPsnName&quot;)" class="control-label" xid="controlLabel6" />
</div>
<div class="col-sm-4" xid="col9" >
<input bind-ref="dCarUseArrange.ref('fArgnPsnName')" class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseApply" xid="fArgnPsnName" />
</div>
</div>
</div>
</div>

</div>