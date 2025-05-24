package com.zoologico.mapper.animal;

import com.zoologico.dtos.animal.AnimalFoodDTO;
import com.zoologico.model.animal.AnimalFood;

public class AnimalFoodMapper {

    public AnimalFood toEntity(AnimalFoodDTO foodDto) {
        return new AnimalFood(
                foodDto.getId(),
                foodDto.getAnimalId(),
                foodDto.getFoodName(),
                foodDto.getQuantity(),
                foodDto.getFeedingTime(),
                foodDto.getFeedingDate(),
                foodDto.getNotes()
        );
    }
}
