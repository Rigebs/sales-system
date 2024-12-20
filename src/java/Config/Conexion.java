package Config;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexion {
    Connection cn;
    
    String url = "jdbc:mysql://localhost:3306/";
    String driver = "com.mysql.cj.jdbc.Driver";
    String user = "root";
    String password = "";
    String database = "DB_SALES_SYSTEM";
    
    public Connection getConexion(){
        try {
            Class.forName(driver);
            cn = DriverManager.getConnection(url + database, user, password);
            System.out.println("Se conecto a la base de datos : " + database);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("No se conecto a la base de datos : " + database);

        }
        return cn;
    }
}
