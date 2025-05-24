package com.zoologico.service.animal;

import com.zoologico.dtos.animal.AnimalDTO;
import com.zoologico.dtos.animal.AnimalFoodDTO;
import com.zoologico.mapper.animal.AnimalMapper;
import com.zoologico.model.animal.Animal;
import com.zoologico.repository.animal.IAnimalRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class AnimalService {
    private IAnimalRepository animalRepository;
    private AnimalMapper animalMapper;

    public AnimalService(IAnimalRepository animalRepository, AnimalMapper animalMapper) {
        this.animalRepository = animalRepository;
        this.animalMapper = animalMapper;
    }

    public boolean registerAnimal(AnimalDTO animalDTO){
        Animal animalSave = animalMapper.toEntity(animalDTO);
        return animalRepository.saveAnimal(animalSave);
    }
    public List<AnimalDTO> findAllAnimals(){
        return animalRepository.findAllAnimals();
    }

    public Optional<AnimalDTO> findById(Long id){
        return animalRepository.findById(id);
    }

    public boolean deleteAnimal(Long id){
        return animalRepository.deleteById(id);
    }

    public boolean editAnimal(Long id , String nomePopular ,String nomeCientifico ,String especie ,String habitat ,String recinto ,String genero ,String estadoSaude){
        return animalRepository.editAnimal(id , nomePopular , nomeCientifico , especie , habitat , recinto , genero , estadoSaude);
    }


}
