import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Iterator;
import java.util.UUID;

import org.dom4j.Document;
import org.dom4j.Element;

import com.justep.oa.SysUtils;
import com.justep.model.ModelUtils;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.util.CommonUtils;
import com.justep.util.Utils;
import com.justep.doc.DocDBHelper;
import com.justep.doc.DocDirPermissions;

public class Cabinet {

	public static String getCabinetInfo(String personID, String type)
			throws Exception {
		Statement stmt = null, stmtu = null;
		ResultSet rs = null;
		String cabinetInfo = "", newAMID = "";
		String orgID = "", orgName = "", orgFID = "", cabinetNodeID = "", nodeID = "",sequence = "",strDatabaseType = null;
		HashMap<String, Object> filedMap = new HashMap<String, Object>();
		Connection conn = ModelUtils.getConnection("/system/data");
		ContextHelper.getTransaction().begin(conn);
		try {
			strDatabaseType = conn.getMetaData().getDatabaseProductName();
			System.out.print("==strDatabaseType=="+strDatabaseType);
			stmt = conn.createStatement();
			String strSQL = "";
			if (type.equals("psn")) {
				strSQL = "select a.sID as orgID, a.sName as orgName,a.sSequence, '' as orgFID, c.fDocNodeID as cabinetNodeID, n.sID as nodeID"
						+ "  from (SELECT sID,sName,sSequence FROM SA_OPPerson where sID = '"
						+ personID
						+ "') a"
						+ "  left join AP_FileCabinet c on a.sID = c.fPersonID and c.fType = 'psn'"
						+ "  left join SA_DocNode n on n.sID = c.fDocNodeID";
			} else if (type.equals("dept")) {
				if (strDatabaseType.equalsIgnoreCase("Oracle")) {
					strSQL = "select distinct '' as orgID, a.sName as orgName,a.sSequence, a.sFID as orgFID, c.fDocNodeID as cabinetNodeID, n.sID as nodeID"
						+ "  from (select o.sID,o.sName,o.sFID,o.sSequence"
						+ "           from SA_OPOrg o"
						+ "           join (SELECT sFID FROM SA_OPOrg where sPersonID = '"
						+ personID
						+ "' and sValidState = 1) p on p.sFID like o.sFid || '%'"
						+ "              and (o.sOrgKindID = 'ogn' or o.sOrgKindID = 'dpt')) a"
						+ "   left join AP_FileCabinet c on a.sFID = c.FORGFID and c.fType = 'dept'"
						+ "   left join SA_DocNode n on n.sID = c.fDocNodeID";

				}else if (strDatabaseType.equalsIgnoreCase("MSSQL") || strDatabaseType.equalsIgnoreCase("Microsoft SQL Server")){
					strSQL = "select distinct '' as orgID, a.sName as orgName,a.sSequence, a.sFID as orgFID, c.fDocNodeID as cabinetNodeID, n.sID as nodeID"
						+ "  from (select o.sID,o.sName,o.sFID,o.sSequence"
						+ "           from SA_OPOrg o"
						+ "           join (SELECT sFID FROM SA_OPOrg where sPersonID = '"
						+ personID
						+ "' and sValidState = 1) p on p.sFID like o.sFid + '%'"
						+ "              and (o.sOrgKindID = 'ogn' or o.sOrgKindID = 'dpt')) a"
						+ "   left join AP_FileCabinet c on a.sFID = c.FORGFID and c.fType = 'dept'"
						+ "   left join SA_DocNode n on n.sID = c.fDocNodeID";
				}else if (strDatabaseType.equalsIgnoreCase("MySQL")){
					strSQL = "select distinct '' as orgID, a.sName as orgName,a.sSequence, a.sFID as orgFID, c.fDocNodeID as cabinetNodeID, n.sID as nodeID"
						+ "  from (select o.sID,o.sName,o.sFID,o.sSequence"
						+ "           from SA_OPOrg o"
						+ "           join (SELECT sFID FROM SA_OPOrg where sPersonID = '"
						+ personID
						+ "' and sValidState = 1) p on p.sFID like concat(o.sFid , '%')"
						+ "              and (o.sOrgKindID = 'ogn' or o.sOrgKindID = 'dpt')) a"
						+ "   left join AP_FileCabinet c on a.sFID = c.FORGFID and c.fType = 'dept'"
						+ "   left join SA_DocNode n on n.sID = c.fDocNodeID";
				}
			}
			rs = stmt.executeQuery(strSQL);
			while (rs.next()) {
				orgID = rs.getString("orgID");
				orgName = rs.getString("orgName");
				orgFID = rs.getString("orgFID");
				cabinetNodeID = rs.getString("cabinetNodeID");
				sequence = rs.getString("sSequence");
				nodeID = rs.getString("nodeID");
				if (Utils.isNull(cabinetNodeID)) {
					newAMID = UUID.randomUUID().toString();
					addCabinet(filedMap,conn, newAMID, orgID, orgName, orgFID, type,sequence);
					if (type.equals("psn")) {
						addCabinetPerssion("/root/fileCabinet/personalCabinet/"+newAMID,1799);
					} else if (type.equals("dept")) {
						addCabinetPerssion("/root/fileCabinet/deptCabinet/"+newAMID,1799);
					}
					cabinetInfo += "," + newAMID;
				} else if (Utils.isNull(nodeID)) {
					if (type.equals("psn")) {
						filedMap = setMap(orgName, "personalCabinet",
								"/root/fileCabinet/personalCabinet", "/文档中心/文件柜/个人文件柜",sequence);
						DocDBHelper.createDir(cabinetNodeID, filedMap);
						addCabinetPerssion("/root/fileCabinet/personalCabinet/"+cabinetNodeID,1799);
					} else if (type.equals("dept")) {
						filedMap = setMap(orgName, "deptCabinet",
								"/root/fileCabinet/deptCabinet", "/文档中心/文件柜/部门文件柜",sequence);
						DocDBHelper.createDir(cabinetNodeID, filedMap);
						addCabinetPerssion("/root/fileCabinet/deptCabinet/"+cabinetNodeID,1799);

					}
					cabinetInfo += "," + cabinetNodeID;
				} else {
					cabinetInfo += "," + cabinetNodeID;
					if (type.equals("psn")) {
						addCabinetPerssion("/root/fileCabinet/personalCabinet/"+cabinetNodeID,1799);
					} else if (type.equals("dept")) {
						addCabinetPerssion("/root/fileCabinet/deptCabinet/"+cabinetNodeID,1799);

					}
				}
			}
			if (!cabinetInfo.equals(""))
				cabinetInfo = cabinetInfo.substring(1);
		} finally {
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (stmt != null) {
				stmt.close();
				stmt = null;
			}
			if (conn != null) {
				conn.close();
				conn = null;
			}
		}
		return cabinetInfo;
	}

