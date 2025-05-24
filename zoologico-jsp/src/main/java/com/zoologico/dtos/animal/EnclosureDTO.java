package com.zoologico.dtos.animal;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;

public class EnclosureDTO {
    private Long id;
    private String name;
    private String type;
    private BigDecimal sizeM2;
    private String description;
    private Long animalId;
    private String cleanedBy;
    private LocalDate cleanDate;
    private LocalTime cleanTime;

    public EnclosureDTO(Long id, String name, String type, BigDecimal sizeM2, String description,
                        Long animalId, String cleanedBy, LocalDate cleanDate, LocalTime cleanTime) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.sizeM2 = sizeM2;
        this.description = description;
        this.animalId = animalId;
        this.cleanedBy = cleanedBy;
        this.cleanDate = cleanDate;
        this.cleanTime = cleanTime;
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getType() {
        return type;
    }

    public BigDecimal getSizeM2() {
        return sizeM2;
    }

    public String getDescription() {
        return description;
    }

    public Long getAnimalId() {
        return animalId;
    }

    public String getCleanedBy() {
        return cleanedBy;
    }

    public LocalDate getCleanDate() {
        return cleanDate;
    }

    public LocalTime getCleanTime() {
        return cleanTime;
    }
}
