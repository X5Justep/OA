define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	

	Model.prototype.orgFilterFilter = function(event){
		this.orgCondition = event.source.selectedValue.get();
	};

	Model.prototype.statusSelectUpdateValue = function(event){
	    debugger;
	    var data = this.comp("dBookApplyM");
		this.comp("dBookApplyM").refreshData();
		
		var data = this.comp("dBookApplyM");
		var dStatusSelect = this.comp("conditionData");
		var status = event.source.value;
		
		if(status=="" || status == null){
			//dStatusSelect.setValue("status", "bsEditing,bsExecuting");
			//dStatusSelect.setValue("statusName", "编辑中,处理中");
			data.filters.setFilter("statefilter", " 1=1 ");
		}else{
			status = status.replace(/\,/g, "','" ); 
			data.filters.setFilter("statefilter", "OA_BK_BookApplyM.fBizState in('"+status+"') ");
		}
		data.refreshData();
	
	
	};

	Model.prototype.maindataTablesRowDblClick = function(event){
		var row = this.comp("dBookApplyM").getCurrentRow();
		if (!row) {
			return;
		}
		this.openBookApplyDetail(row.getID());
	};
	
    Model.prototype.openBookApplyDetail = function(id){
    	var ctx = this.getContext();
        
    	var process = ctx.getCurrentProcess();
    	var activity = ctx.getCurrentActivity();
    	var operator = "view";
    	var url = "$UI/OA/book/process/bookBorrowApplyDetail/bookBorrowApplyDetailActivity.w?process="
    		+ process +"&activity=" + activity + "&operator=" + operator + "&id=" + id;
    	justep.Portal.openWindow(url,{title:"图书借阅申请详细"});
    	
    };

	Model.prototype.modelModelConstructDone = function(event){
	
		var data = this.comp("dBookApplyM");
		data.filters.setFilter("statefilter", "OA_BK_BookApplyM.fBizState in ('bsEditing','bsExecuting','bsFinished','bsAborted','bsSuspend')");
		data.refreshData();
	};

	return Model;
});