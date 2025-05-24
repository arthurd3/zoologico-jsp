package com.zoologico.mapper.animal;

import com.zoologico.dtos.animal.AnimalDTO;
import com.zoologico.model.animal.Animal;

public class AnimalMapper {

    public Animal toEntity(AnimalDTO animalDTO){
        return new Animal(animalDTO.getId() ,
                animalDTO.getNamePopular() ,
                animalDTO.getNameScientific(),
                animalDTO.getSpecies(),
                animalDTO.getHabitat(),
                animalDTO.getArrivalDate(),
                animalDTO.getGender(),
                animalDTO.getHealthStatus(),
                animalDTO.getEnclosureName());
    }
}
