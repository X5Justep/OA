define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var oaCommon = require("$UI/OA/common/js/oaCommon");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.modelModelConstructDone = function(event){
	   debugger;
	   
		var openPortalOperator = this.getContext().getRequestParameter("openPortalOperator");
		var id = this.getContext().getRequestParameter("id");
		var data = this.comp('dBookInfo');
		if (openPortalOperator == "new") {
			data.newData();
		} else {
			data.filters.setFilter("bookFilter", "OA_BK_BookInfo='" + id + "'");
			data.refreshData();
		}
	};



	Model.prototype.dBookInfoValueChanged = function(event){
	    debugger;
		if (event.col == "fBooksTypeID") {
		    debugger;
			var data = this.comp('dBookInfo');
			var kindData = this.comp('dBookKind');
			var row = kindData.getCurrentRow();
			var fcode = row.val("fCode");
		
			var code =  this.createNextSeqString(fcode, "0000");//
			var bookrow = data.getCurrentRow();
			bookrow.val("fBooksNumber", code);
		}
	};

   Model.prototype.createNextSeqString = function(key, format) {
				
		var bh = "";
		var params = new biz.Request.ActionParam();
		params.setString("key", key);
		params.setString("format", format);
				
		var self = this;
		biz.Request.sendBizRequest({
				"context" : self.getContext(),
				"action" : "createNextSeqStringAction",
				"parameters" : params, 
				"callback" : function(data) {
					    
					data.ignoreError = false;
					if (data.state) {
						bh = data.response;
					}else{
						   alert("编号生成失败");
					}
				}
			});
		return bh;
	};

	Model.prototype.dBookInfoSaveCommit = function(event){
	   debugger;
	   //获取父窗体？
		var caller = null;
		var callerName = this.getContext().getRequestParameter("callerName");
		if (callerName && (callerName != "")) {
			var frames = window.parent.frames;
			for ( var i = 0; i < frames.length; i++) {
				if (frames[i].name == callerName) {
					caller = frames[i];
					break;
				}
			}
		}
		if (caller) {
			if (caller.dataChangeCallBackFun) {
				var data = this.comp("dBookInfo");
				var rowid = data.getCurrentRowID()
				
				caller.dataChangeCallBackFun(rowid);
			}
		}
	};

    Model.prototype.readOnly = function(){
	    var openPortalOperator = this.getContext().getRequestParameter("openPortalOperator");
		return openPortalOperator == "view";
	};
    
    Model.prototype.btnvisible = function(){
	    var openPortalOperator = this.getContext().getRequestParameter("openPortalOperator");
		return openPortalOperator == "new";
	};
	
	return Model;
});