import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.Collection;
import java.util.Iterator;

import com.justep.system.context.ContextHelper;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.model.ModelUtils;

/**
 * 知识地图
 * 
 * @author Administrator
 * 
 */
public class KWMap {
	public static final String OADataModel ="/OA/knowledge/data";
	/**
	 * 获取 知识地图分类 管理员
	 * 
	 * @param folderID
	 * @return
	 * @throws Exception
	 */
	public static String getKnowledgeMapManagers(String folderID){
		String result = null;

		String  sql = "select m.fManagerID from OA_KM_FDManager m where m.fFolderID = '"
							+ folderID + "'";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs = rows.next();
			String managerID = rs.getString("fManagerID");
			if (result == null) {
				result = managerID;
			} else {
				result += "," + managerID;
			}
		}

		if (result == null) {
			result = "";
		}
		return result;
	}

	/**
	 * 获取当前登录人知识地图(知识地图权限)
	 * 
	 * @queryKind = 'map'表示查询知识地图 queryKind='mapKind'表示查询地图分类
	 * @return
	 * @throws Exception
	 */
	public static String getCurrentPsnKnowledgeMap(String folderID,
			String queryKind)  {
		String sql = null;
		String result = "";


			String psnID = com.justep.oa.SysUtils.getCurrentPersonID();
			Collection<String> memberFullIDs = com.justep.oa.SysUtils.getAllPersonMemberFIDs();
			String urlCondition = "";
			for (String memberFullID : memberFullIDs) {
				String condition = " (concat('"+memberFullID+"','/','"+psnID+"','.psn') like concat(r.fOrgFID , '%')) ";
				if (urlCondition.equals(""))
					urlCondition = condition;
				else
					urlCondition += " or " + condition;
			}

			if (queryKind.equals("map")) {
				sql = "select distinct f,f.fName,f.fFullID "
						+ "from OA_KM_Folder f join OA_KM_Rights r "
						+ "on f = r.fFolderID and r.fKWKind = 'Folder' "
						+ "where f.fParent = 'map' " + "and (" + urlCondition
						+ ")";
			} else if (queryKind.equals("mapKind")) {
				sql = "select f,f.fName,f.fFullID from OA_KM_Folder f where f.fParent = '" + folderID + "'";
			} else {
				return "";
			}
			Table table = KSQL.select(sql, null, OADataModel, null);
			Iterator<Row> rows = table.iterator();
			while (rows.hasNext()) {
				Row rs = rows.next();
				String subFolderID = rs.getString("f");
				String subFolderName = rs.getString("fName");
				String subFolderFullID = rs.getString("fFullID");
				if (result.equals("")) {
					result = subFolderID + ":" + subFolderName + ":"
							+ subFolderFullID;
				} else {
					result = result + "|" + subFolderID + ":" + subFolderName
							+ ":" + subFolderFullID;
				}
			}

		return result;
	}
}