import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.justep.design.model.exception.ModelException;
import com.justep.system.context.ContextHelper;
import com.justep.system.opm.PersonMember;
import com.justep.util.Utils;


public class TaskUtils {
	private static final Logger logger = Logger.getLogger(TaskUtils.class);
	
	public static String getCreatorCondition(String alias, Collection<PersonMember> pms, boolean useAgentProcess){
		String result = "";
		List<String> items = new ArrayList<String>();
		for (PersonMember pm : pms){
			String item = alias + ".sCreatorFID = '" + pm.getFID() + "' ";
			if (useAgentProcess){
				String agentProcess = pm.getAgentProcess();
				if (Utils.isNotEmptyString(agentProcess)){
					String agentProcessCondition = getAgentProcessCondition(alias, agentProcess);
					item = appendCondition(item, "and", agentProcessCondition);
				}
			}
			
			items.add(item);
		}
		
		if (items.isEmpty()){
			result = "1<>1";
		}else{
			for (String item : items){
				if (result.equals("")){
					result = item;
				}else{
					result = result + " or " + item;
				}
			}
		}
		
		return result;
	}
	
	public static String getExecutorCondition(String alias, Collection<PersonMember> pms, boolean useAgentProcess){
		String result = "";
		List<String> items = new ArrayList<String>();
		for (PersonMember pm : pms){
			String item = "'" + pm.getFID() + "' like concat(" + alias + ".sExecutorFID, '%')";
			if (useAgentProcess){
				String agentProcess = pm.getAgentProcess();
				if (Utils.isNotEmptyString(agentProcess)){
					String agentProcessCondition = getAgentProcessCondition(alias, agentProcess);
					item = appendCondition(item, "and", agentProcessCondition);
				}
			}
			
			items.add(item);
		}
		
		if (items.isEmpty()){
			result = "1<>1";
		}else{
			for (String item : items){
				if (result.equals("")){
					result = item;
				}else{
					result = result + " or " + item;
				}
			}
			
			result = appendCondition(result, "and", alias + ".sExecutorFID is not null");
		}
		
		return result;
	}
	
	private static String getAgentProcessCondition(String alias, String agentProcess){
		try {
			String result = "";
			SAXReader reader = new SAXReader();
			Document doc = reader.read(new ByteArrayInputStream(agentProcess.getBytes("UTF-8")));
			if (doc.getRootElement() != null){
				for (Object item : doc.getRootElement().elements()){
					String type = ((Element)item).getName();
					String value = ((Element)item).getTextTrim();
					if (type.equals("m")){
						result = appendCondition(result, "or", alias + ".sProcess like '" + value + "%'");
						
					}else if (type.equals("r")){
						for (String processActivity : ContextHelper.getOperator().getPermissionByRoleID(value)){
							String process = processActivity.substring(0, processActivity.indexOf(",")).trim();
							String activity = processActivity.substring(processActivity.indexOf(",") + 1).trim();
							result = appendCondition(result, "or", alias + ".sProcess = '" + process + "' and " + alias + ".sActivity = '" + activity + "'");
						}
						
					}else if (type.equals("p")){
						result = appendCondition(result, "or", alias + ".sProcess = '" + value + "'");

					}else if (type.equals("a")){
						String activity = value.substring(value.lastIndexOf("/") + 1).trim();
						String process = getProcess(value.substring(0, value.lastIndexOf("/")));
						if ("*".equals(activity)){
							result = appendCondition(result, "or", alias + ".sProcess = '" + process + "'");
							
						}else{
							result = appendCondition(result, "or", alias + ".sProcess = '" + process + "' and " + alias + ".sActivity = '" + activity + "'");
						}

					}else{
						String msg = "代理设置的sProcess的格式不对！不支持类型" + type;
						ModelException t = new ModelException(msg);
						logger.error(msg, t);
						throw t;
					}
				}
			}
			
			return result;
		} catch (UnsupportedEncodingException e) {
			String msg = "代理设置的sProcess的格式不对！";
			ModelException t = new ModelException(msg, e);
			logger.error(msg, t);
			throw t;
		} catch (DocumentException e) {
			String msg = "代理设置的sProcess的格式不对！";
			ModelException t = new ModelException(msg, e);
			logger.error(msg, t);
			throw t;
		}
	}
	
	private static String getProcess(String path){
		String name = path.substring(path.lastIndexOf("/") + 1);
		name = Character.toLowerCase(name.charAt(0)) + name.substring(1) + "Process";
		return path + "/" + name;
	}
	
	public static String appendCondition(String base, String operator, String condition){
		if (Utils.isEmptyString(base)){
			return condition;
		}else{
			if (Utils.isEmptyString(condition)){
				return base;
			}else{
				return "((" + base + ") " + operator + " (" + condition + "))";	
			}
		}
	}
	
}
