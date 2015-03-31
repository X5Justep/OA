import org.dom4j.*;

import java.sql.*;
import java.util.*;

import com.justep.model.ModelUtils;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.transform.SimpleTransform;
import com.justep.system.context.ContextHelper;
import com.justep.system.opm.PersonMember;
import com.justep.util.Utils;
import com.justep.system.util.CommonUtils;

public class docPortalUtils {


	public static Map<String, Object> getOpinion(String id, String flag)
			throws Exception {
		Map map = new HashMap<String, Object>();
		String ksql = "";
		if (flag.equals("send")) {
			ksql = "select e.fOpinion,e.fCreateTime,e.fCreatePsnName from OA_DC_DocExecute e Where  e.fActivityLabel = '院首长签阅' and e.fMasterID = '"
					+ id + "' Order by e.fCreateTime desc";
			map.put("s1",
					table2String(KSQL.select(ksql, null, "/OA/doc/data", null)));
			ksql = "select e.fOpinion,e.fCreateTime,e.fCreatePsnName from OA_DC_DocExecute e Where  e.fActivityLabel = '处领导阅稿' and e.fMasterID = '"
					+ id + "' Order by e.fCreateTime desc";
			map.put("s2",
					table2String(KSQL.select(ksql, null, "/OA/doc/data", null)));
			ksql = "select e.fOpinion,e.fCreateTime,e.fCreatePsnName from OA_DC_DocExecute e Where  e.fActivityLabel = '部领导审批' and e.fMasterID = '"
					+ id + "' Order by e.fCreateTime desc";
			map.put("s3",
					table2String(KSQL.select(ksql, null, "/OA/doc/data", null)));
		} else if (flag.equals("telephone")) {
			ksql = "select e.fOpinion,e.fCreateTime,e.fCreatePsnName from OA_DC_DocExecute e Where  (e.fActivityLabel = '院首长签阅' or e.fActivityLabel = '部领导审批') and e.fMasterID = '"
					+ id + "' Order by e.fCreateTime desc";
			map.put("s",
					table2String(KSQL.select(ksql, null, "/OA/doc/data", null)));
		} else if (flag.equals("receive")) {
			ksql = "select e.fOpinion,e.fCreateTime,e.fCreatePsnName from OA_DC_DocExecute e Where  (e.fActivityLabel = '院首长签阅' or e.fActivityLabel = '部领导签阅') and e.fMasterID = '"
					+ id + "' Order by e.fCreateTime desc";
			map.put("s",
					table2String(KSQL.select(ksql, null, "/OA/doc/data", null)));
		} else if (flag.equals("read")) {
			ksql = "select e.fOpinion,e.fCreateTime,e.fCreatePsnName from OA_DC_DocExecute e Where  e.fActivityLabel = '院首长签阅' and e.fMasterID = '"
					+ id + "' Order by e.fCreateTime desc";
			map.put("s1",
					table2String(KSQL.select(ksql, null, "/OA/doc/data", null)));
			ksql = "select e.fOpinion,e.fCreateTime,e.fCreatePsnName from OA_DC_DocExecute e Where  e.fActivityLabel = '部领导审批' and e.fMasterID = '"
					+ id + "' Order by e.fCreateTime desc";
			map.put("s2",
					table2String(KSQL.select(ksql, null, "/OA/doc/data", null)));
		}
		return map;
	}

	public static String table2String(Table tab) {
		String s = "";
		Iterator<Row> rows = tab.iterator();
		while (rows.hasNext()) {
			Row row = rows.next();
			if (s.equals("")) {
				s = row.getString("fOpinion")
						+ " "
						+ row.getString("fCreatePsnName")
						+ " "
						+ row.getDateTime("fCreateTime")
								.toString()
								.substring(
										0,
										row.getDateTime("fCreateTime")
												.toString().indexOf(" "));
			} else {
				s = s
						+ "\n"
						+ row.getString("fOpinion")
						+ " "
						+ row.getString("fCreatePsnName")
						+ " "
						+ row.getDateTime("fCreateTime")
								.toString()
								.substring(
										0,
										row.getDateTime("fCreateTime")
												.toString().indexOf(" "));
			}
		}
		return s;
	}

	private static final String DATA_MODEL = "/system/data";

