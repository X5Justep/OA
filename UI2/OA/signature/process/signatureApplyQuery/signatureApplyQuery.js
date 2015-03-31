define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.dtSignatureRowDblClick = function(event){
		var mainData = this.comp("dSignature");
		var row = {userdata: {recordState: mainData.getRowState(mainData.getCurrentRow())}};
		$.each(mainData.defCols, function(col){
			row[col] = mainData.val(col);
		});
		var options = {action: "show", row: row};
		this.comp("windowDialog").open({data: options});
	
	};
	return Model;
});
