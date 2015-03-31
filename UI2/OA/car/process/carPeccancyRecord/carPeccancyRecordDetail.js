define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.okBtnClick = function(event) {
		var mainData = this.comp("dCarPeccancyRecord");
		var options = {row: {userdata: {recordState: mainData.getRowState(mainData.getCurrentRow())}}, action: this.action};
		$.each(mainData.defCols, function(col){
			options.row[col] = mainData.val(col);
		});
		this.comp("windowReceiver").windowEnsure(options);
	};

	Model.prototype.cancelBtnClick = function(event) {
		this.comp("windowReceiver").windowCancel();
	};

	Model.prototype.windowReceiverReceive = function(event) {
		this.action = event.data.action;
		var mainData = this.comp('dCarPeccancyRecord');
		if (event.data.action === "new"){
			mainData.clear();
			mainData.newData();
		}else{
			mainData.loadData({rows: [event.data.row]}, false);
			mainData.first();
		}
	};

	Model.prototype.selectCarClick = function(event){
		this.comp("dlgSelectCars").open();
	};

	Model.prototype.dlgSelectCarsReceive = function(event){
		this.action = event.data.action;
		var dCarPeccancyRecord = this.comp('dCarPeccancyRecord');
		if (event.data.action === "new"){
			dCarPeccancyRecord.clear();
			dCarPeccancyRecord.newData();
		}else{
			/*dCarPeccancyRecord.loadData({rows: [event.data.row]}, false);
			dCarPeccancyRecord.first();*/
			var row = dCarPeccancyRecord.getCurrentRow();
			var newRow = event.data.row;
			dCarPeccancyRecord.setValue("fCode", newRow.fCode, row);
			dCarPeccancyRecord.setValue("fName", newRow.fName, row);
			dCarPeccancyRecord.setValue("fType", newRow.fType, row);
			dCarPeccancyRecord.setValue("fCarKindName", newRow.fCarKindName, row);
		}
	
	};

	return Model;
});