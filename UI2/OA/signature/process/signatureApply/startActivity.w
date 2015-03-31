<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:369px;top:9px;">
    <div component="$UI/system/components/justep/data/bizData" xid="dSignature"
      concept="OA_SL_Signature" autoNew="true">
      <reader xid="default1" action="/OA/signature/logic/action/querySLSignatureAction"/>  
      <writer xid="default2" action="/OA/signature/logic/action/saveSLSignatureAction"/>  
      <creator xid="default3" action="/OA/signature/logic/action/createSLSignatureAction"/>
    <rule xid="rule1">
   <col name="fNO" xid="ruleCol1">
    <readonly xid="readonly1">
     <expr xid="default6">true</expr></readonly> </col> 
   <col name="fSake" xid="ruleCol2">
    <required xid="required1">
     <expr xid="default10">true</expr>
     <message xid="default11">请填写事由</message></required> </col> 
   <col name="fIndianName" xid="ruleCol3">
    <required xid="required2">
     <expr xid="default12">true</expr>
     <message xid="default13">印管人不能为空</message></required> </col> 
   <col name="fSignatureTypeName" xid="ruleCol4">
    <required xid="required3">
     <expr xid="default14">true</expr>
     <message xid="default15">请选择印章</message></required> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dType"
      concept="OA_Pub_BaseCode" autoLoad="true">
      <reader xid="default4" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>
    </div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="selectData" idColumn="value"><column label="显示" name="lable" type="String" xid="default7"></column>
  <column label="值" name="value" type="Integer" xid="default8"></column>
  <data xid="default9">[{&quot;lable&quot;:&quot;是&quot;,&quot;value&quot;:1},{&quot;lable&quot;:&quot;否&quot;,&quot;value&quot;:0}]</data></div></div>  
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="mainBar"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="advanceBtn" onClick="{operation:'process.advance'}"> 
        <i xid="i2"/>  
        <span xid="span2">流转</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="saveBtn" onClick="{operation:'dSignature.save'}" label="保存"> 
        <i xid="i1"/>  
        <span xid="span1">保存</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="更多" xid="moreBtn" onClick="{operation:'moreMenu.show'}"> 
        <i xid="i15"/>  
        <span xid="span15">更多</span> 
      </a> 
    </div>  
    <div xid="content">
      <h1 xid="title" class="text-center"><![CDATA[北京起步印章使用申请]]></h1>  
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
            <input component="$UI/system/components/justep/input/input" class="form-control" xid="input1" bind-ref="dSignature.ref('fNO')"></input></div>  
          <div class="col-sm-2" xid="col7">
            <label class="control-label" xid="controlLabel4"><![CDATA[申请部门]]></label>
          </div>  
          <div class="col-sm-4" xid="col8">
            <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC1" bind-ref="dSignature.ref('fApplyDeptID')" bind-labelRef="dSignature.ref('fApplyDeptName')"> 
              <div component="$UI/system/components/justep/data/bizData" autoLoad="false" xid="dOrg" limit="-1"/>  
              <option xid="option4"> 
                <columns xid="columns1"> 
                  <column name="sName" xid="column1" />
                </columns> 
              </option> 
            </div>
          </div>
        </div><div class="form-group" xid="formGroup3"> 
          <div class="col-sm-2" xid="col9">
            <label class="control-label" xid="controlLabel5"><![CDATA[申请人]]></label>
          </div>  
          <div class="col-sm-4" xid="col10">
            <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC2" bind-ref="dSignature.ref('fApplyPsnID')" bind-labelRef="dSignature.ref('fApplyPsnName')"> 
              <div component="$UI/system/components/justep/data/bizData" autoLoad="false" xid="dPsm" limit="-1"><treeOption xid="default5" rootFilter="1=1"></treeOption></div>  
              <option xid="option5"> 
                <columns xid="columns2"> 
                  <column name="sName" xid="column2" />
                </columns> 
              </option> 
            </div>
          </div>  
          <div class="col-sm-2" xid="col21">
   <label class="control-label" xid="controlLabel11">应用时间</label></div>
  <div class="col-sm-4" xid="col22">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input3" bind-ref="dSignature.ref('fUseDate')" format="yyyy-MM-dd hh:mm"></input></div></div><div class="form-group" xid="formGroup4"> 
          <div class="col-sm-2" xid="col13">
            <label class="control-label" xid="controlLabel7"><![CDATA[是否主管领导批示]]></label>
          </div>  
          <div class="col-sm-4" xid="col14">
            <span component="$UI/system/components/justep/select/radioGroup" class="x-radio-group" xid="iptIsHeadManger" bind-ref="dSignature.ref('fExtendStr1')" bind-itemset="selectData" bind-itemsetValue="ref('value')" bind-itemsetLabel="ref('lable')"></span></div>  
          <div class="col-sm-2" xid="col15">
            <label class="control-label" xid="controlLabel8"><![CDATA[申请日期]]></label>
          </div>  
          <div class="col-sm-4" xid="col16">
            <input component="$UI/system/components/justep/input/input" class="form-control" xid="iptApplyDate" bind-ref="dSignature.ref('fApplyDate')" format="yyyy-MM-dd hh:mm" />
          </div>
        </div><div class="form-group" xid="formGroup5"> 
          <div class="col-sm-2" xid="col17">
            <label class="control-label" xid="controlLabel9"><![CDATA[印章]]></label>
          </div>  
          <div class="col-sm-4" xid="col18">
            <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect3" bind-ref="dSignature.ref('fSignatureTypeID')" bind-labelRef="dSignature.ref('fSignatureTypeName')"> 
              <option xid="option3" data="dType" value="OA_Pub_BaseCode" label="fName" />
            </div>
          </div>  
          <div class="col-sm-2" xid="col19">
            <label class="control-label" xid="controlLabel10"><![CDATA[印管人]]></label>
          </div>  
          <div class="col-sm-4" xid="col20">
            <input component="$UI/system/components/justep/input/input" class="form-control" xid="input2" bind-ref="dSignature.ref('fIndianName')" />
          </div>
        </div><div class="form-group" xid="formGroup7">
   
   <div class="col-sm-2" xid="col11">
   <label class="control-label" xid="controlLabel6">用印文件及事由</label></div>
  <div class="col-sm-10" xid="col12">
   <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea1" bind-ref="dSignature.ref('fSake')"></textarea></div></div><div class="form-group" xid="formGroup1">
   
   
   <div class="col-sm-2" xid="col2">
    <label class="control-label" xid="controlLabel3">备注</label></div> 
   <div class="col-sm-10" xid="col4">
    <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea3" bind-ref="dSignature.ref('fRemark')"></textarea></div> </div>
  </div>  
          
          
          
        
      </div>  
      </div>
  </div>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="moreMenu" opacity="0" anchor="moreBtn" direction="left-bottom"> 
    <div class="x-popMenu-overlay" xid="moreMenuOverlay"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="moreContent"> 
      <li class="x-menu-item" xid="backItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="backBtn" onClick="{operation:'process.back'}"> 
          <i xid="i8"/>  
          <span xid="span6"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="suspendItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="suspendBtn" onClick="{operation:'process.suspend'}"> 
          <i xid="i3"/>  
          <span xid="span3"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="abortItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="abortBtn" onClick="{operation:'process.abort'}"> 
          <i xid="i4"/>  
          <span xid="span4"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="chartItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="chartBtn" onClick="{operation:'process.showChart'}"> 
          <i xid="i5"/>  
          <span xid="span5"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="recordItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="recordBtn" onClick="{operation:'process.processRecord'}"> 
          <i xid="i55"/>  
          <span xid="span55"/> 
        </a> 
      </li> 
    </ul> 
  </div>
  <div component="$UI/system/components/justep/process/process" xid="process"
    style="height:24px;width:24px;left:19px;top:101px;" data="dSignature"/>
</div>
