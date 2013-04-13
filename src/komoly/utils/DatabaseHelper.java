package komoly.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;

public class DatabaseHelper {

	/**
	 * LOGGER.
	 */
	private static final Logger LOGGER = Logger.getLogger(DatabaseHelper.class);

	private static final String USER_NAME = "root";

	private static final String PASSWORD = "majomka";

	private static final String SID = "orcl";

	static {
		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");

		} catch (ClassNotFoundException e) {
			LOGGER.error(e);
			e.printStackTrace();
		}
	}

	public static Connection getConnection() {
		Connection conn = null;
		try {
			String server = "jdbc:oracle:thin:@localhost:1521:" + SID;
			conn = DriverManager.getConnection(server, USER_NAME, PASSWORD);
		} catch (SQLException e) {
			LOGGER.error(e);
			e.printStackTrace();
		}

		return conn;
	}

	public static void close(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				LOGGER.error(e);
				e.printStackTrace();
			}
		}
	}

	public static void close(PreparedStatement ps) {
		if (ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				LOGGER.error(e);
				e.printStackTrace();
			}
		}
	}

	public static void close(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				LOGGER.error(e);
				e.printStackTrace();
			}
		}
	}

}
