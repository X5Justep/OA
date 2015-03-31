

import java.util.Map;

import com.justep.model.ModelUtils;
import com.justep.system.data.KSQL;
import com.justep.system.data.Table;
import com.justep.util.Utils;

public class KSQLProcedure {

	public static Table query(String ksql, Map<String, Object> variables, String dataModel, String fnModel) {
		Utils.check(Utils.isNotEmptyString(ksql) && Utils.isNotEmptyString(dataModel), "ksqlQueryAction中的ksql和dataModel参数必须指定！");
		return KSQL.select(ksql, variables, dataModel, Utils.isEmptyString(fnModel) ? null : ModelUtils.getModel(fnModel));

	}
	
	public static Integer update(String ksql, Map<String, Object> variables, String dataModel, String fnModel) {
		Utils.check(Utils.isNotEmptyString(ksql) && Utils.isNotEmptyString(dataModel), "ksqlUpdateAction中的ksql和dataModel参数必须指定！");
		return KSQL.executeUpdate(ksql, variables, dataModel, Utils.isEmptyString(fnModel) ? null : ModelUtils.getModel(fnModel));
	}
}
