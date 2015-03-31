<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:35px;top:443px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dPubBaseCode"
      concept="OA_Pub_BaseCode" autoLoad="true" orderBy="fSequence:asc" directDelete="false"
      onSaveCommit="dPubBaseCodeSaveCommit" limit="10"> 
      <reader xid="default1" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <writer xid="default2" action="/OA/common/logic/action/saveOA_Pub_BaseCodeAction"/>  
      <creator xid="default3" action="/OA/common/logic/action/createOA_Pub_BaseCodeAction"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter1"
    style="left:91px;top:270px;" filterData="dPubBaseCode" filterCols="fScope,fName,fDescription,fSequence,fUpdateTime"/>  
 
 	<div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
        xid="toolBar1"> 
        <div component="$UI/system/components/justep/smartFilter/smartFilter"
          xid="smartFilter1" filterData="dPubBaseCode" filterCols="fUseStatusName,fSequence,fCode,fName,fDescription"
          class="pull-right"> 
          <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
            bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
            xid="input1"/> 
        </div>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dPubBaseCode.new'}" xid="button3">
   <i xid="i3"></i>
   <span xid="span6"></span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dPubBaseCode.delete'}" xid="button2">
   <i xid="i2"></i>
   <span xid="span5"></span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dPubBaseCode.save'}" xid="button1">
   <i xid="i1"></i>
   <span xid="span1"></span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dPubBaseCode.refresh'}" xid="button4">
   <i xid="i4"></i>
   <span xid="span7"></span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          label="启用" xid="trgStartUse" icon="icon-ios7-play" onClick="trgStartUseClick"> 
          <i xid="i8" class="icon-ios7-play"/>  
          <span xid="span12">启用</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          label="全部启用" xid="trgAllUse" icon="icon-ios7-skipforward" onClick="trgAllUseClick"> 
          <i xid="i9" class="icon-ios7-skipforward"/>  
          <span xid="span13">全部启用</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          label="停用" xid="trgStopUse" icon="icon-ios7-pause" onClick="trgStopUseClick"> 
          <i xid="i10" class="icon-ios7-pause"/>  
          <span xid="span14">停用</span> 
        </a>  
        
  
  
  
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'bizFilter1.menu'}" xid="button5">
   <i xid="i5"></i>
   <span xid="span8"></span></a></div> 
 
 	      <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
        altRows="true" class="table table-hover table-striped" xid="grid1" data="dPubBaseCode"
        width="100%" height="auto" directEdit="true"> 
        <columns xid="columns1"> 
          <column name="fUseStatusName" xid="column5" label="启用状态"
            editable="false"> 
            <editor xid="editor1"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input1" bind-ref="ref('fUseStatusName')"/> 
            </editor> 
          </column>  
          <column name="fSequence" xid="column4" label="排序" editable="true"> 
            <editor xid="editor2"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input2" bind-ref="ref('fSequence')"/> 
            </editor> 
          </column>  
          <column name="fCode" xid="column1" label="编码" editable="true"> 
            <editor xid="editor3"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input3" bind-ref="ref('fCode')"/> 
            </editor> 
          </column>  
          <column name="fName" xid="column2" label="名称" editable="true"> 
            <editor xid="editor4"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input4" bind-ref="ref('fName')"/> 
            </editor> 
          </column>  
          <column name="fDescription" xid="column3" label="描述" editable="true"> 
            <editor xid="editor5"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input5" bind-ref="ref('fDescription')"/> 
            </editor> 
          </column> 
        </columns> 
      </div>  
      <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
        xid="pagerBar" data="dPubBaseCode"> 
        <div class="row" xid="div1"> 
          <div class="col-sm-3" xid="div2"> 
            <div class="x-pagerbar-length" xid="div3"> 
              <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
                class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
                <span xid="span2">显示</span>  
                <select component="$UI/system/components/justep/select/select"
                  class="form-control input-sm" xid="select1"> 
                  <option value="10" xid="default4">10</option>  
                  <option value="20" xid="default5">20</option>  
                  <option value="50" xid="default6">50</option>  
                  <option value="100" xid="default7">100</option>
                </select>  
                <span xid="span3">条</span>
              </label> 
            </div> 
          </div>  
          <div class="col-sm-3" xid="div4"> 
            <div class="x-pagerbar-info" xid="div5">当前显示0条，共0条</div>
          </div>  
          <div class="col-sm-6" xid="div6"> 
            <div class="x-pagerbar-pagination" xid="div7"> 
              <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
                xid="pagination1"> 
                <li class="prev" xid="li1"> 
                  <a href="#" xid="a1"> 
                    <span aria-hidden="true" xid="span4">«</span>  
                    <span class="sr-only" xid="span11">Previous</span>
                  </a> 
                </li>  
                <li class="next" xid="li2"> 
                  <a href="#" xid="a2"> 
                    <span aria-hidden="true" xid="span15">»</span>  
                    <span class="sr-only" xid="span16">Next</span>
                  </a> 
                </li> 
              </ul> 
            </div> 
          </div> 
        </div> 
      </div>
</div>
