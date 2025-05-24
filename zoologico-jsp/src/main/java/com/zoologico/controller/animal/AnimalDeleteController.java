package com.zoologico.controller.animal;

import com.zoologico.dtos.animal.AnimalDTO;
import com.zoologico.dtos.user.UserDTO;
import com.zoologico.mapper.animal.AnimalMapper;
import com.zoologico.repository.animal.AnimalRepository;
import com.zoologico.service.animal.AnimalService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/excluirAnimal")
public class AnimalDeleteController extends HttpServlet {
    private AnimalService animalService;

    @Override
    public void init() throws ServletException {
        this.animalService = new AnimalService(new AnimalRepository() , new AnimalMapper());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Long id = Long.parseLong(req.getParameter("id"));
        String path = "/";

        boolean successDelete = animalService.deleteAnimal(id);

        if(successDelete)
            resp.sendRedirect("/animalManager");

        resp.sendRedirect(path);

    }
}
