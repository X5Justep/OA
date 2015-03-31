<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_LS_LicenseManage" orderBy=""
      columns=""> 
      <reader action="/OA/license/logic/action/queryLSLicenseManageAction"/>  
      <writer action="/OA/license/logic/action/saveLSLicenseManageAction"/>  
      <creator action="/OA/license/logic/action/createLSLicenseManageAction"/> 
    <rule xid="rule1">
   <col name="fRemark" xid="ruleCol1">
    <readonly xid="readonly1">
     <expr xid="default1">js:true</expr></readonly> </col> 
   <col name="fExamRec" xid="ruleCol2">
    <readonly xid="readonly2">
     <expr xid="default2">js:true</expr></readonly> </col> </rule></div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1"> 
      <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
        xid="form1"> 
        <div class="form-group"> 
          <div class="col-sm-2"> 
            <label class="control-label" bind-text="mainData.label('fLicenseName')"/> 
          </div>  
          <div class="col-sm-4"> 
            <span class="form-control" component="$UI/system/components/justep/output/output"
              data="mainData" bind-ref="mainData.ref('fLicenseName')"/> 
          </div>  
          <div class="col-sm-2"> 
            <label class="control-label" bind-text="mainData.label('fUseStatus')"/> 
          </div>  
          <div class="col-sm-4"> 
            <span class="form-control" component="$UI/system/components/justep/output/output"
              data="mainData" bind-ref="mainData.ref('fUseStatus')"/> 
          </div> 
        </div>  
        <div class="form-group"> 
          <div class="col-sm-2"> 
            <label class="control-label" bind-text="mainData.label('fLicenseNo')"/> 
          </div>  
          <div class="col-sm-4"> 
            <span class="form-control" component="$UI/system/components/justep/output/output"
              data="mainData" bind-ref="mainData.ref('fLicenseNo')"/> 
          </div>  
          <div class="col-sm-2"> 
            <label class="control-label" bind-text="mainData.label('fSerialNumber')"/> 
          </div>  
          <div class="col-sm-4"> 
            <span class="form-control" component="$UI/system/components/justep/output/output"
              data="mainData" bind-ref="mainData.ref('fSerialNumber')"/> 
          </div> 
        </div>  
        <div class="form-group"> 
          <div class="col-sm-2"> 
            <label class="control-label" bind-text="mainData.label('fReleaseDate')"/> 
          </div>  
          <div class="col-sm-4"> 
            <span class="form-control" component="$UI/system/components/justep/output/output"
              data="mainData" bind-ref="mainData.ref('fReleaseDate')"/> 
          </div>  
          <div class="col-sm-2"> 
            <label class="control-label" bind-text="mainData.label('fReleaseDeptName')"/> 
          </div>  
          <div class="col-sm-4"> 
            <span class="form-control" component="$UI/system/components/justep/output/output"
              data="mainData" bind-ref="mainData.ref('fReleaseDeptName')"/> 
          </div> 
        </div>  
        <div class="form-group"> 
          <div class="col-sm-2"> 
            <label class="control-label" bind-text="mainData.label('fValidityDate')"/> 
          </div>  
          <div class="col-sm-4"> 
            <span class="form-control" component="$UI/system/components/justep/output/output"
              data="mainData" bind-ref="mainData.ref('fValidityDate')"/> 
          </div>  
          <div class="col-sm-2"> 
            <label class="control-label" bind-text="mainData.label('fExamPeriod')"/> 
          </div>  
          <div class="col-sm-4"> 
            <span class="form-control" component="$UI/system/components/justep/output/output"
              data="mainData" bind-ref="mainData.ref('fExamPeriod')"/> 
          </div> 
        </div>  
        <div class="form-group"> 
          <div class="col-sm-2"> 
            <label class="control-label" bind-text="mainData.label('fExamWebsite')"/> 
          </div>  
          <div class="col-sm-4"> 
            <span class="form-control" component="$UI/system/components/justep/output/output"
              data="mainData" bind-ref="mainData.ref('fExamWebsite')"/> 
          </div>  
          <div class="col-sm-2"> 
            <label class="control-label" bind-text="mainData.label('fNextExamDate')"/> 
          </div>  
          <div class="col-sm-4"> 
            <span class="form-control" component="$UI/system/components/justep/output/output"
              data="mainData" bind-ref="mainData.ref('fNextExamDate')"/> 
          </div> 
        </div>  
        <div class="form-group"> 
          <div class="col-sm-2"> 
            <label class="control-label" bind-text="mainData.label('fExamDeptName')"/> 
          </div>  
          <div class="col-sm-4"> 
            <span class="form-control" component="$UI/system/components/justep/output/output"
              data="mainData" bind-ref="mainData.ref('fExamDeptName')"/> 
          </div>  
          <div class="col-sm-2"> 
            <label class="control-label" bind-text="mainData.label('fExamData')"/> 
          </div>  
          <div class="col-sm-4"> 
            <span class="form-control" component="$UI/system/components/justep/output/output"
              data="mainData" bind-ref="mainData.ref('fExamData')"/> 
          </div> 
        </div>  
        <div class="form-group"> 
          <div class="col-sm-2"> 
            <label class="control-label" bind-text="mainData.label('fWebSoft')"/> 
          </div>  
          <div class="col-sm-4"> 
            <span class="form-control" component="$UI/system/components/justep/output/output"
              data="mainData" bind-ref="mainData.ref('fWebSoft')"/> 
          </div>  
          <div class="col-sm-2"> 
            <label class="control-label" bind-text="mainData.label('fIsCopyName')"/> 
          </div>  
          <div class="col-sm-4"> 
            <span class="form-control" component="$UI/system/components/justep/output/output"
              data="mainData" bind-ref="mainData.ref('fIsCopyName')"/> 
          </div> 
        </div>  
        <div class="form-group"> 
          <div class="col-sm-2"> 
            <label class="control-label" bind-text="mainData.label('fSafekeepDeptName')"/> 
          </div>  
          <div class="col-sm-4"> 
            <span class="form-control" component="$UI/system/components/justep/output/output"
              data="mainData" bind-ref="mainData.ref('fSafekeepDeptName')"/> 
          </div>  
          <div class="col-sm-2"> 
            <label class="control-label" bind-text="mainData.label('fKeeperName')"/> 
          </div>  
          <div class="col-sm-4"> 
            <span class="form-control" component="$UI/system/components/justep/output/output"
              data="mainData" bind-ref="mainData.ref('fKeeperName')"/> 
          </div> 
        </div>  
        <div class="form-group"> 
          <div class="col-sm-2"> 
            <label class="control-label" bind-text="mainData.label('fExamRec')"/> 
          </div>  
          <div class="col-sm-10"> 
            <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea"
              data="mainData" bind-ref="mainData.ref('fExamRec')"/> 
          </div> 
        </div>  
        <div class="form-group"> 
          <div class="col-sm-2"> 
            <label class="control-label" bind-text="mainData.label('fRemark')"/> 
          </div>  
          <div class="col-sm-10">
            <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea"
              data="mainData" bind-ref="mainData.ref('fRemark')"/> 
          </div> 
        </div>  
        <div class="form-group"> 
          <div class="col-sm-2"> 
            <label class="control-label" bind-text="mainData.label('fOperatorName')"/> 
          </div>  
          <div class="col-sm-4"> 
            <span class="form-control" component="$UI/system/components/justep/output/output"
              data="mainData" bind-ref="mainData.ref('fOperatorName')"/> 
          </div>  
          <div class="col-sm-2"> 
            <label class="control-label" bind-text="mainData.label('fOperateDate')"/> 
          </div>  
          <div class="col-sm-4"> 
            <span class="form-control" component="$UI/system/components/justep/output/output"
              data="mainData" bind-ref="mainData.ref('fOperateDate')"/> 
          </div> 
        </div>  
        <div class="form-group"> 
          <div class="col-sm-2"> 
            <label class="control-label" bind-text="mainData.label('fAttachment')"/> 
          </div>  
          <div class="col-sm-10"> 
            <div component="$UI/system/components/justep/attachment/attachment" access="duud" xid="attachment1" bind-ref="mainData.ref('fAttachment')">
   <div class="x-attachment" xid="div1">
    <div class="x-attachment-content x-card-border" xid="div2">
     <div class="x-doc-process" xid="div3">
      <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="div4"></div></div> 
     <div data-bind="foreach:$attachmentItems" xid="div5">
      <div class="x-attachment-cell" xid="div6">
       <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()}" xid="div7">
        <a data-bind="visible:$model.$state.get() == 'remove'" class="x-remove-barget" xid="a1"></a></div> </div> </div> 
     <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)" xid="div8">
      <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256" xid="div9"></div></div> 
     <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0" xid="div10">
      <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024" xid="div11"></div></div> 
     <div style="clear:both;" xid="div12"></div></div> </div> </div></div> 
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
        label="确定" xid="OKBtn" onClick="OKBtnClick"> 
        <i xid="i1"/>  
        <span xid="span1">确定</span> 
      </a> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="wReceiver" style="left:443px;top:568px;"/> 
</div>
