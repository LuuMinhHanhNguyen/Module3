package com.example.ss12demousermanagement.base;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseConnection {
    static String jdbcURL = "jdbc:mysql://localhost:3306/demoss12";
    static String jdbcUsername = "root";
    static String jdbcPassword = "bigbang23";
    public static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, country) VALUES (?, ?, ?);";
    public static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?;";
    public static final String SELECT_ALL_USERS = "call showAllUser();";

    public static final String DELETE_USERS_SQL = "call deleteUser(?);";
    public static final String UPDATE_USERS_SQL = "call updateUser(?,?,?,?);";
    public static final String SORTED_BY_NAME = "select * from sortByName;";
    public static final String SEARCH_BY_COUNTRY = "select * from users where country = ?;";


    public static Connection getConnection()  {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException e) {
           e.printStackTrace();
        } catch (SQLException e) {
           e.printStackTrace();
        }
        return connection;
    }

}
