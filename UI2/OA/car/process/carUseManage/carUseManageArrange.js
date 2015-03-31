define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	//返回列表
	Model.prototype.okBtnClick = function(event) {
		debugger;
		var dCarUseApply = this.comp("dCarUseApply");
		var dCarUseArrange = this.comp('dCarUseArrange');
		var options = {row: {userdata: {recordState: dCarUseApply.getRowState(dCarUseApply.getCurrentRow())}}, action: this.action};
		$.each(dCarUseApply.defCols, function(col){
			options.row[col] = dCarUseApply.val(col);
		});
		$.each(dCarUseArrange.defCols, function(col){
			options.row[col] = dCarUseArrange.val(col);
		});
		this.comp("windowReceiver").windowEnsure(options);
	};

	Model.prototype.cancelBtnClick = function(event) {
		this.comp("windowReceiver").windowCancel();
	};
	
	//接受列表页的数据
	Model.prototype.windowReceiverReceive = function(event) {
		debugger;
		this.action = event.data.action;
		var dCarUseApply = this.comp('dCarUseApply');
		if (event.data.action === "new"){
			dCarUseApply.clear();
			dCarUseApply.newData();
		}else{
			var dCarUseArrange = this.comp('dCarUseArrange');
			dCarUseApply.loadData({rows: [event.data.row]}, false);
			dCarUseApply.first();
			//这里暂且没有关联主表
			dCarUseArrange.loadData({rows: [event.data.row]}, false);
			dCarUseArrange.first();
			/*
			var id = event.data.row.fMasterID;
			dCarUseArrange.setFilter('filter1',"fMasterID='" + id + "'");
			dCarUseArrange.refreshData();*/
		}
	};

	//弹出
	Model.prototype.selectCarClick = function(event){
		this.comp("dlgSelectCars").open();
	};

	//接受我弹出页的数据
	Model.prototype.dlgSelectCarsReceive = function(event){
		
		this.action = event.data.action;
		var dCarUseArrange = this.comp('dCarUseArrange');
		if (event.data.action === "new"){
			dCarUseArrange.clear();
			dCarUseArrange.newData();
		}else{
			debugger;
			/*dCarUseArrange.loadData({rows: [event.data.row]}, false);
			dCarUseArrange.first();*/
			var row = dCarUseArrange.getCurrentRow();
			var newRow = event.data.row;
			dCarUseArrange.setValue("fCode", newRow.fCode, row);
			dCarUseArrange.setValue("fCarDriverName", newRow.fCarDriverName, row);
			dCarUseArrange.setValue("fName", newRow.fName, row);
			dCarUseArrange.setValue("fCarKindName", newRow.fCarKindName, row);
		}
	};





	return Model;
});