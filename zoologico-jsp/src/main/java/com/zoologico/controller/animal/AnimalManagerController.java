package com.zoologico.controller.animal;

import com.zoologico.dtos.animal.AnimalDTO;
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
import java.util.List;

@WebServlet("/animalManager")
public class AnimalManagerController extends HttpServlet {

    private AnimalService animalService;

    @Override
    public void init() throws ServletException {
        this.animalService = new AnimalService(new AnimalRepository() , new AnimalMapper());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<AnimalDTO> animalList = animalService.findAllAnimals();
        req.setAttribute("animalsList", animalList);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/pages/employee/gerenciar-animais.jsp");
        dispatcher.forward(req, resp);
    }
}
