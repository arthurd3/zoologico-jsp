package com.zoologico.service.animal;

import com.zoologico.dtos.animal.AnimalDTO;
import com.zoologico.dtos.animal.AnimalFoodDTO;
import com.zoologico.mapper.animal.AnimalFoodMapper;
import com.zoologico.repository.animal.IAnimalRepository;

import java.util.ArrayList;
import java.util.List;

public class AnimalFoodService {
    private IAnimalRepository animalRepository;
    private AnimalFoodMapper animalFoodMapper;

    public AnimalFoodService(IAnimalRepository animalRepository, AnimalFoodMapper animalFoodMapper) {
        this.animalRepository = animalRepository;
        this.animalFoodMapper = animalFoodMapper;
    }

    public List<AnimalFoodDTO> findAllFoods(){
        return animalRepository.findAllFoods();
    }

    public boolean registerFood(AnimalFoodDTO animalDTO){
        return animalRepository.saveFood(animalFoodMapper.toEntity(animalDTO));
    }

    public List<String> findAnimalNamesByFoodList(List<AnimalFoodDTO> animalFoodList){

        List<String> animalNames = new ArrayList<>();
        for (AnimalFoodDTO animalFood : animalFoodList) {
            Long id = animalFood.getAnimalId();
            String name = animalRepository.findById(id)
                    .map(AnimalDTO::getNamePopular)
                    .orElseThrow(() -> new RuntimeException("Animal com ID " + id + " não existe."));

            animalNames.add(name);
        }
        return animalNames;
    }
}
