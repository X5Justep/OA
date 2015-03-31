package com.justep.OA.badgut;

import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.util.CommonUtils;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.List;
import java.util.Calendar;
import org.dom4j.Document;
import org.dom4j.Element;

public class badgutInterface {
	public static final String OADataModel = "/OA/badgut/data";

	public static String checkBadgut(Document dom) {
		String result = "", errorInfo = "", year = "", month = "", surplus = "", passedSurplus = "";

		Element root = dom.getRootElement();
		List<Element> badgutNodes = root.selectNodes("./checkBadgut");
		if (badgutNodes.size() > 0) {

			String[] config = getConfig().split("/");
			String aYear = config[0];
			String aMonth = config[1];
			String aHasPassed = config[2];
			HashMap<String, String[]> mapBadgut = new HashMap<String, String[]>();
			for (Element badgutNode : badgutNodes) {
				year = badgutNode.valueOf("year");
				month = badgutNode.valueOf("month");
				if (year.equals("") || month.equals("")) {
					year = aYear;
					month = aMonth;
				}
				String[] badgutAry = new String[5];
				badgutAry[0] = badgutNode.valueOf("costCenterID");
				badgutAry[1] = badgutNode.valueOf("costCenterName");
				badgutAry[2] = badgutNode.valueOf("accountID");
				badgutAry[3] = badgutNode.valueOf("accountName");
				badgutAry[4] = badgutNode.valueOf("amount");
				if (mapBadgut.containsKey(badgutAry[0] + badgutAry[2])) {
					String[] amountAry = mapBadgut.get(badgutAry[0] + badgutAry[2]);
					badgutAry[4] = String.valueOf((Float.parseFloat(badgutAry[4]) + Float.parseFloat(amountAry[4])));
					mapBadgut.put(badgutAry[0] + badgutAry[2], badgutAry);
				} else {
					mapBadgut.put(badgutAry[0] + badgutAry[2], badgutAry);
				}
			}
			for (Entry<String, String[]> entry : mapBadgut.entrySet()) {
				String[] finalAry = entry.getValue();
				Element surplusInfo = getBadgut(year, month, finalAry[0], finalAry[1], finalAry[2], finalAry[3]).getRootElement();
				errorInfo = surplusInfo.valueOf("errorInfo");
				if (errorInfo.equals("")) {
					surplus = surplusInfo.valueOf("surplus");
					passedSurplus = surplusInfo.valueOf("passSurplus");
					if (aHasPassed.equals("0") && Float.parseFloat(finalAry[4]) > Float.parseFloat(surplus)) {
						result = result + year + "年 " + month + "月 " + finalAry[1] + "-" + finalAry[3] + " 所对应预算不足！" + "(余额为:" + surplus + "元)"
								+ "\n";
					} else if (aHasPassed.equals("1") && Float.parseFloat(finalAry[4]) > Float.parseFloat(passedSurplus)) {
						result = result + year + "年 " + month + "月 " + finalAry[1] + "-" + finalAry[3] + " 所对应预算不足！" + "(余额为:" + passedSurplus + "元)"
								+ "\n";
					}
				} else {
					result = result + errorInfo + "\n";
				}
			}
		} else {
			result = "未找到查询预算参数,请检查配置！";
		}
		return result;
	}

