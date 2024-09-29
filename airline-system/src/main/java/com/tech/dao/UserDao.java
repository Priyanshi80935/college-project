package com.tech.dao;

import com.tech.model.User;
import com.tech.util.ConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

    // Add a user to the database
    public void addUser(User user) {
        try {
            Connection connection = ConnectionUtil.getConnection();
            String sql = "INSERT INTO users (username, email, gender, passportId, address, dateofbirth, contact) VALUES (?, ?, ?, ?, ?, ?, ?)";
            
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, user.getUsername());
                preparedStatement.setString(2, user.getEmail());
                preparedStatement.setString(3, user.getGender());
                preparedStatement.setString(4, user.getPassportId());
                preparedStatement.setString(5, user.getAddress());
                preparedStatement.setString(6, user.getDateOfBirth());
                preparedStatement.setString(7, user.getContact());
                
                preparedStatement.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Retrieve all users from the database
    public List<User> viewUsers() {
        List<User> users = new ArrayList<>();
        try {
            Connection connection = ConnectionUtil.getConnection();
            String sql = "SELECT id, username, email, gender, passportId, address, dateofBirth, contact FROM users";
            
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        User user = new User();
                        user.setId(resultSet.getInt("id"));
                        user.setUsername(resultSet.getString("username"));
                        user.setEmail(resultSet.getString("email"));
                        user.setGender(resultSet.getString("gender"));
                        user.setPassportId(resultSet.getString("passportId"));
                        user.setAddress(resultSet.getString("address"));
                        user.setDateOfBirth(resultSet.getString("dateOfBirth"));
                        user.setContact(resultSet.getString("contact"));
                        
                        users.add(user);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    // Update user information
    public void updateUser(User user) {
        try {
            Connection connection = ConnectionUtil.getConnection();
            String sql = "UPDATE users SET username = ?, email = ?, gender = ?, passport_id = ?, address = ?, date_of_birth = ?, contact = ? WHERE id = ?";
            
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, user.getUsername());
                preparedStatement.setString(2, user.getEmail());
                preparedStatement.setString(3, user.getGender());
                preparedStatement.setString(4, user.getPassportId());
                preparedStatement.setString(5, user.getAddress());
                preparedStatement.setString(6, user.getDateOfBirth());
                preparedStatement.setString(7, user.getContact());
                preparedStatement.setInt(8, user.getId());

                preparedStatement.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Delete a user from the database
    public void deleteUser(int id) {
        try {
            Connection connection = ConnectionUtil.getConnection();
            String sql = "DELETE FROM users WHERE id = ?";
            
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, id);
                preparedStatement.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
