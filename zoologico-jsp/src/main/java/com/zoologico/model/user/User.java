package com.zoologico.model.user;

public class User {
    private Long id;
    private String name;
    private String email;
    private String password ;
    private String phone;
    private UserType userType;

    public User(Long id , String name, String email, String password, String phone , UserType userType) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.userType = userType;
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getPhone() {
        return phone;
    }

    public UserType getUserType() {
        return userType;
    }
}
