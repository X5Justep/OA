define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.windowDialogReceive = function(event){
		debugger;
		var dCarBasicInfo = this.comp("dCarBasicInfo");
		if (event.data.action === "new") {
			var id = event.data.row[dCarBasicInfo.idColumn];
			this.comp('dCarBasicInfo').loadData({
				rows : [ event.data.row ]
			}, true);
			dCarBasicInfo.to(id);
		} else {
			$.each(dCarBasicInfo.defCols, function(col) {
				if (event.data.row[col]) {
					dCarBasicInfo.setValue(col, event.data.row[col]);
				}
			});
		}
	};

	Model.prototype.editBtnClick = function(event){
	debugger;
		var dCarBasicInfo = this.comp("dCarBasicInfo");
		var row = {
			userdata : {
				recordState : dCarBasicInfo.getRowState(dCarBasicInfo.getCurrentRow())
			}
		};
		$.each(dCarBasicInfo.defCols, function(col) {
			row[col] = dCarBasicInfo.val(col);
		});
		var options = {
			row : row
		};
		this.comp("windowDialog").open({
			data : options
		});
	};

	Model.prototype.dataSaveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};

	Model.prototype.addBtn = function(event){
		var masterID = this.comp("dCarBasicInfo").getCurrentRowID();
		var options = {
			action : "new",
			masterID : masterID,
		};
		this.comp("windowDialog").open({
			data : options
		});
	};
	
/*	Model.prototype.dCarBasicInfoSaveCommit = function(event) {
		justep.Util.hint("成功！", {
			type : 'success',
			parent : this.getRootNode()
		});
	};*/

	Model.prototype.show = function(msg) {
		justep.Util.hint(msg, {
			type : 'success',
			parent : this.getRootNode()
		});
	};

	Model.prototype.trgStartUseClick = function(event) {
		try {
			var data = this.comp('dCarBasicInfo');
			var row = data.getCurrentRow();
			if (data.getValue("fUseStatus", row) == '1') {
				this.show("已经启用过!");
			} else {
				data.setValue("fUseStatus", '1', row);
				data.setValue("fUseStatusName", '启用', row);
				data.saveData();
			}
		} catch (e) {
			this.show("对不起,启用失败!");
		}
	};

	Model.prototype.trgAllUseClick = function(event) {
		try {
			var data = this.comp('dCarBasicInfo');
			
			 data.eachAll(function(param){
				var useFlag = param.row.val('fUseStatus');
				var row = param.row;
				if (useFlag == '2' || useFlag == '') {
					data.setValue("fUseStatus", '1', row);
					data.setValue("fUseStatusName", '启用', row);
				}
			 });
			data.saveData();
		} catch (e) {
			this.show("对不起,全部启用失败!");
		}
	};

	Model.prototype.trgStopUseClick = function(event) {
		try {
			var data = this.comp('dCarBasicInfo');
			var row = data.getCurrentRow();
			if (data.getValue("fUseStatus", row) == '2') {
				this.show("已经停用了!");
			} else {
				data.setValue("fUseStatus", '2', row);
				data.setValue("fUseStatusName", '停用', row);
				data.saveData();
			}
		} catch(e) {
			this.show("对不起,停用失败!");
		}
	};

	return Model;
});