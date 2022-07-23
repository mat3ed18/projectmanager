package com.projectmanager.config;

public class Config {
    public static final String DATABASE = "postgresql";
    public static final String HOST = "ec2-18-214-35-70.compute-1.amazonaws.com";
    public static final int PORT = 5432;
    public static final String DB_NAME = "d2fe34j70co3ii";
    public static final String USER = "djiykcygkttyax";
    public static final String PASS = "2f33aef647c12b84ef2728cbb3755313891e61b2f91cbbeeccbe61595c16babd";
    public static final String CHARSET = "UTF-8";
    public static final String URL = String.format("jdbc:%s://%s:%d/%s?user=%s&password=%s&charSet=%s", DATABASE, HOST, PORT, DB_NAME, USER, PASS, CHARSET);
    public static long ROWS = 0;
}
