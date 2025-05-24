package com.zoologico.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionConfig {
    private static final String URL = "jdbc:postgresql://localhost:5432/docker";
    private static final String USER = "docker";
    private static final String PASSWORD = "docker";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
