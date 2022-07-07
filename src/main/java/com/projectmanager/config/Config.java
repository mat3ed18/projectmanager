package com.projectmanager.config;

public class Config {
    public static final String DATABASE = "postgresql";
    public static final String HOST = "localhost";
    public static final int PORT = 5432;
    public static final String DB_NAME = "projectmanager";
    public static final String USER = "postgres";
    public static final String PASS = "usbw";
    public static final String URL = String.format("jdbc:%s://%s:%d/%s?user=%s&password=%s", DATABASE, HOST, PORT, DB_NAME, USER, PASS);
}
