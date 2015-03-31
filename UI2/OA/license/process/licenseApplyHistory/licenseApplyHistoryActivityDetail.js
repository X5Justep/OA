define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.OKBtnClick = function(event) {
		this.comp('wReceiver').windowEnsure();
	};

	Model.prototype.wReceiverReceive = function(event) {
		var data = this.comp("dLicenseView");
		data.loadData({
			rows : [ event.data ]
		}, false);
		data.first();
	};

	return Model;
});