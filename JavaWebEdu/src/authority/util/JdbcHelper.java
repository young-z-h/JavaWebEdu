package authority.util;


import java.sql.*;

/**
 * 提供JDBC连接对象和释放资源
 */
public final class JdbcHelper {
	private static String url = "jdbc:mysql://localhost:3306/rabc"+
			"?useUnicode=true&characterEncoding=utf8"+ //疑问后面指定代码为UTF-8
			"&serverTimezone=Asia/Shanghai";//服务器时区为上海
	private static String user = "root";
	private static String password = "122316";
	//jdbc:mysql://localhost:3306/bysj?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC

	private JdbcHelper() {}

	//注册驱动
	static {
		try {
			//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			//注册驱动程序
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("未找到驱动程序类");
		}
	}

	/**
	 * @return 连接对象
	 * @throws SQLException
	 */
	public static Connection getConn() throws SQLException {
		return DriverManager.getConnection(url, user, password);
	}
	//关闭、释放资源
	public static void close(ResultSet rs, Statement stmt, Connection conn) {
		try {
			if (rs != null) {	rs.close();	}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null){	stmt.close();}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if (conn != null){	conn.close();}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				System.out.println();
			}
		}
	}

	//关闭、释放资源
	public static void close(Statement stmt, Connection conn) {
		util.JdbcHelper.close(null,stmt,conn);
	}
}