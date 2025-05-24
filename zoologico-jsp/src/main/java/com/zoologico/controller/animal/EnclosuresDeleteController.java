package com.zoologico.controller.animal;

import com.zoologico.mapper.animal.EnclosureMapper;
import com.zoologico.repository.animal.EnclosureRepository;
import com.zoologico.service.animal.EnclosuresService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/excluirRecinto")
public class EnclosuresDeleteController extends HttpServlet {

    private EnclosuresService enclosuresService;

    @Override
    public void init() throws ServletException {
        this.enclosuresService = new EnclosuresService(new EnclosureRepository() , new EnclosureMapper());
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        String path = "/";

        boolean successDelete = enclosuresService.deleteClosure(id);

        if(successDelete)
            resp.sendRedirect("/enclosuresManager");
        resp.sendRedirect(path);
    }
}
