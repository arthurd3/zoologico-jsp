package com.zoologico.dtos.animal;

public class AnimalDTO {

    private Long id;
    private String name_popular;
    private String name_scientific;
    private String species;
    private String habitat;
    private String gender;
    private String arrival_date;
    private String health_status;
    private String enclosure_name;


    public AnimalDTO(Long id, String name_popular, String name_scientific, String species, String habitat, String gender, String arrival_date, String health_status, String enclosure_name) {
        this.id = id;
        this.name_popular = name_popular;
        this.name_scientific = name_scientific;
        this.species = species;
        this.habitat = habitat;
        this.gender = gender;
        this.arrival_date = arrival_date;
        this.health_status = health_status;
        this.enclosure_name = enclosure_name;
    }

    public Long getId() {
        return id;
    }

    public String getNamePopular() {
        return name_popular;
    }

    public String getNameScientific() {
        return name_scientific;
    }

    public String getSpecies() {
        return species;
    }

    public String getHabitat() {
        return habitat;
    }

    public String getGender() {
        return gender;
    }

    public String getArrivalDate() {
        return arrival_date;
    }

    public String getHealthStatus() {
        return health_status;
    }

    public String getEnclosureName() {
        return enclosure_name;
    }
}
