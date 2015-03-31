<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:615px;top:247px;"
    onModelConstructDone="modelModelConstructDone"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dBookInfo"
      concept="OA_BK_BookInfo" autoLoad="false" onValueChanged="dBookInfoValueChanged" onSaveCommit="dBookInfoSaveCommit"> 
      <reader xid="default1" action="/OA/book/logic/action/queryBKBookInfoAction"/>  
      <writer xid="default2" action="/OA/book/logic/action/saveBKBookInfoAction"/>  
      <creator xid="default3" action="/OA/book/logic/action/createBKBookInfoAction"/> 
    <rule xid="rule1">
   <readonly xid="readonly1">
    <expr xid="default5">$model.readOnly()</expr></readonly> </rule></div> 
  <div component="$UI/system/components/justep/data/bizData" xid="dBookKind" concept="OA_Pub_BaseCode"><reader xid="default4" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"></reader>
  <filter name="filter0" xid="filter1"><![CDATA[OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='图书类型']]></filter></div></div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
    xid="mainBar"> 
    <a component="$UI/system/components/justep/button/button" label=" 新建"
      class="btn btn-link btn-icon-left" icon="icon-plus" xid="newBtn" onClick="{operation:'dBookInfo.new'}" bind-visible=" $model.btnvisible()"> 
      <i class="icon-plus" xid="i2"/>  
      <span xid="span2">新建</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="保存" xid="saveBtn" onClick="{operation:'dBookInfo.save'}" bind-visible=" $model.btnvisible()"> 
      <i xid="i6"/>  
      <span xid="span4">保存</span> 
    </a> 
  </div>  
  <div xid="content"> 
    <table component="$UI/system/components/bootstrap/table/table" xid="table2"
      class="table table-bordered"> 
      <tbody xid="tbody2"> 
        <tr xid="tr4"> 
          <td xid="td5"> 
            <div xid="div5" style="width: 100%; height: 100%;" class="container-fluid"> 
              <div component="$UI/system/components/bootstrap/row/row" class="row"
                xid="row5"> 
                <div class="col col-xs-6" xid="col6"> 
                  <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label20" xid="labelInput2"> 
                    <label class="x-label" xid="label2" bind-text="dBookInfo.label('fBooksNumber')"/>  
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control input-sm x-edit" xid="input2" bind-ref="dBookInfo.ref('fBooksNumber')"/> 
                  </div> 
                </div>  
                <div class="col col-xs-6" xid="col7"> 
                  <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label20" xid="labelInput3"> 
                    <label class="x-label" xid="label3" bind-text="dBookInfo.label('fBooksName')"/>  
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control input-sm x-edit" xid="input3" bind-ref="dBookInfo.ref('fBooksName')"/> 
                  </div> 
                </div> 
              </div>  
              <div component="$UI/system/components/bootstrap/row/row" class="row"
                xid="row2"> 
                <div class="col col-xs-6" xid="col8"> 
                  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelSelect1">
   <label class="x-label" xid="label4" bind-text="dBookInfo.label('fBooksTypeName')"></label>
   <select component="$UI/system/components/justep/select/select" class="form-control x-edit" xid="select1" bind-ref="dBookInfo.ref('fBooksTypeID')" bind-labelRef="dBookInfo.ref('fBooksTypeName')" bind-options="dBookKind" bind-optionsValue="OA_Pub_BaseCode" bind-optionsLabel="fName"></select></div></div>  
                <div class="col col-xs-6" xid="col9"> 
                  <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label20" xid="labelInput5"> 
                    <label class="x-label" xid="label5" bind-text="dBookInfo.label('fLoanName')"/>  
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control input-sm x-edit" xid="input5" bind-ref="dBookInfo.ref('fLoanName')"/> 
                  </div> 
                </div> 
              </div>  
              <div component="$UI/system/components/bootstrap/row/row" class="row"
                xid="row9"> 
                <div class="col col-xs-6" xid="col20"> 
                  <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label20" xid="labelInput15"> 
                    <label class="x-label" xid="label15" bind-text="dBookInfo.label('fBooksNo')"/>  
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control input-sm x-edit" xid="input15" bind-ref="dBookInfo.ref('fBooksNo')"/> 
                  </div> 
                </div>  
                <div class="col col-xs-6" xid="col19"> 
                  <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label20" xid="labelInput14"> 
                    <label class="x-label" xid="label14" bind-text="dBookInfo.label('fAuthor')"/>  
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control input-sm x-edit" xid="input14" bind-ref="dBookInfo.ref('fAuthor')"/> 
                  </div> 
                </div> 
              </div>  
              <div component="$UI/system/components/bootstrap/row/row" class="row"
                xid="row3"> 
                <div class="col col-xs-6" xid="col5"> 
                  <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label20" xid="labelInput6"> 
                    <label class="x-label" xid="label6" bind-text="dBookInfo.label('fFormat')"/>  
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control input-sm x-edit" xid="input6" bind-ref="dBookInfo.ref('fFormat')"/> 
                  </div> 
                </div>  
                <div class="col col-xs-6" xid="col3"> 
                  <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label20" xid="labelInput7"> 
                    <label class="x-label" xid="label7" bind-text="dBookInfo.label('fBookConcern')"/>  
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control input-sm x-edit" xid="input7" bind-ref="dBookInfo.ref('fBookConcern')"/> 
                  </div> 
                </div> 
              </div>  
              <div component="$UI/system/components/bootstrap/row/row" class="row"
                xid="row8"> 
                <div class="col col-xs-6" xid="col11"> 
                  <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label20" xid="labelInput8"> 
                    <label class="x-label" xid="label8" bind-text="dBookInfo.label('fEditionOrder')"/>  
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control input-sm x-edit" xid="input8" bind-ref="dBookInfo.ref('fEditionOrder')"/> 
                  </div> 
                </div>  
                <div class="col col-xs-6" xid="col10"> 
                  <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label20" xid="labelInput11"> 
                    <label class="x-label" xid="label10" bind-text="dBookInfo.label('fPageNum')"/>  
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control input-sm x-edit" xid="input10" bind-ref="dBookInfo.ref('fPageNum')"/> 
                  </div> 
                </div> 
              </div>  
              <div component="$UI/system/components/bootstrap/row/row" class="row"
                xid="row6"> 
                <div class="col col-xs-6" xid="col13"> 
                  <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label20" xid="labelInput10"> 
                    <label class="x-label" xid="label11" bind-text="dBookInfo.label('fPrice')"/>  
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control input-sm x-edit" xid="input11" bind-ref="dBookInfo.ref('fPrice')"/> 
                  </div> 
                </div>  
                <div class="col col-xs-6" xid="col12"> 
                  <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label20" xid="labelInput9"> 
                    <label class="x-label" xid="label9" bind-text="dBookInfo.label('fBuyDate')"/>  
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control input-sm x-edit" xid="input9" bind-ref="dBookInfo.ref('fBuyDate')"/> 
                  </div> 
                </div> 
              </div>  
              <div component="$UI/system/components/bootstrap/row/row" class="row"
                xid="row0"> 
                <div class="col col-xs-12" xid="col4"> 
                  <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label10" xid="labelInput19"> 
                    <label class="x-label" xid="label9">附属物品</label>  
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control input-sm x-edit" xid="input19" bind-ref="dBookInfo.ref('fPertainGoods')"/> 
                  </div> 
                </div> 
              </div>  
              <div component="$UI/system/components/bootstrap/row/row" class="row"
                xid="row10"> 
                <div class="col col-xs-6" xid="col21"> 
                  <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label20" xid="labelInput16"> 
                    <label class="x-label" xid="label16" bind-text="dBookInfo.label('fLoanReadDeptName')"/>  
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control input-sm x-edit" xid="input16" bind-ref="dBookInfo.ref('fLoanReadDeptName')"/> 
                  </div> 
                </div>  
                <div class="col col-xs-6" xid="col22"> 
                  <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label20" xid="labelInput17"> 
                    <label class="x-label" xid="label17" bind-text="dBookInfo.label('fLoanReadPerName')"/>  
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control input-sm x-edit" xid="input17" bind-ref="dBookInfo.ref('fLoanReadPerName')"/> 
                  </div> 
                </div> 
              </div>  
              <div component="$UI/system/components/bootstrap/row/row" class="row"
                xid="row11"> 
                <div class="col col-xs-12" xid="col16"> 
                  <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label10" xid="labelInput20"> 
                    <label class="x-label" xid="label20" bind-text="dBookInfo.label('fCatalog')"/>  
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control input-sm x-edit" xid="input20" bind-ref="dBookInfo.ref('fCatalog')"/> 
                  </div> 
                </div> 
              </div>  
              <div component="$UI/system/components/bootstrap/row/row" class="row"
                xid="row12"> 
                <div class="col col-xs-12" xid="col17"> 
                  <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label10" xid="labelInput1"> 
                    <label class="x-label" xid="label1" bind-text="dBookInfo.label('fBriefIntro')"/>  
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control input-sm x-edit" xid="input1" bind-ref="dBookInfo.ref('fBriefIntro')"/> 
                  </div> 
                </div> 
              </div>  
              <div component="$UI/system/components/bootstrap/row/row" class="row"
                xid="row7"> 
                <div class="col col-xs-6" xid="col14"> 
                  <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label20" xid="labelInput12"> 
                    <label class="x-label" xid="label12" bind-text="dBookInfo.label('fCreatePsnName')"/>  
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control input-sm x-edit" xid="input13" bind-ref="dBookInfo.ref('fCreatePsnName')"/>
                  </div> 
                </div>  
                <div class="col col-xs-6" xid="col15"> 
                  <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label20" xid="labelInput13"> 
                    <label class="x-label" xid="label13" bind-text="dBookInfo.label('fCreateTime')"/>  
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control input-sm x-edit" xid="input18" bind-ref="dBookInfo.ref('fCreateTime')"/>
                  </div> 
                </div> 
              </div>
            </div> 
          </td>  
          <td xid="td7" style="width: 250px;"> 
            <div class="x-blob" component="$UI/system/components/justep/blob/blobImage"
              style="width:100%;height:auto;" xid="blobImage1" bind-ref="dBookInfo.ref('fPhoto')"
              blobConcept="OA_BK_BookInfo" blobRelation="fPhoto" limitSize="1m"> 
              <div class="x-blob-bar" xid="div1"> 
                <i class="x-blob-edit icon-compose" xid="i3"/>  
                <i class="x-blob-del icon-close-round" xid="i4"/> 
              </div>  
              <img class="x-blob-img x-autofill" xid="image1" style="border:dashed thin #C0C0C0;"/> 
            </div> 
          </td> 
        </tr> 
      </tbody> 
    </table> 
  </div> 
</div>
