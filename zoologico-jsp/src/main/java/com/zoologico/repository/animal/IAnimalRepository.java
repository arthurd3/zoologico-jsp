package com.zoologico.repository.animal;

import com.zoologico.dtos.animal.AnimalDTO;
import com.zoologico.dtos.animal.AnimalFoodDTO;
import com.zoologico.model.animal.Animal;
import com.zoologico.model.animal.AnimalFood;

import java.util.List;
import java.util.Optional;

public interface IAnimalRepository {
    boolean saveAnimal(Animal animal);
    List<AnimalDTO> findAllAnimals();
    Optional<AnimalDTO> findById(Long id);
    boolean deleteById(Long id);
    List<AnimalFoodDTO> findAllFoods();
    boolean saveFood(AnimalFood animalFood);
    boolean editAnimal(Long id, String nomePopular, String nomeCientifico , String especie, String habitat , String recinto , String genero , String estadoSaude);
}
