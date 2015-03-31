define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.sureBtnClick = function(event){
		var mainData = this.comp("mainData");
		var options = {row: {userdata: {recordState: mainData.getRowState(mainData.getCurrentRow())}}, action: this.action};
		$.each(mainData.defCols, function(col){
			options.row[col] = mainData.val(col);
		});
		this.comp("windowReceiver").windowEnsure(options);
	};

	Model.prototype.noBtnClick = function(event){
		this.comp("windowReceiver").windowCancel();
	};

	return Model;
});