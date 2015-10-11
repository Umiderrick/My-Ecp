package pb.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import pb.DbConfig;

public class DB implements AutoCloseable {
	boolean bInited = false;

	// 加载驱动
	void initJDBC() throws ClassNotFoundException {
		String driverClass = DbConfig.readValue("DRIVER_CLASS"); 
	    try{    
		Class.forName(driverClass);
	    	}catch(ClassNotFoundException e){   
	    		 System.out.println("找不到驱动程序类 ，加载驱动失败！"); 
	    		 e.printStackTrace() ;  
	    	}
		bInited = true;
	}

	private Connection conn;

	Connection getConnection() throws IOException, ClassNotFoundException, SQLException {
		if (!bInited) {
			initJDBC();
		}
		if (conn != null) {
			return conn;
		}

		String URL = DbConfig.readValue("CONNECTION_URL");
		String name = DbConfig.readValue("CONNECTION_USERNAME");
		String password = DbConfig.readValue("CONNECTION_PASSWORD");
		conn = DriverManager.getConnection(URL, name, password);
		return conn;
	}
	void closeconnection(AutoCloseable obj) {

		if (obj != null) {
			try {
				obj.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	public void closeDatabase() {
		try {
			close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	@Override
	public void close() throws Exception {
		conn.close();
		conn = null;
	}

	public int executeUpdate(String sql) {
		return executeUpdate(sql, null, null);
	}

	/**
	 * 
	 * update users set password=:password where username=:username
	 * 
	 * {password="123",username="user"}
	 * 
	 * @param sql
	 * @param parameter
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public int executeUpdate(String sql, Map<String, Object> parameter) {
		// 解析列明
		Matcher m = colPattern.matcher(sql);
		StringBuffer sb = new StringBuffer();
		List<String> colList = new ArrayList(parameter.size());
		while (m.find()) {
			String col = m.group(1);
			colList.add(col);
			m.appendReplacement(sb, "?");
		}
		m.appendTail(sb);
		// 解析参数值
		int[] sqlTypes = new int[colList.size()];
		Object[] paramValues = new Object[colList.size()];
		for (int i = 0; i < colList.size(); i++) {
			Object v = parameter.get(colList.get(i));
			sqlTypes[i] = 12;
			paramValues[i] = v;
		}
		return executeUpdate(sb.toString(), sqlTypes, paramValues);
	}

	static final Pattern colPattern = Pattern.compile(":(\\w+)");

	/**
	 * delete from table where ip=? update table set ip=? where name=?
	 * 
	 * @param sql
	 * @param sqlTypes
	 *            java.sql.Types
	 * @param paramValues
	 */
	public int executeUpdate(String sql, int[] sqlTypes, Object[] paramValues) {
		try {
			Statement stmt = null;
			if (sqlTypes != null) {
				stmt = getConnection().prepareStatement(sql);
				setPrepareStatementParams((PreparedStatement) stmt, sqlTypes, paramValues);
			} else {
				stmt = createStatement();
			}
			int rs = (stmt instanceof PreparedStatement ? ((PreparedStatement) stmt).executeUpdate() : stmt.executeUpdate(sql));

			System.out.println("表更新成功");
			return rs;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

	}

	/**
	 * 向指定的表中插入数据 inert into table（colname） values(?,?,?)
	 * 
	 * @param table
	 * @param dataList
	 * @throws Exception
	 */
	public int tableInsert(String table, List<Map<String, Object>> dataList) {
		try {
			Set<String> colSet = parseColSet(dataList);
			Set<DataColumn> tableColumnSet = getTableColumnSet(table);
			Set<DataColumn> cols = filterColSet(colSet, tableColumnSet);
			String executeSql = createInsertSql(table, cols);
			PreparedStatement ps = getConnection().prepareStatement(executeSql);
			setParamValues(ps, dataList, cols);
			int[] sums = ps.executeBatch();
			return getSum(sums);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	private int getSum(int[] sums) {
		int sum = 0;
		for (int v : sums) {
			sum += v;
		}
		return sum;
	}

	private void setParamValues(PreparedStatement ps, List<Map<String, Object>> dataList, Set<DataColumn> colSet) throws Exception {
		DataColumn[] cols = colSet.toArray(new DataColumn[colSet.size()]);
		final int[] sqlTypes = new int[colSet.size()];
		final Object[] paramValues = new Object[colSet.size()];
		for (Map<String, Object> data : dataList) {
			for (int i = 0; i < colSet.size(); i++) {
				DataColumn dc = cols[i];
				sqlTypes[i] = dc.getType();
				paramValues[i] = data.get(dc.getName());
			}
			setPrepareStatementParams(ps, sqlTypes, paramValues);
			ps.addBatch();
		}
	}

	private String createInsertSql(String table, Set<DataColumn> cols) throws Exception {
		String sql = "insert into " + table + " (";
		int i = 0;
		String arg = "";
		for (DataColumn col : cols) {
			if (i++ > 0) {
				sql += ",";
				arg += ",";
			}
			sql += col.getName();
			arg += "?";
		}
		sql += ") values (";
		sql += arg;
		sql += ")";
		System.out.println(sql);
		return sql;
	}

	private Set<DataColumn> filterColSet(Set<String> colSet, Set<DataColumn> tableColumnSet) {
		Set<DataColumn> tmpSet = new LinkedHashSet();
		for (DataColumn col : tableColumnSet) {
			if (colSet.contains(col.getName())) {
				tmpSet.add(col);
			}
		}
		return tmpSet;
	}

	public Set<DataColumn> getTableColumnSet(String table) throws Exception {
		Connection conn = getConnection();
		Set<DataColumn> tcSet = new LinkedHashSet<>();
		ResultSet rs = conn.getMetaData().getColumns(null, null, table, null);
		while (rs.next()) {
			String name = rs.getString(4);
			int sqlType = rs.getInt(5);
			DataColumn dc = new DataColumn(name, sqlType);
			dc.setSize(rs.getInt(7));
			dc.setDeci(rs.getInt(9));
			tcSet.add(dc);
		}
		return tcSet;
	}

	private Set<String> parseColSet(List<Map<String, Object>> dataList) {
		Set<String> colSet = new HashSet<>();
		for (Map<String, Object> data : dataList) {
			colSet.addAll(data.keySet());
		}
		return colSet;
	}

	/**
	 * 按主键删除
	 * 
	 * @param table
	 * @param dataList
	 */
	public int tableDelete(String table, List<Map<String, Object>> dataList) {
		try {
			Set<DataColumn> tableColumnSet = getTableColumnSet(table);
			String[] Pkey = getprimary(table);
			Set<DataColumn> cols = new LinkedHashSet<>();
			prepareset(Pkey,tableColumnSet,cols);
			if (Pkey != null && Pkey.length > 0) {
				String executedelSql = createDeleteSql(table, Pkey);
				PreparedStatement ps = getConnection().prepareStatement(executedelSql);
				setParamValues(ps, dataList, cols);
				int[] sums = ps.executeBatch();
				return getSum(sums);
			} else
				throw new RuntimeException("找不到主键：" + table);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	private String createDeleteSql(String table, String[] Pkey) {
		String sql = "delete from " + table + " where ";
		for (int i = 0; i < Pkey.length; i++) {
			sql += Pkey[i] + "=?";
		}
		System.out.println(sql);
		return sql;
	}

	/**
	 * 按主键更新
	 * 
	 * @param table
	 * @param dataList
	 */
	public int tableUpdate(String table, List<Map<String, Object>> dataList) {
		try {
			Set<String> colSet = parseColSet(dataList);
			Set<DataColumn> tableColumnSet = getTableColumnSet(table);
			String[] Pkey = getprimary(table);
			Set<DataColumn> cols = npkfilterColSet(colSet, tableColumnSet, Pkey);
			if (Pkey != null) {
				String executeSql = createUpdateSql(table, cols, Pkey);
				PreparedStatement ps = getConnection().prepareStatement(executeSql);
				prepareset(Pkey,tableColumnSet,cols);
				setParamValues(ps, dataList, cols);
				int[] sums = ps.executeBatch();
				return getSum(sums);
			} else
				throw new RuntimeException("找不到主键：" + table);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void prepareset(String[] pkey, Set<DataColumn> tableColumnSet, Set<DataColumn> cols) {
		for (String key : pkey) {
			for (DataColumn dc : tableColumnSet) {
				if (key.equals(dc.getName())) {
					cols.add(dc);
					break;
				}
			}
		}
		
	}

	private Set<DataColumn> npkfilterColSet(Set<String> colSet, Set<DataColumn> tableColumnSet, String[] pKey) {
		Set<DataColumn> tmpSet = new LinkedHashSet();
		for (DataColumn col : tableColumnSet) {
			if (colSet.contains(col.getName())) {

				for (int i = 0; i < pKey.length; i++)
					if (col.getName().equals(pKey[i])) {

					} else
						tmpSet.add(col);

			}
		}
		return tmpSet;
	}

	/**
	 * 主键多个，以数组的形式返回
	 * 
	 * @param table
	 * @return
	 */
	public String[] getprimary(String table) {
		try {
			ResultSet rs = conn.getMetaData().getPrimaryKeys(null, null, table);
			ArrayList<String> pKey = new ArrayList<String>();
			while (rs != null && rs.next()) {
				String pKeye = rs.getString("Column_NAME");
				pKey.add(pKeye);
			}
			String[] StringPkey = pKey.toArray(new String[pKey.size()]);
			return StringPkey;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

	}

	private String createUpdateSql(String table, Set<DataColumn> cols, String[] Pkey) throws ClassNotFoundException, SQLException, IOException {
		String sql = "update " + table + " set ";
		for (DataColumn col : cols) {
			String colname = col.getName();
			sql += colname + " =?,";
		}
		sql = sql.substring(0, sql.length() - 1);
		sql += " where ";
		for (int i = 0; i < Pkey.length; i++)
			sql += Pkey[i] + "=?,";
		sql = sql.substring(0, sql.length() - 1);
		System.out.println(sql);
		return sql;
	}

	public TableValues query(String sql) {
		return query(sql, null, null);
	}

	/**
	 * 根据指定的SQL语句及对应的参数返回关系表中的数据值。
	 * 
	 * DEMO: sql=select * from users where user=? sqlTypes=new int[]{12}
	 * paramValues=new Object[]{"admin"}
	 * 
	 * @param sql
	 *            查询语句
	 * @param sqlTypes
	 *            参数类型，参见{@link java.sql.Types}
	 * @param paramValues
	 *            参数值
	 * @return
	 */
	public TableValues query(String sql, int[] sqlTypes, Object[] paramValues) {
		try {
			Statement stmt = null;
			if (sqlTypes != null) {
				stmt = createPreparedStatement(sql);
				setPrepareStatementParams((PreparedStatement) stmt, sqlTypes, paramValues);
			} else {
				stmt = createStatement();
			}
			ResultSet rs = stmt instanceof PreparedStatement ? ((PreparedStatement) stmt).executeQuery() : stmt.executeQuery(sql);
			DataColumn[] dcs = getDataColumns(rs);
			Object[][] values = getValues(rs);
			return new TableValues(dcs, values);
		} catch (Exception e) {
			
			throw new RuntimeException(e);
		}
	}

	private Statement createPreparedStatement(String sql) throws Exception {

		return getConnection().prepareStatement(sql);
	}

	private void setPrepareStatementParams(PreparedStatement stmt, int[] sqlTypes, Object[] paramValues) throws Exception {
		for (int i = 0; i < sqlTypes.length; i++) {
			switch (sqlTypes[i]) {
			case java.sql.Types.VARCHAR: {
				stmt.setString(i + 1, (String) paramValues[i]);
				break;
			}
			case java.sql.Types.INTEGER: {
				stmt.setInt(i + 1, (int) paramValues[i]);
				break;
			}
			case java.sql.Types.DATE: {
				Date date = (Date) paramValues[i];
				stmt.setDate(i + 1, new java.sql.Date(date.getTime()));
				break;
			}
			case java.sql.Types.DOUBLE: {
				stmt.setDouble(i+1, (double)paramValues[i]);
				break;
			}
			case java.sql.Types.DECIMAL: {
				java.math.BigDecimal bd = new java.math.BigDecimal(paramValues[i].toString());
				stmt.setBigDecimal(i+1, bd);
				break;
			}
			default:
				throw new RuntimeException("传入参数格式不支持！");
			}
		}
	}

	private Statement createStatement() throws Exception {
		return getConnection().createStatement();
	}

	private DataColumn[] getDataColumns(ResultSet rs) throws Exception {
		ResultSetMetaData rsmd = rs.getMetaData();
		int cc = rsmd.getColumnCount();
		DataColumn[] dcs = new DataColumn[cc];
		for (int i = 1; i <= cc; i++) {
			String name = rsmd.getColumnName(i);
			int type = rsmd.getColumnType(i);
			dcs[i - 1] = new DataColumn(name, type);

		}

		return dcs;

	}

	private Object[][] getValues(ResultSet rs) throws Exception {

		ArrayList<Object> List = new ArrayList<>();

		int columnCount = rs.getMetaData().getColumnCount();
		while (rs.next()) {
			Object[] value = new Object[columnCount];
			for (int i = 1; i <= columnCount; i++) {
				value[i - 1] = rs.getObject(i);
			}
			List.add(value);

		}
		Object[][] obj = List.toArray(new Object[List.size()][]);
		return obj;
	}

//	static void testQuery() {
//		DB query = new DB();
//		TableValues tv = query.query("select * from users ", null, null);
//		try {
//			query.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		System.out.println(tv);
//	}
//
//	static void testUpdate() {
//		DB update = new DB();
//		String sql = "update users set password=:password where username=:username";
//		Map<String, Object> params = new HashMap();
//		params.put("username", "admin");
//		params.put("password", "" + System.currentTimeMillis());
//		update.executeUpdate(sql, params);
//		try {
//			update.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	static void testInsert() {
//		DB db = new DB();
//		List<Map<String, Object>> recordList = new ArrayList<>();
//		Map<String, Object> record = new HashMap();
//		record.put("salid", "x02");
//		record.put("salcode", "1507-02");
//		record.put("ccode", "李四");
//		recordList.add(record);
//		db.tableInsert("salorder", recordList);
//		try {
//			db.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	static void testDelete() {
//		DB db = new DB();
//		List<Map<String, Object>> recordList = new ArrayList<>();
//		Map<String, Object> record = new HashMap();
//		record.put("salid", "x01");
//		recordList.add(record);
//		db.tableDelete("salorder", recordList);
//		try {
//			db.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	static void testUpdate2() {
//		DB db = new DB();
//		List<Map<String, Object>> recordList = new ArrayList<>();
//		Map<String, Object> record = new HashMap();
//		record.put("salid", "x001");
//		record.put("salcode", "1507-24");
//		record.put("ccode", "李四");
//		record.put("jixl", "阿斯达斯的");
//		recordList.add(record);
//		db.tableUpdate("salorder", recordList);
//		try {
//			db.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	public static void main(String[] args) {
//		 testUpdate2();
//		 testQuery();
//		 testDelete();
//		 testInsert();
//	}
}
