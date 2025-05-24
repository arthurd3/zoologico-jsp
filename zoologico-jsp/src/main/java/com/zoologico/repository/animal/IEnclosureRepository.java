package com.zoologico.repository.animal;

import com.zoologico.dtos.animal.EnclosureDTO;
import com.zoologico.model.animal.Enclosure;

import java.util.List;
import java.util.Optional;

public interface IEnclosureRepository {
    List<EnclosureDTO> findAllEnclosures();
    boolean save(Enclosure enclosure);
    boolean deleteById(Long id);
    Optional<EnclosureDTO> findById(Long id);
    boolean cleanEnclosure(Long id , String cleanedBy , String cleanDate , String cleanTime);
}
