import java.io.ByteArrayInputStream;
import java.text.SimpleDateFormat;
import java.util.Iterator;

import org.dom4j.Document;
import org.dom4j.io.SAXReader;

import com.justep.oa.ConfigUtils;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.process.ProcessUtils;
import com.justep.system.util.CommonUtils;
import com.justep.system.util.BizUtils;

//import OA.archival.*;

public class ReceiveDoc {

	public static void receiveDocProcessBeforeFinish() throws Exception {
		String sql = null;

		Document doc = ConfigUtils.getBizConfig("/OA/doc/businessConfig.xml");
		String enable = ConfigUtils.getStringConfigItem(doc, "/root/interface/reciveDocToArchival/enable", "false");

		if (enable.equals("true")) {

			String bizID = ProcessUtils.getProcessData1();
			sql = "select * from oa_dc_doc where fid = '" + bizID + "'";
			Table table = KSQL.select(sql, null, "/OA/doc/data", null);
			Iterator<Row> rows = table.iterator();
			while (rows.hasNext()) {
				Row rs = rows.next();
				String json = "";
				String docInfo = "";
				if (rs.getString("fTemplate") != null && rs.getString("fTemplate") != "")
					docInfo = rs.getString("fTemplate").replace("[", "").replace("]", "");
				if (rs.getString("fAttachment") != null && rs.getString("fAttachment") != "")
					json = rs.getString("fAttachment").replace("[", "").replace("]", "");
				if (docInfo != "" && json != "") {
					docInfo += "," + json;
				} else if (json != "") {
					docInfo = json;
				}

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
				String curYear = sdf.format(new java.util.Date());
				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
				String curDate = sdf2.format(new java.util.Date());
				curDate = rs.getDate("fIssueDate") == null ? curDate : sdf2.format(rs.getDate("fIssueDate"));

				String fTitle = rs.getString("fTitle") == null ? "" : rs.getString("fTitle");
				String fDocNumber = rs.getString("fDocNumber") == null ? "" : rs.getString("fDocNumber");
				String fRelevanceID = rs.getString("fRelevanceID") == null ? "" : rs.getString("fRelevanceID");
				String fRelevanceName = rs.getString("fRelevanceName") == null ? "" : rs.getString("fRelevanceName");
				String fKeyword = rs.getString("fKeyword") == null ? "" : rs.getString("fKeyword");
				String fCopies = rs.getString("fCopies") == null ? "" : rs.getString("fCopies");
				String fPages = rs.getString("fPages") == null ? "" : rs.getString("fPages");
				String strCurrentDate = CommonUtils.getCurrentDate().toString().replace("-", "");
				String format = "00";
				String fileNO = BizUtils.createNextSequenceString(strCurrentDate, format);
				String xmlStr = "<?xml version='1.0' encoding='GB2312'?>" + "<root>" + "<fileNO>" + fileNO + "</fileNO>" + "<archivalNO>"
						+ "</archivalNO>" + "<title>" + fTitle + "</title>" + "<keyword>" + fKeyword + "</keyword>" + "<copies>" + fCopies
						+ "</copies>" + "<pages>" + fPages + "</pages>" + "<documentNO>" + fDocNumber + "</documentNO>" + "<fondsID>"
						+ ConfigUtils.getStringConfigItem(doc, "/root/interface/reciveDocToArchival/fondsID", "") + "</fondsID>" + "<categoryID>"
						+ ConfigUtils.getStringConfigItem(doc, "/root/interface/reciveDocToArchival/categoryID", "") + "</categoryID>" + "<rollID>"
						+ ConfigUtils.getStringConfigItem(doc, "/root/interface/reciveDocToArchival/rollID", "") + "</rollID>" + "<fondsName>"
						+ ConfigUtils.getStringConfigItem(doc, "/root/interface/reciveDocToArchival/fondsName", "") + "</fondsName>"
						+ "<categoryName>" + ConfigUtils.getStringConfigItem(doc, "/root/interface/reciveDocToArchival/categoryName", "")
						+ "</categoryName>" + "<rollName>" + ConfigUtils.getStringConfigItem(doc, "/root/interface/reciveDocToArchival/rollName", "")
						+ "</rollName>" + "<year>" + curYear + "</year>" + "<date>" + curDate + "</date>" + "<secret>"
						+ ConfigUtils.getStringConfigItem(doc, "/root/interface/reciveDocToArchival/secret", "") + "</secret>" + "<carry>"
						+ ConfigUtils.getStringConfigItem(doc, "/root/interface/reciveDocToArchival/carry", "") + "</carry>" + "<limit>"
						+ ConfigUtils.getStringConfigItem(doc, "/root/interface/reciveDocToArchival/limit", "") + "</limit>" + "<relevanceID>"
						+ fRelevanceID + "</relevanceID>" + "<relevanceName>" + fRelevanceName + "</relevanceName>" + "<businessID>" + bizID
						+ "</businessID>" + "<funcURL>" + ConfigUtils.getStringConfigItem(doc, "/root/interface/reciveDocToArchival/funcURL", "")
						+ "</funcURL>" + "<docLink>" + "[" + docInfo + "]" + "</docLink>" + "<table>"
						+ ConfigUtils.getStringConfigItem(doc, "/root/interface/reciveDocToArchival/table", "") + "</table>" + "<filed>"
						+ ConfigUtils.getStringConfigItem(doc, "/root/interface/reciveDocToArchival/filed", "") + "</filed>" + "</root>";
				SAXReader saxReader = new SAXReader();
				Document docDoc;
				docDoc = saxReader.read(new ByteArrayInputStream(xmlStr.getBytes()));
				//ArchivalInterface.archivalInterface(docDoc);
			}
		}
	}
}