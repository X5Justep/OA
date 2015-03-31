define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.okBtnClick = function(event) {
		var dCarUseRecord = this.comp("dCarUseRecord");
		var options = {row: {userdata: {recordState: dCarUseRecord.getRowState(dCarUseRecord.getCurrentRow())}}, action: this.action};
		$.each(dCarUseRecord.defCols, function(col){
			options.row[col] = dCarUseRecord.val(col);
		});
		this.comp("windowReceiver").windowEnsure(options);
	};

	Model.prototype.cancelBtnClick = function(event) {
		this.comp("windowReceiver").windowCancel();
	};

	Model.prototype.windowReceiverReceive = function(event) {
		debugger;
		this.action = event.data.action;
		var dCarUseRecord = this.comp('dCarUseRecord');
		if (event.data.action === "new"){
			dCarUseRecord.clear();
			dCarUseRecord.newData();
		}else{
//			var dCarUseRecordFeeDetail = this.comp('dCarUseRecordFeeDetail');
			dCarUseRecord.loadData({rows: [event.data.row]}, false);
			dCarUseRecord.first();
			/*
			dCarUseRecordFeeDetail.loadData({rows: [event.data.row]}, false);
			dCarUseRecordFeeDetail.first();*/
		}
	};

	Model.prototype.selectCarUseApplyClick = function(event){
		this.comp("windowDialog").open();
	};

	Model.prototype.windowDialogReceive = function(event){
		this.action = event.data.action;
		var dCarUseRecord = this.comp('dCarUseRecord');
		if (event.data.action === "new"){
			dCarUseRecord.clear();
			dCarUseRecord.newData();
		}else{
			/*dCarUseRecord.loadData({rows: [event.data.row]}, false);
			dCarUseRecord.first();*/
			var row = dCarUseRecord.getCurrentRow();
			var newRow = event.data.row;
			dCarUseRecord.setValue("fNO", newRow.fNO, row);
			dCarUseRecord.setValue("fCode", newRow.fCode, row);
			dCarUseRecord.setValue("fName", newRow.fName, row);
			dCarUseRecord.setValue("fCarDriverName", newRow.fCarDriverName, row);
			dCarUseRecord.setValue("fApplyDeptName", newRow.fApplyDeptName, row);
			dCarUseRecord.setValue("fApplyDeptName", newRow.fApplyDeptName, row);
			dCarUseRecord.setValue("fBeginTime", newRow.fBeginTime, row);
			dCarUseRecord.setValue("fBeginTime", newRow.fBeginTime, row);
		}
	};

	return Model;
});