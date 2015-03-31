define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.okBtnClick = function(event) {
		var dCarAccidentRecord = this.comp("dCarAccidentRecord");
		var options = {row: {userdata: {recordState: dCarAccidentRecord.getRowState(dCarAccidentRecord.getCurrentRow())}}, action: this.action};
		$.each(dCarAccidentRecord.defCols, function(col){
			options.row[col] = dCarAccidentRecord.val(col);
		});
		this.comp("windowReceiver").windowEnsure(options);
	};

	Model.prototype.cancelBtnClick = function(event) {
		this.comp("windowReceiver").windowCancel();
	};

	Model.prototype.windowReceiverReceive = function(event) {
		this.action = event.data.action;
		var dCarAccidentRecord = this.comp('dCarAccidentRecord');
		if (event.data.action === "new"){
			dCarAccidentRecord.clear();
			dCarAccidentRecord.newData();
		}else{
			dCarAccidentRecord.loadData({rows: [event.data.row]}, false);
			dCarAccidentRecord.first();
		}
	};

	Model.prototype.selectCarClick = function(event){
		this.comp("dlgSelectCars").open();
	};

	Model.prototype.dlgSelectCarsReceive = function(event){
		this.action = event.data.action;
		var dCarAccidentRecord = this.comp('dCarAccidentRecord');
		if (event.data.action === "new"){
			dCarAccidentRecord.clear();
			dCarAccidentRecord.newData();
		}else{
			
			/*dCarAccidentRecord.loadData({rows: [event.data.row]}, false);
			dCarAccidentRecord.first();*/
			
			var row = dCarAccidentRecord.getCurrentRow();
			var newRow = event.data.row;
			dCarAccidentRecord.setValue("fCode", newRow.fCode, row);
			dCarAccidentRecord.setValue("fName", newRow.fName, row);
			dCarAccidentRecord.setValue("fType", newRow.fType, row);
			dCarAccidentRecord.setValue("fCarKindName", newRow.fCarKindName, row);
		}
	
	};

	return Model;
});