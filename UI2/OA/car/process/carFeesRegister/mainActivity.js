define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.dlgDetailReceive = function(event){
		var dFees = this.comp("dFees");
		if (event.data.action === "new") {
			var id = event.data.row[dFees.idColumn];
			this.comp('dFees').loadData({
				rows : [ event.data.row ]
			}, true);
			dFees.to(id);
		} else {
			$.each(dFees.defCols, function(col) {
				if (event.data.row[col]) {
					dFees.setValue(col, event.data.row[col]);
				}
			});
		}
	};

	Model.prototype.newBtnClick = function(event){
		var masterID = this.comp("dFees").getCurrentRowID();
		var options = {
			action : "new",
			masterID : masterID,
		};
		this.comp("dlgDetail").open({
			data : options
		});
	
	};

	Model.prototype.dFeesSaveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};

	Model.prototype.feesDTRowDblClick = function(event){
		var dFees = this.comp("dFees");
		var row = {
			userdata : {
				recordState : dFees.getRowState(dFees.getCurrentRow())
			}
		};
		$.each(dFees.defCols, function(col) {
			row[col] = dFees.val(col);
		});
		var options = {
			row : row
		};
		this.comp("dlgDetail").open({
			data : options
		});
	
	
	};

	return Model;
});