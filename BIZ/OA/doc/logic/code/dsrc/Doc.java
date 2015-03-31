import java.math.*;
import java.sql.*;
import java.util.*;
import org.dom4j.*;
import com.justep.system.data.*;
import com.justep.system.opm.OrgUnit;
import com.justep.system.opm.OrgUtils;
import com.justep.system.context.ContextHelper;
import com.justep.system.process.ProcessUtils;

public class Doc {


	public static void insertSignPsn(String sData1,String activity,String fCounterSignIDs,String isAdd){
		String counterSignIDs = "'" + fCounterSignIDs.replaceAll(",", "','") + "'";
		//System.out.println("counterSignIDs=" + counterSignIDs);
		try{
			//if(!isAdd.equals("1")){
			String dsql = "delete from OA_DC_SignPsn s where s.fMasterID = '" + sData1 + "' and s.fActivity = '" 
				+ activity + "' and s.fSignState = '0' ";
			KSQL.executeUpdate(dsql, null, "/OA/doc/data", null);
			//}
			String isql = "insert into OA_DC_SignPsn s (s,s.fMasterID,s.fCounterSignID,s.fCounterSigner," +
					"s.fCounterSignFID,s.fCounterSignFName,s.fActivity,s.fSignState,s.fSignStateName,s.version) " +
					"(select guid(),'" + sData1 + "',ogn.sPersonID,ogn.sName,ogn.sFID,ogn.sFName,'" 
					+ activity + "','0','未处理',0  from V_SA_OPOrg ogn " +
					" where ogn.sValidState = 1 and " +
					"ogn.sPersonID in (" + counterSignIDs + "))" ;
			KSQL.executeUpdate(isql, null, "/OA/doc/data", null);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public static String getCActivityOrgUnit(String process,String activity){
		List<OrgUnit> list = new ArrayList<OrgUnit>();
		String result = "";
		list = OrgUtils.findOrgUnitsHasActivity(process, activity, null, false);
		for(int i=0; i<list.size(); i++){
			result += list.get(i).getFID() + ",";
		}
		if(!result.equals("")){
			result = result.substring(0, result.length()-1);
		}
		return result;
	}
}