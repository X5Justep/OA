define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.okBtnClick = function(event) {
		var dCarUseApplyDetail = this.comp("dCarUseApplyDetail");
		var options = {row: {userdata: {recordState: dCarUseApplyDetail.getRowState(dCarUseApplyDetail.getCurrentRow())}}, action: this.action};
		$.each(dCarUseApplyDetail.defCols, function(col){
			options.row[col] = dCarUseApplyDetail.val(col);
		});
		this.comp("windowReceiver").windowEnsure(options);
	};

	Model.prototype.cancelBtnClick = function(event) {
		this.comp("windowReceiver").windowCancel();
	};

	Model.prototype.windowReceiverReceive = function(event) {
		this.action = event.data.action;
		var dCarUseApplyDetail = this.comp('dCarUseApplyDetail');
		var dCarUseArrangeDetail = this.comp('dCarUseArrangeDetail');
		if (event.data.action === "new"){
			dCarUseApplyDetail.clear();
			dCarUseApplyDetail.newData();
		}else{
			dCarUseApplyDetail.loadData({rows: [event.data.row]}, false);
			var id = event.data.row.OA_CA_CarUseApply.value.latestValue;
			dCarUseArrangeDetail.setFilter('filter1',"fMasterID='" + id + "'");
			dCarUseArrangeDetail.refreshData();
			dCarUseApplyDetail.first();
		}
	};

	Model.prototype.chart2BtnClick = function(event){
		var process = this.comp("process");
		process.showChart(this.getContext().getProcess(), this.comp("dCarUseApplyDetail").getCurrentRowID(), null);
	};

	return Model;
});