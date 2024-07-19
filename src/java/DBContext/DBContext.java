package DBContext;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {

    public Connection getConnection() throws Exception {
        String url = "jdbc:sqlserver://" + serverName + ":" + portNumber;
        if (instance != null && !instance.trim().isEmpty()) {
            url += "\\" + instance;
        }
        url += ";databaseName=" + dbName + ";encrypt=true;trustServerCertificate=true;sslProtocol=TLSv1.2";

        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userID, password);
    }


    private final String serverName = "LAPTOP-LHN746VG\\NHANPH";
    private final String dbName = "BadmintonDB";
    private final String portNumber = "1433";
    private final String instance = "";
    private final String userID = "sa";
    private final String password = "0305150900nhv";

    public static void main(String[] args) {
        DBContext db = new DBContext();

        try (Connection conn = db.getConnection()) {
            System.out.println("Connected");
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
