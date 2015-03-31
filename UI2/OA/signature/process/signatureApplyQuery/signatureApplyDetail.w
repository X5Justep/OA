<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:259px;top:378px;">
    <div component="$UI/system/components/justep/data/bizData" xid="dSignature"
      concept="OA_SL_Signature" autoNew="false" limit="1" autoLoad="false">
      <reader xid="default1" action="/OA/signature/logic/action/querySLSignatureAction"/>  
      <writer xid="default2"/>  
      <creator xid="default3"/>
    <rule xid="rule1">
   <readonly xid="readonly1">
    <expr xid="default4">true</expr></readonly> 
   <col name="fNO" xid="ruleCol1">
    <readonly xid="readonly2">
     <expr xid="default5">true</expr></readonly> </col> </rule></div>  
    </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="chart2Btn" onClick="chart2BtnClick" label="流程图" icon="icon-image">
   <i xid="i9" class="icon-image"></i>
   <span xid="span9">流程图</span></a></div><div xid="view"> 
    <div xid="content">
      <h1 xid="title" class="text-center"><![CDATA[北京起步印章使用详情]]>
  </h1>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="申请信息" xid="controlGroup2"> 
        <div class="x-control-group-title" xid="controlGroupTitle2"> 
          <span xid="span4">title</span>
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form1"><div class="form-group" xid="formGroup2"> 
          <div class="col-sm-2" xid="col5">
            <label class="control-label" xid="controlLabel2"><![CDATA[NO:]]></label>
          </div>  
          <div class="col-sm-4" xid="col6">
            <div component="$UI/system/components/justep/output/output" class="form-control" xid="noOutput" bind-ref="dSignature.ref('fNO')"></div></div>  
          <div class="col-sm-2" xid="col7">
            <label class="control-label" xid="controlLabel4"><![CDATA[申请部门]]></label>
          </div>  
          <div class="col-sm-4" xid="col8">
            <div component="$UI/system/components/justep/output/output" class="form-control" xid="output2" bind-ref="dSignature.ref('fApplyDeptName')"></div></div>
        </div><div class="form-group" xid="formGroup3"> 
          <div class="col-sm-2" xid="col9">
            <label class="control-label" xid="controlLabel5"><![CDATA[申请人]]></label>
          </div>  
          <div class="col-sm-4" xid="col10">
            <div component="$UI/system/components/justep/output/output" class="form-control" xid="output3" bind-ref="dSignature.ref('fApplyPsnName')"></div></div>  
          <div class="col-sm-2" xid="col19">
   <label class="control-label" xid="controlLabel8">引用时间</label></div>
  <div class="col-sm-4" xid="col20">
   <div component="$UI/system/components/justep/output/output" class="form-control" xid="output7" bind-ref="dSignature.ref('fUseDate')" format="yyyy-MM-dd hh:mm"></div></div></div><div class="form-group" xid="formGroup4"> 
          <div class="col-sm-2" xid="col13">
            <label class="control-label" xid="controlLabel1">申请日期</label></div>  
          <div class="col-sm-4" xid="col14">
   <div component="$UI/system/components/justep/output/output" class="form-control" xid="output4" bind-ref="dSignature.ref('fApplyDate')" format="yyyy-MM-dd hh:mm"></div></div><div class="col-sm-2" xid="col15">
            <label class="control-label" xid="controlLabel3">印章</label></div>  
          <div class="col-sm-4" xid="col16">
            <div component="$UI/system/components/justep/output/output" class="form-control" xid="output5" bind-ref="dSignature.ref('fSignatureTypeName')"></div></div>
        </div><div class="form-group" xid="formGroup5"> 
          <div class="col-sm-2" xid="col17">
            <label class="control-label" xid="controlLabel7">印管人</label></div>  
          <div class="col-sm-4" xid="col18">
            <div component="$UI/system/components/justep/output/output" class="form-control" xid="output6" bind-ref="dSignature.ref('fIndianName')"></div></div>  
          </div><div class="form-group" xid="formGroup6"> 
          <div class="col-sm-2" xid="col21">
            <label class="control-label" xid="controlLabel9">备注</label></div>  
          <div class="col-sm-10" xid="col22">
            <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea3" bind-ref="dSignature.ref('fRemark')"></textarea></div>  
          </div>
  <div class="form-group" xid="formGroup1">
   
   <div class="col-sm-2" xid="col4">
   <label class="control-label" xid="controlLabel11">用印文件及事由</label></div>
  <div class="col-sm-10" xid="col3">
   <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea4" bind-ref="dSignature.ref('fSake')"></textarea></div></div></div>  
          
          
          
        
      </div>  
      </div>
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process" style="height:24px;width:24px;left:173px;top:108px;" data="dSignature"></div><span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver" onReceive="windowReceiverReceive"></span></div>
