<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:350px;top:185px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_LS_LicenseManage" limit="15"
      columns="" onSaveCommit="saveCommit"> 
      <reader action="/OA/license/logic/action/queryLSLicenseManageAction"/>  
      <writer action="/OA/license/logic/action/saveLSLicenseManageAction"/>  
      <creator action="/OA/license/logic/action/createLSLicenseManageAction"/>  
      <calculateRelation relation="calcCheckBox"/>  
      <rule xid="rule1"> 
        <col name="fLicenseNo" xid="ruleCol1"> 
          <required xid="required1"> 
            <expr xid="default8">js:true</expr>  
            <message xid="default9">证照号不能为空</message> 
          </required> 
        </col>  
        <col name="fSerialNumber" xid="ruleCol2"> 
          <required xid="required2"> 
            <expr xid="default10">js:true</expr>  
            <message xid="default11">编号不能为空</message> 
          </required> 
        </col>  
        <col name="fLicenseName" xid="ruleCol3"> 
          <required xid="required3"> 
            <expr xid="default12">js:true</expr>  
            <message xid="default13">证照名不能为空</message> 
          </required> 
        </col> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dTypeFilter" idColumn="typeName"> 
      <column label="typeName" name="typeName" type="String" xid="default5"/>  
      <column label="typeValue" name="typeValue" type="String" xid="default6"/>  
      <data xid="default7">[{"typeName":"闲置","typeValue":"Unused"},{"typeName":"借出","typeValue":"Lended"}]</data> 
    </div> 
  </div>  
  <!--   <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs">  -->  
  <!--     <ul class="nav nav-tabs" xid="navs">  -->  
  <!--       <li class="active" xid="nav-list">  -->  
  <!--         <a content="list" xid="tabItem1"><![CDATA[列表]]></a>  -->  
  <!--       </li>   -->  
  <!--       <li role="presentation" xid="nav-detail">  -->  
  <!--         <a content="detail" xid="tabItem2"><![CDATA[详细]]></a>  -->  
  <!--       </li>  -->  
  <!--     </ul>   -->  
  <!--     <div class="tab-content" xid="contents">  -->  
  <!--       <div class="tab-pane active" xid="list">  --> 
  <div xid="bar" component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"> 
    <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter1"
      filterData="mainData" class="pull-right" filterCols="fUseStatusName,fLicenseNo,fSerialNumber,fLicenseName,fReleaseDeptName,fReleaseDate,fValidityDate,fNextExamDate,fIsCopyName"> 
      <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
        bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
        xid="input4"/> 
    </div>  
    <a component="$UI/system/components/justep/button/button" label=" 新建"
      class="btn btn-link btn-icon-left" icon="icon-plus" onClick="addBtnClick"> 
      <i class="icon-plus"/>  
      <span>新建</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="button4" onClick="button2Click" label="删除" icon="icon-minus"> 
      <i xid="i7" class="icon-minus"/>  
      <span xid="span11">删除</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="button3" onClick='{"operation":"mainData.refresh"}'> 
      <i xid="i6"/>  
      <span xid="span10">刷新</span> 
    </a> 
  </div>  
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="false"
    class="table table-hover hidder-xs" xid="listData" data="mainData" rowActiveClass="active"
    showRowNumber="false" responsive="true" style="width:100%;"> 
    <columns xid="column"> 
      <column name="fUseStatusName" visible="false"/>  
      <column name="fLicenseNo"/>  
      <column name="fSerialNumber"/>  
      <column name="fLicenseName"/>  
      <column name="fReleaseDeptName"/>  
      <column name="fReleaseDate"/>  
      <column name="fValidityDate"/>  
      <column name="fNextExamDate"/>  
      <column name="fIsCopyName"/> 
    </columns> 
  </div>  
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
    xid="pageBar" data="mainData"> 
    <div class="row" xid="div1"> 
      <div class="col-sm-3" xid="div2"> 
        <div class="x-pagerbar-length" xid="div3"> 
          <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
            class="x-pagerlimitselect" xid="limitSelect1"> 
            <span xid="span2">显示</span>  
            <select component="$UI/system/components/justep/select/select" class="form-control input-sm"
              xid="select1"> 
              <option value="10" xid="default1">10</option>  
              <option value="20" xid="default2">20</option>  
              <option value="50" xid="default3">50</option>  
              <option value="100" xid="default4">100</option> 
            </select>  
            <span xid="span5">条</span> 
          </label> 
        </div> 
      </div>  
      <div class="col-sm-3" xid="div4"> 
        <div class="x-pagerbar-info" xid="div5">当前显示1-10条，共16条</div> 
      </div>  
      <div class="col-sm-6" xid="div6"> 
        <div class="x-pagerbar-pagination" xid="div7"> 
          <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
            xid="pagination1"> 
            <li class="prev" xid="li1"> 
              <a href="#" xid="a1"> 
                <span aria-hidden="true" xid="span6">«</span>  
                <span class="sr-only" xid="span7">Previous</span> 
              </a> 
            </li>  
            <li class="next" xid="li2"> 
              <a href="#" xid="a2"> 
                <span aria-hidden="true" xid="span8">»</span>  
                <span class="sr-only" xid="span9">Next</span> 
              </a> 
            </li> 
          </ul> 
        </div> 
      </div> 
    </div> 
  </div>  
  <!--       </div>   -->  
  <!--       <div class="tab-pane" xid="detail">  -->  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="详细信息" xid="controlGroup1" collapsible="true"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span13"><![CDATA[详细信息]]></span>
    </div>  
    <div xid="detailBar" component="$UI/system/components/justep/toolBar/toolBar"
      class="x-toolbar x-toolbar-spliter form-inline"> 
      <a component="$UI/system/components/justep/button/button" label="添加"
        class="btn btn-link btn-icon-left" icon="icon-plus" onClick="addBtnClick"
        xid="newBtn2"> 
        <i class="icon-plus" xid="i3"/>  
        <span xid="span1">添加</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" label=" 保存"
        class="btn btn-link btn-icon-left" onClick="{operation:'mainData.save'}" xid="saveBtn"> 
        <i/>  
        <span>保存</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="删除" xid="button2" icon="icon-minus" onClick="button2Click"> 
        <i xid="i2" class="icon-minus"/>  
        <span xid="label6">删除</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="button5" onClick='{"operation":"mainData.refresh"}'> 
        <i xid="i8"/>  
        <span xid="span12"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="preBtn" onClick='{"operation":"mainData.prevRow"}'> 
        <i xid="i4"/>  
        <span xid="span3"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="nextBtn" onClick='{"operation":"mainData.nextRow"}'> 
        <i xid="i5"/>  
        <span xid="span4"/> 
      </a> 
    </div>  
    <div class="container-fluid">
      <div xid="mainForm" class="form-horizontal" component="$UI/system/components/bootstrap/form/form"> 
        <div xid="formGroup1" class="form-group"> 
          <div xid="col11" class="col-sm-2"> 
            <label xid="fUseStatusL" class="control-label"><![CDATA[证照名称]]></label> 
          </div>  
          <div xid="col12" class="col-sm-2 oa-nopadding"> 
            <input xid="fUseStatus" class="form-control" component="$UI/system/components/justep/input/input"
              bind-ref="mainData.ref('fLicenseName')"/> 
          </div>  
          <div xid="col13" class="col-sm-2"> 
            <label xid="fUseStatusNameL" class="control-label"><![CDATA[状态]]></label> 
          </div>  
          <div xid="col14" class="col-sm-2 oa-nopadding"> 
            <input xid="fUseStatusName" class="form-control" component="$UI/system/components/justep/input/input"
              bind-ref="mainData.ref('fUseStatusName')"/> 
          </div>
          <div xid="col21" class="col-sm-2"> 
            <label xid="fLicenseNoL" class="control-label"><![CDATA[证照号]]></label> 
          </div>  
          <div xid="col22" class="col-sm-2 oa-nopadding"> 
            <input xid="fLicenseNo" class="form-control" component="$UI/system/components/justep/input/input"
              bind-ref="mainData.ref('fLicenseNo')"/> 
          </div> 
        </div>  
        <div xid="formGroup2" class="form-group"> 
          <div xid="col23" class="col-sm-2"> 
            <label xid="fSerialNumberL" class="control-label"><![CDATA[编号]]></label> 
          </div>  
          <div xid="col24" class="col-sm-2 oa-nopadding"> 
            <input xid="fSerialNumber" class="form-control" component="$UI/system/components/justep/input/input"
              bind-ref="mainData.ref('fSerialNumber')"/> 
          </div> 
     
          <div xid="col31" class="col-sm-2"> 
            <label xid="fLicenseNameL" class="control-label"><![CDATA[颁发日期]]></label> 
          </div>  
          <div xid="col32" class="col-sm-2 oa-nopadding"> 
            <input xid="fLicenseName" class="form-control" component="$UI/system/components/justep/input/input"
              bind-ref="mainData.ref('fReleaseDate')"/> 
          </div>  
          <div xid="col33" class="col-sm-2"> 
            <label xid="fReleaseDeptIDL" class="control-label"><![CDATA[颁发部门]]></label> 
          </div>  
          <div xid="col34" class="col-sm-2 oa-nopadding"> 
            <input xid="fReleaseDeptID" class="form-control" component="$UI/system/components/justep/input/input"
              bind-ref="mainData.ref('fReleaseDeptName')"/> 
          </div> 
        </div>  
        <div xid="formGroup4" class="form-group"> 
          <div xid="col41" class="col-sm-2"> 
            <label xid="fReleaseDeptNameL" class="control-label"><![CDATA[有效期]]></label> 
          </div>  
          <div xid="col42" class="col-sm-2 oa-nopadding"> 
            <input xid="fReleaseDeptName" class="form-control" component="$UI/system/components/justep/input/input"
              bind-ref="mainData.ref('fValidityDate')"/> 
          </div>  
          <div xid="col43" class="col-sm-2"> 
            <label xid="fReleaseDateL" class="control-label"><![CDATA[年检周期]]></label> 
          </div>  
          <div xid="col44" class="col-sm-2 oa-nopadding"> 
            <input xid="fReleaseDate" class="form-control" component="$UI/system/components/justep/input/input"
              bind-ref="mainData.ref('fReleaseDate')"/> 
          </div>
          <div xid="col51" class="col-sm-2"> 
            <label xid="fValidityDateL" class="control-label"><![CDATA[年检网址]]></label> 
          </div>  
          <div xid="col52" class="col-sm-2 oa-nopadding"> 
            <input xid="fValidityDate" class="form-control" component="$UI/system/components/justep/input/input"
              bind-ref="mainData.ref('fExamWebsite')"/> 
          </div> 
        </div>  
        <div xid="formGroup5" class="form-group"> 
          <div xid="col53" class="col-sm-2"> 
            <label xid="fExamPeriodL" class="control-label"><![CDATA[下次年检时间]]></label> 
          </div>  
          <div xid="col54" class="col-sm-2 oa-nopadding"> 
            <input xid="fExamPeriod" class="form-control" component="$UI/system/components/justep/input/input"
              bind-ref="mainData.ref('fNextExamDate')"/> 
          </div> 
          <div xid="col61" class="col-sm-2"> 
            <label xid="fExamWebsiteL" class="control-label"><![CDATA[年检部门]]></label> 
          </div>  
          <div xid="col62" class="col-sm-2 oa-nopadding"> 
            <input xid="fExamWebsite" class="form-control" component="$UI/system/components/justep/input/input"
              bind-ref="mainData.ref('fExamDeptName')"/> 
          </div>  
          <div xid="col63" class="col-sm-2"> 
            <label xid="fNextExamDateL" class="control-label"><![CDATA[年检材料]]></label> 
          </div>  
          <div xid="col64" class="col-sm-2 oa-nopadding"> 
            <input xid="fNextExamDate" class="form-control" component="$UI/system/components/justep/input/input"
              bind-ref="mainData.ref('fExamData')"/> 
          </div> 
        </div>  
        <div xid="formGroup7" class="form-group"> 
          <div xid="col71" class="col-sm-2"> 
            <label xid="fExamDeptNameL" class="control-label"><![CDATA[网上填报系统]]></label> 
          </div>  
          <div xid="col72" class="col-sm-2 oa-nopadding"> 
            <input xid="fExamDeptName" class="form-control" component="$UI/system/components/justep/input/input"
              bind-ref="mainData.ref('fWebSoft')"/> 
          </div>  
          <div xid="col73" class="col-sm-2"> 
            <label xid="fExamDataL" class="control-label"><![CDATA[正副本标识]]></label> 
          </div>  
          <div xid="col74" class="col-sm-2 oa-nopadding"> 
            <input xid="fExamData" class="form-control" component="$UI/system/components/justep/input/input"
              bind-ref="mainData.ref('fIsCopyName')"/> 
          </div> 
          <div xid="col81" class="col-sm-2"> 
            <label xid="fWebSoftL" class="control-label"><![CDATA[保管部门]]></label> 
          </div>  
          <div xid="col82" class="col-sm-2 oa-nopadding"> 
            <input xid="fWebSoft" class="form-control" component="$UI/system/components/justep/input/input"
              bind-ref="mainData.ref('fSafekeepDeptName')"/> 
          </div>
        </div>  
        <div xid="formGroup8" class="form-group"> 
          <div xid="col83" class="col-sm-2"> 
            <label xid="fSafekeepDeptNameL" class="control-label"><![CDATA[保管人]]></label> 
          </div>  
          <div xid="col84" class="col-sm-2 oa-nopadding"> 
            <input xid="fSafekeepDeptName" class="form-control" component="$UI/system/components/justep/input/input"
              bind-ref="mainData.ref('fKeeperName')"/> 
          </div> 

          <div xid="col91" class="col-sm-2"> 
            <label xid="fKeeperNameL" class="control-label"><![CDATA[录入人]]></label> 
          </div>  
          <div xid="col92" class="col-sm-2 oa-nopadding"> 
            <input xid="fKeeperName" class="form-control" component="$UI/system/components/justep/input/input"
              bind-ref="mainData.ref('fOperatorName')"/> 
          </div>  
          <div xid="col93" class="col-sm-2"> 
            <label xid="fOperateDateL" class="control-label"><![CDATA[录入日期]]></label> 
          </div>  
          <div xid="col94" class="col-sm-2 oa-nopadding"> 
            <input xid="fOperateDate" class="form-control" component="$UI/system/components/justep/input/input"
              bind-ref="mainData.ref('fOperateDate')"/> 
          </div> 
        </div>  
        <div xid="formGroup10" class="form-group"> 
          <div xid="col111" class="col-sm-2"> 
            <label xid="fOperateDateL" class="control-label"><![CDATA[年检记录]]></label> 
          </div>  
          <div xid="col112" class="col-sm-10 oa-nopadding"> 
            <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="fExamRec" bind-ref="mainData.ref('fExamRec')"></textarea></div> 
        </div> 
        <div xid="formGroup11" class="form-group"> 
          <div xid="col121" class="col-sm-2"> 
            <label xid="fOperateDateL" class="control-label"><![CDATA[备注]]></label> 
          </div>  
          <div xid="col122" class="col-sm-10 oa-nopadding"> 
            <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="fRemark" bind-ref="mainData.ref('fRemark')"></textarea></div> 
        </div> 
        <div class="form-group" xid="formGroup12"> 
          <div class="col-sm-2" xid="col1"> 
            <label xid="fAttachmentL" class="control-label"><![CDATA[附件]]></label> 
          </div>  
          <div class="col-sm-10 oa-nopadding" xid="col2"> 
            <div component="$UI/system/components/justep/attachment/attachment"
              access="duud" xid="attachmentPC1" bind-ref="mainData.ref('fAttachment')"> 
              <div class="x-attachment" xid="div8"> 
                <div class="x-attachment-content x-card-border" xid="div9"> 
                  <div class="x-doc-process" xid="div10"> 
                    <div class="progress-bar x-doc-process-bar" role="progressbar"
                      style="width:0%;" xid="div11"/> 
                  </div>  
                  <div data-bind="foreach:$attachmentItems" xid="div12"> 
                    <div class="x-attachment-cell" xid="div13"> 
                      <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()}"
                        xid="div14"> 
                        <a data-bind="visible:$model.$state.get() == 'remove'"
                          class="x-remove-barget" xid="a3"/> 
                      </div> 
                    </div> 
                  </div>  
                  <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                    xid="div15"> 
                    <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                      xid="div16"/> 
                  </div>  
                  <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                    xid="div17"> 
                    <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                      xid="div18"/> 
                  </div>  
                  <div style="clear:both;" xid="div19"/> 
                </div> 
              </div> 
            </div>  
            <!--               </div>  -->  
            <!--             </div>  -->  
            <!--           </div>  --> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>
</div>
