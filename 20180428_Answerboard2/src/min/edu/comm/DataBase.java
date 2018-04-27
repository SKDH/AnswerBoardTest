package min.edu.comm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DataBase {
	public DataBase() {
		String driver = "oracle.jdbc.driver.OracleDriver";
		try {
			Class.forName(driver);
			System.out.println("Driver connect success");
		} catch (ClassNotFoundException e) {
			System.out.println("Dirver connect fail: " + e);
		}
	}
	
	protected Connection getConnection() throws SQLException {
		Connection conn = null;
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "korea";
		String password = "korea";
		conn = DriverManager.getConnection(url, user, password);
		return conn;
	}
	
	protected void closed(ResultSet rs, Statement stmt, Connection conn) {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
			System.out.println("Cloesd success");
		} catch (SQLException e) {
			System.out.println("Closed fail: " + e);
		}
	}
}
