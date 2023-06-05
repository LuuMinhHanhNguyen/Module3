package com.example.ss12demousermanagement.service;

import com.example.ss12demousermanagement.model.User;
import com.example.ss12demousermanagement.repository.IUserRepository;
import com.example.ss12demousermanagement.repository.UserRepository;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService{
    IUserRepository iUserRepository = new UserRepository();
    @Override
    public void insertUser(User user) throws SQLException {
        iUserRepository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return iUserRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return iUserRepository.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return iUserRepository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return iUserRepository.updateUser(user);
    }

    @Override
    public List<User> sortedByName() {
        return iUserRepository.sortedByName();
    }

    @Override
    public List<User> searchByCountry(String country) {
        return iUserRepository.searchByCountry(country);
    }
}
