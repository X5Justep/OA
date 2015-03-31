import java.math.*;
import java.sql.*;
import java.util.*;

import org.dom4j.*;
import org.dom4j.io.SAXReader;

import com.justep.model.Model;
import com.justep.model.ModelUtils;
import com.justep.model.exception.ModelException;
import com.justep.olap.common.WEBConstants;
import com.justep.system.data.*;
import com.justep.system.opm.OrgUnit;
import com.justep.system.opm.OrgUtils;
import com.justep.system.context.ContextHelper;
import com.justep.system.process.ProcessUtils;
import com.justep.system.util.BizUtils;
import com.justep.util.Utils;

public class DocReport {
	public static Table docSummaryFW(String beginDate,String endDate,String dayNum,String orgIDs)throws DocumentException{
		//System.out.println("1----- beginDate="+beginDate+"--endDate="+endDate+"--dayNum="+dayNum+"--orgIDs="+orgIDs);
		String orclSql = "",msSql = "",mySql="",orgCondition="",orgID="";
		String beginDateOrcl="",endDateOrcl="",beginDateMS="",endDateMS="",beginDateMySQL="",endDateMySQL="";
		String dbNameORCL = "",dbNameMS="",dbNameMySQL="";
		String webAbsPath = WEBConstants.getWebRootAbsPath();
		String configPath = webAbsPath.substring(0, webAbsPath.indexOf("apache-tomcat")) + "apache-tomcat\\conf\\server.xml";
		SAXReader xmlReader = new SAXReader();
		Node ndORCL = xmlReader.read(configPath).getRootElement().selectSingleNode("//Resource[@name='system']/@username");
		dbNameORCL = ndORCL.getStringValue();
		Node ndMS = xmlReader.read(configPath).getRootElement().selectSingleNode("//Resource[@name='system']/@url");
		dbNameMS = ndMS.getStringValue().substring(ndMS.getStringValue().lastIndexOf("/")+1, ndMS.getStringValue().length());
		dbNameMySQL = dbNameMS;
		
		beginDateOrcl = "to_date('"+ beginDate + "','YYYY-MM-DD')";
		endDateOrcl = "to_date('"+ endDate + "','YYYY-MM-DD')";
		
		beginDateMS = "cast('"+beginDate+"' as datetime) ";
		endDateMS = "cast('"+endDate+"' as datetime) ";
		
		beginDateMySQL = "str_to_date('"+ beginDate + "','%Y-%m-%d')";
		endDateMySQL = "str_to_date('"+ endDate + "','%Y-%m-%d')";
		
		if(orgIDs.equals("") || orgIDs.equals(null)){
			orgID = " null as orgID";
			orgCondition = " and 1=1 ";
		}else{
			orgIDs = "'"+ orgIDs + "'";
			orgID = orgIDs.replace(" ", ",") + " as orgID";
			orgIDs = orgIDs.replaceAll(" ","','");
			orgCondition= " and fCreateDeptID in ("+ orgIDs.replaceAll(" ","','") +")";
		}
		
		if(dayNum.equals("") || dayNum.equals(null)){
			orclSql = "select t1.ct SWSPCT,t2.ct QQWBJWSCT,t3.ct DQXSWSCT,t4.ct BJSLCT,t5.ct QQZJRWBJSCT,t6.ct DQXSWBJCT,t7.ct WBJCT,null CSBLRWSCT,null ASBLRWCT,null DAYNUM,"+orgID+","+beginDateOrcl+" BEGINDATE,"+endDateOrcl+" ENDDATE from "
				+ "(select (a1.ct+a2.ct) ct from (select count(d.fid) ct  from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateOrcl+orgCondition+") d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateOrcl+"))) a1,(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and d.fcreatetime >= "+beginDateOrcl+" and d.fcreatetime <= "+endDateOrcl+orgCondition+") a2) t1,"
				+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateOrcl+orgCondition+" ) d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateOrcl+"))) t2,"
				+ "(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and d.fcreatetime >= "+beginDateOrcl+" and d.fcreatetime <= "+endDateOrcl+orgCondition+") t3,"
				+ "(select count(s.sid) ct from "+dbNameORCL+".sa_task s where s.sprocess='/OA/doc/process/sendDoc/sendDocProcess' and s.sstatusid = 'tesFinished' and s.sparentid is null and s.sactualfinishtime >= "+beginDateOrcl+" and s.sactualfinishtime <= "+endDateOrcl+") t4,"
				+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateOrcl+orgCondition+") d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+beginDateOrcl+" and s.sactualfinishtime <= "+endDateOrcl+")) t5,"
				+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime >= "+beginDateOrcl+" and fcreatetime <= "+endDateOrcl+orgCondition+" ) d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= "+endDateOrcl+")) t6,"
				+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime <= "+endDateOrcl+orgCondition+") d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+endDateOrcl+"))) t7";
			
			msSql ="select t1.ct SWSPCT,t2.ct QQWBJWSCT,t3.ct DQXSWSCT,t4.ct BJSLCT,t5.ct QQZJRWBJSCT,t6.ct DQXSWBJCT,t7.ct WBJCT,null CSBLRWSCT,null ASBLRWCT,null DAYNUM,"+orgID+","+beginDateMS+" BEGINDATE,"+endDateMS+" ENDDATE from "
				+ "(select (a1.ct+a2.ct) ct from (select count(d.fid) ct  from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateMS+orgCondition+") d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMS+"))) a1,(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and d.fcreatetime >= "+beginDateMS+" and d.fcreatetime <= "+endDateMS+orgCondition+") a2) t1,"
				+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateMS+orgCondition+" ) d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMS+"))) t2,"
				+ "(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and d.fcreatetime >= "+beginDateMS+" and d.fcreatetime <= "+endDateMS+orgCondition+") t3,"
				+ "(select count(s.sid) ct from "+dbNameMS+".dbo.sa_task s where s.sprocess='/OA/doc/process/sendDoc/sendDocProcess' and s.sstatusid = 'tesFinished' and s.sparentid is null and s.sactualfinishtime >= "+beginDateMS+" and s.sactualfinishtime <= "+endDateMS+") t4,"
				+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateMS+orgCondition+") d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+beginDateMS+" and s.sactualfinishtime <= "+endDateMS+")) t5,"
				+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime >= "+beginDateMS+" and fcreatetime <= "+endDateMS+orgCondition+" ) d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= "+endDateMS+")) t6,"
				+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime <= "+endDateMS+orgCondition+") d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+endDateMS+"))) t7";
			
			mySql ="select t1.ct SWSPCT,t2.ct QQWBJWSCT,t3.ct DQXSWSCT,t4.ct BJSLCT,t5.ct QQZJRWBJSCT,t6.ct DQXSWBJCT,t7.ct WBJCT,null CSBLRWSCT,null ASBLRWCT,null DAYNUM,"+orgID+","+beginDateMySQL+" BEGINDATE,"+endDateMySQL+" ENDDATE from "
			+ "(select (a1.ct+a2.ct) ct from (select count(d.fid) ct  from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateMySQL+orgCondition+") d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMySQL+"))) a1,(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and d.fcreatetime >= "+beginDateMySQL+" and d.fcreatetime <= "+endDateMySQL+orgCondition+") a2) t1,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateMySQL+orgCondition+" ) d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMySQL+"))) t2,"
			+ "(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and d.fcreatetime >= "+beginDateMySQL+" and d.fcreatetime <= "+endDateMySQL+orgCondition+") t3,"
			+ "(select count(s.sid) ct from "+dbNameMySQL+".sa_task s where s.sprocess='/OA/doc/process/sendDoc/sendDocProcess' and s.sstatusid = 'tesFinished' and s.sparentid is null and s.sactualfinishtime >= "+beginDateMySQL+" and s.sactualfinishtime <= "+endDateMySQL+") t4,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateMySQL+orgCondition+") d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+beginDateMySQL+" and s.sactualfinishtime <= "+endDateMySQL+")) t5,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime >= "+beginDateMySQL+" and fcreatetime <= "+endDateMySQL+orgCondition+" ) d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= "+endDateMySQL+")) t6,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime <= "+endDateMySQL+orgCondition+") d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+endDateMySQL+"))) t7";
		}else{
			orclSql = "select t1.ct SWSPCT,t2.ct QQWBJWSCT,t3.ct DQXSWSCT,t4.ct BJSLCT,t5.ct QQZJRWBJSCT,t6.ct DQXSWBJCT,t7.ct WBJCT,t8.ct CSBLRWSCT,t9.ct ASBLRWCT,"+dayNum+" DAYNUM,"+orgID+","+beginDateOrcl+" BEGINDATE,"+endDateOrcl+" ENDDATE from "
				+ "(select (a1.ct+a2.ct) ct from (select count(d.fid) ct  from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateOrcl+orgCondition+") d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateOrcl+"))) a1,(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and d.fcreatetime >= "+beginDateOrcl+" and d.fcreatetime <= "+endDateOrcl+orgCondition+") a2) t1,"
				+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateOrcl+orgCondition+") d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateOrcl+"))) t2,"
				+ "(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and d.fcreatetime >= "+beginDateOrcl+" and d.fcreatetime <= "+endDateOrcl+orgCondition+") t3,"
				+ "(select count(s.sid) ct from "+dbNameORCL+".sa_task s where s.sprocess='/OA/doc/process/sendDoc/sendDocProcess' and s.sstatusid = 'tesFinished' and s.sparentid is null and s.sactualfinishtime >= "+beginDateOrcl+" and s.sactualfinishtime <= "+endDateOrcl+") t4,"
				+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateOrcl+orgCondition+") d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+beginDateOrcl+" and s.sactualfinishtime <= "+endDateOrcl+")) t5,"
				+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime >= "+beginDateOrcl+" and fcreatetime <= "+endDateOrcl+orgCondition+" ) d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= "+endDateOrcl+")) t6,"
				+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime <= "+endDateOrcl+orgCondition+") d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+endDateOrcl+"))) t7,"
				+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime >= "+beginDateOrcl+" and fcreatetime <= "+endDateOrcl+orgCondition+" ) d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime > s.sactualstarttime +("+dayNum+"-1) )) t8,"
				+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime >= "+beginDateOrcl+" and fcreatetime <= "+endDateOrcl+orgCondition+" ) d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime < =s.sactualstarttime + ("+dayNum+"-1))) t9";
			
			msSql = "select t1.ct SWSPCT,t2.ct QQWBJWSCT,t3.ct DQXSWSCT,t4.ct BJSLCT,t5.ct QQZJRWBJSCT,t6.ct DQXSWBJCT,t7.ct WBJCT,t8.ct CSBLRWSCT,t9.ct ASBLRWCT,"+dayNum+" DAYNUM,"+orgID+","+beginDateMS+" BEGINDATE,"+endDateMS+" ENDDATE from "
				+ "(select (a1.ct+a2.ct) ct from (select count(d.fid) ct  from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateMS+orgCondition+") d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMS+"))) a1,(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and d.fcreatetime >= "+beginDateMS+" and d.fcreatetime <= "+endDateMS+orgCondition+") a2) t1,"
				+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateMS+orgCondition+") d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMS+"))) t2,"
				+ "(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and d.fcreatetime >= "+beginDateMS+" and d.fcreatetime <= "+endDateMS+orgCondition+") t3,"
				+ "(select count(s.sid) ct from "+dbNameMS+".dbo.sa_task s where s.sprocess='/OA/doc/process/sendDoc/sendDocProcess' and s.sstatusid = 'tesFinished' and s.sparentid is null and s.sactualfinishtime >= "+beginDateMS+" and s.sactualfinishtime <= "+endDateMS+") t4,"
				+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateMS+orgCondition+") d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+beginDateMS+" and s.sactualfinishtime <= "+endDateMS+")) t5,"
				+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime >= "+beginDateMS+" and fcreatetime <= "+endDateMS+orgCondition+" ) d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= "+endDateMS+")) t6,"
				+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime <= "+endDateMS+orgCondition+") d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+endDateMS+"))) t7,"
				+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime >= "+beginDateMS+" and fcreatetime <= "+endDateMS+orgCondition+" ) d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime > s.sactualstarttime +("+dayNum+"-1) )) t8,"
				+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime >= "+beginDateMS+" and fcreatetime <= "+endDateMS+orgCondition+" ) d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime < =s.sactualstarttime + ("+dayNum+"-1))) t9";
			
			mySql = "select t1.ct SWSPCT,t2.ct QQWBJWSCT,t3.ct DQXSWSCT,t4.ct BJSLCT,t5.ct QQZJRWBJSCT,t6.ct DQXSWBJCT,t7.ct WBJCT,t8.ct CSBLRWSCT,t9.ct ASBLRWCT,"+dayNum+" DAYNUM,"+orgID+","+beginDateMySQL+" BEGINDATE,"+endDateMySQL+" ENDDATE from "
			+ "(select (a1.ct+a2.ct) ct from (select count(d.fid) ct  from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateMySQL+orgCondition+") d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMySQL+"))) a1,(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and d.fcreatetime >= "+beginDateMySQL+" and d.fcreatetime <= "+endDateMySQL+orgCondition+") a2) t1,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateMySQL+orgCondition+") d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMySQL+"))) t2,"
			+ "(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and d.fcreatetime >= "+beginDateMySQL+" and d.fcreatetime <= "+endDateMySQL+orgCondition+") t3,"
			+ "(select count(s.sid) ct from "+dbNameMySQL+".sa_task s where s.sprocess='/OA/doc/process/sendDoc/sendDocProcess' and s.sstatusid = 'tesFinished' and s.sparentid is null and s.sactualfinishtime >= "+beginDateMySQL+" and s.sactualfinishtime <= "+endDateMySQL+") t4,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateMySQL+orgCondition+") d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+beginDateMySQL+" and s.sactualfinishtime <= "+endDateMySQL+")) t5,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime >= "+beginDateMySQL+" and fcreatetime <= "+endDateMySQL+orgCondition+" ) d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= "+endDateMySQL+")) t6,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime <= "+endDateMySQL+orgCondition+") d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+endDateMySQL+"))) t7,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime >= "+beginDateMySQL+" and fcreatetime <= "+endDateMySQL+orgCondition+" ) d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime > date_add(s.sactualstarttime ,INTERVAL ("+dayNum+"-1) day) )) t8,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime >= "+beginDateMySQL+" and fcreatetime <= "+endDateMySQL+orgCondition+" ) d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= date_add(s.sactualstarttime ,INTERVAL ("+dayNum+"-1) day))) t9";
		
		}
		HashMap<String,String> sqlMap = new HashMap<String,String>();
		sqlMap.put("ORACLE",orclSql);
		sqlMap.put("MSSQL",msSql);
		sqlMap.put("MYSQL",mySql);
		
		return SQL.select(sqlMap,null,"/OA/doc/data");
	}

	public static Table docSummarySW(String beginDate,String endDate,String dayNum,String orgIDs)throws DocumentException{
		//System.out.println("2----- beginDate="+beginDate+"--endDate="+endDate+"--dayNum="+dayNum+"--orgIDs="+orgIDs);
		String orclSql = "",msSql = "",mySql="",orgCondition="",orgID="";
		String beginDateOrcl="",endDateOrcl="",beginDateMS="",endDateMS="",beginDateMySQL="",endDateMySQL="";
		String dbNameORCL = "",dbNameMS="",dbNameMySQL="";
		
		String webAbsPath = WEBConstants.getWebRootAbsPath();
		String configPath = webAbsPath.substring(0, webAbsPath.indexOf("apache-tomcat")) + "apache-tomcat\\conf\\server.xml";
		SAXReader xmlReader = new SAXReader();
		Node ndORCL = xmlReader.read(configPath).getRootElement().selectSingleNode("//Resource[@name='system']/@username");
		dbNameORCL = ndORCL.getStringValue();
		Node ndMS = xmlReader.read(configPath).getRootElement().selectSingleNode("//Resource[@name='system']/@url");
		dbNameMS = ndMS.getStringValue().substring(ndMS.getStringValue().lastIndexOf("/")+1, ndMS.getStringValue().length());
		dbNameMySQL = dbNameMS;
		
		beginDateOrcl = "to_date('"+ beginDate + "','YYYY-MM-DD')";
		endDateOrcl = "to_date('"+ endDate + "','YYYY-MM-DD')";
		
		beginDateMS = "cast('"+beginDate+"' as datetime) ";
		endDateMS = "cast('"+endDate+"' as datetime) ";
		
		beginDateMySQL = "str_to_date('"+ beginDate + "','%Y-%m-%d')";
		endDateMySQL = "str_to_date('"+ endDate + "','%Y-%m-%d')";
		
		if(orgIDs.equals("") || orgIDs.equals(null)){
			orgID = " null as orgID";
			orgCondition = " and 1=1 ";
		}else{
			orgIDs = "'"+ orgIDs + "'";
			orgID = orgIDs.replace(" ", ",") + " as orgID";
			orgIDs = orgIDs.replaceAll(" ","','");
			orgCondition= " and fCreateDeptID in ("+ orgIDs.replaceAll(" ","','") +")";
		}
		
		if(dayNum.equals("") || dayNum.equals(null)){
			orclSql = "select t1.ct SWSPCT,t2.ct QQWBJWSCT,t3.ct DQXSWSCT,t4.ct BJSLCT,t5.ct QQZJRWBJSCT,t6.ct DQXSWBJCT,t7.ct WBJCT,null CSBLRWSCT,null ASBLRWCT,null DAYNUM,"+orgID+","+beginDateOrcl+" BEGINDATE,"+endDateOrcl+" ENDDATE from "
			+ "(select (a1.ct+a2.ct) ct from (select count(d.fid) ct  from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateOrcl+orgCondition+") d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateOrcl+"))) a1,(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and d.fcreatetime >= "+beginDateOrcl+" and d.fcreatetime <= "+endDateOrcl+orgCondition+") a2) t1,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateOrcl+orgCondition+" ) d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateOrcl+"))) t2,"
			+ "(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and d.fcreatetime >= "+beginDateOrcl+" and d.fcreatetime <= "+endDateOrcl+orgCondition+") t3,"
			+ "(select count(s.sid) ct from "+dbNameORCL+".sa_task s where s.sprocess='/OA/doc/process/receiveDoc/receiveDocProcess' and s.sstatusid = 'tesFinished' and s.sparentid is null and s.sactualfinishtime >= "+beginDateOrcl+" and s.sactualfinishtime <= "+endDateOrcl+") t4,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateOrcl+orgCondition+") d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+beginDateOrcl+" and s.sactualfinishtime <= "+endDateOrcl+")) t5,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime >= "+beginDateOrcl+" and fcreatetime <= "+endDateOrcl+orgCondition+" ) d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= "+endDateOrcl+")) t6,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime <= "+endDateOrcl+orgCondition+") d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+endDateOrcl+"))) t7";
			
			msSql ="select t1.ct SWSPCT,t2.ct QQWBJWSCT,t3.ct DQXSWSCT,t4.ct BJSLCT,t5.ct QQZJRWBJSCT,t6.ct DQXSWBJCT,t7.ct WBJCT,null CSBLRWSCT,null ASBLRWCT,null DAYNUM,"+orgID+","+beginDateMS+" BEGINDATE,"+endDateMS+" ENDDATE from "
			+ "(select (a1.ct+a2.ct) ct from (select count(d.fid) ct  from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateMS+orgCondition+") d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMS+"))) a1,(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and d.fcreatetime >= "+beginDateMS+" and d.fcreatetime <= "+endDateMS+orgCondition+") a2) t1,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateMS+orgCondition+" ) d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMS+"))) t2,"
			+ "(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and d.fcreatetime >= "+beginDateMS+" and d.fcreatetime <= "+endDateMS+orgCondition+") t3,"
			+ "(select count(s.sid) ct from "+dbNameMS+".dbo.sa_task s where s.sprocess='/OA/doc/process/receiveDoc/receiveDocProcess' and s.sstatusid = 'tesFinished' and s.sparentid is null and s.sactualfinishtime >= "+beginDateMS+" and s.sactualfinishtime <= "+endDateMS+") t4,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateMS+orgCondition+") d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+beginDateMS+" and s.sactualfinishtime <= "+endDateMS+")) t5,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime >= "+beginDateMS+" and fcreatetime <= "+endDateMS+orgCondition+" ) d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= "+endDateMS+")) t6,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime <= "+endDateMS+orgCondition+") d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+endDateMS+"))) t7";
			
			mySql = "select t1.ct SWSPCT,t2.ct QQWBJWSCT,t3.ct DQXSWSCT,t4.ct BJSLCT,t5.ct QQZJRWBJSCT,t6.ct DQXSWBJCT,t7.ct WBJCT,null CSBLRWSCT,null ASBLRWCT,null DAYNUM,"+orgID+","+beginDateMySQL+" BEGINDATE,"+endDateMySQL+" ENDDATE from "
			+ "(select (a1.ct+a2.ct) ct from (select count(d.fid) ct  from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateMySQL+orgCondition+") d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMySQL+"))) a1,(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and d.fcreatetime >= "+beginDateMySQL+" and d.fcreatetime <= "+endDateMySQL+orgCondition+") a2) t1,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateMySQL+orgCondition+" ) d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMySQL+"))) t2,"
			+ "(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and d.fcreatetime >= "+beginDateMySQL+" and d.fcreatetime <= "+endDateMySQL+orgCondition+") t3,"
			+ "(select count(s.sid) ct from "+dbNameMySQL+".sa_task s where s.sprocess='/OA/doc/process/receiveDoc/receiveDocProcess' and s.sstatusid = 'tesFinished' and s.sparentid is null and s.sactualfinishtime >= "+beginDateMySQL+" and s.sactualfinishtime <= "+endDateMySQL+") t4,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateMySQL+orgCondition+") d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+beginDateMySQL+" and s.sactualfinishtime <= "+endDateMySQL+")) t5,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime >= "+beginDateMySQL+" and fcreatetime <= "+endDateMySQL+orgCondition+" ) d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= "+endDateMySQL+")) t6,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime <= "+endDateMySQL+orgCondition+") d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+endDateMySQL+"))) t7";
		}else{
			orclSql = "select t1.ct SWSPCT,t2.ct QQWBJWSCT,t3.ct DQXSWSCT,t4.ct BJSLCT,t5.ct QQZJRWBJSCT,t6.ct DQXSWBJCT,t7.ct WBJCT,t8.ct CSBLRWSCT,t9.ct ASBLRWCT,"+dayNum+" DAYNUM,"+orgID+","+beginDateOrcl+" BEGINDATE,"+endDateOrcl+" ENDDATE from "
			+ "(select (a1.ct+a2.ct) ct from (select count(d.fid) ct  from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateOrcl+orgCondition+") d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateOrcl+"))) a1,(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and d.fcreatetime >= "+beginDateOrcl+" and d.fcreatetime <= "+endDateOrcl+orgCondition+") a2) t1,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateOrcl+orgCondition+") d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateOrcl+"))) t2,"
			+ "(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and d.fcreatetime >= "+beginDateOrcl+" and d.fcreatetime <= "+endDateOrcl+orgCondition+") t3,"
			+ "(select count(s.sid) ct from "+dbNameORCL+".sa_task s where s.sprocess='/OA/doc/process/receiveDoc/receiveDocProcess' and s.sstatusid = 'tesFinished' and s.sparentid is null and s.sactualfinishtime >= "+beginDateOrcl+" and s.sactualfinishtime <= "+endDateOrcl+") t4,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateOrcl+orgCondition+") d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+beginDateOrcl+" and s.sactualfinishtime <= "+endDateOrcl+")) t5,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime >= "+beginDateOrcl+" and fcreatetime <= "+endDateOrcl+orgCondition+" ) d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= "+endDateOrcl+")) t6,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime <= "+endDateOrcl+orgCondition+") d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+endDateOrcl+"))) t7,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime >= "+beginDateOrcl+" and fcreatetime <= "+endDateOrcl+orgCondition+" ) d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime > s.sactualstarttime +("+dayNum+"-1) )) t8,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime >= "+beginDateOrcl+" and fcreatetime <= "+endDateOrcl+orgCondition+" ) d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime < =s.sactualstarttime + ("+dayNum+"-1))) t9";
			
			msSql = "select t1.ct SWSPCT,t2.ct QQWBJWSCT,t3.ct DQXSWSCT,t4.ct BJSLCT,t5.ct QQZJRWBJSCT,t6.ct DQXSWBJCT,t7.ct WBJCT,t8.ct CSBLRWSCT,t9.ct ASBLRWCT,"+dayNum+" DAYNUM,"+orgID+","+beginDateMS+" BEGINDATE,"+endDateMS+" ENDDATE from "
			+ "(select (a1.ct+a2.ct) ct from (select count(d.fid) ct  from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateMS+orgCondition+") d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMS+"))) a1,(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and d.fcreatetime >= "+beginDateMS+" and d.fcreatetime <= "+endDateMS+orgCondition+") a2) t1,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateMS+orgCondition+") d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMS+"))) t2,"
			+ "(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and d.fcreatetime >= "+beginDateMS+" and d.fcreatetime <= "+endDateMS+orgCondition+") t3,"
			+ "(select count(s.sid) ct from "+dbNameMS+".dbo.sa_task s where s.sprocess='/OA/doc/process/receiveDoc/receiveDocProcess' and s.sstatusid = 'tesFinished' and s.sparentid is null and s.sactualfinishtime >= "+beginDateMS+" and s.sactualfinishtime <= "+endDateMS+") t4,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateMS+orgCondition+") d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+beginDateMS+" and s.sactualfinishtime <= "+endDateMS+")) t5,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime >= "+beginDateMS+" and fcreatetime <= "+endDateMS+orgCondition+" ) d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= "+endDateMS+")) t6,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime <= "+endDateMS+orgCondition+") d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+endDateMS+"))) t7,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime >= "+beginDateMS+" and fcreatetime <= "+endDateMS+orgCondition+" ) d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime > s.sactualstarttime +("+dayNum+"-1) )) t8,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime >= "+beginDateMS+" and fcreatetime <= "+endDateMS+orgCondition+" ) d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime < =s.sactualstarttime + ("+dayNum+"-1))) t9";
			
			mySql = "select t1.ct SWSPCT,t2.ct QQWBJWSCT,t3.ct DQXSWSCT,t4.ct BJSLCT,t5.ct QQZJRWBJSCT,t6.ct DQXSWBJCT,t7.ct WBJCT,t8.ct CSBLRWSCT,t9.ct ASBLRWCT,"+dayNum+" DAYNUM,"+orgID+","+beginDateMySQL+" BEGINDATE,"+endDateMySQL+" ENDDATE from "
			+ "(select (a1.ct+a2.ct) ct from (select count(d.fid) ct  from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateMySQL+orgCondition+") d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMySQL+"))) a1,(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and d.fcreatetime >= "+beginDateMySQL+" and d.fcreatetime <= "+endDateMySQL+orgCondition+") a2) t1,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateMySQL+orgCondition+") d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMySQL+"))) t2,"
			+ "(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and d.fcreatetime >= "+beginDateMySQL+" and d.fcreatetime <= "+endDateMySQL+orgCondition+") t3,"
			+ "(select count(s.sid) ct from "+dbNameMySQL+".sa_task s where s.sprocess='/OA/doc/process/receiveDoc/receiveDocProcess' and s.sstatusid = 'tesFinished' and s.sparentid is null and s.sactualfinishtime >= "+beginDateMySQL+" and s.sactualfinishtime <= "+endDateMySQL+") t4,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateMySQL+orgCondition+") d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+beginDateMySQL+" and s.sactualfinishtime <= "+endDateMySQL+")) t5,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime >= "+beginDateMySQL+" and fcreatetime <= "+endDateMySQL+orgCondition+" ) d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= "+endDateMySQL+")) t6,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime <= "+endDateMySQL+orgCondition+") d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+endDateMySQL+"))) t7,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime >= "+beginDateMySQL+" and fcreatetime <= "+endDateMySQL+orgCondition+" ) d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime > date_add(s.sactualstarttime ,INTERVAL ("+dayNum+"-1) day) )) t8,"
			+ "(select count(d.fid) ct from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime >= "+beginDateMySQL+" and fcreatetime <= "+endDateMySQL+orgCondition+" ) d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= date_add(s.sactualstarttime ,INTERVAL ("+dayNum+"-1) day))) t9";
			
		}
		//System.out.println("orclSql2="+orclSql);
		HashMap<String,String> sqlMap = new HashMap<String,String>();
		sqlMap.put("ORACLE",orclSql);
		sqlMap.put("MSSQL",msSql);
		sqlMap.put("MYSQL",mySql);
		
		return SQL.select(sqlMap,null,"/OA/doc/data");
		
	}
	public static Table docSummaryFWChart(String beginDate,String endDate,String dayNum,String orgIDs)throws DocumentException{
		//System.out.println("3----- beginDate="+beginDate+"--endDate="+endDate+"--dayNum="+dayNum+"--orgIDs="+orgIDs);
		String orclSql = "",msSql = "",mySql = "",orgCondition="";
		String beginDateOrcl="",endDateOrcl="",beginDateMS="",endDateMS="",beginDateMySQL="",endDateMySQL="";
		String dbNameORCL = "",dbNameMS="",dbNameMySQL="";
		String webAbsPath = WEBConstants.getWebRootAbsPath();
		String configPath = webAbsPath.substring(0, webAbsPath.indexOf("apache-tomcat")) + "apache-tomcat\\conf\\server.xml";
		SAXReader xmlReader = new SAXReader();
		Node ndORCL = xmlReader.read(configPath).getRootElement().selectSingleNode("//Resource[@name='system']/@username");
		dbNameORCL = ndORCL.getStringValue();
		Node ndMS = xmlReader.read(configPath).getRootElement().selectSingleNode("//Resource[@name='system']/@url");
		dbNameMS = ndMS.getStringValue().substring(ndMS.getStringValue().lastIndexOf("/")+1, ndMS.getStringValue().length());
		dbNameMySQL = dbNameMS;
		
		beginDateOrcl = "to_date('"+ beginDate + "','YYYY-MM-DD')";
		endDateOrcl = "to_date('"+ endDate + "','YYYY-MM-DD')";
		
		beginDateMS = "cast('"+beginDate+"' as datetime) ";
		endDateMS = "cast('"+endDate+"' as datetime) ";
		
		beginDateMySQL = "str_to_date('"+ beginDate + "','%Y-%m-%d')";
		endDateMySQL = "str_to_date('"+ endDate + "','%Y-%m-%d')";
		if(orgIDs.equals("") || orgIDs.equals(null)){
			orgCondition = " and 1=1 ";
		}else{
			orgIDs = "'"+ orgIDs + "'";
			orgIDs = orgIDs.replaceAll(" ","','");
			orgCondition= " and fCreateDeptID in ("+ orgIDs.replaceAll(" ","','") +")";
		}
		
		if(dayNum.equals("") || dayNum.equals(null)){
			orclSql = "select '发文审批总数' FNAME,(a1.ct+a2.ct) CT from (select count(d.fid) ct  from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateOrcl+orgCondition+") d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateOrcl+"))) a1,(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and d.fcreatetime >= "+beginDateOrcl+" and d.fcreatetime <= "+endDateOrcl+orgCondition+") a2 union "
			+ "select '前期未办结文数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateOrcl+orgCondition+" ) d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateOrcl+")) union "
			+ "select '当期新拟文数' FNAME,count(d.fid) CT from  OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and d.fcreatetime >= "+beginDateOrcl+" and d.fcreatetime <= "+endDateOrcl+orgCondition+" union "
			+ "select '办结数量' FNAME,count(s.sid) CT from "+dbNameORCL+".sa_task s where s.sprocess='/OA/doc/process/sendDoc/sendDocProcess' and s.sstatusid = 'tesFinished' and s.sparentid is null and s.sactualfinishtime >= "+beginDateOrcl+" and s.sactualfinishtime <= "+endDateOrcl+" union "
			+ "select '前期转接任务办结数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateOrcl+orgCondition+") d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+beginDateOrcl+" and s.sactualfinishtime <= "+endDateOrcl+") union "
			+ "select '当期新收文办结' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime >= "+beginDateOrcl+" and fcreatetime <= "+endDateOrcl+orgCondition+" ) d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= "+endDateOrcl+") union "
			+ "select '未办结' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime <= "+endDateOrcl+orgCondition+") d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+endDateOrcl+"))";
			
			msSql ="select '发文审批总数' FNAME,(a1.ct+a2.ct) CT from (select count(d.fid) ct  from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateMS+orgCondition+") d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMS+"))) a1,(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and d.fcreatetime >= "+beginDateMS+" and d.fcreatetime <= "+endDateMS+orgCondition+") a2 union "
			+ "select '前期未办结文数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateMS+orgCondition+" ) d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMS+")) union "
			+ "select '当期新拟文数' FNAME,count(d.fid) CT from  OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and d.fcreatetime >= "+beginDateMS+" and d.fcreatetime <= "+endDateMS+orgCondition+" union "
			+ "select '办结数量' FNAME,count(s.sid) CT from "+dbNameMS+".dbo.sa_task s where s.sprocess='/OA/doc/process/sendDoc/sendDocProcess' and s.sstatusid = 'tesFinished' and s.sparentid is null and s.sactualfinishtime >= "+beginDateMS+" and s.sactualfinishtime <= "+endDateMS+" union "
			+ "select '前期转接任务办结数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateMS+orgCondition+") d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+beginDateMS+" and s.sactualfinishtime <= "+endDateMS+") union "
			+ "select '当期新收文办结' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime >= "+beginDateMS+" and fcreatetime <= "+endDateMS+orgCondition+" ) d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= "+endDateMS+") union "
			+ "select '未办结' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime <= "+endDateMS+orgCondition+") d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+endDateMS+"))";
			
			mySql ="select '发文审批总数' FNAME,(a1.ct+a2.ct) CT from (select count(d.fid) ct  from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateMySQL+orgCondition+") d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMySQL+"))) a1,(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and d.fcreatetime >= "+beginDateMySQL+" and d.fcreatetime <= "+endDateMySQL+orgCondition+") a2 union "
			+ "select '前期未办结文数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateMySQL+orgCondition+" ) d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMySQL+")) union "
			+ "select '当期新拟文数' FNAME,count(d.fid) CT from  OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and d.fcreatetime >= "+beginDateMySQL+" and d.fcreatetime <= "+endDateMySQL+orgCondition+" union "
			+ "select '办结数量' FNAME,count(s.sid) CT from "+dbNameMySQL+".sa_task s where s.sprocess='/OA/doc/process/sendDoc/sendDocProcess' and s.sstatusid = 'tesFinished' and s.sparentid is null and s.sactualfinishtime >= "+beginDateMySQL+" and s.sactualfinishtime <= "+endDateMySQL+" union "
			+ "select '前期转接任务办结数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateMySQL+orgCondition+") d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+beginDateMS+" and s.sactualfinishtime <= "+endDateMS+") union "
			+ "select '当期新收文办结' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime >= "+beginDateMS+" and fcreatetime <= "+endDateMS+orgCondition+" ) d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= "+endDateMySQL+") union "
			+ "select '未办结' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime <= "+endDateMySQL+orgCondition+") d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+endDateMySQL+"))";
		}else{
			orclSql = "select '发文审批总数' FNAME,(a1.ct+a2.ct) CT from (select count(d.fid) ct  from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateOrcl+orgCondition+") d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateOrcl+"))) a1,(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and d.fcreatetime >= "+beginDateOrcl+" and d.fcreatetime <= "+endDateOrcl+orgCondition+") a2 union "
			+ "select '前期未办结文数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateOrcl+orgCondition+") d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateOrcl+")) union "
			+ "select '当期新拟文数' FNAME,count(d.fid) CT from  OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and d.fcreatetime >= "+beginDateOrcl+" and d.fcreatetime <= "+endDateOrcl+orgCondition+" union "
			+ "select '办结数量' FNAME,count(s.sid) CT from "+dbNameORCL+".sa_task s where s.sprocess='/OA/doc/process/sendDoc/sendDocProcess' and s.sstatusid = 'tesFinished' and s.sparentid is null and s.sactualfinishtime >= "+beginDateOrcl+" and s.sactualfinishtime <= "+endDateOrcl+" union "
			+ "select '前期转接任务办结数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateOrcl+orgCondition+") d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+beginDateOrcl+" and s.sactualfinishtime <= "+endDateOrcl+") union "
			+ "select '当期新收文办结' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime >= "+beginDateOrcl+" and fcreatetime <= "+endDateOrcl+orgCondition+" ) d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= "+endDateOrcl+") union "
			+ "select '未办结' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime <= "+endDateOrcl+orgCondition+") d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+endDateOrcl+")) union "
			+ "select '超时办理任务数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime >= "+beginDateOrcl+" and fcreatetime <= "+endDateOrcl+orgCondition+" ) d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime > s.sactualstarttime +("+dayNum+"-1) ) union "
			+ "select  '按时办理任务数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime >= "+beginDateOrcl+" and fcreatetime <= "+endDateOrcl+orgCondition+" ) d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime < =s.sactualstarttime + ("+dayNum+"-1))";
			
			msSql = "select '发文审批总数' FNAME,(a1.ct+a2.ct) CT from (select count(d.fid) ct  from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateMS+orgCondition+") d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMS+"))) a1,(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and d.fcreatetime >= "+beginDateMS+" and d.fcreatetime <= "+endDateMS+orgCondition+") a2 union "
			+ "select '前期未办结文数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateMS+orgCondition+") d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMS+")) union "
			+ "select '当期新拟文数' FNAME,count(d.fid) CT from  OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and d.fcreatetime >= "+beginDateMS+" and d.fcreatetime <= "+endDateMS+orgCondition+" union "
			+ "select '办结数量' FNAME,count(s.sid) CT from "+dbNameMS+".dbo.sa_task s where s.sprocess='/OA/doc/process/sendDoc/sendDocProcess' and s.sstatusid = 'tesFinished' and s.sparentid is null and s.sactualfinishtime >= "+beginDateMS+" and s.sactualfinishtime <= "+endDateMS+" union "
			+ "select '前期转接任务办结数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateMS+orgCondition+") d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+beginDateMS+" and s.sactualfinishtime <= "+endDateMS+") union "
			+ "select '当期新收文办结' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime >= "+beginDateMS+" and fcreatetime <= "+endDateMS+orgCondition+" ) d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= "+endDateMS+") union "
			+ "select '未办结' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime <= "+endDateMS+orgCondition+") d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+endDateMS+")) union "
			+ "select '超时办理任务数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime >= "+beginDateMS+" and fcreatetime <= "+endDateMS+orgCondition+" ) d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime > s.sactualstarttime +("+dayNum+"-1) ) union "
			+ "select  '按时办理任务数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime >= "+beginDateMS+" and fcreatetime <= "+endDateMS+orgCondition+" ) d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime < =s.sactualstarttime + ("+dayNum+"-1))";
			
			mySql = "select '发文审批总数' FNAME,(a1.ct+a2.ct) CT from (select count(d.fid) ct  from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateMySQL+orgCondition+") d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMySQL+"))) a1,(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and d.fcreatetime >= "+beginDateMySQL+" and d.fcreatetime <= "+endDateMySQL+orgCondition+") a2 union "
			+ "select '前期未办结文数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateMySQL+orgCondition+") d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMySQL+")) union "
			+ "select '当期新拟文数' FNAME,count(d.fid) CT from  OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and d.fcreatetime >= "+beginDateMySQL+" and d.fcreatetime <= "+endDateMySQL+orgCondition+" union "
			+ "select '办结数量' FNAME,count(s.sid) CT from "+dbNameMySQL+".sa_task s where s.sprocess='/OA/doc/process/sendDoc/sendDocProcess' and s.sstatusid = 'tesFinished' and s.sparentid is null and s.sactualfinishtime >= "+beginDateMySQL+" and s.sactualfinishtime <= "+endDateMySQL+" union "
			+ "select '前期转接任务办结数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime < "+beginDateMySQL+orgCondition+") d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+beginDateMySQL+" and s.sactualfinishtime <= "+endDateMySQL+") union "
			+ "select '当期新收文办结' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime >= "+beginDateMySQL+" and fcreatetime <= "+endDateMySQL+orgCondition+" ) d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= "+endDateMySQL+") union "
			+ "select '未办结' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime <= "+endDateMySQL+orgCondition+") d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+endDateMySQL+")) union "
			+ "select '超时办理任务数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime >= "+beginDateMySQL+" and fcreatetime <= "+endDateMySQL+orgCondition+" ) d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime > date_add(s.sactualstarttime ,INTERVAL ("+dayNum+"-1) day) ) union "
			+ "select  '按时办理任务数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_SendDoc' and fcreatetime >= "+beginDateMySQL+" and fcreatetime <= "+endDateMySQL+orgCondition+" ) d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= date_add(s.sactualstarttime ,INTERVAL ("+dayNum+"-1) day))";
		}
		//System.out.println("orclSql3="+orclSql);
		HashMap<String,String> sqlMap = new HashMap<String,String>();
		sqlMap.put("ORACLE",orclSql);
		sqlMap.put("MSSQL",msSql);
		sqlMap.put("MYSQL",mySql);
		
		return SQL.select(sqlMap,null,"/OA/doc/data");

	}
	public static Table docSummarySWChart(String beginDate,String endDate,String dayNum,String orgIDs)throws DocumentException{
		//System.out.println("4----- beginDate="+beginDate+"--endDate="+endDate+"--dayNum="+dayNum+"--orgIDs="+orgIDs);
		String orclSql = "",msSql = "",mySql = "",orgCondition="";
		String beginDateOrcl="",endDateOrcl="",beginDateMS="",endDateMS="",beginDateMySQL="",endDateMySQL="";
		String dbNameORCL = "",dbNameMS="",dbNameMySQL="";
		String webAbsPath = WEBConstants.getWebRootAbsPath();
		String configPath = webAbsPath.substring(0, webAbsPath.indexOf("apache-tomcat")) + "apache-tomcat\\conf\\server.xml";
		SAXReader xmlReader = new SAXReader();
		Node ndORCL = xmlReader.read(configPath).getRootElement().selectSingleNode("//Resource[@name='system']/@username");
		dbNameORCL = ndORCL.getStringValue();
		Node ndMS = xmlReader.read(configPath).getRootElement().selectSingleNode("//Resource[@name='system']/@url");
		dbNameMS = ndMS.getStringValue().substring(ndMS.getStringValue().lastIndexOf("/")+1, ndMS.getStringValue().length());
		dbNameMySQL = dbNameMS;
		
		beginDateOrcl = "to_date('"+ beginDate + "','YYYY-MM-DD')";
		endDateOrcl = "to_date('"+ endDate + "','YYYY-MM-DD')";
		
		beginDateMS = "cast('"+beginDate+"' as datetime) ";
		endDateMS = "cast('"+endDate+"' as datetime) ";
		
		beginDateMySQL = "str_to_date('"+ beginDate + "','%Y-%m-%d')";
		endDateMySQL = "str_to_date('"+ endDate + "','%Y-%m-%d')";
		if(orgIDs.equals("") || orgIDs.equals(null)){
			orgCondition = " and 1=1 ";
		}else{
			orgIDs = "'"+ orgIDs + "'";
			orgIDs = orgIDs.replaceAll(" ","','");
			orgCondition= " and fCreateDeptID in ("+ orgIDs.replaceAll(" ","','") +")";
		}
		
		if(dayNum.equals("") || dayNum.equals(null)){
			orclSql = "select '发文审批总数' FNAME,(a1.ct+a2.ct) CT from (select count(d.fid) ct  from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateOrcl+orgCondition+") d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateOrcl+"))) a1,(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and d.fcreatetime >= "+beginDateOrcl+" and d.fcreatetime <= "+endDateOrcl+orgCondition+") a2 union "
			+ "select '前期未办结文数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateOrcl+orgCondition+" ) d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateOrcl+")) union "
			+ "select '当期新拟文数' FNAME,count(d.fid) CT from  OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and d.fcreatetime >= "+beginDateOrcl+" and d.fcreatetime <= "+endDateOrcl+orgCondition+" union "
			+ "select '办结数量' FNAME,count(s.sid) CT from "+dbNameORCL+".sa_task s where s.sprocess='/OA/doc/process/sendDoc/sendDocProcess' and s.sstatusid = 'tesFinished' and s.sparentid is null and s.sactualfinishtime >= "+beginDateOrcl+" and s.sactualfinishtime <= "+endDateOrcl+" union "
			+ "select '前期转接任务办结数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateOrcl+orgCondition+") d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+beginDateOrcl+" and s.sactualfinishtime <= "+endDateOrcl+") union "
			+ "select '当期新收文办结' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime >= "+beginDateOrcl+" and fcreatetime <= "+endDateOrcl+orgCondition+" ) d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= "+endDateOrcl+") union "
			+ "select '未办结' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime <= "+endDateOrcl+orgCondition+") d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+endDateOrcl+"))";
			
			msSql ="select '发文审批总数' FNAME,(a1.ct+a2.ct) CT from (select count(d.fid) ct  from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateMS+orgCondition+") d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMS+"))) a1,(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and d.fcreatetime >= "+beginDateMS+" and d.fcreatetime <= "+endDateMS+orgCondition+") a2 union "
			+ "select '前期未办结文数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateMS+orgCondition+" ) d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMS+")) union "
			+ "select '当期新拟文数' FNAME,count(d.fid) CT from  OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and d.fcreatetime >= "+beginDateMS+" and d.fcreatetime <= "+endDateMS+orgCondition+" union "
			+ "select '办结数量' FNAME,count(s.sid) CT from "+dbNameMS+".dbo.sa_task s where s.sprocess='/OA/doc/process/sendDoc/sendDocProcess' and s.sstatusid = 'tesFinished' and s.sparentid is null and s.sactualfinishtime >= "+beginDateMS+" and s.sactualfinishtime <= "+endDateMS+" union "
			+ "select '前期转接任务办结数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateMS+orgCondition+") d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+beginDateMS+" and s.sactualfinishtime <= "+endDateMS+") union "
			+ "select '当期新收文办结' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime >= "+beginDateMS+" and fcreatetime <= "+endDateMS+orgCondition+" ) d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= "+endDateMS+") union "
			+ "select '未办结' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime <= "+endDateMS+orgCondition+") d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+endDateMS+"))";
			
			mySql ="select '发文审批总数' FNAME,(a1.ct+a2.ct) CT from (select count(d.fid) ct  from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateMySQL+orgCondition+") d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMS+"))) a1,(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and d.fcreatetime >= "+beginDateMS+" and d.fcreatetime <= "+endDateMS+orgCondition+") a2 union "
			+ "select '前期未办结文数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateMySQL+orgCondition+" ) d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMS+")) union "
			+ "select '当期新拟文数' FNAME,count(d.fid) CT from  OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and d.fcreatetime >= "+beginDateMySQL+" and d.fcreatetime <= "+endDateMySQL+orgCondition+" union "
			+ "select '办结数量' FNAME,count(s.sid) CT from "+dbNameMySQL+".sa_task s where s.sprocess='/OA/doc/process/sendDoc/sendDocProcess' and s.sstatusid = 'tesFinished' and s.sparentid is null and s.sactualfinishtime >= "+beginDateMySQL+" and s.sactualfinishtime <= "+endDateMySQL+" union "
			+ "select '前期转接任务办结数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateMySQL+orgCondition+") d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+beginDateMySQL+" and s.sactualfinishtime <= "+endDateMySQL+") union "
			+ "select '当期新收文办结' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime >= "+beginDateMySQL+" and fcreatetime <= "+endDateMySQL+orgCondition+" ) d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= "+endDateMySQL+") union "
			+ "select '未办结' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime <= "+endDateMySQL+orgCondition+") d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+endDateMySQL+"))";
		}else{
			orclSql = "select '发文审批总数' FNAME,(a1.ct+a2.ct) CT from (select count(d.fid) ct  from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateOrcl+orgCondition+") d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateOrcl+"))) a1,(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and d.fcreatetime >= "+beginDateOrcl+" and d.fcreatetime <= "+endDateOrcl+orgCondition+") a2 union "
			+ "select '前期未办结文数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateOrcl+orgCondition+") d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateOrcl+")) union "
			+ "select '当期新拟文数' FNAME,count(d.fid) CT from  OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and d.fcreatetime >= "+beginDateOrcl+" and d.fcreatetime <= "+endDateOrcl+orgCondition+" union "
			+ "select '办结数量' FNAME,count(s.sid) CT from "+dbNameORCL+".sa_task s where s.sprocess='/OA/doc/process/sendDoc/sendDocProcess' and s.sstatusid = 'tesFinished' and s.sparentid is null and s.sactualfinishtime >= "+beginDateOrcl+" and s.sactualfinishtime <= "+endDateOrcl+" union "
			+ "select '前期转接任务办结数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateOrcl+orgCondition+") d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+beginDateOrcl+" and s.sactualfinishtime <= "+endDateOrcl+") union "
			+ "select '当期新收文办结' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime >= "+beginDateOrcl+" and fcreatetime <= "+endDateOrcl+orgCondition+" ) d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= "+endDateOrcl+") union "
			+ "select '未办结' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime <= "+endDateOrcl+orgCondition+") d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+endDateOrcl+")) union "
			+ "select '超时办理任务数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime >= "+beginDateOrcl+" and fcreatetime <= "+endDateOrcl+orgCondition+" ) d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime > s.sactualstarttime +("+dayNum+"-1) ) union "
			+ "select  '按时办理任务数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime >= "+beginDateOrcl+" and fcreatetime <= "+endDateOrcl+orgCondition+" ) d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime < =s.sactualstarttime + ("+dayNum+"-1))";
			
			msSql = "select '发文审批总数' FNAME,(a1.ct+a2.ct) CT from (select count(d.fid) ct  from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateMS+orgCondition+") d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMS+"))) a1,(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and d.fcreatetime >= "+beginDateMS+" and d.fcreatetime <= "+endDateMS+orgCondition+") a2 union "
			+ "select '前期未办结文数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateMS+orgCondition+") d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMS+")) union "
			+ "select '当期新拟文数' FNAME,count(d.fid) CT from  OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and d.fcreatetime >= "+beginDateMS+" and d.fcreatetime <= "+endDateMS+orgCondition+" union "
			+ "select '办结数量' FNAME,count(s.sid) CT from "+dbNameMS+".dbo.sa_task s where s.sprocess='/OA/doc/process/sendDoc/sendDocProcess' and s.sstatusid = 'tesFinished' and s.sparentid is null and s.sactualfinishtime >= "+beginDateMS+" and s.sactualfinishtime <= "+endDateMS+" union "
			+ "select '前期转接任务办结数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateMS+orgCondition+") d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+beginDateMS+" and s.sactualfinishtime <= "+endDateMS+") union "
			+ "select '当期新收文办结' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime >= "+beginDateMS+" and fcreatetime <= "+endDateMS+orgCondition+" ) d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= "+endDateMS+") union "
			+ "select '未办结' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime <= "+endDateMS+orgCondition+") d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+endDateMS+")) union "
			+ "select '超时办理任务数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime >= "+beginDateMS+" and fcreatetime <= "+endDateMS+orgCondition+" ) d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime > s.sactualstarttime +("+dayNum+"-1) ) union "
			+ "select  '按时办理任务数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime >= "+beginDateMS+" and fcreatetime <= "+endDateMS+orgCondition+" ) d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime < =s.sactualstarttime + ("+dayNum+"-1))";
			
			mySql = "select '发文审批总数' FNAME,(a1.ct+a2.ct) CT from (select count(d.fid) ct  from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateMySQL+orgCondition+") d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMySQL+"))) a1,(select count(d.fid) ct from  OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and d.fcreatetime >= "+beginDateMySQL+" and d.fcreatetime <= "+endDateMySQL+orgCondition+") a2 union "
			+ "select '前期未办结文数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateMySQL+orgCondition+") d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime > "+beginDateMySQL+")) union "
			+ "select '当期新拟文数' FNAME,count(d.fid) CT from  OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and d.fcreatetime >= "+beginDateMySQL+" and d.fcreatetime <= "+endDateMySQL+orgCondition+" union "
			+ "select '办结数量' FNAME,count(s.sid) CT from "+dbNameMySQL+".sa_task s where s.sprocess='/OA/doc/process/sendDoc/sendDocProcess' and s.sstatusid = 'tesFinished' and s.sparentid is null and s.sactualfinishtime >= "+beginDateMySQL+" and s.sactualfinishtime <= "+endDateMySQL+" union "
			+ "select '前期转接任务办结数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime < "+beginDateMySQL+orgCondition+") d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+beginDateMySQL+" and s.sactualfinishtime <= "+endDateMySQL+") union "
			+ "select '当期新收文办结' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime >= "+beginDateMySQL+" and fcreatetime <= "+endDateMS+orgCondition+" ) d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= "+endDateMySQL+") union "
			+ "select '未办结' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime <= "+endDateMySQL+orgCondition+") d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid <> 'tesFinished' or (s.sstatusid = 'tesFinished' and s.sactualfinishtime >= "+endDateMySQL+")) union "
			+ "select '超时办理任务数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime >= "+beginDateMySQL+" and fcreatetime <= "+endDateMySQL+orgCondition+" ) d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime > date_add(s.sactualstarttime ,INTERVAL ("+dayNum+"-1) day) ) union "
			+ "select  '按时办理任务数' FNAME,count(d.fid) CT from (select fid from OA_DC_Doc d  where fDocType='OA_DC_ReceiveDoc' and fcreatetime >= "+beginDateMySQL+" and fcreatetime <= "+endDateMySQL+orgCondition+" ) d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= date_add(s.sactualstarttime ,INTERVAL ("+dayNum+"-1) day))";
		}
		//System.out.println("orclSql4="+orclSql);
		HashMap<String,String> sqlMap = new HashMap<String,String>();
		sqlMap.put("ORACLE",orclSql);
		sqlMap.put("MSSQL",msSql);
		sqlMap.put("MYSQL",mySql);
		
		return SQL.select(sqlMap,null,"/OA/doc/data");
		
	}
	
	public static Table docSummaryTaskDetail(String taskType,String docType,String beginDate,String endDate,String dayNum,String orgIDs)throws DocumentException{
		String orclSql = "",msSql = "",mySql = "",orgCondition="",orgID="";
		String beginDateOrcl="",endDateOrcl="",beginDateMS="",endDateMS="",beginDateMySQL="",endDateMySQL="";
		String dbNameORCL = "",dbNameMS="",dbNameMySQL="";
		
		String webAbsPath = WEBConstants.getWebRootAbsPath();
		String configPath = webAbsPath.substring(0, webAbsPath.indexOf("apache-tomcat")) + "apache-tomcat\\conf\\server.xml";
		SAXReader xmlReader = new SAXReader();
		Node ndORCL = xmlReader.read(configPath).getRootElement().selectSingleNode("//Resource[@name='system']/@username");
		dbNameORCL = ndORCL.getStringValue();
		Node ndMS = xmlReader.read(configPath).getRootElement().selectSingleNode("//Resource[@name='system']/@url");
		dbNameMS = ndMS.getStringValue().substring(ndMS.getStringValue().lastIndexOf("/")+1, ndMS.getStringValue().length());		
		dbNameMySQL = dbNameMS;
		
		beginDateOrcl = "to_date('"+ beginDate + "','YYYY-MM-DD')";
		endDateOrcl = "to_date('"+ endDate + "','YYYY-MM-DD')";
		
		beginDateMS = "cast('"+beginDate+"' as datetime) ";
		endDateMS = "cast('"+endDate+"' as datetime) ";
		
		beginDateMySQL = "str_to_date('"+ beginDate + "','%Y-%m-%d')";
		endDateMySQL = "str_to_date('"+ endDate + "','%Y-%m-%d')";
		if(orgIDs.equals("") || orgIDs.equals(null)){
			orgID = " null as orgID";
			orgCondition = " and 1=1 ";
		}else{
			orgIDs = "'"+ orgIDs + "'";
			orgID = orgIDs + " as orgID";
			orgIDs = orgIDs.replaceAll(" ","','");
			orgCondition= " and fCreateDeptID in ("+ orgIDs.replaceAll(" ","','") +")";
		}
		
		if(taskType.equals("csbl")){
			orclSql = "select FID,FTITLE,FDOCTYPE,FDOCTYPENAME,FDOCKINDNAME,FKEYWORD,FDOCNUMBER,FSOURCEDOCNUMBER,FDOCEXIGENCELEVELNAME,FDOCSECRETLEVELNAME,FCREATEDEPTNAME,FCREATEPSNNAME,FCREATETIME from (select d.fID FID,d.fTitle,d.fDocType FDOCTYPE,d.fDocTypeName,d.fDocKindName,d.fKeyword,d.fDocNumber,d.fSourceDocNumber,d.fDocExigenceLevelName,d.fDocSecretLevelName,d.fCreateDeptName,d.fCreatePsnName,d.fCreateTime from OA_DC_Doc d  where d.fDocType='"+docType+"' and fcreatetime >= "+beginDateOrcl+" and fcreatetime <= "+endDateOrcl+orgCondition+" ) d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime > s.sactualstarttime +("+dayNum+"-1) )";
			msSql = "select FID,FTITLE,FDOCTYPE,FDOCTYPENAME,FDOCKINDNAME,FKEYWORD,FDOCNUMBER,FSOURCEDOCNUMBER,FDOCEXIGENCELEVELNAME,FDOCSECRETLEVELNAME,FCREATEDEPTNAME,FCREATEPSNNAME,FCREATETIME from (select d.fID FID,d.fTitle,d.fDocType FDOCTYPE,d.fDocTypeName,d.fDocKindName,d.fKeyword,d.fDocNumber,d.fSourceDocNumber,d.fDocExigenceLevelName,d.fDocSecretLevelName,d.fCreateDeptName,d.fCreatePsnName,d.fCreateTime from OA_DC_Doc d  where d.fDocType='"+docType+"' and fcreatetime >= "+beginDateMS+" and fcreatetime <= "+endDateMS+orgCondition+" ) d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime > s.sactualstarttime +("+dayNum+"-1) )";
			mySql = "select FID,FTITLE,FDOCTYPE,FDOCTYPENAME,FDOCKINDNAME,FKEYWORD,FDOCNUMBER,FSOURCEDOCNUMBER,FDOCEXIGENCELEVELNAME,FDOCSECRETLEVELNAME,FCREATEDEPTNAME,FCREATEPSNNAME,FCREATETIME from (select d.fID FID,d.fTitle,d.fDocType FDOCTYPE,d.fDocTypeName,d.fDocKindName,d.fKeyword,d.fDocNumber,d.fSourceDocNumber,d.fDocExigenceLevelName,d.fDocSecretLevelName,d.fCreateDeptName,d.fCreatePsnName,d.fCreateTime from OA_DC_Doc d  where d.fDocType='"+docType+"' and fcreatetime >= "+beginDateMySQL+" and fcreatetime <= "+endDateMySQL+orgCondition+" ) d join "+dbNameMS+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime > date_add(s.sactualstarttime ,INTERVAL ("+dayNum+"-1) day))";
		}else if(taskType.equals("asbl")){
			orclSql = "select FID,FTITLE,FDOCTYPE,FDOCTYPENAME,FDOCKINDNAME,FKEYWORD,FDOCNUMBER,FSOURCEDOCNUMBER,FDOCEXIGENCELEVELNAME,FDOCSECRETLEVELNAME,FCREATEDEPTNAME,FCREATEPSNNAME,FCREATETIME from (select d.fID FID,d.fTitle,d.fDocType FDOCTYPE,d.fDocTypeName,d.fDocKindName,d.fKeyword,d.fDocNumber,d.fSourceDocNumber,d.fDocExigenceLevelName,d.fDocSecretLevelName,d.fCreateDeptName,d.fCreatePsnName,d.fCreateTime from OA_DC_Doc d  where d.fDocType='"+docType+"' and fcreatetime >= "+beginDateOrcl+" and fcreatetime <= "+endDateOrcl+orgCondition+" ) d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime < =s.sactualstarttime + ("+dayNum+"-1))";
			msSql = "select FID,FTITLE,FDOCTYPE,FDOCTYPENAME,FDOCKINDNAME,FKEYWORD,FDOCNUMBER,FSOURCEDOCNUMBER,FDOCEXIGENCELEVELNAME,FDOCSECRETLEVELNAME,FCREATEDEPTNAME,FCREATEPSNNAME,FCREATETIME from (select d.fID FID,d.fTitle,d.fDocType FDOCTYPE,d.fDocTypeName,d.fDocKindName,d.fKeyword,d.fDocNumber,d.fSourceDocNumber,d.fDocExigenceLevelName,d.fDocSecretLevelName,d.fCreateDeptName,d.fCreatePsnName,d.fCreateTime from OA_DC_Doc d  where d.fDocType='"+docType+"' and fcreatetime >= "+beginDateMS+" and fcreatetime <= "+endDateMS+orgCondition+" ) d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime < =s.sactualstarttime + ("+dayNum+"-1))";
			mySql = "select FID,FTITLE,FDOCTYPE,FDOCTYPENAME,FDOCKINDNAME,FKEYWORD,FDOCNUMBER,FSOURCEDOCNUMBER,FDOCEXIGENCELEVELNAME,FDOCSECRETLEVELNAME,FCREATEDEPTNAME,FCREATEPSNNAME,FCREATETIME from (select d.fID FID,d.fTitle,d.fDocType FDOCTYPE,d.fDocTypeName,d.fDocKindName,d.fKeyword,d.fDocNumber,d.fSourceDocNumber,d.fDocExigenceLevelName,d.fDocSecretLevelName,d.fCreateDeptName,d.fCreatePsnName,d.fCreateTime from OA_DC_Doc d  where d.fDocType='"+docType+"' and fcreatetime >= "+beginDateMySQL+" and fcreatetime <= "+endDateMySQL+orgCondition+" ) d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= date_add(s.sactualstarttime ,INTERVAL ("+dayNum+"-1) day))";
			
		}
		//System.out.println("orclSql5="+orclSql);
		HashMap<String,String> sqlMap = new HashMap<String,String>();
		sqlMap.put("ORACLE",orclSql);
		sqlMap.put("MSSQL",msSql);
		sqlMap.put("MYSQL",mySql);
		
		return SQL.select(sqlMap,null,"/OA/doc/data");
	}
	public static Table docSummaryTaskDetailTitle(String taskType,String docType,String beginDate,String endDate,String dayNum,String orgIDs)throws DocumentException{
		//System.out.println("beginDate="+beginDate+"--endDate="+endDate);
		String orclSql = "",msSql = "",mySql="",title="";
		String dbNameORCL = "",dbNameMS="",dbNameMySQL="";
		
		String webAbsPath = WEBConstants.getWebRootAbsPath();
		String configPath = webAbsPath.substring(0, webAbsPath.indexOf("apache-tomcat")) + "apache-tomcat\\conf\\server.xml";
		SAXReader xmlReader = new SAXReader();
		Node ndORCL = xmlReader.read(configPath).getRootElement().selectSingleNode("//Resource[@name='system']/@username");
		dbNameORCL = ndORCL.getStringValue();
		Node ndMS = xmlReader.read(configPath).getRootElement().selectSingleNode("//Resource[@name='system']/@url");
		dbNameMS = ndMS.getStringValue().substring(ndMS.getStringValue().lastIndexOf("/")+1, ndMS.getStringValue().length());
		dbNameMySQL = dbNameMS;
		
		if(orgIDs.equals("") || orgIDs.equals(null)){
			if(taskType.equals("csbl")){
				if(docType.equals("OA_DC_SendDoc")){
					title = "发文超时办理任务";
				}else if(docType.equals("OA_DC_ReceiveDoc")){
					title = "收文超时办理任务";
				}
			}else if(taskType.equals("asbl")){
				if(docType.equals("OA_DC_SendDoc")){
					title = "发文按时办理任务";
				}else if(docType.equals("OA_DC_ReceiveDoc")){
					title = "收文按时办理任务";
				}
				
			}
			orclSql = "select '"+title+"' as TITLE,'统计区间：'|| '"+beginDate+"' || ' 至  '  || '"+endDate+"' ||  '    预定办理周期：'||"+dayNum+" ||'(天)  '  || '      部门：全部' as SNAME from "+dbNameORCL+".SA_OPOrg o where rownum=1";
			msSql = "select TOP 1 '"+title+"' as TITLE,'统计区间：'+ '"+beginDate+"' + ' 至  '  + '"+endDate+"' +  '    预定办理周期：'+'"+dayNum+"' +'(天)  '  + '      部门：全部' as SNAME from "+dbNameMS+".dbo.SA_OPOrg o ";
			mySql = "select '"+title+"' as TITLE,concat('统计区间：', '"+beginDate+"' , ' 至  '  , '"+endDate+"' ,  '    预定办理周期：','"+dayNum+"','(天)  '  , '      部门：全部') as SNAME from "+dbNameMySQL+".SA_OPOrg o limit 1";
			
		}else{
			if(taskType.equals("csbl")){
				if(docType.equals("OA_DC_SendDoc")){
					title = "发文超时办理任务";
				}else if(docType.equals("OA_DC_ReceiveDoc")){
					title = "收文超时办理任务";
				}
			}else if(taskType.equals("asbl")){
				if(docType.equals("OA_DC_SendDoc")){
					title = "发文按时办理任务";
				}else if(docType.equals("OA_DC_ReceiveDoc")){
					title = "收文按时办理任务";
				}
				
			}
			String orgIDArr[] = orgIDs.split(" ");
			String sqlQueryORCL="",sqlQueryMS="",sqlQueryMySQL="",sqlQueryORCLs="",sqlQueryMSs="",sqlQueryMySQLs="",sqlQOrcl="",sqlQMS="",sqlQMySQL="",sqlROrcl="",sqlRMS="",sqlRMySQL="";
			for(int i=0;i<orgIDArr.length;i++){
				sqlQueryORCL = "(select o.sName from "+dbNameORCL+".SA_OPOrg o where o.sID = '"+orgIDArr[i].trim()+"' and o.sValidState=1) t"+i;
				sqlQueryMS = "(select o.sName from "+dbNameMS+".dbo.SA_OPOrg o where o.sID = '"+orgIDArr[i].trim()+"' and o.sValidState=1) t"+i;
				sqlQueryMySQL = "(select o.sName from "+dbNameMySQL+".SA_OPOrg o where o.sID = '"+orgIDArr[i].trim()+"' and o.sValidState=1) t"+i;
				if(sqlQueryORCLs.equals("")){
					sqlQueryORCLs = sqlQueryORCL;
					sqlQueryMSs = sqlQueryMS;
					sqlQueryMySQLs = sqlQueryMySQL;
					sqlQOrcl = "select t"+i+".sName";
					sqlQMS = "select t"+i+".sName";
					sqlQMySQL = "select t"+i+".sName";
				}else{
					sqlQueryORCLs = sqlQueryORCLs +","+sqlQueryORCL;
					sqlQueryMSs = sqlQueryMSs +","+sqlQueryMS;
					sqlQueryMySQLs = sqlQueryMySQLs +","+sqlQueryMySQL;
					sqlQOrcl = sqlQOrcl +"|| ',' || t"+i+".sName";
					sqlQMS = sqlQMS +"+ ',' + t"+i+".sName";
					sqlQMySQL = sqlQMySQL +"+ ',' + t"+i+".sName";
				}
			}
			sqlROrcl = sqlQOrcl +" as sName from "+sqlQueryORCLs;
			sqlRMS = sqlQMS  +" as sName from "+sqlQueryMSs;
			sqlRMySQL = sqlRMySQL  +" as sName from "+sqlRMySQL;
			orclSql = "select '"+title+"' as TITLE,'统计区间：'|| '"+beginDate+"' || ' 至  '  || '"+endDate+"' ||  '    预定办理周期：'||"+dayNum+" ||'(天)  '  || '      部门：'|| a.sName as SNAME from ("+sqlROrcl+") a";
			msSql = "select '"+title+"' as TITLE,'统计区间：'+ '"+beginDate+"' + ' 至  '  + '"+endDate+"' +  '    预定办理周期：'+'"+dayNum+"' +'(天)  '  + '      部门：'+ a.sName as SNAME from ("+sqlRMS+") a";
			mySql = "select '"+title+"' as TITLE,concat('统计区间：', '"+beginDate+"' , ' 至  '  ,'"+endDate+"' ,  '    预定办理周期：','"+dayNum+"' ,'(天)  '  , '      部门：', a.sName) as SNAME from ("+sqlRMySQL+") a";
		}
		
		//System.out.println("msSql="+msSql);
		HashMap<String,String> sqlMap = new HashMap<String,String>();
		sqlMap.put("ORACLE",orclSql);
		sqlMap.put("MSSQL",msSql);
		sqlMap.put("MYSQL",mySql);
		
		return SQL.select(sqlMap,null,"/OA/doc/data");
	}
	
	public static Table sendDocFlowTrack(String id)throws DocumentException{
		String sql = "select d.FTITLE,d.fExtendStr1 FDOCNUMBER ,d.FDRAFTPERNAME,e.fcreatepsnname as FDEPTAPPROVEPSNNAME from (select fID,fTitle,fExtendStr1,fDraftPerName from OA_DC_Doc where fid ='"+id+"') d left join (select fCreatePsnName,fmasterid from oa_pub_execute where fActivityFName='/OA/doc/process/sendDoc/deptApproveActivity') e on d.fid = e.fmasterid";
		
		//System.out.println("orclSql7="+orclSql);
		HashMap<String,String> sqlMap = new HashMap<String,String>();
		sqlMap.put("DEFAULT",sql);
		
		return SQL.select(sqlMap,null,"/OA/doc/data");
	}
	public static Table sendDocDetailFlowTrack(String id)throws DocumentException{
		String orclSql = "",msSql = "",mySql="";
		String dbNameORCL = "",dbNameMS="",dbNameMySQL="";
		String webAbsPath = WEBConstants.getWebRootAbsPath();
		String configPath = webAbsPath.substring(0, webAbsPath.indexOf("apache-tomcat")) + "apache-tomcat\\conf\\server.xml";
		SAXReader xmlReader = new SAXReader();
		Node ndORCL = xmlReader.read(configPath).getRootElement().selectSingleNode("//Resource[@name='system']/@username");
		dbNameORCL = ndORCL.getStringValue();
		Node ndMS = xmlReader.read(configPath).getRootElement().selectSingleNode("//Resource[@name='system']/@url");
		dbNameMS = ndMS.getStringValue().substring(ndMS.getStringValue().lastIndexOf("/")+1, ndMS.getStringValue().length());
		dbNameMySQL = dbNameMS;
		
		orclSql = "select t1.factivityLabel FACTIVITY,t1.FCOUNTERSIGNER,t2.sactualfinishtime FUPDATETIME,case when t2.FSTATE is null then '未处理' else t2.fState end as fState from ((select distinct r.fmasterid,r.fcountersignid, r.fcountersigner, r.factivity,case when r.factivity = 'deptMeetingActivity' then '部门会签' else case when r.factivity = 'reviewActivity'then '领导签阅' else '领导签发' end end as factivityLabel from OA_DC_SignPsn r where r.fmasterid = '"+id+"') union (select distinct e.fmasterid, e.fcreatepsnid, e.fcreatepsnname,'meetingActivity' factivityfname,e.factivitylabel from oa_pub_execute e  where e.fmasterid = '"+id+"' and e.factivityfname='/OA/doc/process/sendDoc/meetingActivity')) t1 left join (select t.sdata1,t.sactivity,t.sexecutorpersonid,t.screatetime,t.sstatusname,t.sactualfinishtime,case when t.sstatusname='尚未处理' then '未处理' else '已处理' end as fState from "+dbNameORCL+".sa_task t ,(select s.sdata1,s.sactivity,s.sexecutorpersonid,max(s.screatetime) screatetime from "+dbNameORCL+".sa_task s where s.sdata1='"+id+"' and s.sactivity in ('deptMeetingActivity','reviewActivity','signActivity') and s.sexecutorpersonid is not null group by s.sdata1,s.sactivity,s.sexecutorpersonid) w where t.sdata1 = w.sdata1 and t.sactivity=w.sactivity and t.sexecutorpersonid=w.sexecutorpersonid and t.screatetime=w.screatetime ) t2 on t1.fmasterid=t2.sdata1 and t1.factivity=t2.sactivity and t1.fcountersignid=t2.sexecutorpersonid  union select p.factivityLabel,p.fpersonname,p.fupdatetime,p.fState from (select '阅知情况'as factivityLabel,r.fmasterid,r.fpersonid,r.fpersonname,case when e.fupdatetime IS NOT NULL then e.fupdatetime else e.fcreatetime end fupdatetime,case when e.fcreatepsnid is null then '未阅' else '已阅' end as fState from (select fmasterid,fpersonid,fpersonname from oa_dc_readerrange where fmasterid='"+id+"')r left join oa_pub_execute e on r.fmasterid = e.fmasterid and r.fpersonid = e.fcreatepsnid and e.factivityfname = 'readerOpinion') p";
		msSql = "select t1.factivityLabel FACTIVITY,t1.FCOUNTERSIGNER,t2.sactualfinishtime FUPDATETIME,case when t2.FSTATE is null then '未处理' else t2.fState end as fState from ((select distinct r.fmasterid,r.fcountersignid, r.fcountersigner, r.factivity,case when r.factivity = 'deptMeetingActivity' then '部门会签' else case when r.factivity = 'reviewActivity'then '领导签阅' else '领导签发' end end as factivityLabel from OA_DC_SignPsn r where r.fmasterid = '"+id+"') union (select distinct e.fmasterid, e.fcreatepsnid, e.fcreatepsnname,'meetingActivity' factivityfname,e.factivitylabel from oa_pub_execute e  where e.fmasterid = '"+id+"' and e.factivityfname='/OA/doc/process/sendDoc/meetingActivity')) t1 left join (select t.sdata1,t.sactivity,t.sexecutorpersonid,t.screatetime,t.sstatusname,t.sactualfinishtime,case when t.sstatusname='尚未处理' then '未处理' else '已处理' end as fState from "+dbNameMS+".dbo.sa_task t ,(select s.sdata1,s.sactivity,s.sexecutorpersonid,max(s.screatetime) screatetime from "+dbNameMS+".dbo.sa_task s where s.sdata1='"+id+"' and s.sactivity in ('deptMeetingActivity','reviewActivity','signActivity') and s.sexecutorpersonid is not null group by s.sdata1,s.sactivity,s.sexecutorpersonid) w where t.sdata1 = w.sdata1 and t.sactivity=w.sactivity and t.sexecutorpersonid=w.sexecutorpersonid and t.screatetime=w.screatetime ) t2 on t1.fmasterid=t2.sdata1 and t1.factivity=t2.sactivity and t1.fcountersignid=t2.sexecutorpersonid  union select p.factivityLabel,p.fpersonname,p.fupdatetime,p.fState from (select '阅知情况'as factivityLabel,r.fmasterid,r.fpersonid,r.fpersonname,case when e.fupdatetime IS NOT NULL then e.fupdatetime else e.fcreatetime end fupdatetime,case when e.fcreatepsnid is null then '未阅' else '已阅' end as fState from (select fmasterid,fpersonid,fpersonname from oa_dc_readerrange where fmasterid='"+id+"')r left join oa_pub_execute e on r.fmasterid = e.fmasterid and r.fpersonid = e.fcreatepsnid and e.factivityfname = 'readerOpinion') p";
		mySql = "select t1.factivityLabel FACTIVITY,t1.FCOUNTERSIGNER,t2.sactualfinishtime FUPDATETIME,case when t2.FSTATE is null then '未处理' else t2.fState end as fState from ((select distinct r.fmasterid,r.fcountersignid, r.fcountersigner, r.factivity,case when r.factivity = 'deptMeetingActivity' then '部门会签' else case when r.factivity = 'reviewActivity'then '领导签阅' else '领导签发' end end as factivityLabel from OA_DC_SignPsn r where r.fmasterid = '"+id+"') union (select distinct e.fmasterid, e.fcreatepsnid, e.fcreatepsnname,'meetingActivity' factivityfname,e.factivitylabel from oa_pub_execute e  where e.fmasterid = '"+id+"' and e.factivityfname='/OA/doc/process/sendDoc/meetingActivity')) t1 left join (select t.sdata1,t.sactivity,t.sexecutorpersonid,t.screatetime,t.sstatusname,t.sactualfinishtime,case when t.sstatusname='尚未处理' then '未处理' else '已处理' end as fState from "+dbNameMySQL+".sa_task t ,(select s.sdata1,s.sactivity,s.sexecutorpersonid,max(s.screatetime) screatetime from "+dbNameMySQL+".sa_task s where s.sdata1='"+id+"' and s.sactivity in ('deptMeetingActivity','reviewActivity','signActivity') and s.sexecutorpersonid is not null group by s.sdata1,s.sactivity,s.sexecutorpersonid) w where t.sdata1 = w.sdata1 and t.sactivity=w.sactivity and t.sexecutorpersonid=w.sexecutorpersonid and t.screatetime=w.screatetime ) t2 on t1.fmasterid=t2.sdata1 and t1.factivity=t2.sactivity and t1.fcountersignid=t2.sexecutorpersonid  union select p.factivityLabel,p.fpersonname,p.fupdatetime,p.fState from (select '阅知情况'as factivityLabel,r.fmasterid,r.fpersonid,r.fpersonname,case when e.fupdatetime IS NOT NULL then e.fupdatetime else e.fcreatetime end fupdatetime,case when e.fcreatepsnid is null then '未阅' else '已阅' end as fState from (select fmasterid,fpersonid,fpersonname from oa_dc_readerrange where fmasterid='"+id+"')r left join oa_pub_execute e on r.fmasterid = e.fmasterid and r.fpersonid = e.fcreatepsnid and e.factivityfname = 'readerOpinion') p";
		
		//System.out.println("orclSql8="+orclSql);
		HashMap<String,String> sqlMap = new HashMap<String,String>();
		sqlMap.put("ORACLE",orclSql);
		sqlMap.put("MSSQL",msSql);
		sqlMap.put("MYSQL",mySql);
		
		return SQL.select(sqlMap,null,"/OA/doc/data");
	}
	public static Table receiveDocFlowTrack(String id)throws DocumentException{
		String orclSql = "",msSql = "",mySql="";
		
		orclSql = "select d.FTITLE,d.fExtendStr1 FDOCNUMBER ,d.FDRAFTPERNAME,e.fcreatepsnname as FDEPTAPPROVEPSNNAME from (select fID,fTitle,fExtendStr1,fDraftPerName from OA_DC_Doc where fid ='"+id+"') d left join (select fCreatePsnName,fmasterid from oa_pub_execute where fActivityFName='/OA/doc/process/receiveDoc/draftActivity') e on d.fid = e.fmasterid";
		msSql = orclSql;
		mySql = orclSql;
		
		//System.out.println("orclSql="+orclSql);
		HashMap<String,String> sqlMap = new HashMap<String,String>();
		sqlMap.put("ORACLE",orclSql);
		sqlMap.put("MSSQL",msSql);
		sqlMap.put("MYSQL",mySql);
		
		return SQL.select(sqlMap,null,"/OA/doc/data");
	}
	public static Table receiveDocDetailFlowTrack(String id)throws DocumentException{
		String orclSql = "",msSql = "",mySql="";
		String dbNameORCL = "",dbNameMS="",dbNameMySQL="";
		
		String webAbsPath = WEBConstants.getWebRootAbsPath();
		String configPath = webAbsPath.substring(0, webAbsPath.indexOf("apache-tomcat")) + "apache-tomcat\\conf\\server.xml";
		SAXReader xmlReader = new SAXReader();
		Node ndORCL = xmlReader.read(configPath).getRootElement().selectSingleNode("//Resource[@name='system']/@username");
		dbNameORCL = ndORCL.getStringValue();
		Node ndMS = xmlReader.read(configPath).getRootElement().selectSingleNode("//Resource[@name='system']/@url");
		dbNameMS = ndMS.getStringValue().substring(ndMS.getStringValue().lastIndexOf("/")+1, ndMS.getStringValue().length());
		dbNameMySQL = dbNameMS;
		orclSql = "select t1.factivityLabel FACTIVITY,t1.FCOUNTERSIGNER,t2.sactualfinishtime FUPDATETIME,case when t2.fState is null then '未处理' else t2.fState end as FSTATE from (select distinct r.fmasterid,r.fcountersignid, r.fcountersigner, r.factivity,case when r.factivity = 'leadApproveActivity' then  '领导批示' else case  when r.factivity = 'operatorActivity' then '部门阅办' else  '传阅'  end end as factivityLabel from OA_DC_SignPsn r where r.fmasterid = '"+id+"') t1 left join (select t.sdata1,t.sactivity,t.sexecutorpersonid,t.screatetime,t.sstatusname,t.sactualfinishtime,case when t.sstatusname='尚未处理' then '未处理' else '已处理' end as fState from "+dbNameORCL+".sa_task t ,(select s.sdata1,s.sactivity,s.sexecutorpersonid,max(s.screatetime) screatetime from "+dbNameORCL+".sa_task s where s.sdata1='"+id+"' and s.sactivity in ('roundPerusalActivity','operatorActivity','leadApproveActivity') and s.sexecutorpersonid is not null group by s.sdata1,s.sactivity,s.sexecutorpersonid) w where t.sdata1 = w.sdata1 and t.sactivity=w.sactivity and t.sexecutorpersonid=w.sexecutorpersonid and t.screatetime=w.screatetime ) t2 on t1.fmasterid=t2.sdata1 and t1.factivity=t2.sactivity and t1.fcountersignid=t2.sexecutorpersonid  union select p.factivityLabel,p.fpersonname,p.fupdatetime,p.fState from (select '阅知情况'as factivityLabel,r.fmasterid,r.fpersonid,r.fpersonname,case when e.fupdatetime IS NOT NULL then e.fupdatetime else e.fcreatetime end fupdatetime,case when e.fcreatepsnid is null then '未阅' else '已阅' end as fState from (select fmasterid,fpersonid,fpersonname from oa_dc_readerrange where fmasterid='"+id+"')r left join oa_pub_execute e on r.fmasterid = e.fmasterid and r.fpersonid = e.fcreatepsnid and e.factivityfname = 'readerOpinion') p";
		msSql = "select t1.factivityLabel FACTIVITY,t1.FCOUNTERSIGNER,t2.sactualfinishtime FUPDATETIME,case when t2.fState is null then '未处理' else t2.fState end as FSTATE from (select distinct r.fmasterid,r.fcountersignid, r.fcountersigner, r.factivity,case when r.factivity = 'leadApproveActivity' then  '领导批示' else case  when r.factivity = 'operatorActivity' then '部门阅办' else  '传阅'  end end as factivityLabel from OA_DC_SignPsn r where r.fmasterid = '"+id+"') t1 left join (select t.sdata1,t.sactivity,t.sexecutorpersonid,t.screatetime,t.sstatusname,t.sactualfinishtime,case when t.sstatusname='尚未处理' then '未处理' else '已处理' end as fState from "+dbNameMS+".dbo.sa_task t ,(select s.sdata1,s.sactivity,s.sexecutorpersonid,max(s.screatetime) screatetime from "+dbNameMS+".dbo.sa_task s where s.sdata1='"+id+"' and s.sactivity in ('roundPerusalActivity','operatorActivity','leadApproveActivity') and s.sexecutorpersonid is not null group by s.sdata1,s.sactivity,s.sexecutorpersonid) w where t.sdata1 = w.sdata1 and t.sactivity=w.sactivity and t.sexecutorpersonid=w.sexecutorpersonid and t.screatetime=w.screatetime ) t2 on t1.fmasterid=t2.sdata1 and t1.factivity=t2.sactivity and t1.fcountersignid=t2.sexecutorpersonid  union select p.factivityLabel,p.fpersonname,p.fupdatetime,p.fState from (select '阅知情况'as factivityLabel,r.fmasterid,r.fpersonid,r.fpersonname,case when e.fupdatetime IS NOT NULL then e.fupdatetime else e.fcreatetime end fupdatetime,case when e.fcreatepsnid is null then '未阅' else '已阅' end as fState from (select fmasterid,fpersonid,fpersonname from oa_dc_readerrange where fmasterid='"+id+"')r left join oa_pub_execute e on r.fmasterid = e.fmasterid and r.fpersonid = e.fcreatepsnid and e.factivityfname = 'readerOpinion') p";
		mySql = "select t1.factivityLabel FACTIVITY,t1.FCOUNTERSIGNER,t2.sactualfinishtime FUPDATETIME,case when t2.fState is null then '未处理' else t2.fState end as FSTATE from (select distinct r.fmasterid,r.fcountersignid, r.fcountersigner, r.factivity,case when r.factivity = 'leadApproveActivity' then  '领导批示' else case  when r.factivity = 'operatorActivity' then '部门阅办' else  '传阅'  end end as factivityLabel from OA_DC_SignPsn r where r.fmasterid = '"+id+"') t1 left join (select t.sdata1,t.sactivity,t.sexecutorpersonid,t.screatetime,t.sstatusname,t.sactualfinishtime,case when t.sstatusname='尚未处理' then '未处理' else '已处理' end as fState from "+dbNameMySQL+".sa_task t ,(select s.sdata1,s.sactivity,s.sexecutorpersonid,max(s.screatetime) screatetime from "+dbNameMySQL+".sa_task s where s.sdata1='"+id+"' and s.sactivity in ('roundPerusalActivity','operatorActivity','leadApproveActivity') and s.sexecutorpersonid is not null group by s.sdata1,s.sactivity,s.sexecutorpersonid) w where t.sdata1 = w.sdata1 and t.sactivity=w.sactivity and t.sexecutorpersonid=w.sexecutorpersonid and t.screatetime=w.screatetime ) t2 on t1.fmasterid=t2.sdata1 and t1.factivity=t2.sactivity and t1.fcountersignid=t2.sexecutorpersonid  union select p.factivityLabel,p.fpersonname,p.fupdatetime,p.fState from (select '阅知情况'as factivityLabel,r.fmasterid,r.fpersonid,r.fpersonname,case when e.fupdatetime IS NOT NULL then e.fupdatetime else e.fcreatetime end fupdatetime,case when e.fcreatepsnid is null then '未阅' else '已阅' end as fState from (select fmasterid,fpersonid,fpersonname from oa_dc_readerrange where fmasterid='"+id+"')r left join oa_pub_execute e on r.fmasterid = e.fmasterid and r.fpersonid = e.fcreatepsnid and e.factivityfname = 'readerOpinion') p";
		
		//System.out.println("orclSql10="+orclSql);
		HashMap<String,String> sqlMap = new HashMap<String,String>();
		sqlMap.put("ORACLE",orclSql);
		sqlMap.put("MSSQL",msSql);
		sqlMap.put("MYSQL",mySql);
		
		return SQL.select(sqlMap,null,"/OA/doc/data");
	}
	public static Table docQueryFlowTrack(String id,String docType)throws DocumentException{
		String orclSql = "",msSql = "",mySql="";
		if(docType.equals("OA_DC_SendDoc")){
			orclSql = "select d.FTITLE,d.fExtendStr1 FDOCNUMBER ,d.FDRAFTPERNAME,e.fcreatepsnname as FDEPTAPPROVEPSNNAME from (select fID,fTitle,fExtendStr1,fDraftPerName from OA_DC_Doc where fid ='"+id+"') d left join (select fCreatePsnName,fmasterid from oa_pub_execute where fActivityFName='/OA/doc/process/sendDoc/deptApproveActivity') e on d.fid = e.fmasterid";
		}else if(docType.equals("OA_DC_ReceiveDoc")){
			orclSql = "select d.FTITLE,d.fExtendStr1 FDOCNUMBER ,d.FDRAFTPERNAME,e.fcreatepsnname as FDEPTAPPROVEPSNNAME from (select fID,fTitle,fExtendStr1,fDraftPerName from OA_DC_Doc where fid ='"+id+"') d left join (select fCreatePsnName,fmasterid from oa_pub_execute where fActivityFName='/OA/doc/process/receiveDoc/draftActivity') e on d.fid = e.fmasterid";
		}
		msSql = orclSql;
		mySql = orclSql;
		
		//System.out.println("orclSql9="+orclSql);
		HashMap<String,String> sqlMap = new HashMap<String,String>();
		sqlMap.put("ORACLE",orclSql);
		sqlMap.put("MSSQL",msSql);
		sqlMap.put("MYSQL",mySql);
		
		return SQL.select(sqlMap,null,"/OA/doc/data");
	}
	public static Table docQueryDetailFlowTrack(String id,String docType)throws DocumentException{
		String orclSql = "",msSql = "",mySql="";
		String dbNameORCL = "",dbNameMS="",dbNameMySQL="";
		String webAbsPath = WEBConstants.getWebRootAbsPath();
		String configPath = webAbsPath.substring(0, webAbsPath.indexOf("apache-tomcat")) + "apache-tomcat\\conf\\server.xml";
		SAXReader xmlReader = new SAXReader();
		Node ndORCL = xmlReader.read(configPath).getRootElement().selectSingleNode("//Resource[@name='system']/@username");
		dbNameORCL = ndORCL.getStringValue();
		Node ndMS = xmlReader.read(configPath).getRootElement().selectSingleNode("//Resource[@name='system']/@url");
		dbNameMS = ndMS.getStringValue().substring(ndMS.getStringValue().lastIndexOf("/")+1, ndMS.getStringValue().length());
		dbNameMySQL = dbNameMS;
		
		if(docType.equals("OA_DC_SendDoc")){
			orclSql = "select t1.factivityLabel FACTIVITY,t1.FCOUNTERSIGNER,t2.sactualfinishtime FUPDATETIME,case when t2.FSTATE is null then '未处理' else t2.fState end as FSTATE from ((select distinct r.fmasterid,r.fcountersignid, r.fcountersigner, r.factivity,case when r.factivity = 'deptMeetingActivity' then '部门会签' else case when r.factivity = 'reviewActivity'then '领导签阅' else '领导签发' end end as factivityLabel from OA_DC_SignPsn r where r.fmasterid = '"+id+"') union (select distinct e.fmasterid, e.fcreatepsnid, e.fcreatepsnname,'meetingActivity' factivityfname,e.factivitylabel from oa_pub_execute e  where e.fmasterid = '"+id+"' and e.factivityfname='/OA/doc/process/sendDoc/meetingActivity')) t1 left join (select t.sdata1,t.sactivity,t.sexecutorpersonid,t.screatetime,t.sstatusname,t.sactualfinishtime,case when t.sstatusname='尚未处理' then '未处理' else '已处理' end as fState from "+dbNameORCL+".sa_task t ,(select s.sdata1,s.sactivity,s.sexecutorpersonid,max(s.screatetime) screatetime from "+dbNameORCL+".sa_task s where s.sdata1='"+id+"' and s.sactivity in ('deptMeetingActivity','reviewActivity','signActivity') and s.sexecutorpersonid is not null group by s.sdata1,s.sactivity,s.sexecutorpersonid) w where t.sdata1 = w.sdata1 and t.sactivity=w.sactivity and t.sexecutorpersonid=w.sexecutorpersonid and t.screatetime=w.screatetime ) t2 on t1.fmasterid=t2.sdata1 and t1.factivity=t2.sactivity and t1.fcountersignid=t2.sexecutorpersonid  union select p.factivityLabel,p.fpersonname,p.fupdatetime,p.fState from (select '阅知情况'as factivityLabel,r.fmasterid,r.fpersonid,r.fpersonname,case when e.fupdatetime IS NOT NULL then e.fupdatetime else e.fcreatetime end fupdatetime,case when e.fcreatepsnid is null then '未阅' else '已阅' end as fState from (select fmasterid,fpersonid,fpersonname from oa_dc_readerrange where fmasterid='"+id+"')r left join oa_pub_execute e on r.fmasterid = e.fmasterid and r.fpersonid = e.fcreatepsnid and e.factivityfname = 'readerOpinion') p";
			msSql = "select t1.factivityLabel FACTIVITY,t1.FCOUNTERSIGNER,t2.sactualfinishtime FUPDATETIME,case when t2.FSTATE is null then '未处理' else t2.fState end as FSTATE from ((select distinct r.fmasterid,r.fcountersignid, r.fcountersigner, r.factivity,case when r.factivity = 'deptMeetingActivity' then '部门会签' else case when r.factivity = 'reviewActivity'then '领导签阅' else '领导签发' end end as factivityLabel from OA_DC_SignPsn r where r.fmasterid = '"+id+"') union (select distinct e.fmasterid, e.fcreatepsnid, e.fcreatepsnname,'meetingActivity' factivityfname,e.factivitylabel from oa_pub_execute e  where e.fmasterid = '"+id+"' and e.factivityfname='/OA/doc/process/sendDoc/meetingActivity')) t1 left join (select t.sdata1,t.sactivity,t.sexecutorpersonid,t.screatetime,t.sstatusname,t.sactualfinishtime,case when t.sstatusname='尚未处理' then '未处理' else '已处理' end as fState from "+dbNameMS+".dbo.sa_task t ,(select s.sdata1,s.sactivity,s.sexecutorpersonid,max(s.screatetime) screatetime from "+dbNameMS+".dbo.sa_task s where s.sdata1='"+id+"' and s.sactivity in ('deptMeetingActivity','reviewActivity','signActivity') and s.sexecutorpersonid is not null group by s.sdata1,s.sactivity,s.sexecutorpersonid) w where t.sdata1 = w.sdata1 and t.sactivity=w.sactivity and t.sexecutorpersonid=w.sexecutorpersonid and t.screatetime=w.screatetime ) t2 on t1.fmasterid=t2.sdata1 and t1.factivity=t2.sactivity and t1.fcountersignid=t2.sexecutorpersonid  union select p.factivityLabel,p.fpersonname,p.fupdatetime,p.fState from (select '阅知情况'as factivityLabel,r.fmasterid,r.fpersonid,r.fpersonname,case when e.fupdatetime IS NOT NULL then e.fupdatetime else e.fcreatetime end fupdatetime,case when e.fcreatepsnid is null then '未阅' else '已阅' end as fState from (select fmasterid,fpersonid,fpersonname from oa_dc_readerrange where fmasterid='"+id+"')r left join oa_pub_execute e on r.fmasterid = e.fmasterid and r.fpersonid = e.fcreatepsnid and e.factivityfname = 'readerOpinion') p";
			mySql = "select t1.factivityLabel FACTIVITY,t1.FCOUNTERSIGNER,t2.sactualfinishtime FUPDATETIME,case when t2.FSTATE is null then '未处理' else t2.fState end as FSTATE from ((select distinct r.fmasterid,r.fcountersignid, r.fcountersigner, r.factivity,case when r.factivity = 'deptMeetingActivity' then '部门会签' else case when r.factivity = 'reviewActivity'then '领导签阅' else '领导签发' end end as factivityLabel from OA_DC_SignPsn r where r.fmasterid = '"+id+"') union (select distinct e.fmasterid, e.fcreatepsnid, e.fcreatepsnname,'meetingActivity' factivityfname,e.factivitylabel from oa_pub_execute e  where e.fmasterid = '"+id+"' and e.factivityfname='/OA/doc/process/sendDoc/meetingActivity')) t1 left join (select t.sdata1,t.sactivity,t.sexecutorpersonid,t.screatetime,t.sstatusname,t.sactualfinishtime,case when t.sstatusname='尚未处理' then '未处理' else '已处理' end as fState from "+dbNameMySQL+".sa_task t ,(select s.sdata1,s.sactivity,s.sexecutorpersonid,max(s.screatetime) screatetime from "+dbNameMySQL+".sa_task s where s.sdata1='"+id+"' and s.sactivity in ('deptMeetingActivity','reviewActivity','signActivity') and s.sexecutorpersonid is not null group by s.sdata1,s.sactivity,s.sexecutorpersonid) w where t.sdata1 = w.sdata1 and t.sactivity=w.sactivity and t.sexecutorpersonid=w.sexecutorpersonid and t.screatetime=w.screatetime ) t2 on t1.fmasterid=t2.sdata1 and t1.factivity=t2.sactivity and t1.fcountersignid=t2.sexecutorpersonid  union select p.factivityLabel,p.fpersonname,p.fupdatetime,p.fState from (select '阅知情况'as factivityLabel,r.fmasterid,r.fpersonid,r.fpersonname,case when e.fupdatetime IS NOT NULL then e.fupdatetime else e.fcreatetime end fupdatetime,case when e.fcreatepsnid is null then '未阅' else '已阅' end as fState from (select fmasterid,fpersonid,fpersonname from oa_dc_readerrange where fmasterid='"+id+"')r left join oa_pub_execute e on r.fmasterid = e.fmasterid and r.fpersonid = e.fcreatepsnid and e.factivityfname = 'readerOpinion') p";
		}else if(docType.equals("OA_DC_ReceiveDoc")){
			orclSql = "select t1.factivityLabel FACTIVITY,t1.FCOUNTERSIGNER,t2.sactualfinishtime FUPDATETIME,case when t2.fState is null then '未处理' else t2.fState end as FSTATE from (select distinct r.fmasterid,r.fcountersignid, r.fcountersigner, r.factivity,case when r.factivity = 'leadApproveActivity' then  '领导批示' else case  when r.factivity = 'operatorActivity' then '部门阅办' else  '传阅'  end end as factivityLabel from OA_DC_SignPsn r where r.fmasterid = '"+id+"') t1 left join (select t.sdata1,t.sactivity,t.sexecutorpersonid,t.screatetime,t.sstatusname,t.sactualfinishtime,case when t.sstatusname='尚未处理' then '未处理' else '已处理' end as fState from "+dbNameORCL+".sa_task t ,(select s.sdata1,s.sactivity,s.sexecutorpersonid,max(s.screatetime) screatetime from "+dbNameORCL+".sa_task s where s.sdata1='"+id+"' and s.sactivity in ('roundPerusalActivity','operatorActivity','leadApproveActivity') and s.sexecutorpersonid is not null group by s.sdata1,s.sactivity,s.sexecutorpersonid) w where t.sdata1 = w.sdata1 and t.sactivity=w.sactivity and t.sexecutorpersonid=w.sexecutorpersonid and t.screatetime=w.screatetime ) t2 on t1.fmasterid=t2.sdata1 and t1.factivity=t2.sactivity and t1.fcountersignid=t2.sexecutorpersonid  union select p.factivityLabel,p.fpersonname,p.fupdatetime,p.fState from (select '阅知情况'as factivityLabel,r.fmasterid,r.fpersonid,r.fpersonname,case when e.fupdatetime IS NOT NULL then e.fupdatetime else e.fcreatetime end fupdatetime,case when e.fcreatepsnid is null then '未阅' else '已阅' end as fState from (select fmasterid,fpersonid,fpersonname from oa_dc_readerrange where fmasterid='"+id+"')r left join oa_pub_execute e on r.fmasterid = e.fmasterid and r.fpersonid = e.fcreatepsnid and e.factivityfname = 'readerOpinion') p";
			msSql = "select t1.factivityLabel FACTIVITY,t1.FCOUNTERSIGNER,t2.sactualfinishtime FUPDATETIME,case when t2.fState is null then '未处理' else t2.fState end as FSTATE from (select distinct r.fmasterid,r.fcountersignid, r.fcountersigner, r.factivity,case when r.factivity = 'leadApproveActivity' then  '领导批示' else case  when r.factivity = 'operatorActivity' then '部门阅办' else  '传阅'  end end as factivityLabel from OA_DC_SignPsn r where r.fmasterid = '"+id+"') t1 left join (select t.sdata1,t.sactivity,t.sexecutorpersonid,t.screatetime,t.sstatusname,t.sactualfinishtime,case when t.sstatusname='尚未处理' then '未处理' else '已处理' end as fState from "+dbNameMS+".dbo.sa_task t ,(select s.sdata1,s.sactivity,s.sexecutorpersonid,max(s.screatetime) screatetime from "+dbNameMS+".dbo.sa_task s where s.sdata1='"+id+"' and s.sactivity in ('roundPerusalActivity','operatorActivity','leadApproveActivity') and s.sexecutorpersonid is not null group by s.sdata1,s.sactivity,s.sexecutorpersonid) w where t.sdata1 = w.sdata1 and t.sactivity=w.sactivity and t.sexecutorpersonid=w.sexecutorpersonid and t.screatetime=w.screatetime ) t2 on t1.fmasterid=t2.sdata1 and t1.factivity=t2.sactivity and t1.fcountersignid=t2.sexecutorpersonid  union select p.factivityLabel,p.fpersonname,p.fupdatetime,p.fState from (select '阅知情况'as factivityLabel,r.fmasterid,r.fpersonid,r.fpersonname,case when e.fupdatetime IS NOT NULL then e.fupdatetime else e.fcreatetime end fupdatetime,case when e.fcreatepsnid is null then '未阅' else '已阅' end as fState from (select fmasterid,fpersonid,fpersonname from oa_dc_readerrange where fmasterid='"+id+"')r left join oa_pub_execute e on r.fmasterid = e.fmasterid and r.fpersonid = e.fcreatepsnid and e.factivityfname = 'readerOpinion') p";
			mySql = "select t1.factivityLabel FACTIVITY,t1.FCOUNTERSIGNER,t2.sactualfinishtime FUPDATETIME,case when t2.fState is null then '未处理' else t2.fState end as FSTATE from (select distinct r.fmasterid,r.fcountersignid, r.fcountersigner, r.factivity,case when r.factivity = 'leadApproveActivity' then  '领导批示' else case  when r.factivity = 'operatorActivity' then '部门阅办' else  '传阅'  end end as factivityLabel from OA_DC_SignPsn r where r.fmasterid = '"+id+"') t1 left join (select t.sdata1,t.sactivity,t.sexecutorpersonid,t.screatetime,t.sstatusname,t.sactualfinishtime,case when t.sstatusname='尚未处理' then '未处理' else '已处理' end as fState from "+dbNameMySQL+".sa_task t ,(select s.sdata1,s.sactivity,s.sexecutorpersonid,max(s.screatetime) screatetime from "+dbNameMySQL+".sa_task s where s.sdata1='"+id+"' and s.sactivity in ('roundPerusalActivity','operatorActivity','leadApproveActivity') and s.sexecutorpersonid is not null group by s.sdata1,s.sactivity,s.sexecutorpersonid) w where t.sdata1 = w.sdata1 and t.sactivity=w.sactivity and t.sexecutorpersonid=w.sexecutorpersonid and t.screatetime=w.screatetime ) t2 on t1.fmasterid=t2.sdata1 and t1.factivity=t2.sactivity and t1.fcountersignid=t2.sexecutorpersonid  union select p.factivityLabel,p.fpersonname,p.fupdatetime,p.fState from (select '阅知情况'as factivityLabel,r.fmasterid,r.fpersonid,r.fpersonname,case when e.fupdatetime IS NOT NULL then e.fupdatetime else e.fcreatetime end fupdatetime,case when e.fcreatepsnid is null then '未阅' else '已阅' end as fState from (select fmasterid,fpersonid,fpersonname from oa_dc_readerrange where fmasterid='"+id+"')r left join oa_pub_execute e on r.fmasterid = e.fmasterid and r.fpersonid = e.fcreatepsnid and e.factivityfname = 'readerOpinion') p";
		}
		
		//System.out.println("orclSql10="+orclSql);
		HashMap<String,String> sqlMap = new HashMap<String,String>();
		sqlMap.put("ORACLE",orclSql);
		sqlMap.put("MSSQL",msSql);
		sqlMap.put("MYSQL",mySql);
		
		return SQL.select(sqlMap,null,"/OA/doc/data");
	}
	
	
}