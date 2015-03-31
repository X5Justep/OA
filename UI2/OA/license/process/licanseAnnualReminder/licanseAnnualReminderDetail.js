define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.OKBtnClick = function(event){
		this.comp("wReceiver").windowEnsure();
	};
	
	return Model;
});