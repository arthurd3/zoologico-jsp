package com.zoologico.controller.user;

import com.zoologico.dtos.user.UserDTO;
import com.zoologico.mapper.user.UserMapper;
import com.zoologico.model.user.UserType;
import com.zoologico.repository.user.UserRepository;
import com.zoologico.service.user.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/adminRegisterController")
public class AdminRegisterController extends HttpServlet {

    private UserService userService;

    public void init() {
        this.userService = new UserService(new UserRepository() , new UserMapper());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String name = req.getParameter("nome");
        String phone = req.getParameter("telefone");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String userType = req.getParameter("userType");

        UserDTO userDto = new UserDTO(null , name , email , password , phone , UserType.valueOf(userType));

        boolean successRegister  = userService.registerUser(userDto);

        if (successRegister)
            resp.sendRedirect("/jsp/pages/admin/usuarios-register.jsp?successRegister=true");
        else
            resp.sendRedirect("/jsp/pages/admin/usuarios-register.jsp?successRegister=false");
    }
}