	public static void addCabinet(HashMap<String, Object> filedMap,Connection conn, String docID,
			String personID, String orgName, String orgFID, String type,String sequence)
			throws Exception {
		if(sequence==null){
			sequence = "0";
		}
		String strSQL = "";
		Statement stmtd = conn.createStatement();
		try {
			if (type.equals("psn")) {
				filedMap = setMap(orgName, "personalCabinet",
						"/root/fileCabinet/personalCabinet", "/文档中心/文件柜/个人文件柜",sequence);
				if (DocDBHelper.createDir(docID,filedMap)) {
					strSQL = "insert into AP_FileCabinet(fID,fPersonID,FORGFID,fDocNodeID,fType) values ('"
							+ CommonUtils.createGUID()
							+ "','"
							+ personID
							+ "','"
							+ orgFID
							+ "','"
							+ docID + "','psn')";
					stmtd.executeUpdate(strSQL);
					
				}
			} else if (type.equals("dept")) {
				filedMap = setMap(orgName, "deptCabinet",
						"/root/fileCabinet/deptCabinet", "/文档中心/文件柜/部门文件柜",sequence);
				if (DocDBHelper.createDir(docID, filedMap)) {
					strSQL = "insert into AP_FileCabinet(fID,fPersonID,FORGFID,fDocNodeID,fType) values ('"
						+ CommonUtils.createGUID()
							+ "','"
							+ personID
							+ "','"
							+ orgFID
							+ "','"
							+ docID + "','dept')";
					stmtd.executeUpdate(strSQL);
				}
			}
		} finally {
			if (stmtd != null) {
				stmtd.close();
				stmtd = null;
			}
		}
	}

	public static HashMap<String, Object> setMap(String docName,
			String parentID, String path, String pathName, String sequence)
			throws Exception {
		HashMap<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("sDocName",docName);
		infoMap.put("sParentID",parentID);
		infoMap.put("sDocPath",path);
		infoMap.put("sDocDisplayPath",pathName);
		infoMap.put("sSequence",sequence);
		return infoMap;
	}
	
	
	
	public static void addCabinetPerssion(String docPath,int sAccess){
		String sql = "select a from SA_DocAuth a where a.sDocPath = '"+docPath+"' and a.sAuthorizeeFID='"+ContextHelper.getPersonMember().getFID()+"'";
		Table table;
		//Table table = KSQL.select(sql, null, "/SA/doc/data", null);
		try {
			table = KSQL.select(sql, null, "/SA/doc/data", null);
		}
		catch(Exception e){
			table = KSQL.select(sql, null, "/system/data", null);
		}
		Iterator<Row> it = table.iterator();
		if(!it.hasNext()){
			DocDirPermissions ddp = new DocDirPermissions();
			ddp.add(CommonUtils.createGUID(), docPath, ContextHelper.getPersonMember().getFID(), ContextHelper.getPersonMember().getName(), sAccess);
			ddp.save();
		}
	}
}
