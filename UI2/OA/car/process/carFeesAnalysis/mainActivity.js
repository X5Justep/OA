define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.bSearchClick = function(event){
		
		debugger;
		var dTemp = this.comp('dTemp');
		var year = dTemp.getValue('year');
		var month1 = dTemp.getValue('month1');
		var month2 = dTemp.getValue('month2');
		var yearCondition = "", monthCondition = "", filter = "", connFlag = "";
		if (year != '') {
			yearCondition = "FYEAR = " + year;
		}
		if (!(month1 == '' && month2 == '') && !(month1 != '' && month2 != '')) {
			alert('请输入完整月范围！');
			return;
		} /*else if (month2 < month1) {
			alert('起始月份必须小于等于终止月份！');
			return;
		} else if (month2 >= month1 && !(month1 == '' || month2 == '')) {*/
		else if (!(month1 == '' || month2 == '')) {
			if (year != '') {
				connFlag = " AND ";
			}
			monthCondition = "FMONTH >= " + month1 + " AND FMONTH <=" + month2;
		} else if (month1 == '' || month2 == '') {
			connFlag = "";
			monthCondition = "";
		}
		if (!(year == '' && month1 == '' && month2 == '')) {
			filter = " WHERE " + yearCondition + connFlag + monthCondition;
		}
		var sql = "SELECT FYEAR,FMONTH,FCARNAME,FCARNO,FFIXEDPARKFEE,FTEMPPARKFEE,FREIMBLOADTOLL,FETCROADTOLL,FDRIVERREPAIRFEE,FMANAGERFEE,FOILFEE,FLITERS,FVEHICLEFEE,FREIMBFEE,FPASSAGEFEE,FVEHICLETAX,FTRANSPORTFEE,FMEDICALEXAMFEE,FOFFICEFEE,FCOMMUNICATFEE,FACCIDENTINSURANCE,FOVERTIMEDAYS,FOTHERFEES,FHUNDREDKMOILFEUL,FUSERSNAME,FREMARK FROM OA_CA_FEESREGISTER"
				+ filter;
		debugger;
		var d1 = this.comp('d1');
		d1.setSQL(sql, "DEFAULT");
		this.comp('report').refresh();
			
	};

	return Model;
});