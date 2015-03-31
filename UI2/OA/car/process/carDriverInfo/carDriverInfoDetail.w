<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:465px;top:173px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dCarDriverInfo"
      directDelete="true" autoLoad="false" concept="OA_CA_DriverBasicInfo" columns=""
      autoNew="false" onSaveCommit="dCarDriverInfoSaveCommit"> 
      <reader action="/OA/car/logic/action/queryCADriverBasicInfoAction"/>  
      <writer action="/OA/car/logic/action/saveCADriverBasicInfoAction"/>  
      <creator action="/OA/car/logic/action/createCADriverBasicInfoAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    <rule xid="rule1">
   <col name="fCode" xid="ruleCol1">
    <required xid="required1">
     <expr xid="default4">true</expr>
     <message xid="default5">'编码:不能为空或重复！'</message></required> </col> 
   <col name="fName" xid="ruleCol2">
    <required xid="required2">
     <expr xid="default6">true</expr>
     <message xid="default7">'姓名不能为空！'</message></required> </col> 
   <col name="fDrivingLicence" xid="ruleCol3">
    <required xid="required3">
     <expr xid="default8">true</expr>
     <message xid="default9">'驾驶证号不能为空！'</message></required> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="sexData" idColumn="sex"><column label="性别" name="sex" type="String" xid="default1"></column>
  <data xid="default2">[{&quot;sex&quot;:&quot;男&quot;},{&quot;sex&quot;:&quot;女&quot;}]</data></div>
  <div component="$UI/system/components/justep/data/bizData" xid="dCarKind" concept="OA_Pub_BaseCode"><reader xid="default3" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"></reader></div></div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive" style="left:154px;top:381px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div class="x-toolbar form-inline x-toolbar-spliter" component="$UI/system/components/justep/toolBar/toolBar"
        xid="toolBar1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{operation:'dCarDriverInfo.new'}" xid="button4">
   <i xid="i4"></i>
   <span xid="span7"></span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{operation:'dCarDriverInfo.save'}" xid="button1">
   <i xid="i2"></i>
   <span xid="span5"></span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{operation:'dCarDriverInfo.delete'}" xid="button3">
   <i xid="i3"></i>
   <span xid="span6"></span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{operation:'dCarDriverInfo.refresh'}" xid="button5">
   <i xid="i7"></i>
   <span xid="span8"></span></a><a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button"
          icon="icon-ios7-play" label="启用" xid="trgStartUse" onClick="trgStartUseClick"> 
          <i class="icon-ios7-play" xid="i8"/>  
          <span xid="span12">启用</span> 
        </a>  
        <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button"
          icon="icon-ios7-pause" label="停用" xid="trgStopUse" onClick="trgStopUseClick"> 
          <i class="icon-ios7-pause" xid="i10"/>  
          <span xid="span14">停用</span> 
        </a>  
        </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="基本信息" xid="carBasicInfoBasic" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle1"> 
          <span xid="span2"><![CDATA[基本信息]]></span> 
        </div>  
        <div xid="div1"> 
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row1"> 
            <div class="col col-xs-8 col-sm-8 col-md-8 col-lg-8" xid="col1"> 
              <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
                xid="form1"> 
                <div class="form-group" xid="formGroup1"> 
                  <div class="col-sm-2" xid="col4"> 
                    <label class="control-label" bind-text=' $model.dCarDriverInfo.label("fCode")'
                      xid="fCodeLabel"/> 
                  </div>  
                  <div class="col-sm-4" xid="col5"> 
                    <input class="form-control" component="$UI/system/components/justep/input/input"
                      data="dCarBasicInfo" bind-ref="dCarDriverInfo.ref('fCode')" xid="input1"/> 
                  </div>  
                  <div class="col-sm-2" xid="col6"> 
                    <label class="control-label" bind-text=' $model.dCarDriverInfo.val("fName")'
                      xid="controlLabel1"/> 
                  </div>  
                  <div class="col-sm-4" xid="col7"> 
                    <input class="form-control" component="$UI/system/components/justep/input/input"
                      data="dCarBasicInfo" bind-ref="dCarDriverInfo.ref('fName')" xid="input2"/> 
                  </div> 
                </div>  
                <div class="form-group" xid="formGroup2"> 
                  <div class="col-sm-2" xid="col8"> 
                    <label class="control-label" bind-text=' $model.dCarDriverInfo.label("fBirthday")'
                      xid="controlLabel2"/> 
                  </div>  
                  <div class="col-sm-4" xid="col9"> 
                    <input class="form-control" component="$UI/system/components/justep/input/input"
                      data="dCarBasicInfo" bind-ref="dCarDriverInfo.ref('fBirthday')" xid="input3"/> 
                  </div>  
                  <div class="col-sm-2" xid="col10"> 
                    <label class="control-label" bind-text=' $model.dCarDriverInfo.label("fAge")'
                      xid="controlLabel3"/> 
                  </div>  
                  <div class="col-sm-4" xid="col11"> 
                    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarBasicInfo" bind-ref="dCarDriverInfo.ref('fAge')" xid="fAge"></input></div> 
                </div>  
                <div class="form-group" xid="formGroup3"> 
                  <div class="col-sm-2" xid="col12"> 
                    <label class="control-label" bind-text=' $model.dCarDriverInfo.label("fSex")'
                      xid="controlLabel4"/> 
                  </div>  
                  <div class="col-sm-4" xid="col13"> 
                    <select component="$UI/system/components/justep/select/select" class="form-control" xid="select1" bind-ref="dCarDriverInfo.ref('fSex')" bind-labelRef="dCarDriverInfo.ref('fSex')" bind-options="sexData" bind-optionsValue="sex" bind-optionsLabel="sex"></select></div>  
                  <div class="col-sm-2" xid="col14"> 
                    <label class="control-label" bind-text=' $model.dCarDriverInfo.label("fDrivingLicence")'
                      xid="controlLabel5"/> 
                  </div>  
                  <div class="col-sm-4" xid="col15"> 
                    <input class="form-control" component="$UI/system/components/justep/input/input"
                      data="dCarBasicInfo" bind-ref="dCarDriverInfo.ref('fDrivingLicence')"
                      xid="input6"/> 
                  </div> 
                </div>  
                <div class="form-group" xid="formGroup4"> 
                  <div class="col-sm-2" xid="col16"> 
                    <label class="control-label" bind-text=' $model.dCarDriverInfo.label("fSendLicenceDate")'
                      xid="controlLabel6"/> 
                  </div>  
                  <div class="col-sm-4" xid="col17"> 
                    <input class="form-control" component="$UI/system/components/justep/input/input"
                      data="dCarBasicInfo" bind-ref="dCarDriverInfo.ref('fSendLicenceDate')"
                      xid="input7"/> 
                  </div>  
                  <div class="col-sm-2" xid="col18"> 
                    <label class="control-label" bind-text=' $model.dCarDriverInfo.label("fCarLicenceLife")'
                      xid="controlLabel7"/> 
                  </div>  
                  <div class="col-sm-4" xid="col19"> 
                    <input class="form-control" component="$UI/system/components/justep/input/input"
                      data="dCarBasicInfo" bind-ref="dCarDriverInfo.ref('fCarLicenceLife')"
                      xid="input8"/> 
                  </div> 
                </div>  
                <div class="form-group" xid="formGroup5"> 
                  <div class="col-sm-2" xid="col20"> 
                    <label class="control-label" bind-text=' $model.dCarDriverInfo.label("fCarKindName")'
                      xid="controlLabel8"/> 
                  </div>  
                  <div class="col-sm-4" xid="col21"> 
                    <select component="$UI/system/components/justep/select/select" class="form-control" xid="fCarKindName" bind-ref="dCarDriverInfo.ref('fCarKindID')" bind-labelRef="dCarDriverInfo.ref('fCarKindName')" bind-options="dCarKind" bind-optionsValue="fCode" bind-optionsLabel="fName"></select></div>  
                  <div class="col-sm-2" xid="col22"> 
                    <label class="control-label" bind-text=' $model.dCarDriverInfo.label("fDrivingYears")'
                      xid="controlLabel9"/> 
                  </div>  
                  <div class="col-sm-4" xid="col23"> 
                    <input class="form-control" component="$UI/system/components/justep/input/input"
                      data="dCarBasicInfo" bind-ref="dCarDriverInfo.ref('fDrivingYears')"
                      xid="fDrivingYears"/> 
                  </div> 
                </div>  
                <div class="form-group" xid="formGroup6"> 
                  <div class="col-sm-2" xid="col24"> 
                    <label class="control-label" bind-text=' $model.dCarDriverInfo.label("fTelephone")'
                      xid="controlLabel10"/> 
                  </div>  
                  <div class="col-sm-4" xid="col25"> 
                    <input class="form-control" component="$UI/system/components/justep/input/input"
                      data="dCarBasicInfo" bind-ref="dCarDriverInfo.ref('fTelephone')"
                      xid="fTelephone"/> 
                  </div>  
                  <div class="col-sm-2" xid="col26"> 
                    <label class="control-label" bind-text=' $model.dCarDriverInfo.label("fMobilePhone")'
                      xid="controlLabel11"/> 
                  </div>  
                  <div class="col-sm-4" xid="col27"> 
                    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarBasicInfo" bind-ref="dCarDriverInfo.ref('fMobilePhone')" xid="fMobilePhone"></input></div> 
                </div>  
                <div class="form-group" xid="formGroup7"> 
                  <div class="col-sm-2" xid="col28"> 
                    <label class="control-label" bind-text=' $model.dCarDriverInfo.label("fAddress")'
                      xid="controlLabel12"/> 
                  </div>  
                  <div class="col-sm-4" xid="col29"> 
                    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarBasicInfo" bind-ref="dCarDriverInfo.ref('fAddress')" xid="fAddress"></input></div>  
                  <div class="col-sm-2" xid="col30"> 
                    <label class="control-label" bind-text=' $model.dCarDriverInfo.label("fWorkUnits")'
                      xid="controlLabel13"/> 
                  </div>  
                  <div class="col-sm-4" xid="col31"> 
                    <input class="form-control" component="$UI/system/components/justep/input/input"
                      data="dCarBasicInfo" bind-ref="dCarDriverInfo.ref('fWorkUnits')"
                      xid="fWorkUnits"/> 
                  </div> 
                </div>  
                <div class="form-group" xid="formGroup8"> 
                  <div class="col-sm-2" xid="col37">
                    <label class="control-label" bind-text=' $model.dCarDriverInfo.label("fWorkHistory")'
                      xid="controlLabel14"/>
                  </div>  
                  <div class="col-sm-4" xid="col38">
                    <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="fWorkHistory" bind-ref="dCarDriverInfo.ref('fWorkHistory')"></textarea></div>  
                  <div class="col-sm-2" xid="col39">
                    <label class="control-label" bind-text=' $model.dCarDriverInfo.label("fRemark")'
                      xid="controlLabel15"/>
                  </div>  
                  <div class="col-sm-4" xid="col40">
                    <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="fRemark" bind-ref="dCarDriverInfo.ref('fRemark')"></textarea></div>
                </div>  
                </div> 
            </div>  
            <div class="col col-xs-4 col-sm-4 col-md-4 col-lg-4" xid="col2" style="height:100%;"> 
              <div component="$UI/system/components/justep/attachment/attachmentImage" access="duud" xid="attachmentImage1" bind-ref="dCarDriverInfo.ref('fPhoto')" style="height:100%;width:100%;">
   <div class="x-attachment x-attachment-image" xid="div3">
    <div data-bind="foreach:$attachmentItems,event:{mouseover:function(){$model.$state.set('remove')},mouseout:function(){$model.$state.set('browse')}}" xid="div4">
     <img class="x-item-attachment-img" data-bind="attr:{src:$model.getPictureUrl($object)},click:$model.showInfullScreen.bind($model,$object)" xid="image1"></img>
     <a data-bind="visible:$model.$state.get() == 'remove',click:$model.previewOrRemoveItem.bind($model),enable:$model.$access.get() % 4 &gt;= 2" class="x-remove-barget" xid="a1"></a></div> 
    <div class="x-doc-process" xid="div5">
     <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="div6"></div></div> 
    <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; (1 &gt; $attachmentItems.get().length)" xid="div7">
     <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256" xid="div8"></div></div> </div> </div></div> 
          </div> 
        </div> 
      </div>  
      </div>  
    <div class="x-panel-bottom" xid="bottom2"> 
      <a class="btn btn-link btn-only-label x-dialog-button" component="$UI/system/components/justep/button/button"
        label="取    消" onClick="cancelBtnClick" style="margin-left:30px;width:80px;"
        xid="cancelBtn"> 
        <i xid="i4_1"/>  
        <span xid="span4_1">取 消</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button"
        label="确定" xid="OKBtn" onClick="okBtnClick"> 
        <i xid="i1"/>  
        <span xid="span1">确定</span> 
      </a> 
    </div> 
  </div> 
</div>
