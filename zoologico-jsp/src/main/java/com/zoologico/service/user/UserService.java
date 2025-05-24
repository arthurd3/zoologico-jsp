package com.zoologico.service.user;

import com.zoologico.dtos.user.UserDTO;
import com.zoologico.mapper.user.UserMapper;
import com.zoologico.model.user.User;
import com.zoologico.repository.user.IUserRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class UserService{

    private final IUserRepository userRepository;
    private final UserMapper userMapper;

    public UserService(IUserRepository userRepository, UserMapper userMapper) {
        this.userRepository = userRepository;
        this.userMapper = userMapper;
    }

    public boolean registerUser(UserDTO userDto){
        String userEmail = userDto.getEmail();
        String userPhone = userDto.getPhone();

        if(!userRepository.existUser(userEmail , userPhone)){
            User savedUser = userMapper.toEntity(userDto);
            userRepository.save(savedUser);
            return true;
        }
        return false;
    }

    public boolean loginUser(String userEmail , String userPassword){
        return userRepository.verifyLoginUser(userEmail, userPassword);
    }
    public List<String> findUser(String userEmail , String userPassword){
        return userRepository.findUser(userEmail , userPassword);
    }

    public List<UserDTO> findAllUsers(){
        return userRepository.getAllUsers();
    }

    public Optional<UserDTO> findUserById(Long id){
        return userRepository.findById(id);
    }

    public boolean deleteUser(Long id){
        return userRepository.deleteById(id);
    }

    public String getTypeUser(Long id){
        UserDTO userDTO = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Usuário não encontrado"));

        return userDTO.getUserType().toString();
    }

    public List<UserDTO> filterList(String typeUser){
        List<UserDTO> usersFilterList = new ArrayList<>();
        List<UserDTO> allUsers = findAllUsers();

        for (UserDTO user : allUsers) {
            if(user.getUserType().toString().equalsIgnoreCase(typeUser)){
                usersFilterList.add(user);
            }
        }
        return usersFilterList;

    }
}
