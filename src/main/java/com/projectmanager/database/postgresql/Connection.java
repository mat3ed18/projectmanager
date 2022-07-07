package com.projectmanager.database.postgresql;

import com.projectmanager.config.Config;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connection {
    private static java.sql.Connection conn;
    
    static {
        try {
            conn = DriverManager.getConnection(Config.URL);
        } catch (SQLException ex) {
            System.out.println("ERRO: " + ex.getMessage());
        }
    }
    
    public static java.sql.Connection getConnection() {
        return conn;
    }
}