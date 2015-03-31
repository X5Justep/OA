define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.addBookBtnClick = function(event){
		//添加图书
		
		this.comp("bookDialog").open();
	};



	Model.prototype.modelModelConstructDone = function(event){
	   
	   var ctx = this.getContext();
	   
	   debugger;
		var data = this.comp('dBookApplyM');
		
		var sData1 = ctx.getData1();
		if (sData1 == null || sData1 == undefined || sData1 == "") {
			data.newData();
			
			var book = this.getContext().getRequestParameter("books");
			book = decodeURI(book);
			if(book != "" && book != null && book != undefined){
				var dData = this.comp('dBookApplyD');
				var books = book.split(";");
				for(var i=0; i<books.length-1; i++){
				   var bookIDs = books[i].split("|");
				    dData.newData({
				    	index : 0,
				    	defaultValues : [ {
				    		"fBookID" : bookIDs[0],
				    		"fBooksNumber" : bookIDs[1],
				    		"fBooksName" : bookIDs[2],
				    		"fBooksTypeName" : bookIDs[3],
				    		"fAuthor" : bookIDs[4],
				    		"fBookConcern" : bookIDs[5],
				    		"fPrice" : bookIDs[6],
				    		"fPageNum" : bookIDs[7]
				    	} ]
				    });
		
				}
			}
		} else {
		    
			data.filters.setFilter("flowFilter", "OA_BK_BookApplyM = '" + sData1 + "'");
			data.refreshData();
		}
	};
	Model.prototype.hasDetail = function(){
		return this.comp("dBookApplyD").getCount() > 0;
	};
	
	Model.prototype.readOnly = function(){
	   
		return this.comp("dBookApplyD").getCount() == 0;
	};
	
	Model.prototype.datareadOnly = function(){
	   
		return 1 == 1;
	};
	
	Model.prototype.bookDialogReceive = function(event){
         debugger;
         var mdata = this.comp("dBookApplyM");
         if(mdata.isChanged())
        	 mdata.saveData();
         var IDs = "";
         $.each(event.data, function(i, row) {
            if(IDs == "")
            	IDs = "'"+row.getID()+"'" ;
            else 	
            	IDs = IDs +",'"+row.getID()+"'";
			
		});
		var params = new biz.Request.ActionParam();
		params.setString("sBookID",IDs);
		params.setString("sMasterID",this.comp("dBookApplyM").getCurrentRowID());
		
		var self = this;
		biz.Request.sendBizRequest({
			"context" : self.getContext(),
			"action" : "AppendBookAction",
			"parameters" : params, 
			"callback" : function(data) {
			    debugger;
				data.ignoreError = false;
				if (data.state) {
					self.comp("dBookApplyD").refreshData();;
				}
			}
		});
	};
	

	
	Model.prototype.processBeforeAdvanceQuery = function(event){
	   debugger;
	   
		var bookData = this.comp('dBookApplyD');
		
		var len = bookData.getCount();
		var status = "0";
		if (len > 0) {
		
			var param = new biz.Request.ActionParam();
			var bookIDs = "";
			bookData.each(function(options) {
			    debugger;
				var row = options.row;	
				if (bookIDs == "") {
					  bookIDs ="'" + row.val("fBookID") + "'";
				 } else {
					  bookIDs = bookIDs + ",'" + row.val("fBookID") + "'";
				}
				
				
			});
		
			param.setString('bookIDs', bookIDs);
			param.setString('status', status);
			
			var str = this.sendBizRequestAction(param);
			var result = "";
			if (str == null || str == "") {
			} else {
				result = str.substring(0, str.lastIndexOf("、")) + "\n已申请,确定要申请!";
				if(!confirm(result)){
					event.cancel = true;
				}
			}
		} else {
			event.cancel = true;
			alert("图书信息为空,请填写!");
		}
	};
	
    Model.prototype.sendBizRequestAction= function(param) {
        var self = this;
        var str = "";
		biz.Request.sendBizRequest({
			"context" : self.getContext(),
			"action" : "isBookStatusAction",
			"parameters" : param, 
			"callback" : function(data) {
				data.ignoreError = false;
				if (data.state) {
				    debugger;
					//返回值
					str = data.response;
				}else{
					//alert("图书占用检查失败");
				}
			}
		});

    	return str;
}
    
	
	return Model;
});