	public static Document queryWaitTaskNoDoc() {
		String condition = TaskUtils.getExecutorCondition("t", ContextHelper
				.getPerson().getPersonMembers(), true);

		String query = "select t, t.sName, t.sCURL, t.sProcess, t.sActivity, t.sCreateTime, t.sExecutorFName, t.sExecutorNames, t.sEURL, t.sCreatorFName, t.sShortcut, t.sHints, t.sCreatorFID, t.sExecutorFID "
				+ " from SA_Task t "
				+ " where (t.sKindID='tkTask' or t.sKindID='tkExecutor' or t.sKindID='tkNotice' or t.sKindID IS NULL) "
				+ " and (t.sStatusID='tesReady' or t.sStatusID='tesExecuting') "
				+ " and (t.sTypeID IS NULL or t.sTypeID <> 'WORKREMIND')"
				+ " and not(t.sProcess  like '%/OA/doc%')"
				+ " and "
				+ condition
				+ " order by  t.sCreateTime desc " + " limit 0,8 ";
		return toDOM(KSQL.select(query, null, DATA_MODEL, null));
	}

	public static Document queryWaitTaskDoc() {
		String condition = TaskUtils.getExecutorCondition("t", ContextHelper
				.getPerson().getPersonMembers(), true);

		String query = "select t, t.sName, t.sCURL, t.sProcess, t.sActivity, t.sCreateTime, t.sExecutorFName, t.sExecutorNames, t.sEURL, t.sCreatorFName, t.sShortcut, t.sHints, t.sCreatorFID, t.sExecutorFID "
				+ " from SA_Task t "
				+ " where (t.sKindID='tkTask' or t.sKindID='tkExecutor' or t.sKindID='tkNotice' or t.sKindID IS NULL) "
				+ " and (t.sStatusID='tesReady' or t.sStatusID='tesExecuting') "
				+ " and (t.sTypeID IS NULL or t.sTypeID <> 'WORKREMIND')"
				+ " and t.sProcess like '%/OA/doc%'"
				+ " and "
				+ condition
				+ " order by  t.sCreateTime desc " + " limit 0,8 ";
		return toDOM(KSQL.select(query, null, DATA_MODEL, null));
	}

	private static Document toDOM(Table table) {
		Document result = DocumentHelper.createDocument();
		Element tasks = result.addElement("tasks");
		if (table != null) {
			for (Iterator<Row> it = table.iterator(); it.hasNext();) {
				Row r = it.next();
				Element task = tasks.addElement("SA_Task");
				task.addAttribute("id", r.getString("t"));
				task.addElement("sName").addText(
						getValue(r.getString("sName"), ""));

				task.addElement("sCURL").addText(
						getValue(r.getString("sCURL"), ""));

				task.addElement("sEURL").addText(
						getValue(r.getString("sEURL"), ""));
				task.addElement("sProcess").addText(
						getValue(r.getString("sProcess"), ""));
				task.addElement("sActivity").addText(
						getValue(r.getString("sActivity"), ""));
				task.addElement("sCreateTime").addText(
						getValue(SimpleTransform.transToString(r
								.getDateTime("sCreateTime")), ""));
				task.addElement("sCreatorFID").addText(
						getValue(r.getString("sCreatorFID"), ""));
				task.addElement("sExecutorFID").addText(
						getValue(r.getString("sExecutorFID"), ""));

				{
					String executorName = getValue(
							r.getString("sExecutorFName"), "");
					if (Utils.isEmptyString(executorName)) {
						executorName = getValue(r.getString("sExecutorNames"),
								"");
					} else {
						executorName = CommonUtils.getNameOfFile(executorName);
					}

					if (executorName == null) {
						executorName = "";
					}

					task.addElement("sExecutorFName").addText(executorName);
				}

				{
					String creatorName = getValue(r.getString("sCreatorFName"),
							"");
					creatorName = CommonUtils.getNameOfFile(creatorName);
					if (creatorName == null) {
						creatorName = "";
					}
					task.addElement("sCreatorFName").addText(creatorName);
				}

				task.addElement("sHints").addText(
						getValue(r.getString("sHints"), ""));
				task.addElement("sShortcut").addText(
						getValue(r.getString("sShortcut"), ""));
			}

		}

		return result;
	}

	private static String getValue(String obj, String defaultValue) {
		if (obj == null) {
			return defaultValue;
		} else {
			return obj;
		}
	}
}