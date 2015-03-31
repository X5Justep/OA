define(function(require){
	var $ = require("jquery");
	var Model = function(){
		this.callParent();
	};
	Model.prototype.selectCarClick = function(event){
		this.comp("dlgSelectCars").open();
	};
	return Model;
});