	public static String getConfig() {
		String strMonth = null;
		String sql = "select c.fCurrentYear,c.fCurrentMonth,c.fHasPassed from OA_BG_Config c";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			Row rs = rows.next();
			strMonth = rs.getString("fCurrentYear") + "/" + rs.getString("fCurrentMonth") + "/" + rs.getString("fHasPassed");
		} else {
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH) + 1;
			sql = "insert into OA_BG_Config c (c.fCurrentYear,c.fCurrentMonth,c,c.version,c.fHasPassed)values ('" + year + "','" + month
					+ "',guid(),0,'0')";
			KSQL.executeUpdate(sql, null, OADataModel, null);
			strMonth = year + "/" + month + "/0";
		}
		return strMonth;
	}

	public static Document getBadgut(String year, String month, String costCenterID, String costCenterName, String accountID, String accountName) {
		Document result = org.dom4j.DocumentHelper.createDocument(org.dom4j.DocumentHelper.createElement("badgut"));

		String selectStr = "select ";
		if (month.equals("1")) {
			selectStr = selectStr + "d.fPlan2 - d.fFact1 as surplus,d.fPlan1 - d.fFact1 as passSurplus";
		} else if (month.equals("2")) {
			selectStr = selectStr + "d.fPlan2 - d.fFact2 as surplus,d.fPlan1 + d.fPlan2 - d.fFact1 - d.fFact2 as passSurplus";
		} else if (month.equals("3")) {
			selectStr = selectStr + "d.fPlan5 - d.fFact3 as surplus,d.fPlan1 + d.fPlan2 + d.fPlan3 - d.fFact1 - d.fFact2 - d.fFact3 as passSurplus";
		} else if (month.equals("4")) {
			selectStr = selectStr
					+ "d.fPlan4 - d.fFact4 as surplus,d.fPlan1 + d.fPlan3 + d.fPlan3 + d.fPlan4 - d.fFact1 - d.fFact2 - d.fFact3 - d.fFact4 as passSurplus";
		} else if (month.equals("5")) {
			selectStr = selectStr
					+ "d.fPlan5 - d.fFact5 as surplus,d.fPlan1 + d.fPlan2 + d.fPlan3 + d.fPlan4 + d.fPlan5 - d.fFact1 - d.fFact2 - d.fFact3 - d.fFact4 - d.fFact5 as passSurplus";
		} else if (month.equals("6")) {
			selectStr = selectStr
					+ "d.fPlan7 - d.fFact6 as surplus,d.fPlan1 + d.fPlan2 + d.fPlan3 + d.fPlan4 + d.fPlan6 + d.fPlan6 - d.fFact1 - d.fFact2 - d.fFact3 - d.fFact4 - d.fFact5 - d.fFact6 as passSurplus";
		} else if (month.equals("7")) {
			selectStr = selectStr
					+ "d.fPlan8 - d.fFact7 as surplus,d.fPlanall - d.fPlan12 - d.fPlan11 - d.fPlan10 - d.fPlan9 - d.fPlan8 - d.fFactall + d.fFact12 + d.fFact11 + d.fFact10 + d.fFact9 + d.fFact8 as passSurplus";
		} else if (month.equals("8")) {
			selectStr = selectStr
					+ "d.fPlan9 - d.fFact8 as surplus,d.fPlanall - d.fPlan12 - d.fPlan11 - d.fPlan10 - d.fPlan9 - d.ffactall + d.fFact12 + d.fFact11 + d.fFact10 + d.fFact9 as passSurplus";
		} else if (month.equals("9")) {
			selectStr = selectStr
					+ "d.fPlan9 - d.fFact9 as surplus,d.fPlanall - d.fPlan12 - d.fPlan11 - d.fPlan10 - d.ffactall + d.fFact12 + d.fFact11 + d.fFact10 as passSurplus";
		} else if (month.equals("10")) {
			selectStr = selectStr
					+ "d.fPlan10 - d.fFact10 as surplus,d.fPlanall - d.fPlan12 - d.fPlan11 - d.fFactall + d.fFact12 + d.fFact11 as passSurplus";
		} else if (month.equals("11")) {
			selectStr = selectStr + "d.fPlan11 - d.fFact11 as surplus,d.fPlanall - d.fPlan12 - d.fFactall + d.fFact12 as passSurplus";
		} else if (month.equals("12")) {
			selectStr = selectStr + "d.fPlan12 - d.fFact12 as surplus,d.fPlanall - d.ffactall as passSurplus";
		}
		String sql = selectStr + " from OA_BG_BadgutM m join OA_BG_BadgutD d on m = d.fBGBadgutID where m.fYear = '" + year
				+ "' and m.fCostCenterID = '" + costCenterID + "' and d.fAccountID = '" + accountID + "'";

		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			Row rs = rows.next();
			Element surplus = result.getRootElement().addElement("surplus");
			if(rs.getDecimal("surplus")!=null){
				surplus.addText(rs.getDecimal("surplus").toString());
			}
			Element passSurplus = result.getRootElement().addElement("passSurplus");
			if(rs.getDecimal("passSurplus")!=null){
				passSurplus.addText(rs.getDecimal("passSurplus").toString());
			}
			result.getRootElement().addElement("errorInfo");
		} else {
			result.getRootElement().addElement("surplus");
			result.getRootElement().addElement("passSurplus");
			result.getRootElement().addElement("errorInfo")
					.addText("未找到 " + year + "年 " + month + "月 " + costCenterName + "-" + accountName + " 所对应预算！");
		}
		System.out.println("result=="+result);
		return result;
	}

	public static void setBadgutFact(Document dom) {
		String costCenterID = "", accountID = "", kindID = "", year = "", month = "", amount = "", deptID = "", deptName = "", personID = "", personName = "", url = "", businessID = "", funcURL = "", sql = "", iprocess = "", iactivity = "", dateTime = "", strDate = "";
		Element root = dom.getRootElement();
		List<Element> badgutNodes = root.selectNodes("./setBadgut");
		if (badgutNodes.size() > 0) {
			String kindName = null;
			String[] config = getConfig().split("/");
			String aYear = config[0];
			String aMonth = config[1];
			for (Element badgutNode : badgutNodes) {
				costCenterID = badgutNode.valueOf("costCenterID");
				accountID = badgutNode.valueOf("accountID");
				kindID = badgutNode.valueOf("kindID");
				year = badgutNode.valueOf("year");
				month = badgutNode.valueOf("month");
				if (year.equals("") || month.equals("")) {
					year = aYear;
					month = aMonth;
				}
				amount = badgutNode.valueOf("amount");
				deptID = badgutNode.valueOf("deptID");
				deptName = badgutNode.valueOf("deptName");
				personID = badgutNode.valueOf("personID");
				personName = badgutNode.valueOf("personName");
				url = badgutNode.valueOf("url");
				businessID = badgutNode.valueOf("businessID");
				funcURL = badgutNode.valueOf("funcURL");
				iprocess = badgutNode.valueOf("iprocess");
				iactivity = badgutNode.valueOf("iactivity");
				dateTime = badgutNode.valueOf("dateTime");
				sql = "update OA_BG_BadgutD d set d.fFact" + month + " = d.fFact" + month + " + " + amount + ", d.fFactall = d.fFactall + " + amount
						+ " where d.fAccountID = '" + accountID + "'"
						+ " and d.fBGBadgutID in (select m from OA_BG_BadgutM m where m.fCostCenterID = '" + costCenterID + "' and m.fYear = '"
						+ year + "')";
				KSQL.executeUpdate(sql, null, "/OA/badgut/data", null);

				if (kindID.equals("reimburse")) {
					kindName = "财务报销";
				}
				sql = "insert into OA_BG_History h(h,h.fAccountID,h.fAccountCode,h.fAccountName,h.version,h.fCostCenterID,h.fCostCenterCode,h.fCostCenterName,"
						+ "h.fYear,h.fMonth,h.fKindID,h.fKindName,h.fAmount,h.fSurplus,h.fDeptID,h.fDeptName,h.fPersonID,h.fPersonName,h.fURL,h.fBusinessID,"
						+ "h.fFuncURL,h.fDateTime,h.fProcess,h.fActivity) "
						+ " (select guid(),d.fAccountID,d.fAccountCode,d.fAccountName,0,m.fCostCenterID,m.fCostCenterCode,m.fCostCenterName,'"
						+ year
						+ "','"
						+ month
						+ "','"
						+ kindID
						+ "','"
						+ kindName
						+ "',"
						+ amount
						+ ",d.fPlan"
						+ month
						+ " - "
						+ amount
						+ ",'"
						+ deptID
						+ "','"
						+ deptName
						+ "','"
						+ personID
						+ "','"
						+ personName
						+ "','"
						+ url
						+ "','"
						+ businessID
						+ "','"
						+ funcURL
						+ "',:strDate,'"
						+ iprocess
						+ "','"
						+ iactivity
						+ "' from OA_BG_BadgutM m join OA_BG_BadgutD d on m =d.fBGBadgutID where m.fCostCenterID = '"
						+ costCenterID
						+ "' and d.fAccountID = '" + accountID + "' and m.fYear = '" + year + "')";
				Map<String, Object> param = new HashMap<String, Object>();
				if (dateTime.equals("")) {
					param.put("strDate", CommonUtils.getCurrentDateTime());
				} else {
					param.put("strDate", "stringToDateTime('" + dateTime + "')");
				}
				KSQL.executeUpdate(sql, param, "/OA/badgut/data", null);
			}

		}
	}
}