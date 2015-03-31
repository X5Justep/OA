define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.OKBtnClick = function(event) {
		var selection = this.comp("searchGrid").getCheckeds();
		this.comp('windowReceiver').windowEnsure(selection);
	};


	Model.prototype.windowReceiverReceive = function(event) {
		
	};

	Model.prototype.modelLoad = function(event) {
		var dialogData = this.comp("dialogData");
		dialogData.setFilter("dLicenseManageFilter","fUseStatus = 'Unused'");
		dialogData.refreshData();
	};

	return Model;
});