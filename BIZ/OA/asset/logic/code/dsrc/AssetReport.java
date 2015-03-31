import java.util.HashMap;
import org.dom4j.DocumentException;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;
import com.justep.olap.common.WEBConstants;
import com.justep.system.data.SQL;
import com.justep.system.data.Table;

public class AssetReport {
	public static Table assetSummaryMain(String beginDate,String endDate,String dayNum,String orgIDs) throws DocumentException{
		//System.out.println("1----- beginDate="+beginDate+"--endDate="+endDate+"--dayNum="+dayNum+"--orgIDs="+orgIDs);
		String orclSql = "",msSql = "",mySql="",orgCondition="";
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
			orgIDs = orgIDs.replace(" ","','");
			orgCondition= " and m.fCreateDeptID in ("+ orgIDs +")";
		}
		if(dayNum.equals("") || dayNum.equals(null)){
			orclSql = "select t1.ct SQDSL,null CYYDZQRWS,null DYYDZQRWS,null DAYNUM,"+beginDateOrcl+" BEGINDATE,"+endDateOrcl+" ENDDATE from "
			+"(select count(m.fid) ct from OA_AS_BuyApplyM m where m.fcreatetime >= "+beginDateOrcl+" and m.fcreatetime <= "+endDateOrcl+orgCondition+") t1";
			
			msSql ="select t1.ct SQDSL,null CYYDZQRWS,null DYYDZQRWS,null DAYNUM,"+beginDateMS+" BEGINDATE,"+endDateMS+" ENDDATE from "
			+"(select count(m.fid) ct from OA_AS_BuyApplyM m where m.fcreatetime >= "+beginDateMS+" and m.fcreatetime <= "+endDateMS+orgCondition+") t1";
			
			mySql ="select t1.ct SQDSL,null CYYDZQRWS,null DYYDZQRWS,null DAYNUM,"+beginDateMS+" BEGINDATE,"+endDateMS+" ENDDATE from "
			+"(select count(m.fid) ct from OA_AS_BuyApplyM m where m.fcreatetime >= "+beginDateMS+" and m.fcreatetime <= "+endDateMS+orgCondition+") t1";
		}else{
			orclSql = "select t1.ct SQDSL,t2.ct CYYDZQRWS,t3.ct DYYDZQRWS,"+dayNum+" DAYNUM,"+beginDateOrcl+" BEGINDATE,"+endDateOrcl+" ENDDATE from "
			+"(select count(m.fid) ct from OA_AS_BuyApplyM m where m.fcreatetime >= "+beginDateOrcl+" and m.fcreatetime <= "+endDateOrcl+orgCondition+") t1,"
			+"(select count(d.fid) ct from (select fid from OA_AS_BuyApplyM m where m.fcreatetime >= "+beginDateOrcl+" and m.fcreatetime <= "+endDateOrcl+orgCondition+" ) d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime > s.sactualstarttime +("+dayNum+"-1))) t2,"
			+"(select count(d.fid) ct from (select fid from OA_AS_BuyApplyM m where m.fcreatetime >= "+beginDateOrcl+" and m.fcreatetime <= "+endDateOrcl+orgCondition+" ) d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime < =s.sactualstarttime + ("+dayNum+"-1))) t3";
			
			msSql = "select t1.ct SQDSL,t2.ct CYYDZQRWS,t3.ct DYYDZQRWS,"+dayNum+" DAYNUM,"+beginDateMySQL+" BEGINDATE,"+endDateMySQL+" ENDDATE from "
			+"(select count(m.fid) ct from OA_AS_BuyApplyM m where m.fcreatetime >= "+beginDateMySQL+" and m.fcreatetime <= "+endDateMySQL+orgCondition+") t1,"
			+"(select count(d.fid) ct from (select fid from OA_AS_BuyApplyM m where m.fcreatetime >= "+beginDateMySQL+" and m.fcreatetime <= "+endDateMySQL+orgCondition+" ) d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime > s.sactualstarttime +("+dayNum+"-1))) t2,"
			+"(select count(d.fid) ct from (select fid from OA_AS_BuyApplyM m where m.fcreatetime >= "+beginDateMySQL+" and m.fcreatetime <= "+endDateMySQL+orgCondition+" ) d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= s.sactualstarttime + ("+dayNum+"-1))) t3";
			
			mySql = "select t1.ct SQDSL,t2.ct CYYDZQRWS,t3.ct DYYDZQRWS,"+dayNum+" DAYNUM,"+beginDateMySQL+" BEGINDATE,"+endDateMySQL+" ENDDATE from "
			+"(select count(m.fid) ct from OA_AS_BuyApplyM m where m.fcreatetime >= "+beginDateMySQL+" and m.fcreatetime <= "+endDateMySQL+orgCondition+") t1,"
			+"(select count(d.fid) ct from (select fid from OA_AS_BuyApplyM m where m.fcreatetime >= "+beginDateMySQL+" and m.fcreatetime <= "+endDateMySQL+orgCondition+" ) d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime > date_add(s.sactualstarttime ,INTERVAL ("+dayNum+"-1) day))) t2,"
			+"(select count(d.fid) ct from (select fid from OA_AS_BuyApplyM m where m.fcreatetime >= "+beginDateMySQL+" and m.fcreatetime <= "+endDateMySQL+orgCondition+" ) d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= date_add(s.sactualstarttime ,INTERVAL ("+dayNum+"-1) day))) t3";
		}

