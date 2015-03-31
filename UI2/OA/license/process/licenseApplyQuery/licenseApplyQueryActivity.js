define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.chartBtnClick = function(event){
		this.showChart();
	};

	Model.prototype.chart2BtnClick = function(event){
		this.chartBtnClick();
	};
	
	Model.prototype.showChart = function(){
		var process = this.comp("process");
		process.showChart(this.getContext().getProcess(), this.comp("mainData").getCurrentRowID(), null);
	};
	
	Model.prototype.listTablesRowDblClick = function(event){
		var tabs = this.comp("tabs");
		tabs.setActiveTab("detailLi");
	};
	
	return Model;
});