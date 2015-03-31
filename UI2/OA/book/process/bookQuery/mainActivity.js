define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.maindataTablesRowDblClick = function(event){
		var row = this.comp("dBookInfo").getCurrentRow();
		if (!row) {
			return;
		}
		this.openBookDetail(row.getID());
	};
    
     Model.prototype.openBookDetail = function(id) {
        debugger;
        var ctx = this.getContext();
        
    	var process = ctx.getCurrentProcess();
    	var activity = ctx.getCurrentActivity();
    	
    	var url = "";
    	
    	var	openPortalOperator = "view";
    	url = "$UI/OA/book/process/bookDetail/bookDetailActivity.w?process="
				+ process + "&activity=" + activity + "&openPortalOperator="
				+ openPortalOperator + "&id=" + id+ "&callerName="
				+ window.name ;
  
    	justep.Portal.openWindow(url,{title:"图书详细信息"});
    };
    
	Model.prototype.btnApplyClick = function(event){
		this.selectBooks();
	};
	
	Model.prototype.selectBooks =function(){
	    var maindataTables = this.comp("maindataTables");
		if (maindataTables.getCheckeds().length == 0) {
			justep.Util.hint("请选择要借阅的图书！");
			return;
		}
		var self = this;
		var data = this.comp('dBookInfo');
		var books = "";
		var loaned = "";
		
		$.each(maindataTables.getCheckeds(), function(i, row) {
		       var id = row.getID();
		       var fLoanID = row.val("fLoanID");
			   if(fLoanID == "1"){
				   var fBooksNumber = row.val("fBooksNumber");
					var fBooksName = row.val("fBooksName");
					loaned = loaned + fBooksNumber + "--" + fBooksName +";";
			   }else{
			      debugger;
			       //(row.val("fNumber") > 0) ? row.val("fNumber") - 1 : 0
				   var fBooksNumber = row.val("fBooksNumber") != undefined ? row.val("fBooksNumber") : "";
				   var fBooksName = row.val("fBooksName") != undefined ? row.val("fBooksName") : "";
				   var fBooksTypeName = row.val("fBooksTypeName") != undefined ? row.val("fBooksTypeName") : "";
				   var fAuthor = row.val("fAuthor") != undefined ? row.val("fAuthor") : "";
				   var fBookConcern = row.val("fBookConcern") != undefined ? row.val("fBookConcern") : "";
			       var fPrice = row.val("fPrice") != undefined ? row.val("fPrice") : "";
				   var fPageNum = row.val("fPageNum") != undefined ? row.val("fPageNum") : "";
				   books = books + id + "|" +fBooksNumber + "|" + fBooksName + "|" + fBooksTypeName + "|"
						+ fAuthor + "|" + fBookConcern + "|" + fPrice + "|" + fPageNum + ";";
			   }
		});
		if(loaned != ""){
			justep.Util.hint(loaned+"\n已借出,请选择其他图书!");
			event.cancle = true;
		}else{
			this.openBookApply(books);
		}	
		
	};

    Model.prototype.openBookApply = function(books){  
    	var process = "/OA/book/process/bookBorrowApply/bookBorrowApplyProcess";
    	var activity ="mainActivity";
    	var url = "$UI/OA/book/process/bookBorrowApply/mainActivity.w?process="+process
			+"&activity="+activity+"&books="+books;
    	//justep.Portal.openWindow("图书借阅申请",url);
    	justep.Portal.openWindow(url,{title:"图书借阅申请"});
    };
	Model.prototype.statusSelectUpdateValue = function(event){
    //
	};
	return Model;
});