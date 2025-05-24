package com.zoologico.mapper.animal;

import com.zoologico.dtos.animal.EnclosureDTO;
import com.zoologico.model.animal.Enclosure;

public class EnclosureMapper {

    public Enclosure toEntity(EnclosureDTO dto) {
        return new Enclosure(
                dto.getId(),
                dto.getName(),
                dto.getType(),
                dto.getSizeM2(),
                dto.getDescription(),
                dto.getAnimalId(),
                dto.getCleanedBy(),
                dto.getCleanDate(),
                dto.getCleanTime()
        );
    }
}
