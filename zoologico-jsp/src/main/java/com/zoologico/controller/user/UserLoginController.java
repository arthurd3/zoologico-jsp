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
import java.util.List;

@WebServlet("/loginController")
public class UserLoginController extends HttpServlet {

    private UserService userService;

    public void init() {
        this.userService = new UserService(new UserRepository() , new UserMapper());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        boolean successLogin = userService.loginUser(email , password);


        if (successLogin){

            List<String> userInfos = userService.findUser(email, password);

            req.getSession().setAttribute("userName", userInfos.get(1));

            req.getSession().setAttribute("userPhone", userInfos.get(2));
            req.getSession().setAttribute("userEmail", userInfos.get(3));
            req.getSession().setAttribute("userType", userInfos.get(4));

            resp.sendRedirect("/jsp/pages/login.jsp?successLogin=true");
        }
        else
            resp.sendRedirect("/jsp/pages/login.jsp?successLogin=false");
    }
}
