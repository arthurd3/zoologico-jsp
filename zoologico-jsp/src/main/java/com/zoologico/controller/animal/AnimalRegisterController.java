package com.zoologico.controller.animal;

import com.zoologico.dtos.animal.AnimalDTO;
import com.zoologico.mapper.animal.AnimalMapper;
import com.zoologico.repository.animal.AnimalRepository;
import com.zoologico.service.animal.AnimalService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/animalsRegisterController")
public class AnimalRegisterController extends HttpServlet {
    private AnimalService animalService;

    @Override
    public void init() throws ServletException {
        this.animalService = new AnimalService(new AnimalRepository() , new AnimalMapper());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        String nomePopular = req.getParameter("nomePopular");
        String nomeCientifico = req.getParameter("nomeCientifico");
        String especie = req.getParameter("especie");
        String habitat = req.getParameter("habitat");
        String dataChegada = req.getParameter("dataChegada");
        String genero = req.getParameter("genero");
        String estadoSaude = req.getParameter("estadoSaude");
        String recinto = req.getParameter("recinto");

        AnimalDTO animalDTO = new AnimalDTO(null ,
                nomePopular ,
                nomeCientifico ,
                especie ,
                habitat ,
                dataChegada ,
                genero ,
                estadoSaude ,
                recinto
        );

        boolean successRegister = animalService.registerAnimal(animalDTO);
        if (successRegister)
            resp.sendRedirect("/jsp/pages/employee/animais-register.jsp?successRegister=true");
        else
            resp.sendRedirect("/jsp/pages/employee/animais-register.jsp?successRegister=false");

    }
}
