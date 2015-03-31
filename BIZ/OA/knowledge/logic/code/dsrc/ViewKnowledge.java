import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

import org.dom4j.Document;
import org.dom4j.Element;
import com.justep.model.ModelUtils;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.util.CommonUtils;

public class ViewKnowledge {
	public static final String OADataModel ="/OA/knowledge/data";
	public static final String sysDataModel ="/system/data";
	private static class Reader {
		String sID;
		String sName;
		String sFName;
	}

	public static void insertReaders(String KWID) {
		String curPersonID = com.justep.oa.SysUtils.getCurrentPersonID();
		String curPersonName = com.justep.oa.SysUtils.getCurrentPersonName();
		String sqlCheckReader = "select r.fReaderID from OA_KM_READERS r where r.fKWID = '"+KWID+"' and fReaderID = '"+curPersonID+"' ";
		
		


		Table table = KSQL.select(sqlCheckReader, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext()) {
			return;
		}

		String sqlInsertReader = "insert into OA_KM_READERS r(r, r.fKWID, r.fReaderID, r.fReaderName, r.fReadTime) "
						+ "	values(guid(),'"+KWID+"','"+curPersonID+"','"+curPersonName+"',:currentDate) ";
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("currentDate", CommonUtils.getCurrentDateTime());
		KSQL.executeUpdate(sqlInsertReader, param, OADataModel, null);

		String sqlUpdateReadCount = "update OA_KM_Knowledge k set k.fReaderCount = COALESCE(k.fReaderCount, 0) + 1 where k = '"+KWID+"' ";
		KSQL.executeUpdate(sqlUpdateReadCount, null, OADataModel, null);

	
	}

	public static Document getNoReaders(String KWID)  {
		Document result = org.dom4j.DocumentHelper
				.createDocument(org.dom4j.DocumentHelper
						.createElement("noReaders"));
		Map<String, String> alreadyReaders = getAlreadyReaders(KWID);
		Map<String, Reader> canReaders = getCanReaders(KWID);
		Map<String, Reader> noReaders = getNoReaders(alreadyReaders,
						canReaders);
		for (Reader reader : noReaders.values()) {
					Element readerElement = result.getRootElement().addElement(
							"reader");
					readerElement.addElement("sID").addText(reader.sID);
					readerElement.addElement("sName").addText(reader.sName);
					readerElement.addElement("sFName").addText(reader.sFName);
		}
		return result;
	}

	public static Integer getNoReaderCount(String KWID) throws Exception {
		Connection conn = ModelUtils.getConnection("/OA");
		ContextHelper.getTransaction().begin(conn);
		try {
			Connection connSys = ModelUtils.getConnection("/system/data");
			ContextHelper.getTransaction().begin(conn);
			try {
				Map<String, String> alreadyReaders = getAlreadyReaders(KWID);
				Map<String, Reader> canReaders = getCanReaders(KWID);
				Map<String, Reader> noReaders = getNoReaders(alreadyReaders,
						canReaders);
				return noReaders.size();
			} finally {
				connSys.close();
				connSys = null;
			}
		} finally {
			conn.close();
			conn = null;
		}
	}

	private static Map<String, String> getAlreadyReaders(String KWID) {
		String sql = "select r.fReaderID, r.fReaderName from OA_KM_READERS r where r.fKWID = '"+KWID+"'";

		Map<String, String> result = new HashMap<String, String>();

		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs = rows.next();
			result.put(rs.getString("fReaderID"), rs.getString("fReaderName"));
		}

		return result;
	}

	private static Map<String, Reader> getCanReaders(String KWID){
		Map<String, Reader> result = new LinkedHashMap<String, Reader>();

		String orgIDs = "'-'", psnIDs = "'-'";
		String sqlGetRights = "select r.fOrgID, r.fOrgKind from OA_KM_Rights r where r.fKWID = '"+KWID+"' and r.fCanReadKW = 1 ";
		Table table = KSQL.select(sqlGetRights, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rsRights = rows.next();
			if (!(rsRights.getString("fOrgKind")
							.equalsIgnoreCase("psn"))) {
				orgIDs += ", '"+rsRights.getString("fOrgID")+"'";
			}
			if (rsRights.getString("fOrgKind").equalsIgnoreCase("psn")) {
				psnIDs += ", '"+rsRights.getString("fOrgID")+"'";
			}
		}

		String sqlGetPersons = "Select distinct p as sID, p.sName, mainOrg.sFName "
								+ "	from SA_OPPerson p "
								+ "		join SA_OPOrg mainOrg on p.sMainOrgID = mainOrg "
								+ "	where p in ("+psnIDs+") "
								+ "		or p in ( "
								+ "			select pm.sPersonID "
								+ "			from SA_OPOrg org "
								+ "				join SA_OPOrg orgC on orgC.sFID like concat(org.sFID , '%') "
								+ "				join SA_OPOrg pm on orgC = pm.sParent "
								+ "			where org in ("+orgIDs+") ) "
								+ "	order by mainOrg.sFName, p.sName ";


			Table tab = KSQL.select(sqlGetPersons, null, sysDataModel, null);
			Iterator<Row> tabs = tab.iterator();
			while (tabs.hasNext()) {
				Row rs = tabs.next();
				Reader reader = new Reader();
				reader.sID = rs.getString("sID");
				reader.sName = rs.getString("sName");
				reader.sFName = rs.getString("sFName");
				result.put(rs.getString("sID"), reader);
			}
	
		return result;
	}

	private static Map<String, Reader> getNoReaders(
			Map<String, String> alreadyReaders, Map<String, Reader> canReaders) {
		Map<String, Reader> result = new LinkedHashMap<String, Reader>();
		for (String readerID : canReaders.keySet()) {
			if (!(alreadyReaders.keySet().contains(readerID)))
				result.put(readerID, canReaders.get(readerID));
		}
		return result;
	}

}