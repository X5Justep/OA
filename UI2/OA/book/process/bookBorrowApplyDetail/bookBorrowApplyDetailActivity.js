define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	
	var Model = function(){
		this.callParent();
	};

    Model.prototype.datareadOnly = function(){
	     var openPortalOperator = this.getContext().getRequestParameter("operator");
		return openPortalOperator == "view";
	};
	
	Model.prototype.modelModelConstructDone = function(event){
	   debugger;
	  
		var openPortalOperator = this.getContext().getRequestParameter("operator");
		var id = this.getContext().getRequestParameter("id");
		var data = this.comp('dBookApplyM');
		if (openPortalOperator == "new") {
			data.newData();
		} else {
			data.filters.setFilter("Filter0", "OA_BK_BookApplyM='" + id + "'");
			data.refreshData();
			
			var taskData = this.comp("taskData");
			taskData.filters.setFilter("Filter1", "SA_Task.sData1='" + id + "'");
			taskData.refreshData();
		}
	};
	
	return Model;
});