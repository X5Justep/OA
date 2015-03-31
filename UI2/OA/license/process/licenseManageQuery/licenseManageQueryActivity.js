define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.saveCommit = function(event) {
		justep.Util.hint("保存成功！", {
			type : 'success',
			parent : this.getRootNode()
		});
	};

	Model.prototype.mainGridRowDblClick = function(event) {
		this.comp("showDetailInfo").open()
	};


	Model.prototype.getMainData = function() {
		return this.comp("mainData");
	}

	return Model;
});