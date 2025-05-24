package com.zoologico.controller.animal;

import com.zoologico.dtos.animal.EnclosureDTO;
import com.zoologico.mapper.animal.EnclosureMapper;
import com.zoologico.repository.animal.EnclosureRepository;
import com.zoologico.service.animal.EnclosuresService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/enclosuresManager")
public class EnclosuresManagerController extends HttpServlet {

    private EnclosuresService enclosuresService;

    @Override
    public void init() throws ServletException {
        this.enclosuresService = new EnclosuresService(new EnclosureRepository() , new EnclosureMapper());
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<EnclosureDTO> enclosuresList = enclosuresService.findAllEnclosures();
        req.setAttribute("enclosuresList", enclosuresList);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/pages/employee/gerenciar-recintos.jsp");
        dispatcher.forward(req, resp);
    }

}
