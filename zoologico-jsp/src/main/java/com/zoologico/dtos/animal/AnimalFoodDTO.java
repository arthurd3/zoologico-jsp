package com.zoologico.dtos.animal;

public class AnimalFoodDTO {
    private Long id;
    private Long animalId;
    private String foodName;
    private String quantity;
    private String feedingTime;
    private String feedingDate;
    private String notes;

    public AnimalFoodDTO(Long id, Long animalId, String foodName, String quantity, String feedingTime, String feedingDate, String notes) {
        this.id = id;
        this.animalId = animalId;
        this.foodName = foodName;
        this.quantity = quantity;
        this.feedingTime = feedingTime;
        this.feedingDate = feedingDate;
        this.notes = notes;
    }

    public Long getId() {
        return id;
    }

    public Long getAnimalId() {
        return animalId;
    }

    public String getFoodName() {
        return foodName;
    }

    public String getQuantity() {
        return quantity;
    }

    public String getFeedingTime() {
        return feedingTime;
    }

    public String getFeedingDate() {
        return feedingDate;
    }

    public String getNotes() {
        return notes;
    }
}
