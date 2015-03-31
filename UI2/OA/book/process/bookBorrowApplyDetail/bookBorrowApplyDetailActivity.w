<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xui="http://www.justep.com/xui" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:424px;top:82px;"
    onModelConstructDone="modelModelConstructDone"> 
    <div autoLoad="false" autoNew="false" component="$UI/system/components/justep/data/bizData"
      concept="OA_BK_BookApplyM" limit="1" xid="dBookApplyM" xui:update-mode="merge"> 
      <reader action="/OA/book/logic/action/queryBKBookApplyMAction" xid="default1"/>  
      <writer action="/OA/book/logic/action/saveBKBookApplyMAction" xid="default2"/>  
      <creator action="/OA/book/logic/action/createBKBookApplyMAction" xid="default3"/>  
      <rule xid="rule11" xui:parent="dBookApplyM" xui:update-mode="insert"> 
        <readonly xid="readonly11"> 
          <expr xid="default11">$model.datareadOnly()</expr> 
        </readonly> 
      </rule> 
    </div>  
    <div autoLoad="true" component="$UI/system/components/justep/data/bizData"
      concept="OA_BK_BookApplyD" limit="-1" xid="dBookApplyD"> 
      <reader action="/OA/book/logic/action/queryBKBookApplyDAction" xid="default4"/>  
      <writer action="/OA/book/logic/action/saveBKBookApplyDAction" xid="default5"/>  
      <creator action="/OA/book/logic/action/createBookApplyDAction" xid="default6"/>  
      <calculateRelation relation="relation0" xid="calculateRelation1"/>  
      <master data="dBookApplyM" relation="fMasterID" xid="default18"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="taskData"
      concept="SA_Task"> 
      <reader xid="default7" action="/system/logic/action/queryTaskAction"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="dBookApplyM" style="height:24px;width:24px;left:0px;top:200px;" autoStart="false"
    autoSave="false" autoClose="false" autoFilter="false"/>  
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="mainBar"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="chartBtn" label="流程图" onClick="{operation:'process.showChart', args:{task: '$model.taskData.getCurrentRowID()'}}"> 
        <i xid="i2"/>  
        <span xid="span2">流程图</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="processRecBtn" label="流程记录" onClick="{operation:'process.processRecord', args:{task: '$model.taskData.getCurrentRowID()'}}"> 
        <i xid="i1"/>  
        <span xid="span1">流程记录</span> 
      </a> 
    </div>  
    <div xid="content"> 
      <h1 xid="title" class="text-center"><![CDATA[图书借阅申请]]></h1>  
      <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
        xid="form"> 
        <div class="form-group" xid="formGroup1"> 
          <div class="col-sm-2" xid="col1"> 
            <label class="control-label" xid="codeL"><![CDATA[申请编号]]></label> 
          </div>  
          <div class="col-sm-4" xid="col2"> 
            <output component="$UI/system/components/justep/output/output" class="form-control"
              xid="code" bind-ref="dBookApplyM.ref('fNO')"/> 
          </div>  
          <div class="col-sm-2" xid="col3"> 
            <label class="control-label" xid="orderDateL"><![CDATA[申请日期]]></label> 
          </div>  
          <div class="col-sm-4" xid="col4"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="orderDate" bind-ref="dBookApplyM.ref('fApplyDate')" format="yyyy-MM-dd"/> 
          </div> 
        </div>  
        <div class="form-group" xid="formGroup2"> 
          <div class="col-sm-2" xid="col5"> 
            <label class="control-label" xid="customerL"><![CDATA[申请部门]]></label> 
          </div>  
          <div class="col-sm-4" xid="col6"> 
            <output component="$UI/system/components/justep/output/output" class="form-control"
              bind-ref="dBookApplyM.ref('fApplyDeptName')" xid="output2"/> 
          </div>  
          <div class="col-sm-2" xid="col7"> 
            <label class="control-label" xid="reportL">申请人</label> 
          </div>  
          <div class="col-sm-4" xid="col8"> 
            <output component="$UI/system/components/justep/output/output" class="form-control"
              bind-ref="dBookApplyM.ref('fApplyPsnName')" xid="report"/> 
          </div> 
        </div>  
        <div class="form-group" xid="formGroup4"> 
          <div class="col-sm-2" xid="col13"> 
            <label class="control-label" xid="shippedDateL"><![CDATA[预计借阅时间]]></label> 
          </div>  
          <div class="col-sm-4" xid="col14"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              bind-ref="dBookApplyM.ref('fIntendStartDate')" xid="shippedDate"/> 
          </div>  
          <div class="col-sm-2" xid="col15"> 
            <label class="control-label" xid="requiredDateL"><![CDATA[预计归还时间]]></label> 
          </div>  
          <div class="col-sm-4" xid="col16"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              bind-ref="dBookApplyM.ref('fIntendEndDate')" xid="requiredDate"/> 
          </div> 
        </div>  
        <div class="form-group" xid="formGroup5"> 
          <div class="col-sm-2" xid="col17"> 
            <label class="control-label" xid="totalAmtL"><![CDATA[备注]]></label> 
          </div>  
          <div class="col-sm-10" xid="col18"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              bind-ref="dBookApplyM.ref('fRemark')" xid="totalAmt" style="height:85px;"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/controlGroup/controlGroup"
          class="x-control-group" title="图书信息" xid="productGroup" collapsible="true"> 
          <div class="x-control-group-title" xid="productTitle"> 
            <span xid="span7">title</span> 
          </div>  
          <div xid="productContent"> 
            <div component="$UI/system/components/justep/dataTables/dataTables"
              flexibleWidth="true" class="table  table-hover table-striped" xid="detailTable"
              data="dBookApplyD" pagingType="simple" rowActiveClass="active" showRowNumber="true"> 
              <columns xid="columns1"> 
                <column name="fBooksNumber" xid="column7"/>  
                <column name="fBooksName" xid="column8"/>  
                <column name="fBooksTypeName" xid="column9"/>  
                <column name="fAuthor" xid="column11"/>  
                <column name="fBookConcern" xid="column10"/>  
                <column name="fPrice" xid="column14"/>  
                <column name="fPageNum" xid="column12"/>  
                <column name="fRemark" xid="column13"/> 
              </columns> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
