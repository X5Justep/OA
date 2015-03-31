define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.windowDialogReceive = function(event){
		var dCarUseApplyQuery = this.comp("dCarUseApplyQuery");
		if (event.data.action === "new") {
			var id = event.data.row[dCarUseApplyQuery.idColumn];
			this.comp('dCarUseApplyQuery').loadData({
				rows : [ event.data.row ]
			}, true);
			dCarUseApplyQuery.to(id);
		} else {
			$.each(dCarUseApplyQuery.defCols, function(col) {
				if (event.data.row[col]) {
					dCarUseApplyQuery.setValue(col, event.data.row[col]);
				}
			});
		}
	};

	Model.prototype.editBtnClick = function(event){
		var dCarUseApplyQuery = this.comp("dCarUseApplyQuery");
		var row = {
			userdata : {
				recordState : dCarUseApplyQuery.getRowState(dCarUseApplyQuery.getCurrentRow())
			}
		};
		$.each(dCarUseApplyQuery.defCols, function(col) {
			row[col] = dCarUseApplyQuery.val(col);
		});
		var options = {
			row : row
		};
		this.comp("windowDialog").open({
			data : options
		});
	};

	return Model;
});