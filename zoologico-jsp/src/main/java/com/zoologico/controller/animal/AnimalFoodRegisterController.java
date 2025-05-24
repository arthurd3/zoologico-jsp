package com.zoologico.controller.animal;

import com.zoologico.dtos.animal.AnimalFoodDTO;
import com.zoologico.mapper.animal.AnimalFoodMapper;
import com.zoologico.repository.animal.AnimalRepository;
import com.zoologico.service.animal.AnimalFoodService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/foodRegisterController")
public class AnimalFoodRegisterController extends HttpServlet {
    private AnimalFoodService animalFoodService;

    @Override
    public void init() throws ServletException {
        this.animalFoodService = new AnimalFoodService(new AnimalRepository() , new AnimalFoodMapper());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long animalId = Long.parseLong(req.getParameter("animalId"));
        String foodName = req.getParameter("foodName");
        String quantity = req.getParameter("quantity");
        String feedingTime = req.getParameter("feedingTime");
        String feedingDate = req.getParameter("feedingDate");
        String notes = req.getParameter("notes");


        AnimalFoodDTO animalFoodDTO = new AnimalFoodDTO(
                null,
                animalId,
                foodName,
                quantity,
                feedingTime,
                feedingDate,
                notes
        );

        boolean successRegister = animalFoodService.registerFood(animalFoodDTO);

        if (successRegister)
            resp.sendRedirect("/jsp/pages/employee/foods-register.jsp?successRegister=true");
        else
            resp.sendRedirect("/jsp/pages/employee/foods-register.jsp?successRegister=false");

    }
}
