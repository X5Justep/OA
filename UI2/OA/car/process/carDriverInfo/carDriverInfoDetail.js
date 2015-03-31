define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.okBtnClick = function(event) {
		var mainData = this.comp("dCarDriverInfo");
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
		var mainData = this.comp('dCarDriverInfo');
		if (event.data.action === "new"){
			mainData.clear();
			mainData.newData();
		}else{
			mainData.loadData({rows: [event.data.row]}, false);
			mainData.first();
		}
	};

	Model.prototype.trgStartUseClick = function(event){
		debugger;
		try {
			var data = this.comp('dCarDriverInfo');
			var row = data.getCurrentRow();
			if (data.getValue("fUseStatus", row) == '1') {
				this.show("已经启用过!");
			} else {
				data.setValue("fUseStatus", '1', row);
				data.setValue("fUseStatusName", '启用', row);
				data.saveData();
			}
		} catch (e) {
			this.show("对不起,启用失败!");
		}
	
	};

	Model.prototype.trgStopUseClick = function(event){
		debugger;
		try {
			var data = this.comp('dCarDriverInfo');
			var row = data.getCurrentRow();
			if (data.getValue("fUseStatus", row) == '2') {
				this.show("已经停用了!");
			} else {
				data.setValue("fUseStatus", '2', row);
				data.setValue("fUseStatusName", '停用', row);
				data.saveData();
			}
		} catch(e) {
			this.show("对不起,停用失败!");
		}
	
	};

	Model.prototype.show = function(msg) {
		justep.Util.hint(msg, {
			type : 'success',
			parent : this.getRootNode()
		});
	};

	Model.prototype.dCarDriverInfoSaveCommit = function(event){
		justep.Util.hint("成功！", {
			type : 'success',
			parent : this.getRootNode()
		});
	
	
	};
	return Model;
});