define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.windowDialogReceive = function(event){
		var mainData = this.comp("mainData");
		if (event.data.action === "new") {
			var id = event.data.row[mainData.idColumn];
			this.comp('mainData').loadData({
				rows : [ event.data.row ]
			}, true);
			mainData.to(id);
		} else {
			$.each(mainData.defCols, function(col) {
				if (event.data.row[col]) {
					mainData.setValue(col, event.data.row[col]);
				}
			});
		}
	};

	Model.prototype.editBtnClick = function(event){
		var mainData = this.comp("mainData");
		var row = {
			userdata : {
				recordState : mainData.getRowState(mainData.getCurrentRow())
			}
		};
		$.each(mainData.defCols, function(col) {
			row[col] = mainData.val(col);
		});
		var options = {
			row : row
		};
		this.comp("windowDialog").open({
			data : options
		});
	};

	Model.prototype.dataSaveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};

	Model.prototype.addBtn = function(event){
		var masterID = this.comp("mainData").getCurrentRowID();
		var options = {
			action : "new",
			masterID : masterID,
		};
		this.comp("windowDialog").open({
			data : options
		});
	};

	return Model;
});