package com.zoologico.controller.animal;

import com.zoologico.dtos.animal.EnclosureDTO;
import com.zoologico.mapper.animal.EnclosureMapper;
import com.zoologico.repository.animal.EnclosureRepository;
import com.zoologico.service.animal.EnclosuresService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@WebServlet("/cleanEnclosureManager")
public class EnclosuresCleanController extends EnclosuresDeleteController {
    private EnclosuresService enclosuresService;

    @Override
    public void init() throws ServletException {
        this.enclosuresService = new EnclosuresService(new EnclosureRepository() , new EnclosureMapper());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("id"));

        Optional<EnclosureDTO> enclosureDto = enclosuresService.findById(id)
                .or(Optional::empty);

        List<EnclosureDTO> enclosureClean = new ArrayList<>();
        enclosureDto.ifPresent(enclosureClean::add);

        req.setAttribute("enclosureClean", enclosureClean);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/pages/employee/gerenciar-limpeza-recintos.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String idParam = req.getParameter("id");
        String cleanedBy = req.getParameter("cleanedBy");
        String cleanDate = req.getParameter("cleanDate");
        String cleanTime = req.getParameter("cleanTime");

        Long id = Long.parseLong(idParam);

        enclosuresService.cleanEnclosure(id , cleanedBy , cleanDate , cleanTime);

        resp.sendRedirect("/enclosuresManager");

    }
}
