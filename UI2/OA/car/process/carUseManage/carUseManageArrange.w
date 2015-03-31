<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xu="http://www.xmldb.org/xupdate"
  xmlns:xui="http://www.justep.com/xui" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:449px;top:22px;"
    xui:update-mode="insert" xui:parent=""> 
    <div component="$UI/system/components/justep/data/bizData" xid="dCarUseApply"
      directDelete="true" autoLoad="false" concept="OA_CA_CarUseApply" orderBy=""
      autoNew="false"> 
      <reader action="/OA/car/logic/action/queryCACarUseApplyAction"/>  
      <writer action="/OA/car/logic/action/saveCACarUseApplyAction"/>  
      <creator action="/OA/car/logic/action/createCACarUseApplyAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dCarUseArrange"
      concept="OA_CA_CarUseArrange"> 
      <reader xid="default1" action="/OA/car/logic/action/queryCACarUseArrangeAction"/>  
      <writer xid="default2" action="/OA/car/logic/action/saveCACarUseArrangeAction"/>  
      <creator xid="default3" action="/OA/car/logic/action/createCACarUseArrangeAction"/>  
      <master xid="default8"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dDriverInfo"
      concept="OA_CA_DriverBasicInfo"> 
      <reader xid="default4" action="/OA/car/logic/action/queryCADriverBasicInfoAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="isRoundtripData" idColumn="isRoundtrip"> 
      <column label="是否往返" name="isRoundtrip" type="String" xid="default6"/>  
      <data xid="default7">[{"isRoundtrip":"单程"},{"isRoundtrip":"双程"}]</data> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgSelectCars"
    src="$UI/OA/car/process/dialog/selcetCarsDialog/selectCarsDialog.w" onReceive="dlgSelectCarsReceive"
    status="normal" style="left:47px;top:156px;" xui:update-mode="insert" xui:parent=""/>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="left:75px;top:133px;" onReceive="windowReceiverReceive"
    xui:update-mode="insert" xui:parent=""/>  
  <div xid="view" xui:update-mode="insert" xui:parent=""> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="mainBar"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-only-label"
        xid="moreBtn" onClick="{operation:'dCarUseApply.new'}" icon="icon-ios7-more"> 
        <i xid="i15" class="icon-ios7-more"/>  
        <span xid="span15">新增</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="saveBtn" onClick="{operation:'dCarUseApply.save'}"> 
        <i xid="i1"/>  
        <span xid="span1"/> 
      </a> 
    </div>  
    <div xid="content"> 
      <h1 xid="h11" class="text-center">用车申请单</h1>  
      <div class="x-control-group" collapsible="true" component="$UI/system/components/justep/controlGroup/controlGroup"
        title="用车安排" xid="controlGroup211" xui:before="controlGroup1" xui:parent="content"
        xui:update-mode="insert"> 
        <div class="x-control-group-title" xid="controlGroupTitle211"> 
          <span xid="span211">用车安排</span> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
          xid="form1"> 
          <div class="form-group" xid="formGroup211"> 
            <div class="col-sm-2" xid="col211"> 
              <label bind-text=" $model.dCarUseArrange.label(&quot;fCode&quot;)" class="control-label"
                xid="controlLabel111"/> 
            </div>  
            <div class="col-sm-3" xid="col411"> 
              <input bind-ref="dCarUseArrange.ref('fCode')" class="form-control"
                component="$UI/system/components/justep/input/input" data="dCarUseApply"
                xid="fCode"/> 
            </div>  
            <div class="col-sm-1" xid="col15"> 
              <a class="btn btn-link btn-only-icon" component="$UI/system/components/justep/button/button"
                icon="icon-android-search" onClick="selectCarClick" xid="selectCar"> 
                <i class="icon-android-search" xid="i11"/>  
                <span xid="span11"/> 
              </a> 
            </div>  
            <div class="col-sm-2" xid="col311"> 
              <label bind-text=" $model.dCarUseArrange.label(&quot;fCarDriverName&quot;)"
                class="control-label" xid="controlLabel211"/> 
            </div>  
            <div class="col-sm-4" xid="col111"> 
              <select bind-labelRef="dCarUseArrange.ref('fCarDriverName')" bind-options="dDriverInfo"
                bind-optionsLabel="fName" bind-optionsValue="fCode" bind-ref="dCarUseArrange.ref('fCarDriverID')"
                class="form-control" component="$UI/system/components/justep/select/select"
                xid="fCarDriverName"/> 
            </div> 
          </div>  
          <div class="form-group" xid="formGroup311"> 
            <div class="col-sm-2" xid="col6"> 
              <label bind-text=" $model.dCarUseArrange.label(&quot;fName&quot;)" class="control-label"
                xid="controlLabel3"/> 
            </div>  
            <div class="col-sm-4" xid="col8"> 
              <input bind-ref="dCarUseArrange.ref('fName')" class="form-control"
                component="$UI/system/components/justep/input/input" data="dCarUseApply"
                xid="input4"/> 
            </div>  
            <div class="col-sm-2" xid="col7"> 
              <label bind-text=" $model.dCarUseArrange.label(&quot;fCarKindName&quot;)"
                class="control-label" xid="controlLabel4"/> 
            </div>  
            <div class="col-sm-4" xid="col5"> 
              <input bind-ref="dCarUseArrange.ref('fCarKindName')" class="form-control"
                component="$UI/system/components/justep/input/input" data="dCarUseApply"
                xid="input3"/> 
            </div> 
          </div>  
          <div class="form-group" xid="formGroup111"> 
            <div class="col-sm-2" xid="col611"> 
              <label bind-text=" $model.dCarUseArrange.label(&quot;fTelephone&quot;)" class="control-label"
                xid="controlLabel5"/> 
            </div>  
            <div class="col-sm-4" xid="col511"> 
              <input bind-ref="dCarUseArrange.ref('fTelephone')" class="form-control"
                component="$UI/system/components/justep/input/input" data="dCarUseApply"
                xid="input6"/> 
            </div>  
            <div class="col-sm-2" xid="col10"> 
              <label bind-text=" $model.dCarUseArrange.label(&quot;fArgnPsnName&quot;)"
                class="control-label" xid="controlLabel6"/> 
            </div>  
            <div class="col-sm-4" xid="col9"> 
              <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC1" bind-ref="dCarUseArrange.ref('fArgnPsnID')" bind-labelRef="dCarUseArrange.ref('fArgnPsnName')">
   <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="pOrgData"></div>
   <option xid="option3">
    <columns xid="columns3">
     <column name="sName" xid="column3"></column></columns> </option> </div></div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="基本信息" xid="controlGroup1"> 
        <div class="x-control-group-title" xid="controlGroupTitle1"> 
          <span xid="span7"> <![CDATA[基本信息]]> </span> 
        </div>  
        <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"> 
          <div xid="formGroup8" class="form-group"> 
            <div xid="col1" class="col-sm-2"> 
              <label xid="controlLabel1" class="control-label" bind-text=" $model.dCarUseApply.label(&quot;fNO&quot;)"/> 
            </div>  
            <div xid="col3" class="col-sm-4"> 
              <input class="form-control" component="$UI/system/components/justep/input/input"
                bind-ref="dCarUseApply.ref('fNO')" xid="input2" readonly="true"/> 
            </div>  
            <div xid="col4" class="col-sm-2"> 
              <label xid="controlLabel2" class="control-label" bind-text=" $model.dCarUseApply.label(&quot;fIsRoundtrip&quot;)"/> 
            </div>  
            <div xid="col2" class="col-sm-4"> 
              <select component="$UI/system/components/justep/select/select" class="form-control"
                xid="fIsRoundtrip" bind-ref="dCarUseApply.ref('fIsRoundtrip')" bind-labelRef="dCarUseApply.ref('fIsRoundtrip')"
                bind-options="isRoundtripData" bind-optionsValue="isRoundtrip" bind-optionsLabel="isRoundtrip"/> 
            </div> 
          </div>  
          <div xid="formGroup1" class="form-group"> 
            <div xid="col11" class="col-sm-2"> 
              <label xid="fApplyDeptNameLable" class="control-label" bind-text=" $model.dCarUseApply.label(&quot;fApplyDeptName&quot;)"/> 
            </div>  
            <div xid="col12" class="col-sm-4"> 
              <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                xid="treeSltDept" bind-ref="dCarUseApply.ref('fApplyDeptID')" bind-labelRef="dCarUseApply.ref('fApplyDeptName')"> 
                <div component="$UI/system/components/justep/data/bizData"
                  autoLoad="true" xid="dOrg" limit="-1"/>  
                <option xid="option1"> 
                  <columns xid="columns1"> 
                    <column name="sName" xid="column1"/> 
                  </columns> 
                </option> 
              </div> 
            </div>  
            <div xid="col13" class="col-sm-2"> 
              <label xid="fApplyPsnNameLable" class="control-label" bind-text=" $model.dCarUseApply.label(&quot;fApplyPsnName&quot;)"/> 
            </div>  
            <div xid="col14" class="col-sm-4"> 
              <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                xid="treeSltPsm" bind-ref="dCarUseApply.ref('fApplyPsnID')" bind-labelRef="dCarUseApply.ref('fApplyPsnName')"> 
                <div component="$UI/system/components/justep/data/bizData"
                  autoLoad="true" xid="dPsm" limit="-1"> 
                  <treeOption xid="default5" rootFilter="1=1"/> 
                </div>  
                <option xid="option2"> 
                  <columns xid="columns2"> 
                    <column name="sName" xid="column2"/> 
                  </columns> 
                </option> 
              </div> 
            </div> 
          </div>  
          <div xid="formGroup2" class="form-group"> 
            <div xid="col21" class="col-sm-2"> 
              <label xid="fApplyDateLable" class="control-label" bind-text=" $model.dCarUseApply.label(&quot;fApplyDate&quot;)"/> 
            </div>  
            <div xid="col22" class="col-sm-4"> 
              <input class="form-control" component="$UI/system/components/justep/input/input"
                bind-ref="dCarUseApply.ref('fApplyDate')"/> 
            </div>  
            <div xid="col23" class="col-sm-2"> 
              <label xid="fPersonCountLable" class="control-label" bind-text=" $model.dCarUseApply.label(&quot;fPersonCount&quot;)"/> 
            </div>  
            <div xid="col24" class="col-sm-4"> 
              <input xid="fApplyDate" class="form-control" component="$UI/system/components/justep/input/input"
                bind-ref="dCarUseApply.ref('fPersonCount')"/> 
            </div> 
          </div>  
          <div xid="formGroup3" class="form-group"> 
            <div xid="col31" class="col-sm-2"> 
              <label xid="fDestinationLable" class="control-label" bind-text=" $model.dCarUseApply.label(&quot;fDestination&quot;)"/> 
            </div>  
            <div xid="col32" class="col-sm-4"> 
              <input class="form-control" component="$UI/system/components/justep/input/input"
                bind-ref="dCarUseApply.ref('fDestination')"/> 
            </div>  
            <div xid="col33" class="col-sm-2"> 
              <label xid="fTelephoneLable" class="control-label" bind-text=" $model.dCarUseApply.label(&quot;fTelephone&quot;)"/> 
            </div>  
            <div xid="col34" class="col-sm-4"> 
              <input xid="fDestination" class="form-control" component="$UI/system/components/justep/input/input"
                bind-ref="dCarUseApply.ref('fTelephone')"/> 
            </div> 
          </div>  
          <div xid="formGroup4" class="form-group"> 
            <div xid="col41" class="col-sm-2"> 
              <label xid="fBeginTimeLable" class="control-label" bind-text=" $model.dCarUseApply.label(&quot;fBeginTime&quot;)"/> 
            </div>  
            <div xid="col42" class="col-sm-4"> 
              <input class="form-control" component="$UI/system/components/justep/input/input"
                bind-ref="dCarUseApply.ref('fBeginTime')"/> 
            </div>  
            <div xid="col43" class="col-sm-2"> 
              <label xid="fEndTimeLable" class="control-label" bind-text=" $model.dCarUseApply.label(&quot;fEndTime&quot;)"/> 
            </div>  
            <div xid="col44" class="col-sm-4"> 
              <input xid="fBeginTime" class="form-control" component="$UI/system/components/justep/input/input"
                bind-ref="dCarUseApply.ref('fEndTime')"/> 
            </div> 
          </div>  
          <div xid="formGroup5" class="form-group"> 
            <div xid="col53" class="col-sm-2"> 
              <label xid="fApplyReasonLable" class="control-label" bind-text=" $model.dCarUseApply.label(&quot;fApplyReason&quot;)"/> 
            </div>  
            <div xid="col54" class="col-sm-10"> 
              <textarea component="$UI/system/components/justep/textarea/textarea"
                class="form-control" xid="textarea1" bind-ref="dCarUseApply.ref('fApplyReason')"/> 
            </div> 
          </div>  
          <div xid="formGroup6" class="form-group"> 
            <div xid="col61" class="col-sm-2"> 
              <label xid="fDriveCircuitLa" class="control-label" bind-text=" $model.dCarUseApply.label(&quot;fDriveCircuit&quot;)"/> 
            </div>  
            <div xid="col62" class="col-sm-10"> 
              <textarea component="$UI/system/components/justep/textarea/textarea"
                class="form-control" xid="textarea2" bind-ref="dCarUseApply.ref('fDriveCircuit')"/> 
            </div> 
          </div>  
          <div xid="formGroup7" class="form-group"> 
            <div xid="col71" class="col-sm-2"> 
              <label xid="fRemarkL" class="control-label" bind-text="dCarUseApply.label('fRemark')"/> 
            </div>  
            <div xid="col72" class="col-sm-10"> 
              <textarea component="$UI/system/components/justep/textarea/textarea"
                class="form-control" xid="textarea3" bind-ref="dCarUseApply.ref('fRemark')"/> 
            </div> 
          </div> 
        </div> 
      </div> 
    <div class="x-panel-bottom" xid="bottom1" height="42">
   <a class="btn btn-link btn-only-label x-dialog-button" component="$UI/system/components/justep/button/button" label="取    消" onClick="cancelBtnClick" style="margin-left:30px;width:80px;" xid="cancelBtn">
    <i xid="i41"></i>
    <span xid="span41">取 消</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button" label="确定" xid="OKBtn" onClick="okBtnClick">
    <i xid="i2"></i>
    <span xid="span2">确定</span></a> </div></div> 
  </div> 
</div>
