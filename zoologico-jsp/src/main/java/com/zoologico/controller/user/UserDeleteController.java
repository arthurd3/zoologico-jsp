package com.zoologico.controller.user;

import com.zoologico.mapper.user.UserMapper;
import com.zoologico.repository.user.UserRepository;
import com.zoologico.service.user.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet("/excluirCliente")
public class UserDeleteController extends HttpServlet {
    private UserService userService;

    @Override
    public void init() {
        this.userService = new UserService(new UserRepository(), new UserMapper());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Long id = Long.parseLong(req.getParameter("id"));
        String path = "/";

        String pageRedirect = userService.getTypeUser(id);


        if(pageRedirect.equals("CLIENT"))
            path = "/userManager?typeUser=client";
        if(pageRedirect.equals("EMPLOYEE"))
            path = "/userManager?typeUser=employee";

        boolean successDelete = userService.deleteUser(id);

        if(successDelete)
            resp.sendRedirect(path);
    }
}

