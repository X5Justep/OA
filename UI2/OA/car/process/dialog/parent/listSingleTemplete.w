<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:402px;top:123px;">
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      limit="10" autoLoad="true">
      <reader xid="default1"/>  
      <calculateRelation relation="carsNO" xid="calculateRelation1" type="Integer"/>  
      <rule xid="rule1"> 
        <col name="carsNO" xid="ruleCol1"> 
          <calculate xid="calculate1"> 
            <expr xid="default2"><![CDATA[$row.index()+1]]></expr>
          </calculate> 
        </col> 
      </rule>
    </div>
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="left:107px;top:15px;"/>
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1">
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
        xid="toolBar1">
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{'operation':'mainData.refresh'}" xid="button3"> 
          <i xid="i3"/>  
          <span xid="span3"/>
        </a>
      </div>
    </div>  
    <div class="x-panel-content" xid="content1">
      <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
        rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1"
        data="mainData"> 
        <columns xid="columns1"/>
      </div>  
      <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
        xid="pagerBar1" data="mainData"> 
        <div class="row" xid="div1"> 
          <div class="col-sm-3" xid="div2"> 
            <div class="x-pagerbar-length" xid="div3"> 
              <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
                class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
                <span xid="span4">显示</span>  
                <select component="$UI/system/components/justep/select/select"
                  class="form-control input-sm" xid="select1"> 
                  <option value="10" xid="default3">10</option>  
                  <option value="20" xid="default4">20</option>  
                  <option value="50" xid="default5">50</option>  
                  <option value="100" xid="default6">100</option>
                </select>  
                <span xid="span5">条</span>
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
    </div>  
    <div class="x-panel-bottom" xid="bottom1">
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
        xid="toolBar2" style="float:right;">
        <a component="$UI/system/components/justep/button/button" class="btn btn-default"
          label="确定" xid="sureBtn" onClick="sureBtnClick"> 
          <i xid="i1"/>  
          <span xid="span1">确定</span>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-default"
          label="取消" xid="noBtn" onClick="noBtnClick"> 
          <i xid="i2"/>  
          <span xid="span2">取消</span>
        </a>
      </div>
    </div>
  </div>
</div>
