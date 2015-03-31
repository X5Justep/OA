<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dLicenseView"
      concept="OA_LS_LicenseView" autoLoad="true"> 
      <reader xid="default1" action="/OA/license/logic/action/queryLSLicenseViewAction"/>  
      <writer xid="default2" action="/OA/license/logic/action/saveLSLicenseViewAction"/>  
      <creator xid="default3" action="/OA/license/logic/action/createLSLicenseViewAction"/>  
      <calculateRelation relation="recNo" xid="calculateRelation1"/>  
      <rule xid="rule1"> 
        <col name="fRemark" xid="ruleCol1"> 
          <readonly xid="readonly1"> 
            <expr xid="default4">js:true</expr> 
          </readonly> 
        </col> 
      </rule> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="基本信息" xid="controlGroup1"> 
        <div class="x-control-group-title" xid="controlGroupTitle1"> 
          <span xid="span3"><![CDATA[基本信息]]></span> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
          xid="vLicenseView">
          <div class="form-group" xid="formGroup1"> 
            <div class="col-sm-2" xid="col1">
              <label>单据号</label>
            </div>  
            <div class="col-sm-10" xid="col2"><div component="$UI/system/components/justep/output/output" class="x-output" xid="output9" bind-ref="dLicenseView.ref('fNO')"></div></div> 
          </div>  
          <div class="form-group" xid="formGroup2"> 
            <div class="col-sm-2" xid="col5">
              <label>证照名称</label>
            </div>  
            <div class="col-sm-4" xid="col6">
              <div component="$UI/system/components/justep/output/output" class="x-output"
                xid="output1" bind-ref="dLicenseView.ref('fLicenseName')"/>
            </div>  
            <div class="col-sm-2" xid="col7">
              <label>状态</label>
            </div>  
            <div class="col-sm-4" xid="col8">
              <div component="$UI/system/components/justep/output/output" class="x-output"
                xid="output2" bind-ref="dLicenseView.ref('fUseStatusName')"/>
            </div>
          </div>  
          <div class="form-group" xid="formGroup3"> 
            <div class="col-sm-2" xid="col9">
              <label>证照号</label>
            </div>  
            <div class="col-sm-4" xid="col10">
              <div component="$UI/system/components/justep/output/output" class="x-output"
                xid="output3" bind-ref="dLicenseView.ref('fLicenseNo')"/>
            </div>  
            <div class="col-sm-2" xid="col11">
              <label>编号</label>
            </div>  
            <div class="col-sm-4" xid="col12">
              <div component="$UI/system/components/justep/output/output" class="x-output"
                xid="output4" bind-ref="dLicenseView.ref('fSerialNumber')"/>
            </div>
          </div>  
          <div class="form-group" xid="formGroup4"> 
            <div class="col-sm-2" xid="col13">
              <label>提交岗位</label>
            </div>  
            <div class="col-sm-4" xid="col14">
              <div component="$UI/system/components/justep/output/output" class="x-output"
                xid="output5" bind-ref="dLicenseView.ref('fCreatePosName')"/>
            </div>  
            <div class="col-sm-2" xid="col15">
              <label>提交部门</label>
            </div>  
            <div class="col-sm-4" xid="col16">
              <div component="$UI/system/components/justep/output/output" class="x-output"
                xid="output6" bind-ref="dLicenseView.ref('fCreateDeptName')"/>
            </div>
          </div>  
          <div class="form-group" xid="formGroup5"> 
            <div class="col-sm-2" xid="col17">
              <label>使用说明</label>
            </div>  
            <div class="col-sm-10" xid="col18">
              <textarea component="$UI/system/components/justep/textarea/textarea"
                class="form-control" xid="textarea1" bind-ref="dLicenseView.ref('fRemark')"/>
            </div> 
          </div>  
          <div class="form-group" xid="formGroup6"> 
            <div class="col-sm-2" xid="col21">
              <label>提交人</label>
            </div>  
            <div class="col-sm-4" xid="col22">
              <div component="$UI/system/components/justep/output/output" class="x-output"
                xid="output7" bind-ref="dLicenseView.ref('fCreatePsnName')"/>
            </div>  
            <div class="col-sm-2" xid="col23">
              <label>提交时间</label>
            </div>  
            <div class="col-sm-4" xid="col24">
              <div component="$UI/system/components/justep/output/output" class="x-output"
                xid="output8" bind-ref="dLicenseView.ref('fCreateTime')"/>
            </div>
          </div>
        </div> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
        label="取消" xid="cancelBtn" onClick="{&quot;operation&quot;:&quot;wReceiver.windowCancel&quot;}"> 
        <i xid="i2"/>  
        <span xid="span2">取消</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button"
        label="归还" xid="OKBtn" onClick="OKBtnClick"> 
        <i xid="i1"/>  
        <span xid="span1">归还</span> 
      </a> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link x-dialog-button" xid="button1" onClick="{operation:'dLicenseView.refresh'}">
   <i xid="i3"></i>
   <span xid="span4">刷新</span></a></div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="wReceiver" style="left:443px;top:568px;" onReceive="wReceiverReceive"/> 
</div>
