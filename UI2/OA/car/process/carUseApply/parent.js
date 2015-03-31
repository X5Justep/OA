define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Model = function(){
		this.callParent();
	};

	Model.prototype.modelModelConstructDone = function(event) {
		var data = this.comp("dCarUseApply");
		var sData1 = this.getContext().getProcessData1();
		var sData = this.comp("dCarUseArrange");
		if (sData1 == null || sData1 == undefined || sData1 == '') {
			data.newData();
		} else {
			data.filters.setFilter("filter", "OA_CA_CarUseApply = '" + sData1
					+ "'");
			data.refreshData();
			sData.refreshData();

			if (this.getContext().getCurrentActivity() == "carArrangeActivity") {
				if (data.getValue("fIsArrange") == "0") {
					sData.newData();
					data.setValue("fIsArrange", "1");
				} else {
					sData.refreshData();
				}
			}
		}

	};

	Model.prototype.dlgSelectCarsReceive = function(event){
		debugger;
		var dCarUseArrange = this.comp("dCarUseArrange");
		if (event.data.action === "new") {
			var id = event.data.row[dCarUseArrange.idColumn];
			this.comp('dCarUseArrange').loadData({
				rows : [ event.data.row ]
			}, true);
			dCarUseArrange.to(id);
		} else if(event.data.action === "no"){
			return;
		}else {
			$.each(dCarUseArrange.defCols, function(col) {
				if (event.data.row[col]) {
					dCarUseArrange.setValue(col, event.data.row[col]);
				}
			});
		}
	};

	return Model;
});