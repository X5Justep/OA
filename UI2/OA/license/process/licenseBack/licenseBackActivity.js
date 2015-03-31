define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Request = require("$UI/system/lib/base/request");
	var MessageDialog = require("$UI/system/components/justep/messageDialog/messageDialog");
	var Model = function() {
		this.callParent();
	};
	Model.prototype.tbnBackClick = function(event) {
		this.licenseBack();
	};

	Model.prototype.grdLicenseViewRowDblClick = function(event) {
		var mainData = this.getData();
		if(mainData.getCount() === 0)return;
		var row = {userdata: {recordState: mainData.getRowState(mainData.getCurrentRow())}};
		$.each(mainData.defCols, function(col) {
			row[col] = mainData.val(col);
		});
		this.comp("dlgLicenseViewDetail").open({
			data : row
		});
	};

	Model.prototype.getData = function() {
		return this.comp("mainData");
	};
	Model.prototype.licenseBack = function() {
		if (!this.msg) {
			this.msg = new MessageDialog({
				parentNode : this.getParent().getRootNode(),
			})
		}
		this.msg.show({
			type : "OKCancel",
			message : "是否归还该证照",
			title : "提示"
		});
		var self = this;
		this.msg.on("onOK", function() {
			var options = {};
			var param = new Request.ActionParam();
			var licenseData = self.getData();
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
			options.context = self.getContext();
			options.callback = function(data) {
				if (data.state) {
					justep.Util.hint("归还成功！", options);
					self.getData().refreshData();
				} else {
					Request.errorMessage(licenseData, "归还证照失败", null, null)
				}
			}
			var r = Request.sendBizRequest(options);
		})
	}
	Model.prototype.modelLoad = function(event){
		this.getData().setFilter("licenseViewDataFilter1", "fApplyDStatus = 'Lended'");
		this.getData().setFilter("licenseViewDataFilter2", "fCreatePsnID = '" + this.getContext().getCurrentPersonID() + "'");
		this.getData().refreshData();
	};
	Model.prototype.dlgLicenseViewDetailReceive = function(event){
		this.getData().refreshData();
	};
	return Model;
});