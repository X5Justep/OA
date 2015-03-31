import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.naming.NamingException;

import org.json.JSONException;
import org.json.JSONObject;

import com.justep.model.ModelUtils;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.BizData;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;

public class Email {
	private static final String DATA_MODEL = "/OA/email/data";

	private static long parserLong(Object v) {
		long result = 0;
		if (v instanceof BigDecimal) {
			result = ((BigDecimal) v).longValue();
		} else if (v instanceof Integer) {
			result = ((Integer) v).longValue();
		} else if (v instanceof Long) {
			result = ((Long) v).longValue();
		} else {
			result = Long.parseLong(v.toString());
		}

		return result;
	}

	public static long queryNotRead() {
		long result = 0l;
		String query = "select countAll() as taskCount " + " from OA_EM_ReceiveEmail t where t.fQurey='未查看' and t.fConsigneeID='"
				+ ContextHelper.getPerson().getID() + "'";
		Table table = KSQL.select(query, null, DATA_MODEL, null);
		for (Iterator<Row> it = table.iterator(); it.hasNext();) {
			Row r = it.next();
			Object v = r.getValue("taskCount");
			result = parserLong(v);
		}
		return result;
	}

	public static String sendEmail(String dataJson) {
		String re = "fail"; 
		Connection conn = null;
		Statement st = null;
		try {
			JSONObject dbData = new JSONObject(dataJson);

			String fID = dbData.getString("fID");//这里要使用概念名

			String fConsigneeID = dbData.getString("fConsigneeID");
			String fConsignee = dbData.getString("fConsignee");
			String fConsigneeCode = dbData.getString("fConsigneeCode");
			String fEmailName = dbData.getString("fEmailName");
			String fSendPerID = dbData.getString("fSendPerID");
			String fSendPerName = dbData.getString("fSendPerName");
			String fSendPerCode = dbData.getString("fSendPerCode");
			String fText = dbData.getString("fText");
			String FJID = dbData.getString("fFJID"); 
			if(FJID!=null&&FJID.indexOf("value")!=-1){
				FJID=FJID.substring(6);
			}
			System.out.println(FJID+"------");
			String[] revicePerID = fConsigneeID.split(";");
			String[] revicePerName = fConsignee.split(";");
			String[] revicePerCode = fConsigneeCode.split(";");
			String sql = null;

			Calendar cal = Calendar.getInstance();
			Date curTime = cal.getTime();
			String dtStr = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(curTime);
			

			conn = ModelUtils.getConnection(DATA_MODEL);
			st = conn.createStatement();
			for (int i = 0; i < revicePerID.length; i++) {
				sql = "insert into OA_EM_ReceiveEmail(fID,version,fQurey,fReplyState,fEmailName,fText,fFJID,fSendPerName,fSendPerID,fSendPerCode,fConsigneeID,fConsignee,fConsigneeCode,fSendTime) "
						+ "values(sys_guid(),0,'未查看','未回复','"
						+ fEmailName
						+ "','"
						+ fText
						+ "','"
						+ FJID
						+ "','"
						+ fSendPerName
						+ "','"
						+ fSendPerID
						+ "','"
						+ fSendPerCode
						+ "','"
						+ revicePerID[i]
						+ "','"
						+ revicePerName[i]
						+ "','"
						+ revicePerCode[i]
						+ "',to_date('"
						+ dtStr
						+ "','yyyy-mm-dd hh24:mi:ss'))";
				st.addBatch(sql);
			}
			sql = "update OA_EM_SendEmail set fState='已发送',fSendTime=to_date('" + dtStr + "','yyyy-mm-dd hh24:mi:ss') where fID='" + fID + "'";
			st.addBatch(sql);
			//System.out.println(sql);
			st.executeBatch();
			re = "success";
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (st != null) {
				try {
					st.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}

		return re;
	}
}