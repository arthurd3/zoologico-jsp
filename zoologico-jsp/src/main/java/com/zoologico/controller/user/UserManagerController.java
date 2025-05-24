package com.zoologico.controller.user;

import com.zoologico.dtos.user.UserDTO;
import com.zoologico.mapper.user.UserMapper;

import com.zoologico.repository.user.UserRepository;
import com.zoologico.service.user.UserService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/userManager")
public class UserManagerController extends HttpServlet {

    private UserService userService;

    public void init() {
        this.userService = new UserService(new UserRepository() , new UserMapper());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageRedirect = req.getParameter("typeUser");

        List<UserDTO> filtredList = userService.filterList(req.getParameter("typeUser"));

        if(pageRedirect.equals("client")){
            req.setAttribute("clientList", filtredList);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/pages/admin/gerenciar-clientes.jsp");
            dispatcher.forward(req, resp);
        }

        if(pageRedirect.equals("employee")){
            req.setAttribute("employeeList", filtredList);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/pages/admin/gerenciar-funcionarios.jsp");
            dispatcher.forward(req, resp);
        }

    }
}
