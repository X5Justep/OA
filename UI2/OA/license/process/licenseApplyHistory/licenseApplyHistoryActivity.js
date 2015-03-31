define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.saveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};

	Model.prototype.grdLicenseViewRowDblClick = function(event){
		var dialog = this.comp("dlgLicenseApplyHistoryDetail");
		var mainData = this.getData();
		var row = {userdata: {recordState: mainData.getRowState(mainData.getCurrentRow())}};
		$.each(mainData.defCols, function(col) {
			row[col] = mainData.val(col);
		});
		dialog.open({data:row});
	};
	Model.prototype.getData = function() {
		return this.comp("mainData");
	}

	return Model;
});