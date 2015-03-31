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
	if(this.getMainData().getCount() === 0)return ;
		var row = {userdata: {recordState: mainData.getRowState(mainData.getCurrentRow())}};
		$.each(mainData.defCols, function(col) {
			row[col] = mainData.val(col);
		});
		this.comp("showDetailInfo").open({data : row});
	};

	Model.prototype.modelLoad = function(event) {
		var data = this.getMainData();
		var date = new Date();
		var date1 = justep.Date.toString(date, "yyyy-MM-dd");
		date.setDate(date.getDate() + 31);
		var date2 = justep.Date.toString(date, "yyyy-MM-dd");
		data.setFilter("reminderFilter1", "fValidityDate > stringToDate('" + date1 + "')");
		data.setFilter("reminderFilter2", "fNextExamDate < stringToDate('" + date2 + "')");
		data.refreshData();
	};
	Model.prototype.getMainData = function() {
		return this.comp("mainData");
	}

	return Model;
});