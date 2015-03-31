import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.justep.oa.DataUtils;

import com.justep.model.ModelUtils;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.transform.SimpleTransform;
import com.justep.system.util.CommonUtils;
import com.justep.oa.SysUtils;

public class Survey {
	public static final String OADataModel ="/OA/survey/data";
	public static final String sysDataModel = "/system/data";
	/* 问卷全部发放 */
	public static void sendSurvey(String paperID)  {
		String sql = null;

		sql = "delete from OA_VS_Detail d where d.fSurveyID in (select v from OA_VS_Survey v where v.fPaperID='"
			+ paperID + "' and v.fSState = '编制中')";
		KSQL.executeUpdate(sql, null, OADataModel, null);
		sql = "insert into OA_VS_Detail d(d,d.fSurveyID,d.fQuestionID,d.fAnswer,d.version) " 
				+ "(select guid(),OA_VS_Survey,OA_VS_Question,"
				+ "null,0 from OA_VS_Survey OA_VS_Survey join OA_VS_Question OA_VS_Question on OA_VS_Survey.fPaperID = OA_VS_Question.fPaperID where OA_VS_Question.fPaperID = '"
				+ paperID + "'and OA_VS_Survey.fSState = '编制中')";
		KSQL.executeUpdate(sql, null, OADataModel, null);
	
		sql = "select guid() as sGUID,p.fPState,p.fTitle,p.fCreatePsnID,p.fCreatePsnName,p.fCreatePsnFID,p.fCreatePsnFName,p.fTaskID from OA_VS_Paper p where p='" + paperID + "'";			
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rsPaper = rows.next();
			if (rsPaper.getString("fPState").equals("编制中")) {
				sql = "insert into SA_Task t(t,t.sName,t.sCatalogID,t.sKindID,t.sCreateTime,t.sCreatorPersonID,t.sCreatorPersonName,t.sCreatorFID,t.sCreatorFName,"
						+ "t.sCURL,t.sEURL,t.sData1,t.sExecuteMode,t.sStatusID,t.sStatusName,t.sProcess,t.sActivity,t.sLock) "
						+ " values('" + rsPaper.getString("sGUID") + "','在线调查:"
						+ rsPaper.getString("fTitle")
						+ "','tsTask','tkTask',:currentDate,'"
						+ rsPaper.getString("fCreatePsnID")
						+ "','"
						+ rsPaper.getString("fCreatePsnName")
						+ "','"
						+ rsPaper.getString("fCreatePsnFID")
						+ "','"
						+ rsPaper.getString("fCreatePsnFName")
						+ "','/OA/survey/process/surveyPaperDetailView/surveyPaperDetailView.w','/OA/survey/process/surveyTask/surveyTask.j','"
						+ paperID
						+ "','temSimultaneous','tesReady','尚未处理',"
						+ "'/OA/survey/process/surveySend/surveySendProcess','surveySendActivity','"+java.util.UUID.randomUUID().toString().replace("-", "").toUpperCase()+"')";
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("currentDate", CommonUtils.getCurrentDateTime());
				KSQL.executeUpdate(sql, param, sysDataModel, null);
				
				sql = "update OA_VS_Paper p set p.fPState='已发布',p.fTaskID = '" + rsPaper.getString("sGUID") + "' where p='" + paperID + "'";
				KSQL.executeUpdate(sql, null, OADataModel, null);
				
				sql = "select guid() as sGUID,s,s.fPerID,s.fPerName,s.fPerFID from OA_VS_Survey s where s.fPaperID='" + paperID + "' and s.fSState = '编制中'";
				Table res = KSQL.select(sql, null, OADataModel, null);
				Iterator<Row> its = res.iterator();
				while (its.hasNext()) {
					Row rsSurvey = its.next();
					sql = "insert into SA_Task t(t,t.sParent,t.sName,t.sCatalogID,t.sKindID,t.sCreateTime,t.sCreatorPersonID,t.sCreatorPersonName,t.sCreatorFID,t.sCreatorFName,"
							+ "t.sExecutorPersonID,t.sExecutorPersonName,t.sExecutorFID,t.sCURL,t.sEURL,t.sData1,t.sExecuteMode,t.sStatusID,t.sStatusName,t.sProcess,t.sActivity,t.sLock) "
							+ " values('"
							+ rsSurvey.getString("sGUID")
							+ "','"
							+ rsPaper.getString("sGUID")
							+ "','在线调查:"
							+ rsPaper.getString("fTitle")
							+ "','tsTask','tkExecutor',:currentDate,'"
							+ rsPaper.getString("fCreatePsnID")
							+ "','"
							+ rsPaper.getString("fCreatePsnName")
							+ "','"
							+ rsPaper.getString("fCreatePsnFID")
							+ "','"
							+ rsPaper.getString("fCreatePsnFName")
							+ "','"
							+ rsSurvey.getString("fPerID")
							+ "','"
							+ rsSurvey.getString("fPerName")
							+ "','"
							+ rsSurvey.getString("fPerFID")
							+ "','/OA/survey/process/surveyPaperDetailView/surveyPaperDetailView.w','/OA/survey/process/surveyTask/surveyTask.j','"
							+ paperID
							+ "','temSimultaneous','tesReady','尚未处理',"
							+ "'/OA/survey/process/surveySend/surveySendProcess','surveySendActivity','"+java.util.UUID.randomUUID().toString().replace("-", "").toUpperCase()+"')";
					Map<String, Object> param1 = new HashMap<String, Object>();
					param1.put("currentDate", CommonUtils.getCurrentDateTime());
					KSQL.executeUpdate(sql, param1, sysDataModel, null);
	
					sql = "update OA_VS_Survey s set s.fSState='已发布',s.fSendTime= :currentDate,s.fTaskID='"
							+ rsSurvey.getString("sGUID") + "' where s='" + rsSurvey.getString("s") + "'";
					Map<String, Object> param2 = new HashMap<String, Object>();
					param2.put("currentDate", CommonUtils.getCurrentDateTime());
					KSQL.executeUpdate(sql, param2, OADataModel, null);
				}
			} else if (rsPaper.getString("fPState").equals("已发布")) {
				sql = "select guid() as sGUID,s,s.fPerID,s.fPerName,s.fPerFID from OA_VS_Survey s where s.fPaperID='"
						+ paperID + "' and s.fSState = '编制中'";
				Table res = KSQL.select(sql, null, OADataModel, null);
				Iterator<Row> its = res.iterator();
				while (its.hasNext()) {
					Row rsSurvey = its.next();
					sql = "insert into SA_Task t(t,t.sParent,t.sName,t.sCatalogID,t.sKindID,t.sCreateTime,t.sCreatorPersonID,t.sCreatorPersonName,t.sCreatorFID,t.sCreatorFName,"
							+ "t.sExecutorPersonID,t.sExecutorPersonName,t.sExecutorFID,t.sCURL,t.sEURL,t.sData1,t.sExecuteMode,t.sStatusID,t.sStatusName,t.sProcess,t.sActivity,t.sLock) "
							+ " values('"
							+ rsSurvey.getString("sGUID")
							+ "','"
							+ rsPaper.getString("fTaskID")
							+ "','在线调查:"
							+ rsPaper.getString("fTitle")
							+ "','tsTask','tkExecutor',:currentDate,'"
							+ rsPaper.getString("fCreatePsnID")
							+ "','"
							+ rsPaper.getString("fCreatePsnName")
							+ "','"
							+ rsPaper.getString("fCreatePsnFID")
							+ "','"
							+ rsPaper.getString("fCreatePsnFName")
							+ "','"
							+ rsSurvey.getString("fPerID")
							+ "','"
							+ rsSurvey.getString("fPerName")
							+ "','"
							+ rsSurvey.getString("fPerFID")
							+ "','/OA/survey/process/surveyPaperDetailView/surveyPaperDetailView.w','/OA/survey/process/surveyTask/surveyTask.j','"
							+ paperID
							+ "','temSimultaneous','tesReady','尚未处理',"
							+ "'/OA/survey/process/surveySend/surveySendProcess','surveySendActivity','"+java.util.UUID.randomUUID().toString().replace("-", "").toUpperCase()+"')";
					Map<String, Object> param = new HashMap<String, Object>();
					param.put("currentDate", CommonUtils.getCurrentDateTime());
					KSQL.executeUpdate(sql, param, sysDataModel, null);
					
					sql = "update OA_VS_Survey s set s.fSState='已发布',s.fSendTime= :currentDate,s.fTaskID='" + rsSurvey.getString("sGUID") + "' where s='" + rsSurvey.getString("s") + "'";
					Map<String, Object> param3 = new HashMap<String, Object>();
					param3.put("currentDate", CommonUtils.getCurrentDateTime());
					KSQL.executeUpdate(sql, param3, OADataModel, null);
				}
			}
		}
	}

	/* 问卷发放 */
	public static void singleSendSurvey(String paperID, String surveyID){
		String sql = null;
		sql = "select guid() as sGUID, p.fTitle,p.fCreatePsnID,p.fCreatePsnName,p.fCreatePsnFID,p.fCreatePsnFName,p.fPState,p.fTaskID from OA_VS_Paper p where p = '" + paperID + "'";
		Table res = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> its = res.iterator();
		while (its.hasNext()) {
			Row rsPaper = its.next();
			if (rsPaper.getString("fPState").equals("编制中")) {
				sql = "delete from OA_VS_Detail d where d.fSurveyID='" + surveyID + "'";
				KSQL.executeUpdate(sql, null, OADataModel, null);
				
				sql = "insert into OA_VS_Detail d(d,d.fSurveyID,d.fQuestionID,d.fAnswer,d.version) " 
					+ "(select guid(),'" + surveyID+ "',q, null,0 from OA_VS_Question q where q.fPaperID = '" + paperID + "')";
				KSQL.executeUpdate(sql, null, OADataModel, null);
				
				
				sql = "insert into SA_Task t(t,t.sName,t.sCatalogID,t.sKindID,t.sCreateTime,t.sCreatorPersonID,t.sCreatorPersonName,t.sCreatorFID,t.sCreatorFName,"
						+ "t.sCURL,t.sEURL,t.sData1,t.sExecuteMode,t.sStatusID,t.sStatusName,t.sProcess,t.sActivity,t.sLock) "
						+ " values('"
						+ rsPaper.getString("sGUID")
						+ "','在线调查:"
						+ rsPaper.getString("fTitle")
						+ "','tsTask','tkTask',:currentDate,'"
						+ rsPaper.getString("fCreatePsnID")
						+ "','"
						+ rsPaper.getString("fCreatePsnName")
						+ "','"
						+ rsPaper.getString("fCreatePsnFID")
						+ "','"
						+ rsPaper.getString("fCreatePsnFName")
						+ "','/OA/survey/process/surveyPaperDetailView/surveyPaperDetailView.w','/OA/survey/process/surveyTask/surveyTask.j','"
						+ paperID
						+ "','temSimultaneous','tesReady','尚未处理',"
						+ "'/OA/survey/process/surveySend/surveySendProcess','surveySendActivity','"+java.util.UUID.randomUUID().toString().replace("-", "").toUpperCase()+"')";
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("currentDate", CommonUtils.getCurrentDateTime());
				KSQL.executeUpdate(sql, param, sysDataModel, null);
				
				sql = "update OA_VS_Paper p set p.fPState='已发布',p.fTaskID = '" + rsPaper.getString("sGUID") + "' where p='" + paperID + "'";
				KSQL.executeUpdate(sql, null, OADataModel, null);
				
				sql = "select guid() as sGUID,s.fPerID,s.fPerName,s.fPerFID from OA_VS_Survey s where s='" + surveyID + "'";
				Table table = KSQL.select(sql, null, OADataModel, null);
				Iterator<Row> tabs = table.iterator();
				while (tabs.hasNext()) {
					Row rsSurvey = tabs.next();
					sql = "insert into SA_Task t(t,t.sParent,t.sName,t.sCatalogID,t.sKindID,t.sCreateTime,t.sCreatorPersonID,t.sCreatorPersonName,t.sCreatorFID,t.sCreatorFName,"
							+ "t.sExecutorPersonID,t.sExecutorPersonName,t.sExecutorFID,t.sCURL,t.sEURL,t.sData1,t.sExecuteMode,t.sStatusID,t.sStatusName,t.sProcess,t.sActivity,t.sLock) "
							+ " values('"
							+ rsSurvey.getString("sGUID")
							+ "','"
							+ rsPaper.getString("sGUID")
							+ "','在线调查:"
							+ rsPaper.getString("fTitle")
							+ "','tsTask','tkExecutor',:currentDate,'"
							+ rsPaper.getString("fCreatePsnID")
							+ "','"
							+ rsPaper.getString("fCreatePsnName")
							+ "','"
							+ rsPaper.getString("fCreatePsnFID")
							+ "','"
							+ rsPaper.getString("fCreatePsnFName")
							+ "','"
							+ rsSurvey.getString("fPerID")
							+ "','"
							+ rsSurvey.getString("fPerName")
							+ "','"
							+ rsSurvey.getString("fPerFID")
							+ "','/OA/survey/process/surveyPaperDetailView/surveyPaperDetailView.w','/OA/survey/process/surveyTask/surveyTask.j','"
							+ paperID
							+ "','temSimultaneous','tesReady','尚未处理',"
							+ "'/OA/survey/process/surveySend/surveySendProcess','surveySendActivity','"+java.util.UUID.randomUUID().toString().replace("-", "").toUpperCase()+"')";
					Map<String, Object> param1 = new HashMap<String, Object>();
					param1.put("currentDate", CommonUtils.getCurrentDateTime());
					KSQL.executeUpdate(sql, param1,sysDataModel, null);
					
					sql = "update OA_VS_Survey s set s.fSState='已发布',s.fSendTime= :currentDate,s.fTaskID='"
							+ rsSurvey.getString("sGUID")
							+ "' where s='" + surveyID + "'";
					Map<String, Object> param2 = new HashMap<String, Object>();
					param2.put("currentDate", CommonUtils.getCurrentDateTime());
					KSQL.executeUpdate(sql, param2, OADataModel, null);
				}
			} else if (rsPaper.getString("fPState").equals("已发布")) {
				sql = "select guid() as sGUID,s.fPerID,s.fPerName,s.fPerFID,s.fSState from OA_VS_Survey s where s='" + surveyID + "'";
				Table table = KSQL.select(sql, null, OADataModel, null);
				Iterator<Row> tabs = table.iterator();
				while (tabs.hasNext()) {
					Row rsSurvey = tabs.next();
					if (rsSurvey.getString("fSState").equals("已发布")) {
						sql = "delete from OA_VS_Detail d where d.fSurveyID='" + surveyID + "'";
						KSQL.executeUpdate(sql, null, OADataModel, null);
						
						sql = "update SA_Task t set t.sStatusID='tesAborted',t.sStatusName='已终止' where t='" + rsSurvey.getString("fTaskID") + "'";
						KSQL.executeUpdate(sql, null, sysDataModel, null);
					} else {
						sql = "delete from OA_VS_Detail d where d.fSurveyID='" + surveyID + "'";
						KSQL.executeUpdate(sql, null, OADataModel, null);
					}
					sql = "insert into OA_VS_Detail d(d,d.fSurveyID,d.fQuestionID,d.fAnswer,d.version) (select guid(),'"
							+ surveyID + "',q ,null,0 from OA_VS_Question q where q.fPaperID = '" + paperID + "')"; 
					KSQL.executeUpdate(sql, null, OADataModel, null);
					
					sql = "insert into SA_Task t(t,t.sParent,t.sName,t.sCatalogID,t.sKindID,t.sCreateTime,t.sCreatorPersonID,t.sCreatorPersonName,t.sCreatorFID,t.sCreatorFName,"
							+ "t.sExecutorPersonID,t.sExecutorPersonName,t.sExecutorFID,t.sCURL,t.sEURL,t.sData1,t.sExecuteMode,t.sStatusID,t.sStatusName,t.sProcess,t.sActivity,t.sLock) "
							+ " values('"
							+ rsSurvey.getString("sGUID")
							+ "','"
							+ rsPaper.getString("fTaskID")
							+ "','在线调查:"
							+ rsPaper.getString("fTitle")
							+ "','tsTask','tkExecutor',:currentDate,'"
							+ rsPaper.getString("fCreatePsnID")
							+ "','"
							+ rsPaper.getString("fCreatePsnName")
							+ "','"
							+ rsPaper.getString("fCreatePsnFID")
							+ "','"
							+ rsPaper.getString("fCreatePsnFName")
							+ "','"
							+ rsSurvey.getString("fPerID")
							+ "','"
							+ rsSurvey.getString("fPerName")
							+ "','"
							+ rsSurvey.getString("fPerFID")
							+ "','/OA/survey/process/surveyPaperDetailView/surveyPaperDetailView.w','/OA/survey/process/surveyTask/surveyTask.j','"
							+ paperID
							+ "','temSimultaneous','tesReady','尚未处理',"
							+ "'/OA/survey/process/surveySend/surveySendProcess','surveySendActivity','"+java.util.UUID.randomUUID().toString().replace("-", "").toUpperCase()+"')";
					Map<String, Object> param1 = new HashMap<String, Object>();
					param1.put("currentDate", CommonUtils.getCurrentDateTime());
					KSQL.executeUpdate(sql, param1, sysDataModel, null);
					
					sql = "update OA_VS_Survey s set s.fSState='已发布',s.fSendTime=:currentDate,s.fTaskID='"
							+ rsSurvey.getString("sGUID") + "' where s='" + surveyID + "'";
					Map<String, Object> param2 = new HashMap<String, Object>();
					param2.put("currentDate", CommonUtils.getCurrentDateTime());
					KSQL.executeUpdate(sql, param2, OADataModel, null);
				}
			}
		}
	}

	public static void destroySurvey(String taskID, String surveyID){

		String sql = null;

		sql = "update SA_Task t set t.sStatusID='tesAborted',t.sStatusName='已终止' where t='"
						+ taskID + "'";
		KSQL.executeUpdate(sql, null, sysDataModel, null);
		
		sql = "update OA_VS_Survey s set s.fSState='已终止' where s = '" + surveyID + "'";
		KSQL.executeUpdate(sql, null, OADataModel, null);


	}

	/* 结束调查 */
	public static void finishSurvey(String paperID) {
		String sql = null;

		sql = "update SA_Task t set t.sStatusID='tesAborted',t.sStatusName='已终止' where t.sData1='"
			+ paperID + "' and t.sStatusID = 'tesReady' and t.sKindID='tkExecutor'";
		KSQL.executeUpdate(sql, null, sysDataModel, null);
		
		sql = "update SA_Task t set t.sStatusID='tesFinished',t.sStatusName='已完成' where t.sData1='"
					+ paperID + "' and t.sStatusID = 'tesReady' and t.sKindID='tkTask'";
		KSQL.executeUpdate(sql, null, sysDataModel, null);
				
		sql = "update OA_VS_Survey s set s.fSState='已终止' where s.fPaperID = '"
					+ paperID + "' and s.fSState <> '已完成'";
		KSQL.executeUpdate(sql, null, OADataModel, null);
				
		sql = "update OA_VS_Paper p set p.fPState='已完成' where p = '" + paperID + "'";
		KSQL.executeUpdate(sql, null, OADataModel, null);
	}

	public static void abortSurvey(String paperID){

		String sql = null;

		sql = "update SA_Task t set t.sStatusID='tesAborted',t.sStatusName='已终止' where t.sData1='"
						+ paperID + "' and t.sStatusID = 'tesReady'";
		KSQL.executeUpdate(sql, null, sysDataModel, null);

		sql = "update OA_VS_Survey s set s.fSState='已终止' where s.fPaperID = '" + paperID + "'";
		KSQL.executeUpdate(sql, null, OADataModel, null);

		sql = "update OA_VS_Paper p set p.fPState='已终止' where p = '" + paperID + "'";
		KSQL.executeUpdate(sql, null, OADataModel, null);
	}

	public static void copyPaper(String paperID) {
		String sql = null, paperGUID = null, qGUID = null;
		paperGUID = createGuid();
		sql = "insert into OA_VS_Paper p(p,p.fTitle,p.fPublicType,p.fPublicTypeName,p.fDescribe,p.fRemark,"
				+ "p.fPState,p.fCreateOgnID,p.fCreateOgnName,p.fCreateDeptID,p.fCreateDeptName,p.fCreatePsnID,"
				+ "p.fCreatePsnName,p.fCreatePsnFID,p.fCreatePsnFName,p.fCreateTime,p.version) (select '" + paperGUID + "',concat('复制-',pp.fTitle),"
				+ "pp.fPublicType,pp.fPublicTypeName,pp.fDescribe,pp.fRemark,'编制中','" + SysUtils.getCurrentOgnID() + "','"
				+ SysUtils.getCurrentOgnName() + "','"
				+ (SysUtils.getCurrentDeptID() != null ? SysUtils.getCurrentDeptID() : SysUtils.getCurrentOgnID()) + "','"
				+ (SysUtils.getCurrentDeptName() != null ? SysUtils.getCurrentDeptName() : SysUtils.getCurrentOgnName()) + "','"
				+ SysUtils.getCurrentPersonID() + "','" + SysUtils.getCurrentPersonName() + "','" + SysUtils.getCurrentPersonMemberFID() + "','"
				+ SysUtils.getCurrentPersonMemberFName() + "',:currentDate,0 from OA_VS_Paper pp where pp = '" + paperID + "')";
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("currentDate", CommonUtils.getCurrentDateTime());
		KSQL.executeUpdate(sql, param, OADataModel, null);

		sql = "select q from OA_VS_Question q where q.fPaperID = '" + paperID + "'";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> tabs = table.iterator();
		while (tabs.hasNext()) {
			Row rsQuestion = tabs.next();
			qGUID = createGuid();
			sql = "insert into OA_VS_Question q(q,q.fPaperID,q.fSequence,q.fQType,q.fQTypeName,q.fContent,q.version) " + " (select guid() ,'"
					+ paperGUID + "',qq.fSequence,qq.fQType,qq.fQTypeName,qq.fContent,0 " + " from OA_VS_Question qq where qq = '"
					+ rsQuestion.getString("q") + "')";
			KSQL.executeUpdate(sql, param, OADataModel, null);

			sql = "insert into OA_VS_Items t(t,t.fQuestionID,t.fSequence,t.fContent,t.version) (select guid(),'" + qGUID
					+ "',i.fSequence,i.fContent,0 from OA_VS_Items i where i.fQuestionID = '" + rsQuestion.getString("q") + "')";
			KSQL.executeUpdate(sql, param, OADataModel, null);
		}
	}

	public static void saveSurvey(Map saveInfo) throws Exception {
		PreparedStatement pstat = null;
		String sql = null;
		Connection conn = ModelUtils.getConnection("/OA");
		ContextHelper.getTransaction().begin(conn);
		try {
			try {
				sql = "update OA_VS_Detail set fAnswer=? where fID=?";
				pstat = conn.prepareStatement(sql);
				Iterator itSave = saveInfo.entrySet().iterator();
				while (itSave.hasNext()) {
					Entry entry = (Entry) itSave.next();
					pstat.setString(1, entry.getValue() == null ? "" : entry
							.getValue().toString());
					pstat.setString(2, entry.getKey().toString());
					pstat.addBatch();
				}
				pstat.executeBatch();
			} finally {
				pstat.close();
				pstat = null;
			}
		} finally {
			conn.close();
			conn = null;
		}
	}

	public static void commitSurvey(String taskID) throws Exception {
		String sql = "";
		sql = "update SA_Task t set t.sStatusID='tesFinished',t.sStatusName='已完成',t.sExpectStartTime = :currentDate where t='"
					+ taskID + "'";
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("currentDate", CommonUtils.getCurrentDateTime());
		KSQL.executeUpdate(sql, param, sysDataModel, null);
			
		sql = "update OA_VS_Survey s set s.fSState='已完成',s.fFinishTime= :currentDate where s.fTaskID='" + taskID + "'";
		Map<String, Object> param1 = new HashMap<String, Object>();
		param1.put("currentDate", CommonUtils.getCurrentDateTime());
		KSQL.executeUpdate(sql, param1, OADataModel, null);
	}

	public static Document queryDom(String sql) {
		Document dom = DataUtils.table2XML(KSQL.select(sql, null,
				"/OA/survey/data", null));
		return dom;
	}

	public static String createGuid() {
		return (java.util.UUID.randomUUID().toString().toUpperCase());
	}
	
	
	public static Document getSurveyFinallyData(String paperID){
			Element root = DocumentHelper.createElement("root");
			Document doc = DocumentHelper.createDocument(root);
			
			Element queryPaper = root.addElement("queryPaper");
			String queryPaperSql = "select OA_VS_Paper.fTitle,OA_VS_Paper.fCreatePsnName,OA_VS_Paper.fCreateDeptName,OA_VS_Paper.fCreateTime,OA_VS_Paper.fDescribe,OA_VS_Paper.fPublicTypeName from OA_VS_Paper OA_VS_Paper where OA_VS_Paper='"+paperID+"'";
			Table tabQueryPaper = KSQL.select(queryPaperSql, null, "/OA/survey/data", null);
			//System.out.println("qsql="+qsql);
			Iterator<Row> rowQueryPapers = tabQueryPaper.iterator();
			Element arrQueryPapers = queryPaper.addElement("root").addElement("data").addElement("rows");
			while (rowQueryPapers.hasNext()){
				Row rowQueryPaper = rowQueryPapers.next();
				Element arrQueryPaper = arrQueryPapers.addElement("row");
				Element fTitle = arrQueryPaper.addElement("fTitle");
				if(rowQueryPaper.getString("fTitle")!=null){
					fTitle.setText(rowQueryPaper.getString("fTitle"));
				}
				arrQueryPaper.addElement("fCreatePsnName").setText(rowQueryPaper.getString("fCreatePsnName"));
				arrQueryPaper.addElement("fCreateDeptName").setText(rowQueryPaper.getString("fCreateDeptName"));
				arrQueryPaper.addElement("fCreateTime").setText(getValue(SimpleTransform.transToString(rowQueryPaper.getDateTime("fCreateTime")), ""));
				Element fDescribe = arrQueryPaper.addElement("fDescribe");
				if(rowQueryPaper.getString("fDescribe")!=null){
					fDescribe.setText(rowQueryPaper.getString("fDescribe"));
				}
				arrQueryPaper.addElement("fPublicTypeName").setText(rowQueryPaper.getString("fPublicTypeName"));
			}
			
			Element queryQuestion = root.addElement("queryQuestion");
			String queryQuestionSql = "select V_OA_VS_SumQuestion,V_OA_VS_SumQuestion.fPaperID,V_OA_VS_SumQuestion.fSequence,V_OA_VS_SumQuestion.fQType,V_OA_VS_SumQuestion.fContent,V_OA_VS_SumQuestion.fTemp,V_OA_VS_SumQuestion.fAllNum,V_OA_VS_SumQuestion.fAnswerNum,V_OA_VS_SumQuestion.fRate from V_OA_VS_SumQuestion V_OA_VS_SumQuestion where V_OA_VS_SumQuestion.fPaperID='"+paperID+"' order by V_OA_VS_SumQuestion.fSequence asc";
			Table tabQueryQuestion = KSQL.select(queryQuestionSql, null, "/OA/survey/data", null);
			//System.out.println("queryQuestionSql="+queryQuestionSql);
			Iterator<Row> rowQueryQuestions = tabQueryQuestion.iterator();
			Element arrQueryQuestions = queryQuestion.addElement("root").addElement("data").addElement("rows");
			while (rowQueryQuestions.hasNext()){
				Row rowQueryQuestion = rowQueryQuestions.next();
				Element arrQueryQuestion = arrQueryQuestions.addElement("row");
				arrQueryQuestion.addElement("V_OA_VS_SumQuestion").setText(rowQueryQuestion.getString("V_OA_VS_SumQuestion"));
				arrQueryQuestion.addElement("fPaperID").setText(rowQueryQuestion.getString("fPaperID"));
				arrQueryQuestion.addElement("fQType").setText(rowQueryQuestion.getString("fQType"));
				Element fContent = arrQueryQuestion.addElement("fContent");
				if(rowQueryQuestion.getString("fContent")!=null){
					fContent.setText(rowQueryQuestion.getString("fContent"));
				}
				arrQueryQuestion.addElement("fAllNum").setText(rowQueryQuestion.getDecimal("fAllNum").toString());
				arrQueryQuestion.addElement("fAnswerNum").setText(rowQueryQuestion.getDecimal("fAnswerNum").toString());
				arrQueryQuestion.addElement("fRate").setText(rowQueryQuestion.getDecimal("fRate").toString());
			}
			
			Element queryItems = root.addElement("queryItems");
			String queryItemsSql = "select V_OA_VS_SumItems.fQuestionID,V_OA_VS_SumItems.fContent,V_OA_VS_SumItems.fSequence,V_OA_VS_SumItems.fAllNum,V_OA_VS_SumItems.fINum,V_OA_VS_SumItems.fRate from V_OA_VS_SumItems V_OA_VS_SumItems where V_OA_VS_SumItems.fPaperID='"+paperID+"' order by V_OA_VS_SumItems.fSequence asc";
			Table tabQueryItems = KSQL.select(queryItemsSql, null, "/OA/survey/data", null);
			//System.out.println("queryItemsSql="+queryItemsSql);
			Iterator<Row> rowQueryItemss = tabQueryItems.iterator();
			Element arrQueryItemss = queryItems.addElement("root").addElement("data").addElement("rows");
			while (rowQueryItemss.hasNext()){
				Row rowQueryItems = rowQueryItemss.next();
				Element arrQueryItems = arrQueryItemss.addElement("row");
				arrQueryItems.addElement("fQuestionID").setText(rowQueryItems.getString("fQuestionID"));
				Element fContent = arrQueryItems.addElement("fContent");
				if(rowQueryItems.getString("fContent")!=null){
					fContent.setText(rowQueryItems.getString("fContent"));
				}
				arrQueryItems.addElement("fAllNum").setText(rowQueryItems.getDecimal("fAllNum").toString());
				arrQueryItems.addElement("fINum").setText(rowQueryItems.getDecimal("fINum").toString());
				arrQueryItems.addElement("fRate").setText(rowQueryItems.getDecimal("fRate").toString());
			}
			
			//System.out.println("doc="+doc.asXML());
			return doc;
	}
	
	public static Document getSurveyTaskData(String task,String paperID,String surveyID){
		Element root = DocumentHelper.createElement("root");
		Document doc = DocumentHelper.createDocument(root);
		Element taskID = root.addElement("task");
		String queryPaperSql = "",queryQuestionSql="",queryItemsSql="";

		if(task.equals("") || task.equals(null) || task==null){
			queryPaperSql = "select OA_VS_Paper.fTitle,OA_VS_Paper.fCreatePsnName,OA_VS_Paper.fCreateDeptName,OA_VS_Paper.fCreateTime,OA_VS_Paper.fDescribe,OA_VS_Paper.fPublicTypeName from OA_VS_Paper OA_VS_Paper where OA_VS_Paper = '"+paperID+"'";
			Element queryPaper = DocumentHelper.createElement("queryPaper");
			Table tabQueryPaper = KSQL.select(queryPaperSql, null, "/OA/survey/data", null);
			//System.out.println("queryPaperSql="+queryPaperSql);
			Iterator<Row> rowQueryPapers = tabQueryPaper.iterator();
			Element arrQueryPapers = queryPaper.addElement("root").addElement("data").addElement("rows");
			while (rowQueryPapers.hasNext()){
				Row rowQueryPaper = rowQueryPapers.next();
				Element arrQueryPaper = arrQueryPapers.addElement("row");
				Element fTitle = arrQueryPaper.addElement("fTitle");
				if(rowQueryPaper.getString("fTitle")!=null){
					fTitle.setText(rowQueryPaper.getString("fTitle"));
					System.out.println("==title=="+rowQueryPaper.getString("fTitle"));
				}
				arrQueryPaper.addElement("fCreatePsnName").setText(rowQueryPaper.getString("fCreatePsnName"));
				arrQueryPaper.addElement("fCreateDeptName").setText(rowQueryPaper.getString("fCreateDeptName"));
				arrQueryPaper.addElement("fCreateTime").setText(getValue(SimpleTransform.transToString(rowQueryPaper.getDateTime("fCreateTime")), ""));
				Element fDescribe = arrQueryPaper.addElement("fDescribe");
				if(rowQueryPaper.getString("fDescribe")!=null){
					fDescribe.setText(rowQueryPaper.getString("fDescribe"));
				}
				arrQueryPaper.addElement("fPublicTypeName").setText(rowQueryPaper.getString("fPublicTypeName"));
			}						
			
			queryQuestionSql = "select V_OA_VS_Survey,V_OA_VS_Survey.fPaperID,V_OA_VS_Survey.fSequence,V_OA_VS_Survey.fQType,V_OA_VS_Survey.fContent,V_OA_VS_Survey.fAnswer,V_OA_VS_Survey.fDetailID,V_OA_VS_Survey.fSState from V_OA_VS_Survey V_OA_VS_Survey where V_OA_VS_Survey.fSurveyID='"+surveyID+"' order by V_OA_VS_Survey.fSequence asc";
			Element queryQuestion = DocumentHelper.createElement("queryQuestion");
			Table tabQueryQuestion = KSQL.select(queryQuestionSql, null, "/OA/survey/data", null);
			//System.out.println("queryQuestionSql="+queryQuestionSql);
			Iterator<Row> rowQueryQuestions = tabQueryQuestion.iterator();
			Element arrQueryQuestions = queryQuestion.addElement("root").addElement("data").addElement("rows");
			while (rowQueryQuestions.hasNext()){
				Row rowQueryQuestion = rowQueryQuestions.next();
				Element arrQueryQuestion = arrQueryQuestions.addElement("row");
				arrQueryQuestion.addElement("V_OA_VS_Survey").setText(rowQueryQuestion.getString("V_OA_VS_Survey"));
				arrQueryQuestion.addElement("fPaperID").setText(rowQueryQuestion.getString("fPaperID"));
				arrQueryQuestion.addElement("fQType").setText(rowQueryQuestion.getString("fQType"));
				Element fContent = arrQueryQuestion.addElement("fContent");
				if(rowQueryQuestion.getString("fContent")!=null){
					fContent.setText(rowQueryQuestion.getString("fContent"));
				}
				Element fAnswer = arrQueryQuestion.addElement("fAnswer");
				if(rowQueryQuestion.getString("fAnswer")!=null){
					fAnswer.setText(rowQueryQuestion.getString("fAnswer"));
				}
				arrQueryQuestion.addElement("fDetailID").setText(rowQueryQuestion.getString("fDetailID"));
				arrQueryQuestion.addElement("fSState").setText(rowQueryQuestion.getString("fSState"));
			}
			
			
			
			queryItemsSql = "select V_OA_VS_Items,V_OA_VS_Items.fQuestionID,V_OA_VS_Items.fContent,V_OA_VS_Items.fSequence from V_OA_VS_Items V_OA_VS_Items where V_OA_VS_Items.fPaperID='"+paperID+"' order by V_OA_VS_Items.fSequence asc";
			Element queryItems = DocumentHelper.createElement("queryItems");
			Table tabQueryItems = KSQL.select(queryItemsSql, null, "/OA/survey/data", null);
			//System.out.println("queryItemsSql="+queryItemsSql);
			Iterator<Row> rowQueryItemss = tabQueryItems.iterator();
			Element dataQueryItems = queryItems.addElement("root").addElement("data");
			Element arrQueryItemss = dataQueryItems.addElement("rows");
			while (rowQueryItemss.hasNext()){
				Row rowQueryItems = rowQueryItemss.next();
				Element arrQueryItems = arrQueryItemss.addElement("row");
				arrQueryItems.addElement("V_OA_VS_Items").setText(rowQueryItems.getString("V_OA_VS_Items"));
				arrQueryItems.addElement("fQuestionID").setText(rowQueryItems.getString("fQuestionID"));
				Element fContent = arrQueryItems.addElement("fContent");
				if(rowQueryItems.getString("fContent")!=null){
					fContent.setText(rowQueryItems.getString("fContent"));
				}
			}
			root.add(queryPaper);
			root.add(queryQuestion);
			root.add(queryItems);
		}else{		
			taskID.setText(task);
			queryQuestionSql = "select V_OA_VS_Survey,V_OA_VS_Survey.fPaperID,V_OA_VS_Survey.fSurveyID,V_OA_VS_Survey.fSequence,V_OA_VS_Survey.fQType,V_OA_VS_Survey.fContent,V_OA_VS_Survey.fDetailID,V_OA_VS_Survey.fAnswer,V_OA_VS_Survey.fSState from V_OA_VS_Survey V_OA_VS_Survey where V_OA_VS_Survey.fTaskID='"+task+"' order by V_OA_VS_Survey.fSequence asc";
			Table tabQueryQuestion = KSQL.select(queryQuestionSql, null, "/OA/survey/data", null);
			//System.out.println("queryQuestionSql="+queryQuestionSql);
			Iterator<Row> rowQueryQuestions = tabQueryQuestion.iterator();
			String fPaperID = "";
			Element queryQuestion = DocumentHelper.createElement("queryQuestion");
			Element arrQueryQuestions = queryQuestion.addElement("root").addElement("data").addElement("rows");
			while (rowQueryQuestions.hasNext()){
				Row rowQueryQuestion = rowQueryQuestions.next();
				fPaperID = rowQueryQuestion.getString("fPaperID");

				Element arrQueryQuestion = arrQueryQuestions.addElement("row");
				arrQueryQuestion.addElement("V_OA_VS_Survey").setText(rowQueryQuestion.getString("V_OA_VS_Survey"));
				arrQueryQuestion.addElement("fPaperID").setText(rowQueryQuestion.getString("fPaperID"));
				arrQueryQuestion.addElement("fSurveyID").setText(rowQueryQuestion.getString("fSurveyID"));
				arrQueryQuestion.addElement("fQType").setText(rowQueryQuestion.getString("fQType"));
				Element fContent = arrQueryQuestion.addElement("fContent");
				if(rowQueryQuestion.getString("fContent")!=null){
					fContent.setText(rowQueryQuestion.getString("fContent"));
				}
				arrQueryQuestion.addElement("fDetailID").setText(rowQueryQuestion.getString("fDetailID"));
				
				Element fAnswer = arrQueryQuestion.addElement("fAnswer");
				if(rowQueryQuestion.getString("fAnswer")!=null){
					fAnswer.setText(rowQueryQuestion.getString("fAnswer"));
				}
				arrQueryQuestion.addElement("fSState").setText(rowQueryQuestion.getString("fSState"));				
			}
			
			queryPaperSql = "select OA_VS_Paper.fTitle,OA_VS_Paper.fCreatePsnName,OA_VS_Paper.fCreateDeptName,OA_VS_Paper.fCreateTime,OA_VS_Paper.fDescribe,OA_VS_Paper.fPublicTypeName from OA_VS_Paper OA_VS_Paper where OA_VS_Paper='"+fPaperID+"'";
			Element queryPaper = DocumentHelper.createElement("queryPaper");
			Table tabQueryPaper = KSQL.select(queryPaperSql, null, "/OA/survey/data", null);
			//System.out.println("queryPaperSql="+queryPaperSql);
			Iterator<Row> rowQueryPapers = tabQueryPaper.iterator();
			Element arrQueryPapers = queryPaper.addElement("root").addElement("data").addElement("rows");
			while (rowQueryPapers.hasNext()){
				Row rowQueryPaper = rowQueryPapers.next();
				Element arrQueryPaper = arrQueryPapers.addElement("row");
				Element fTitle = arrQueryPaper.addElement("fTitle");
				if(rowQueryPaper.getString("fTitle")!=null){
					fTitle.setText(rowQueryPaper.getString("fTitle"));
					System.out.println("==title1=="+rowQueryPaper.getString("fTitle"));
				}
			//	arrQueryPaper.addElement("fTitle").setText(rowQueryPaper.getString("fTitle"));
				arrQueryPaper.addElement("fCreatePsnName").setText(rowQueryPaper.getString("fCreatePsnName"));
				arrQueryPaper.addElement("fCreateDeptName").setText(rowQueryPaper.getString("fCreateDeptName"));
				arrQueryPaper.addElement("fCreateTime").setText(getValue(SimpleTransform.transToString(rowQueryPaper.getDateTime("fCreateTime")), ""));
				
				Element fDescribe = arrQueryPaper.addElement("fDescribe");
				if(rowQueryPaper.getString("fDescribe")!=null){
					fDescribe.setText(rowQueryPaper.getString("fDescribe"));
				}
				arrQueryPaper.addElement("fPublicTypeName").setText(rowQueryPaper.getString("fPublicTypeName"));
			}

			queryItemsSql = "select V_OA_VS_Items,V_OA_VS_Items.fQuestionID,V_OA_VS_Items.fContent,V_OA_VS_Items.fSequence from V_OA_VS_Items V_OA_VS_Items where V_OA_VS_Items.fPaperID='"+fPaperID+"' order by V_OA_VS_Items.fSequence asc";
			
			Element queryItems = DocumentHelper.createElement("queryItems");
			Table tabQueryItems = KSQL.select(queryItemsSql, null, "/OA/survey/data", null);
			//System.out.println("queryItemsSql="+queryItemsSql);
			Iterator<Row> rowQueryItemss = tabQueryItems.iterator();
			Element arrQueryItemss = queryItems.addElement("root").addElement("data").addElement("rows");
			while (rowQueryItemss.hasNext()){
				Row rowQueryItems = rowQueryItemss.next();
				Element arrQueryItems = arrQueryItemss.addElement("row");
				arrQueryItems.addElement("V_OA_VS_Items").setText(rowQueryItems.getString("V_OA_VS_Items"));
				arrQueryItems.addElement("fQuestionID").setText(rowQueryItems.getString("fQuestionID"));
				Element fContent = arrQueryItems.addElement("fContent");
				if(rowQueryItems.getString("fContent")!=null){
					fContent.setText(rowQueryItems.getString("fContent"));
				}
			}
			
			root.add(queryPaper);
			root.add(queryQuestion);
			root.add(queryItems);
		}
		
		System.out.println("doc="+doc.asXML());
		return doc;
	}
	
	public static Document getSurveyPaperData(String paperID){
		Element root = DocumentHelper.createElement("root");
		Document doc = DocumentHelper.createDocument(root);
		Element queryPaper = root.addElement("queryPaper");
		String queryPaperSql = "select OA_VS_Paper.fTitle,OA_VS_Paper.fCreatePsnName,OA_VS_Paper.fCreateDeptName,OA_VS_Paper.fCreateTime,OA_VS_Paper.fDescribe,OA_VS_Paper.fPublicTypeName  from OA_VS_Paper OA_VS_Paper where OA_VS_Paper='"+paperID+"'";
		Table tabQueryPaper = KSQL.select(queryPaperSql, null, "/OA/survey/data", null);
		//System.out.println("queryPaperSql="+queryPaperSql);
		Iterator<Row> rowQueryPapers = tabQueryPaper.iterator();
		Element arrQueryPapers = queryPaper.addElement("root").addElement("data").addElement("rows");
		while (rowQueryPapers.hasNext()){
			Row rowQueryPaper = rowQueryPapers.next();
			Element arrQueryPaper = arrQueryPapers.addElement("row");
			
			Element fTitle = arrQueryPaper.addElement("fTitle");
			if(rowQueryPaper.getString("fTitle")!=null){
				fTitle.setText(rowQueryPaper.getString("fTitle"));
			}
			arrQueryPaper.addElement("fCreatePsnName").setText(rowQueryPaper.getString("fCreatePsnName"));
			arrQueryPaper.addElement("fCreateDeptName").setText(rowQueryPaper.getString("fCreateDeptName"));
			arrQueryPaper.addElement("fCreateTime").setText(getValue(SimpleTransform.transToString(rowQueryPaper.getDateTime("fCreateTime")), ""));
			
			Element fDescribe = arrQueryPaper.addElement("fDescribe");
			if(rowQueryPaper.getString("fDescribe")!=null){
				fDescribe.setText(rowQueryPaper.getString("fDescribe"));
			}
			arrQueryPaper.addElement("fPublicTypeName").setText(rowQueryPaper.getString("fPublicTypeName"));
		}
		
		Element queryQuestion = root.addElement("queryQuestion");
		String queryQuestionSql = "select OA_VS_Question,OA_VS_Question.fPaperID,OA_VS_Question.fSequence,OA_VS_Question.fQType,OA_VS_Question.fContent,OA_VS_Question.fTemp from OA_VS_Question OA_VS_Question where OA_VS_Question.fPaperID='"+paperID+"' order by OA_VS_Question.fSequence asc";
		Table tabQueryQuestion = KSQL.select(queryQuestionSql, null, "/OA/survey/data", null);
		//System.out.println("queryQuestionSql="+queryQuestionSql);
		Iterator<Row> rowQueryQuestions = tabQueryQuestion.iterator();
		Element arrQueryQuestions = queryQuestion.addElement("root").addElement("data").addElement("rows");
		while (rowQueryQuestions.hasNext()){
			Row rowQueryQuestion = rowQueryQuestions.next();
			Element arrQueryQuestion = arrQueryQuestions.addElement("row");
			arrQueryQuestion.addElement("OA_VS_Question").setText(rowQueryQuestion.getString("OA_VS_Question"));
			arrQueryQuestion.addElement("fPaperID").setText(rowQueryQuestion.getString("fPaperID"));
			arrQueryQuestion.addElement("fQType").setText(rowQueryQuestion.getString("fQType"));
			Element fSequence = arrQueryQuestion.addElement("fSequence");
			if(rowQueryQuestion.getInteger("fSequence")!=null){
				fSequence.setText(rowQueryQuestion.getInteger("fSequence").toString());
			}
			Element fContent = arrQueryQuestion.addElement("fContent");
			if(rowQueryQuestion.getString("fContent")!=null){
				fContent.setText(rowQueryQuestion.getString("fContent"));
			}
		}
		
		Element queryItems = root.addElement("queryItems");
		String queryItemsSql = "select V_OA_VS_Items.fQuestionID,V_OA_VS_Items.fContent,V_OA_VS_Items.fSequence from V_OA_VS_Items V_OA_VS_Items where V_OA_VS_Items.fPaperID='"+paperID+"' order by V_OA_VS_Items.fSequence asc";
		Table tabQueryItems = KSQL.select(queryItemsSql, null, "/OA/survey/data", null);
		//System.out.println("queryItemsSql="+queryItemsSql);
		Iterator<Row> rowQueryItemss = tabQueryItems.iterator();
		Element arrQueryItemss = queryItems.addElement("root").addElement("data").addElement("rows");
		while (rowQueryItemss.hasNext()){
			Row rowQueryItems = rowQueryItemss.next();
			Element arrQueryItems = arrQueryItemss.addElement("row");
			arrQueryItems.addElement("fQuestionID").setText(rowQueryItems.getString("fQuestionID"));
			Element fContent = arrQueryItems.addElement("fContent");
			if(rowQueryItems.getString("fContent")!=null){
				fContent.setText(rowQueryItems.getString("fContent"));
			}
			Element fSequence = arrQueryItems.addElement("fSequence");
			if(rowQueryItems.getInteger("fSequence")!=null){
				fSequence.setText(rowQueryItems.getInteger("fSequence").toString());
			}
		}
		
		//System.out.println("doc="+doc.asXML());
		return doc;
	}
	
	private static String getValue(String obj, String defaultValue){
		if (obj == null){
			return defaultValue;
		}else{
			return obj;
		}
	}
}