package com.zoologico.service.animal;

import com.zoologico.dtos.animal.EnclosureDTO;
import com.zoologico.mapper.animal.EnclosureMapper;
import com.zoologico.model.animal.Enclosure;
import com.zoologico.repository.animal.IEnclosureRepository;

import java.util.List;
import java.util.Optional;

public class EnclosuresService {
    private IEnclosureRepository enclosureRepository;
    private EnclosureMapper enclosureMapper;

    public EnclosuresService(IEnclosureRepository enclosureRepository, EnclosureMapper enclosureMapper) {
        this.enclosureRepository = enclosureRepository;
        this.enclosureMapper = enclosureMapper;
    }

    public List<EnclosureDTO> findAllEnclosures(){
        return enclosureRepository.findAllEnclosures();
    }

    public boolean registerEnclosure(EnclosureDTO enclosuresDTO){
        Enclosure savedEnclosure = enclosureMapper.toEntity(enclosuresDTO);
        return enclosureRepository.save(savedEnclosure);
    }

    public boolean deleteClosure(Long id){
        return enclosureRepository.deleteById(id);
    }

    public Optional<EnclosureDTO> findById(Long id){
        return enclosureRepository.findById(id);
    }

    public boolean cleanEnclosure (Long id ,  String cleanedBy , String cleanDate , String cleanTime){
        return enclosureRepository.cleanEnclosure(id , cleanedBy , cleanDate , cleanTime);
    }
}
