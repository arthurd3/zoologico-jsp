package com.zoologico.controller.animal;

import com.zoologico.dtos.animal.AnimalDTO;
import com.zoologico.dtos.animal.EnclosureDTO;
import com.zoologico.mapper.animal.AnimalFoodMapper;
import com.zoologico.mapper.animal.AnimalMapper;
import com.zoologico.repository.animal.AnimalRepository;
import com.zoologico.service.animal.AnimalService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Optional;

@WebServlet("/editarAnimal")
public class AnimalEditController extends HttpServlet {
    private AnimalService animalService;

    @Override
    public void init() throws ServletException {
        this.animalService = new AnimalService(new AnimalRepository() , new AnimalMapper());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        Optional<AnimalDTO> animalEdit = animalService.findById(id);

        req.setAttribute("animal", animalEdit.get());


        RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/pages/employee/editar-animal.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Long id = Long.parseLong(req.getParameter("id"));

        String nomePopular = req.getParameter("nomePopular");
        String nomeCientifico = req.getParameter("nomeCientifico");
        String especie = req.getParameter("especie");
        String habitat = req.getParameter("habitat");
        String recinto = req.getParameter("recinto");
        String genero = req.getParameter("genero");
        String estadoSaude = req.getParameter("estadoSaude");

        boolean successEdit = animalService.editAnimal(id , nomePopular , nomeCientifico , especie , habitat , recinto , genero , estadoSaude);

        if(successEdit)
            resp.sendRedirect("/animalManager");
        else
            throw new ServletException("Erro ao editar animal");

    }
}