		HashMap<String,String> sqlMap = new HashMap<String,String>();
		sqlMap.put("ORACLE",orclSql);
		sqlMap.put("MSSQL",msSql);
		sqlMap.put("MYSQL",mySql);
		
		return SQL.select(sqlMap,null,"/OA/asset/data");
	}
	
	public static Table assetSummaryDetail(String beginDate,String endDate,String orgIDs){
		//System.out.println("2----- beginDate="+beginDate+"--endDate="+endDate+"--orgIDs="+orgIDs);
		String orclSql = "",msSql = "",mySql="",orgCondition="";
		String beginDateOrcl="",endDateOrcl="",beginDateMS="",endDateMS="",beginDateMySQL="",endDateMySQL="";
		
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
			orgIDs = orgIDs.replace(" ","','");
			orgCondition= " and m.fCreateDeptID in ("+ orgIDs +")";
		}
		
		orclSql = "select t.fkind FKINDNAME,t.FNAME,sum(t.fBuyNum) NUM,sum(t.fAmount) AMOUNT from (select d.fkind,d.fname,fBuyNum,d.fAmount from OA_AS_BuyApplyD d join OA_AS_BuyApplyM m on d.fmasterid=m.fid and m.fBizState='bsFinished' and m.fcreatetime >= "+beginDateOrcl+" and m.fcreatetime <= "+endDateOrcl+orgCondition+") t group by t.fkind,t.fname order by t.fkind,t.fname";
		msSql = "select t.fkind FKINDNAME,t.FNAME,sum(t.fBuyNum) NUM,sum(t.fAmount) AMOUNT from (select d.fkind,d.fname,fBuyNum,d.fAmount from OA_AS_BuyApplyD d join OA_AS_BuyApplyM m on d.fmasterid=m.fid and m.fBizState='bsFinished' and m.fcreatetime >= "+beginDateMS+" and m.fcreatetime <= "+endDateMS+orgCondition+") t group by t.fkind,t.fname order by t.fkind,t.fname";
		mySql = "select t.fkind FKINDNAME,t.FNAME,sum(t.fBuyNum) NUM,sum(t.fAmount) AMOUNT from (select d.fkind,d.fname,fBuyNum,d.fAmount from OA_AS_BuyApplyD d join OA_AS_BuyApplyM m on d.fmasterid=m.fid and m.fBizState='bsFinished' and m.fcreatetime >= "+beginDateMySQL+" and m.fcreatetime <= "+endDateMySQL+orgCondition+") t group by t.fkind,t.fname order by t.fkind,t.fname";
		//System.out.println("orclSql="+orclSql);
		HashMap<String,String> sqlMap = new HashMap<String,String>();
		sqlMap.put("ORACLE",orclSql);
		sqlMap.put("MSSQL",msSql);
		sqlMap.put("MYSQL",mySql);
		return SQL.select(sqlMap,null,"/OA/asset/data");
	}
	
	public static Table assetSummaryZT(String beginDate,String endDate,String dayNum,String orgIDs) throws DocumentException{
		//System.out.println("3----- beginDate="+beginDate+"--endDate="+endDate+"--dayNum="+dayNum+"--orgIDs="+orgIDs);
		String orclSql = "",msSql = "",mySql="",orgCondition="";
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
			orgIDs = orgIDs.replace(" ","','");
			orgCondition= " and m.fCreateDeptID in ("+ orgIDs +")";
		}
		if(dayNum.equals("") || dayNum.equals(null)){
			orclSql = "select '申请单数量' FNAME,t1.ct CT from (select count(m.fid) ct from OA_AS_BuyApplyM m where m.fcreatetime >= "+beginDateOrcl+" and m.fcreatetime <= "+endDateOrcl+orgCondition+") t1";
			msSql = "select '申请单数量' FNAME,t1.ct CT from (select count(m.fid) ct from OA_AS_BuyApplyM m where m.fcreatetime >= "+beginDateMS+" and m.fcreatetime <= "+endDateMS+orgCondition+") t1";
			mySql = "select '申请单数量' FNAME,t1.ct CT from (select count(m.fid) ct from OA_AS_BuyApplyM m where m.fcreatetime >= "+beginDateMySQL+" and m.fcreatetime <= "+endDateMySQL+orgCondition+") t1";
		}else{
			orclSql = "select '申请单数量' FNAME,t1.ct CT from (select count(m.fid) ct from OA_AS_BuyApplyM m where m.fcreatetime >= "+beginDateOrcl+" and m.fcreatetime <= "+endDateOrcl+orgCondition+") t1 union "
				+"select '长于预定周期任务数' FNAME,t2.ct CT from (select count(d.fid) ct from (select fid from OA_AS_BuyApplyM m where m.fcreatetime >= "+beginDateOrcl+" and m.fcreatetime <= "+endDateOrcl+orgCondition+" ) d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime > s.sactualstarttime +("+dayNum+"-1))) t2 union "
				+"select '短于预定周期任务数' FNAME,t3.ct CT from (select count(d.fid) ct from (select fid from OA_AS_BuyApplyM m where m.fcreatetime >= "+beginDateOrcl+" and m.fcreatetime <= "+endDateOrcl+orgCondition+" ) d join "+dbNameORCL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime < =s.sactualstarttime + ("+dayNum+"-1))) t3";
			msSql = "select '申请单数量' FNAME,t1.ct CT from (select count(m.fid) ct from OA_AS_BuyApplyM m where m.fcreatetime >= "+beginDateMS+" and m.fcreatetime <= "+endDateMS+orgCondition+") t1 union "
			+"select '长于预定周期任务数' FNAME,t2.ct CT from (select count(d.fid) ct from (select fid from OA_AS_BuyApplyM m where m.fcreatetime >= "+beginDateMS+" and m.fcreatetime <= "+endDateMS+orgCondition+" ) d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime > s.sactualstarttime +("+dayNum+"-1))) t2 union "
			+"select '短于预定周期任务数' FNAME,t3.ct CT from (select count(d.fid) ct from (select fid from OA_AS_BuyApplyM m where m.fcreatetime >= "+beginDateMS+" and m.fcreatetime <= "+endDateMS+orgCondition+" ) d join "+dbNameMS+".dbo.sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime < =s.sactualstarttime + ("+dayNum+"-1))) t3";
			
			mySql = "select '申请单数量' FNAME,t1.ct CT from (select count(m.fid) ct from OA_AS_BuyApplyM m where m.fcreatetime >= "+beginDateMySQL+" and m.fcreatetime <= "+endDateMySQL+orgCondition+") t1 union "
			+"select '长于预定周期任务数' FNAME,t2.ct CT from (select count(d.fid) ct from (select fid from OA_AS_BuyApplyM m where m.fcreatetime >= "+beginDateMySQL+" and m.fcreatetime <= "+endDateMySQL+orgCondition+" ) d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime > date_add(s.sactualstarttime ,INTERVAL ("+dayNum+"-1) day))) t2 union "
			+"select '短于预定周期任务数' FNAME,t3.ct CT from (select count(d.fid) ct from (select fid from OA_AS_BuyApplyM m where m.fcreatetime >= "+beginDateMySQL+" and m.fcreatetime <= "+endDateMySQL+orgCondition+" ) d join "+dbNameMySQL+".sa_task s on d.fid=s.sdata1 and s.sparentid is null and (s.sstatusid = 'tesFinished' and s.sactualfinishtime <= date_add(s.sactualstarttime ,INTERVAL ("+dayNum+"-1) day))) t3";
		}

		HashMap<String,String> sqlMap = new HashMap<String,String>();
		sqlMap.put("ORACLE",orclSql);
		sqlMap.put("MSSQL",msSql);
		sqlMap.put("MYSQL",mySql);
		return SQL.select(sqlMap,null,"/OA/asset/data");
	}
	public static Table assetSummaryBT(String beginDate,String endDate,String orgIDs){
		//System.out.println("4----- beginDate="+beginDate+"--endDate="+endDate+"--orgIDs="+orgIDs);
		String orclSql = "",msSql = "",mySql = "",orgCondition="";
		String beginDateOrcl="",endDateOrcl="",beginDateMS="",endDateMS="",beginDateMySQL="",endDateMySQL="";
		
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
			orgIDs = orgIDs.replace(" ","','");
			orgCondition= " and m.fCreateDeptID in ("+ orgIDs +")";
		}
		orclSql = "select t.fkind FKINDNAME,sum(t.fAmount) AMOUNT from (select d.fkind,d.fAmount from OA_AS_BuyApplyD d join OA_AS_BuyApplyM m on d.fmasterid=m.fid and m.fBizState='bsFinished' and m.fcreatetime >= "+beginDateOrcl+" and m.fcreatetime <= "+endDateOrcl+orgCondition+") t group by t.fkind";
		msSql = "select t.fkind FKINDNAME,sum(t.fAmount) AMOUNT from (select d.fkind,d.fAmount from OA_AS_BuyApplyD d join OA_AS_BuyApplyM m on d.fmasterid=m.fid and m.fBizState='bsFinished' and m.fcreatetime >= "+beginDateMS+" and m.fcreatetime <= "+endDateMS+orgCondition+") t group by t.fkind";
		mySql = "select t.fkind FKINDNAME,sum(t.fAmount) AMOUNT from (select d.fkind,d.fAmount from OA_AS_BuyApplyD d join OA_AS_BuyApplyM m on d.fmasterid=m.fid and m.fBizState='bsFinished' and m.fcreatetime >= "+beginDateMySQL+" and m.fcreatetime <= "+endDateMySQL+orgCondition+") t group by t.fkind";

		HashMap<String,String> sqlMap = new HashMap<String,String>();
		sqlMap.put("ORACLE",orclSql);
		sqlMap.put("MSSQL",msSql);
		sqlMap.put("MYSQL",mySql);
		return SQL.select(sqlMap,null,"/OA/asset/data");
	}
}