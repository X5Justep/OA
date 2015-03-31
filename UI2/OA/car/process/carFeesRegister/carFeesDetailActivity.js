define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.trgCarClick = function(event){
		debugger;
		this.comp("dlgCarInfo").open();
	};


	Model.prototype.dlgCarInfoReceive = function(event){
	debugger;
		this.action = event.data.action;
		var dFees = this.comp('dFees');
		if (event.data.action === "new"){
			dFees.clear();
			dFees.newData();
		}else{
			var row = dFees.getCurrentRow();
			var newRow = event.data.row;
			dFees.setValue("fCarNO", newRow.fCode, row);
			dFees.setValue("fCarName", newRow.fName, row);
		}
	};

	Model.prototype.windowReceiverReceive = function(event){
		this.action = event.data.action;
		var dFees = this.comp('dFees');
		if (event.data.action === "new"){
			dFees.clear();
			dFees.newData();
		}else{
			dFees.loadData({rows: [event.data.row]}, false);
			dFees.first();
		}
	};

	Model.prototype.okBtnClick = function(event){
		var dFees = this.comp("dFees");
		var options = {row: {userdata: {recordState: dFees.getRowState(dFees.getCurrentRow())}}, action: this.action};
		$.each(dFees.defCols, function(col){
			options.row[col] = dFees.val(col);
		});
		this.comp("windowReceiver").windowEnsure(options);
	
	};

	Model.prototype.cancelBtnClick = function(event){
		this.comp("windowReceiver").windowCancel();
	};

	return Model;
});