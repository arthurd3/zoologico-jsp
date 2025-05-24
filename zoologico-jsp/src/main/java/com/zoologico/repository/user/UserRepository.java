package com.zoologico.repository.user;

import com.zoologico.config.ConnectionConfig;
import com.zoologico.dtos.user.UserDTO;
import com.zoologico.model.user.User;
import com.zoologico.model.user.UserType;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class UserRepository implements IUserRepository {

    @Override
    public void save(User user) {
        String sql = "INSERT INTO users (name, email, phone, password , userType) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = ConnectionConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPhone());
            stmt.setString(4, user.getPassword());
            stmt.setString(5, user.getUserType().toString());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean existUser(String email, String phone) {
        String sql = "SELECT 1 FROM users WHERE email = ? OR phone = ?";

        try (Connection conn = ConnectionConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            stmt.setString(2, phone);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean verifyLoginUser(String email, String password) {
        String sql = "SELECT 1 FROM users WHERE email = ? AND password = ?";

        try (Connection conn = ConnectionConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next())
                return true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<String> findUser(String email, String password) {
        String sql = "SELECT id , name, phone, email, usertype FROM users WHERE email = ? AND password = ?";

        try (Connection conn = ConnectionConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next())
                return List.of(
                        rs.getString("id"),
                        rs.getString("name"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("usertype")
                );

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return List.of();
    }

    @Override
    public List<UserDTO> getAllUsers() {
        String sql = "SELECT * FROM users";
        List<UserDTO> users = new ArrayList<>();

        try (Connection conn = ConnectionConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {

                String userTypeStr = rs.getString("usertype");
                UserType userType = UserType.valueOf(userTypeStr);

                UserDTO user = new UserDTO(
                        rs.getLong("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        null,
                        rs.getString("phone"),
                        userType
                );
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public Optional<UserDTO> findById(Long id) {
        String sql = "SELECT * FROM users WHERE id = ?";

        try (Connection conn = ConnectionConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setLong(1, id);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                UserType userType = UserType.valueOf(rs.getString("usertype"));
                return Optional.of(new UserDTO(
                        rs.getLong("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        null,
                        rs.getString("phone"),
                        userType
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }

    @Override
    public void update(User user) {

    }

    @Override
    public boolean deleteById(Long id) {
        String sql = "DELETE FROM users WHERE id = ?";

        try (Connection conn = ConnectionConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setLong(1, id);
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected == 0) {
                System.out.println("Nenhum usuário foi deletado:" + id);
                return false;
            } else {
                System.out.println("Usuário deletado: " + id);
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
