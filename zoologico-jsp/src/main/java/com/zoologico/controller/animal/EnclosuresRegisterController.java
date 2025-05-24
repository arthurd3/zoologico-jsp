package com.zoologico.controller.animal;

import com.zoologico.dtos.animal.EnclosureDTO;
import com.zoologico.mapper.animal.EnclosureMapper;
import com.zoologico.repository.animal.EnclosureRepository;
import com.zoologico.service.animal.EnclosuresService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;



@WebServlet("/enclosureRegister")
public class EnclosuresRegisterController extends HttpServlet {
    private EnclosuresService enclosuresService;

    @Override
    public void init() throws ServletException {
        this.enclosuresService = new EnclosuresService(new EnclosureRepository() , new EnclosureMapper());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("name");
        String type = req.getParameter("type");
        BigDecimal sizeM2 =  new BigDecimal(req.getParameter("sizeM2"));
        String description = req.getParameter("description");
        Long animalId = Long.parseLong(req.getParameter("animalId"));

        EnclosureDTO enclosuresDTO = new EnclosureDTO(null, name, type, sizeM2, description, animalId , null , null , null);

        boolean successRegister = enclosuresService.registerEnclosure(enclosuresDTO);

        if(successRegister)
            resp.sendRedirect("/jsp/pages/employee/enclosure-register.jsp?successRegister=true");
        else
            resp.sendRedirect("/jsp/pages/employee/enclosure-register.jsp?successRegister=false");
    }
}
