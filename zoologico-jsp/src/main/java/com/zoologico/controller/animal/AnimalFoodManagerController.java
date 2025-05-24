package com.zoologico.controller.animal;

import com.zoologico.dtos.animal.AnimalDTO;
import com.zoologico.dtos.animal.AnimalFoodDTO;
import com.zoologico.mapper.animal.AnimalFoodMapper;
import com.zoologico.repository.animal.AnimalRepository;
import com.zoologico.service.animal.AnimalFoodService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/foodManager")
public class AnimalFoodManagerController extends HttpServlet {
    private AnimalFoodService animalFoodService;

    @Override
    public void init() throws ServletException {
        this.animalFoodService = new AnimalFoodService(new AnimalRepository() , new AnimalFoodMapper());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<AnimalFoodDTO> animalFoodList = animalFoodService.findAllFoods();
        req.setAttribute("animalFoodList", animalFoodList);

        List<String> animalNames = animalFoodService.findAnimalNamesByFoodList(animalFoodList);

        req.setAttribute("animalNameList", animalNames);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/pages/employee/gerenciar-alimentacao.jsp");
        dispatcher.forward(req, resp);
    }
}
