define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.windowReceiverReceive = function(event){
		this.action = event.data.action;
		var data = this.comp("dSignature");
		data.loadData({rows: [event.data.row]}, false);
		data.first();
	};

	Model.prototype.chart2BtnClick = function(event){

		var process = this.comp("process");
		process.showChart(this.getContext().getProcess(), this.comp("dSignature").getCurrentRowID(), null);
	
	};

	return Model;
});