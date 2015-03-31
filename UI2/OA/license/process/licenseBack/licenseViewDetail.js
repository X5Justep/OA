define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var MessageDialog = require("$UI/system/components/justep/messageDialog/messageDialog");
	var Request = require("$UI/system/lib/base/request");
	
	var Model = function() {
		this.callParent();
	};

	Model.prototype.OKBtnClick = function(event) {
		this.licenseBack();
		this.comp('wReceiver').windowEnsure();
	};

	Model.prototype.wReceiverReceive = function(event) {
		var data = this.comp("dLicenseView");
		data.loadData({
			rows : [ event.data]
		}, false);
		data.first();
	};
	
	Model.prototype.licenseBack = function() {
			var options = {};
			var param = new Request.ActionParam();
			var licenseData = this.comp("dLicenseView");
			var fInfoID = licenseData.getValue('fInfoID');
			var fRecDate = justep.Date.toString(new Date(), 'yyyy-MM-dd');
			var fApplyID = licenseData.getValue('fApplyID');
			var fLicenseID = licenseData.getValue('fLicenseID');
			param.setString("fInfoID", fInfoID);
			param.setString("fRecDate", fRecDate);
			param.setString("fApplyID", fApplyID);
			param.setString("fLicenseID", fLicenseID);
			options.parameters = param;
			options.action = "LicenseBackAction";
			options.dataType = "json";
			options.context = this.getContext();
			options.callback = function(data) {
				if (data.state) {
					justep.Util.hint("归还成功！", options);
				} else {
					Request.errorMessage(licenseData, "归还证照失败", null, null)
				}
			}
			var r = Request.sendBizRequest(options);
	}
	
	return Model;
});