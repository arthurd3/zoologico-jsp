package com.zoologico.mapper.user;


import com.zoologico.dtos.user.UserDTO;
import com.zoologico.model.user.User;

public class UserMapper {

    public User toEntity(UserDTO userDto){
        return new User(userDto.getId(),userDto.getName(), userDto.getEmail(), userDto.getPassword(), userDto.getPhone() , userDto.getUserType());
    }

}
