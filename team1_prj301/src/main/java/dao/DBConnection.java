
package dao;

import jakarta.persistence.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static EntityManagerFactory emf;

    public static EntityManager getEntityManager() {
        if (emf == null) {
            emf = Persistence.createEntityManagerFactory("ligmaBallsPU");
        }
        return emf.createEntityManager();
    }

    public static void close() {
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }
}

//package dao;
//
//import java.lang.System.Logger;
//import java.lang.System.Logger.Level;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.SQLException;
//import java.sql.Statement;
//import java.sql.ResultSet;
//
//public class DBConnection
//{
//    public static String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
//    private static final String URL = "jdbc:sqlserver://localhost\\SQLEXPRESS:1433;databaseName=LigmaShop;encrypt=false;trustServerCertificate=false";
//    private static final String USER = "sa";
//    private static final String PASSWORD = "Hahoang05092004";   
//        public static Connection getConnection() {
//        Connection con = null;
//        try {
//            Class.forName(driverName);
//            con = DriverManager.getConnection(URL, USER, PASSWORD);
//            return con;
//        } catch (Exception ex) {
//            java.util.logging.Logger.getLogger(DBConnection.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        }
//        return null;
//    }
//    
//    public static void main(String[] args) {
//        try(Connection con = getConnection()) {
//            if (con != null) {
//                System.out.println("connect success");
//            }
//        } catch (SQLException ex) {
//            java.util.logging.Logger.getLogger(DBConnection.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        }
//    }
//}