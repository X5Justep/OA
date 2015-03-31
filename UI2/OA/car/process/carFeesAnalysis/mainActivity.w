<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:49px;top:262px;"> 
    <div component="$UI/system/components/justep/reportData/reportData" xid="d1"> 
      <source> 
     </source> 
    </div> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dTemp" idColumn="year"><column label="年" name="year" type="Integer" xid="default1"></column>
  <column label="起始月" name="month1" type="Integer" xid="default2"></column>
  <column label="结束月" name="month2" type="Integer" xid="default3"></column>
  <data xid="default4">[{&quot;year&quot;:{&quot;value&quot;:&quot;&quot;},&quot;month1&quot;:{&quot;value&quot;:&quot;&quot;}}]</data>
  <rule xid="rule2">
   <col name="year" xid="ruleCol1">
    <required xid="required1">
     <expr xid="default14">true</expr>
     <message xid="default15"></message></required> </col> 
   <col name="month1" xid="ruleCol2">
    <required xid="required2">
     <expr xid="default16">true</expr>
     <message xid="default17"></message></required> </col> 
   <col name="month2" xid="ruleCol3">
    <required xid="required3">
     <expr xid="default18">true</expr>
     <message xid="default19"></message></required> </col> </rule></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dMonth1" idColumn="value"><column label="月的显示" name="label" type="Integer" xid="default5"></column>
  <column label="月的值" name="value" type="Integer" xid="default6"></column>
  <data xid="default7">[{&quot;label&quot;:1,&quot;value&quot;:1},{&quot;label&quot;:2,&quot;value&quot;:2},{&quot;label&quot;:3,&quot;value&quot;:3},{&quot;label&quot;:4,&quot;value&quot;:4},{&quot;label&quot;:5,&quot;value&quot;:5},{&quot;label&quot;:6,&quot;value&quot;:6},{&quot;label&quot;:7,&quot;value&quot;:7},{&quot;label&quot;:8,&quot;value&quot;:8},{&quot;label&quot;:9,&quot;value&quot;:9},{&quot;label&quot;:10,&quot;value&quot;:10},{&quot;label&quot;:11,&quot;value&quot;:11},{&quot;label&quot;:12,&quot;value&quot;:12}]</data></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dMonth2" idColumn="value">
   <column label="月的显示" name="label" type="Integer" xid="default8"></column>
   <column label="月的值" name="value" type="Integer" xid="default9"></column>
   <data xid="default11">[{&quot;label&quot;:1,&quot;value&quot;:1},{&quot;label&quot;:2,&quot;value&quot;:2},{&quot;label&quot;:3,&quot;value&quot;:3},{&quot;label&quot;:4,&quot;value&quot;:4},{&quot;label&quot;:5,&quot;value&quot;:5},{&quot;label&quot;:6,&quot;value&quot;:6},{&quot;label&quot;:7,&quot;value&quot;:7},{&quot;label&quot;:8,&quot;value&quot;:8},{&quot;label&quot;:9,&quot;value&quot;:9},{&quot;label&quot;:10,&quot;value&quot;:10},{&quot;label&quot;:11,&quot;value&quot;:11},{&quot;label&quot;:12,&quot;value&quot;:12}]</data></div></div>  
  <div xid="view"> 
    <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row2">
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col12"><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report.pageSetup'}" xid="button1"> 
        <i xid="i1" />  
        <span xid="span1" /> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report.preview'}" xid="button2"> 
        <i xid="i2" />  
        <span xid="span2" /> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report.print'}" xid="button3"> 
        <i xid="i3" />  
        <span xid="span3" /> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report.exportPDF'}" xid="button4"> 
        <i xid="i4" />  
        <span xid="span4" /> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report.exportWord'}" xid="button5"> 
        <i xid="i5" />  
        <span xid="span5" /> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report.exportExcel'}" xid="button6"> 
        <i xid="i6" />  
        <span xid="span6" /> 
      </a> 
    </div></div>
   <div class="col col-xs-12 col-sm-12 col-md-6 col-lg-6" xid="col13"><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
   <div class="col col-xs-1" xid="col5"><label class="control-label" xid="controlLabel1"><![CDATA[年]]></label></div>
   <div class="col col-xs-2" xid="col6"><input component="$UI/system/components/justep/input/input" class="form-control" xid="iYear" bind-ref="dTemp.ref('year')"></input></div>
   <div class="col col-xs-2" xid="col7"><label class="control-label" xid="controlLabel2"><![CDATA[月范围]]></label></div>
  <div class="col col-xs-2" xid="col8"><select component="$UI/system/components/justep/select/select" class="form-control" xid="sltMonth1" bind-ref="dTemp.ref('month1')" bind-labelRef="dTemp.ref('month1')" bind-options="dMonth1" bind-optionsValue="value" bind-optionsLabel="label"></select></div>
  <div class="col col-xs-1" xid="col9"><label class="control-label" xid="controlLabel3"><![CDATA[---]]></label></div>
  <div class="col col-xs-2" xid="col10"><select component="$UI/system/components/justep/select/select" class="form-control" xid="sltMonth2" bind-ref="dTemp.ref('month2')" bind-labelRef="dTemp.ref('month2')" bind-options="dMonth2" bind-optionsValue="value" bind-optionsLabel="label"></select></div>
  <div class="col col-xs-2" xid="col11"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="bSearch" icon="icon-android-search" onClick="bSearchClick">
   <i xid="i8" class="icon-android-search"></i>
   <span xid="span8"></span></a></div></div></div>
   </div>  
    <div component="$UI/system/components/justep/report/report" src="crossReport.xml"
      reportName="report" autoLoad="false" dataList="" class="x-report x-scroll-h"
      xid="report" style="height:100%;width:100%;"/> 
  </div> 
</div>