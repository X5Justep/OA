define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};
	
	Model.prototype.addBtnClick = function(event){
		var dlgLicenseInfo = this.comp("dlgLicenseInfo");
		dlgLicenseInfo.open();
	};

	Model.prototype.dlgLicenseInfoReceive = function(event){
		//返回数据
	};

	return Model;
});