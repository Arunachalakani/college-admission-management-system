package examfees;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private static final String  url="jdbc:postgresql://localhost:5432/students";
	private static final String  uname="postgres";
	private static final String  password="postgresql";

	public static Connection getConnection() throws SQLException {
	
		return DriverManager.getConnection(url, uname, password);
	}

}
