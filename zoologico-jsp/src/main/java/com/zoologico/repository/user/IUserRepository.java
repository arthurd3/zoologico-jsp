package com.zoologico.repository.user;

import com.zoologico.dtos.user.UserDTO;
import com.zoologico.model.user.User;
import java.util.List;
import java.util.Optional;

public interface IUserRepository {
    public void save(User user);
    public List<String> findUser(String email, String password);
    public Optional<UserDTO> findById(Long id);
    public boolean existUser(String email , String phone);
    public boolean verifyLoginUser(String email , String password);
    public void update(User user);
    public boolean deleteById(Long id);
    public List<UserDTO> getAllUsers();
}
