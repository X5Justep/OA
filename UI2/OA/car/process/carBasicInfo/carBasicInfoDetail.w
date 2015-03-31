<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:465px;top:173px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dCarBasicInfo"
      directDelete="true" autoLoad="false" concept="OA_CA_CarBasicInfo" columns=""
      autoNew="false" onSaveCommit="dCarBasicInfoSaveCommit"> 
      <reader action="/OA/car/logic/action/queryCACarBasicInfoAction"/>  
      <writer action="/OA/car/logic/action/saveCACarBasicInfoAction"/>  
      <creator action="/OA/car/logic/action/createCACarBasicInfoAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    <rule xid="rule7">
   <col name="fCode" xid="ruleCol13">
    <required xid="required13">
     <expr xid="default34"><![CDATA[true]]></expr>
     <message xid="default35">'车牌号码:不能为空或重复！'</message></required> </col> 
   <col name="fName" xid="ruleCol14">
    <required xid="required14">
     <expr xid="default36"><![CDATA[true]]></expr>
     <message xid="default37">'品牌不能为空！'</message></required> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dCarKind"
      concept="OA_Pub_BaseCode" limit="-1">
      <reader xid="default1" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dCarDriver"
      concept="OA_CA_DriverBasicInfo" limit="-1">
      <reader xid="default2" action="/OA/car/logic/action/queryCADriverBasicInfoAction"/>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dUseKind"
      concept="OA_Pub_BaseCode" limit="-1">
      <reader xid="default3" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive" style="left:154px;top:381px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div class="x-toolbar form-inline x-toolbar-spliter" component="$UI/system/components/justep/toolBar/toolBar"
        xid="toolBar1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{'operation':'dCarBasicInfo.new'}" xid="button4"> 
          <i xid="i4"/>  
          <span xid="span7"/>
        </a>
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{'operation':'dCarBasicInfo.save'}" xid="button1"> 
          <i xid="i2"/>  
          <span xid="span5"/>
        </a>
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{'operation':'dCarBasicInfo.delete'}" xid="button3"> 
          <i xid="i3"/>  
          <span xid="span6"/>
        </a>
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{'operation':'dCarBasicInfo.refresh'}" xid="button5"> 
          <i xid="i7"/>  
          <span xid="span8"/>
        </a>
        <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button"
          icon="icon-ios7-play" label="启用" xid="trgStartUse" onClick="trgStartUseClick"> 
          <i class="icon-ios7-play" xid="i8"/>  
          <span xid="span12">启用</span> 
        </a>  
        <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button"
          icon="icon-ios7-pause" label="停用" xid="trgStopUse" onClick="trgStopUseClick"> 
          <i class="icon-ios7-pause" xid="i10"/>  
          <span xid="span14">停用</span> 
        </a>  
        <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button"
          label="年度情况" xid="trgYear"> 
          <i xid="i5"/>  
          <span xid="span3">年度情况</span> 
        </a>  
        <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button"
          label="保险情况" xid="trgSafe"> 
          <i xid="i6"/>  
          <span xid="span4">保险情况</span> 
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
                    <label class="control-label" bind-text="dCarBasicInfo.label('fCode')"
                      xid="fCodeLabel"/> 
                  </div>  
                  <div class="col-sm-4" xid="col5"> 
                    <input class="form-control" component="$UI/system/components/justep/input/input"
                      data="dCarBasicInfo" bind-ref="dCarBasicInfo.ref('fCode')" xid="input1"/> 
                  </div>  
                  <div class="col-sm-2" xid="col6"> 
                    <label class="control-label" bind-text="dCarBasicInfo.label('fName')"
                      xid="controlLabel1"/> 
                  </div>  
                  <div class="col-sm-4" xid="col7"> 
                    <input class="form-control" component="$UI/system/components/justep/input/input"
                      data="dCarBasicInfo" bind-ref="dCarBasicInfo.ref('fName')" xid="input2"/> 
                  </div> 
                </div>  
                <div class="form-group" xid="formGroup2"> 
                  <div class="col-sm-2" xid="col8"> 
                    <label class="control-label" bind-text="dCarBasicInfo.label('fType')"
                      xid="controlLabel2"/> 
                  </div>  
                  <div class="col-sm-4" xid="col9"> 
                    <input class="form-control" component="$UI/system/components/justep/input/input"
                      data="dCarBasicInfo" bind-ref="dCarBasicInfo.ref('fType')" xid="input3"/> 
                  </div>  
                  <div class="col-sm-2" xid="col10"> 
                    <label class="control-label" bind-text=" $model.dCarBasicInfo.label(&quot;fCarKindName&quot;)"
                      xid="controlLabel3"/> 
                  </div>  
                  <div class="col-sm-4" xid="col11"> 
                    <select component="$UI/system/components/justep/select/select"
                      class="form-control" xid="select1" bind-ref="dCarBasicInfo.ref('fCarKindID')"
                      bind-labelRef="dCarBasicInfo.ref('fCarKindName')" bind-options="dCarKind"
                      bind-optionsValue="fCode" bind-optionsLabel="fName"/>
                  </div> 
                </div>  
                <div class="form-group" xid="formGroup3"> 
                  <div class="col-sm-2" xid="col12"> 
                    <label class="control-label" bind-text=" $model.dCarBasicInfo.label(&quot;fCheckPsnNum&quot;)"
                      xid="controlLabel4"/> 
                  </div>  
                  <div class="col-sm-4" xid="col13"> 
                    <input class="form-control" component="$UI/system/components/justep/input/input"
                      data="dCarBasicInfo" bind-ref="dCarBasicInfo.ref('fCheckPsnNum')"
                      xid="input5"/> 
                  </div>  
                  <div class="col-sm-2" xid="col14"> 
                    <label class="control-label" bind-text=" $model.dCarBasicInfo.label(&quot;fCheckLoad&quot;)"
                      xid="controlLabel5"/> 
                  </div>  
                  <div class="col-sm-4" xid="col15"> 
                    <input class="form-control" component="$UI/system/components/justep/input/input"
                      data="dCarBasicInfo" bind-ref="dCarBasicInfo.ref('fCheckLoad')"
                      xid="input6"/> 
                  </div> 
                </div>  
                <div class="form-group" xid="formGroup4"> 
                  <div class="col-sm-2" xid="col16"> 
                    <label class="control-label" bind-text=" $model.dCarBasicInfo.label(&quot;fCheckOilConsumption&quot;)"
                      xid="controlLabel6"/> 
                  </div>  
                  <div class="col-sm-4" xid="col17"> 
                    <input class="form-control" component="$UI/system/components/justep/input/input"
                      data="dCarBasicInfo" bind-ref="dCarBasicInfo.ref('fCheckOilConsumption')"
                      xid="input7"/> 
                  </div>  
                  <div class="col-sm-2" xid="col18"> 
                    <label class="control-label" bind-text="$model.dCarBasicInfo.label(&quot;fDisplacement&quot;)"
                      xid="controlLabel7"/> 
                  </div>  
                  <div class="col-sm-4" xid="col19"> 
                    <input class="form-control" component="$UI/system/components/justep/input/input"
                      data="dCarBasicInfo" bind-ref="dCarBasicInfo.ref('fDisplacement')"
                      xid="input8"/> 
                  </div> 
                </div>  
                <div class="form-group" xid="formGroup5"> 
                  <div class="col-sm-2" xid="col20"> 
                    <label class="control-label" bind-text=" $model.dCarBasicInfo.label(&quot;fOilGrade&quot;)"
                      xid="controlLabel8"/> 
                  </div>  
                  <div class="col-sm-4" xid="col21"> 
                    <input class="form-control" component="$UI/system/components/justep/input/input"
                      data="dCarBasicInfo" bind-ref="dCarBasicInfo.ref('fOilGrade')"
                      xid="input9"/> 
                  </div>  
                  <div class="col-sm-2" xid="col22"> 
                    <label class="control-label" bind-text=" $model.dCarBasicInfo.label(&quot;fCarFrameNo&quot;)"
                      xid="controlLabel9"/> 
                  </div>  
                  <div class="col-sm-4" xid="col23"> 
                    <input class="form-control" component="$UI/system/components/justep/input/input"
                      data="dCarBasicInfo" bind-ref="dCarBasicInfo.ref('fCarFrameNo')"
                      xid="input10"/> 
                  </div> 
                </div>  
                <div class="form-group" xid="formGroup6"> 
                  <div class="col-sm-2" xid="col24"> 
                    <label class="control-label" bind-text=" $model.dCarBasicInfo.label(&quot;fCarEngineNo&quot;)"
                      xid="controlLabel10"/> 
                  </div>  
                  <div class="col-sm-4" xid="col25"> 
                    <input class="form-control" component="$UI/system/components/justep/input/input"
                      data="dCarBasicInfo" bind-ref="dCarBasicInfo.ref('fCarEngineNo')"
                      xid="input11"/> 
                  </div>  
                  <div class="col-sm-2" xid="col26"> 
                    <label class="control-label" bind-text=" $model.dCarBasicInfo.label(&quot;fCarDriverName&quot;)"
                      xid="controlLabel11"/> 
                  </div>  
                  <div class="col-sm-4" xid="col27"> 
                    <select component="$UI/system/components/justep/select/select"
                      class="form-control" xid="select2" bind-ref="dCarBasicInfo.ref('fCarDriverID')"
                      bind-labelRef="dCarBasicInfo.ref('fCarDriverName')" bind-options="dCarDriver"
                      bind-optionsValue="fCode" bind-optionsLabel="fName"/>
                  </div> 
                </div>  
                <div class="form-group" xid="formGroup7"> 
                  <div class="col-sm-2" xid="col28"> 
                    <label class="control-label" bind-text=" $model.dCarBasicInfo.label(&quot;fUseKindName&quot;)"
                      xid="controlLabel12"/> 
                  </div>  
                  <div class="col-sm-4" xid="col29"> 
                    <select component="$UI/system/components/justep/select/select"
                      class="form-control" xid="select3" bind-ref="dCarBasicInfo.ref('fUseKindID')"
                      bind-labelRef="dCarBasicInfo.ref('fUseKindName')" bind-options="dUseKind"
                      bind-optionsValue="fCode" bind-optionsLabel="fName"/>
                  </div>  
                  <div class="col-sm-2" xid="col30"> 
                    <label class="control-label" bind-text="$model.dCarBasicInfo.label(&quot;fUseStatusName&quot;)"
                      xid="controlLabel13"/> 
                  </div>  
                  <div class="col-sm-4" xid="col31"> 
                    <input class="form-control" component="$UI/system/components/justep/input/input"
                      data="dCarBasicInfo" bind-ref="dCarBasicInfo.ref('fUseStatusName')"
                      xid="fUseStatusName"/> 
                  </div> 
                </div>  
                <div class="form-group" xid="formGroup8"> 
                  <div class="col-sm-2" xid="col37">
                    <label class="control-label" bind-text=" $model.dCarBasicInfo.label(&quot;fDutyDeptName&quot;)"
                      xid="controlLabel14"/>
                  </div>  
                  <div class="col-sm-4" xid="col38">
                    <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                      xid="orgSelectPC1" bind-ref="dCarBasicInfo.ref('fDutyDeptID')"
                      bind-labelRef="dCarBasicInfo.ref('fDutyDeptName')"> 
                      <div component="$UI/system/components/justep/data/bizData"
                        autoLoad="true" xid="dOrg" limit="-1"/>  
                      <option xid="option1"> 
                        <columns xid="columns1"> 
                          <column name="sName" xid="column1"/>
                        </columns> 
                      </option> 
                    </div>
                  </div>  
                  <div class="col-sm-2" xid="col39">
                    <label class="control-label" bind-text=" $model.dCarBasicInfo.label(&quot;fDutyPsnName&quot;)"
                      xid="controlLabel15"/>
                  </div>  
                  <div class="col-sm-4" xid="col40">
                    <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                      xid="orgSelectPC2" bind-ref="dCarBasicInfo.ref('fDutyDeptID')"
                      bind-labelRef="dCarBasicInfo.ref('fDutyDeptName')"> 
                      <div component="$UI/system/components/justep/data/bizData"
                        autoLoad="true" xid="dPsm" limit="-1">
                        <treeOption xid="default4" rootFilter="1=1"/>
                      </div>  
                      <option xid="option2"> 
                        <columns xid="columns2"> 
                          <column name="sName" xid="column2"/>
                        </columns> 
                      </option> 
                    </div>
                  </div>
                </div>  
                <div class="form-group" xid="formGroup9"> 
                  <div class="col-sm-2" xid="col36"> 
                    <label class="control-label" bind-text=" $model.dCarBasicInfo.label(&quot;fCarAppendix&quot;)"
                      xid="controlLabel16"><![CDATA[c]]></label>
                  </div>  
                  <div class="col-sm-10" xid="col35"> 
                    <textarea component="$UI/system/components/justep/textarea/textarea"
                      class="form-control x-edit" xid="textarea3" bind-ref="dCarBasicInfo.ref('fCarAppendix')"/>
                  </div> 
                </div>
              </div> 
            </div>  
            <div class="col col-xs-4 col-sm-4 col-md-4 col-lg-4" xid="col2" style="height:100%;"> 
              <div component="$UI/system/components/justep/attachment/attachmentImage" access="duud" xid="attachmentImage1" bind-ref="dCarBasicInfo.ref('fPhoto')" style="height:100%;width:100%;">
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
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="资产信息" xid="assetsInfo" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle2"> 
          <span xid="span9">title</span>
        </div>  
        <div xid="div2">
          <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
            xid="form2">
            <div class="form-group" xid="formGroup10"> 
              <div class="col-sm-2" xid="col3">
                <label class="control-label" bind-text=" $model.dCarBasicInfo.label(&quot;fEquipmentNo&quot;)"
                  xid="controlLabel17"/>
              </div>  
              <div class="col-sm-4" xid="col32">
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  data="dCarBasicInfo" bind-ref="dCarBasicInfo.ref('fEquipmentNo')"
                  xid="input4"/>
              </div>  
              <div class="col-sm-2" xid="col33">
                <label class="control-label" bind-text=" $model.dCarBasicInfo.label(&quot;fOriginValue&quot;)"
                  xid="controlLabel18"/>
              </div>  
              <div class="col-sm-4" xid="col34">
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  data="dCarBasicInfo" bind-ref="dCarBasicInfo.ref('fOriginValue')"
                  xid="input12"/>
              </div>
            </div>  
            <div class="form-group" xid="formGroup11"> 
              <div class="col-sm-2" xid="col41"> 
                <label class="control-label" bind-text=" $model.dCarBasicInfo.label(&quot;fRemainValue&quot;)"
                  xid="controlLabel19"/>
              </div>  
              <div class="col-sm-4" xid="col44"> 
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  data="dCarBasicInfo" bind-ref="dCarBasicInfo.ref('fRemainValue')"
                  xid="input13"/>
              </div>  
              <div class="col-sm-2" xid="col43"> 
                <label class="control-label" bind-text=" $model.dCarBasicInfo.label(&quot;fRemark&quot;)"
                  xid="controlLabel20"/>
              </div>  
              <div class="col-sm-4" xid="col42"> 
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control x-edit" xid="textarea1" bind-ref="dCarBasicInfo.ref('fRemark')"/>
              </div> 
            </div>
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
