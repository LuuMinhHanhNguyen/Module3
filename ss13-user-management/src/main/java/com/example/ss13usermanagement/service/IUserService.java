package com.example.ss12demousermanagement.service;

import com.example.ss12demousermanagement.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    void insertUser(User user) throws SQLException;

    User selectUser(int id);

    List<User> selectAllUsers();

    boolean deleteUser(int id) throws SQLException;

    boolean updateUser(User user) throws SQLException;
    List<User> sortedByName();

    List<User> searchByCountry(String country);
}
