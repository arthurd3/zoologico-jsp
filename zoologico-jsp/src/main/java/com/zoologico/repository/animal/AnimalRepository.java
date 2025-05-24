package com.zoologico.repository.animal;

import com.zoologico.config.ConnectionConfig;
import com.zoologico.dtos.animal.AnimalDTO;
import com.zoologico.dtos.animal.AnimalFoodDTO;
import com.zoologico.model.animal.Animal;
import com.zoologico.model.animal.AnimalFood;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class AnimalRepository implements IAnimalRepository {

    @Override
    public boolean saveAnimal(Animal animal) {
        String sql = "INSERT INTO animals (name_popular, name_scientific, species, gender, habitat, health_status, arrival_date, enclosure_name) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = ConnectionConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, animal.getNamePopular());
            stmt.setString(2, animal.getNameScientific());
            stmt.setString(3, animal.getSpecies());
            stmt.setString(4, animal.getGender());
            stmt.setString(5, animal.getHabitat());
            stmt.setString(6, animal.getHealthStatus());
            stmt.setDate(7, java.sql.Date.valueOf(animal.getArrivalDate()));
            stmt.setString(8, animal.getEnclosureName());
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<AnimalDTO> findAllAnimals() {
        String sql = "SELECT * FROM animals";
        List<AnimalDTO> animals = new ArrayList<>();

        try (Connection conn = ConnectionConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                AnimalDTO animal = new AnimalDTO(
                        rs.getLong("id"),
                        rs.getString("name_popular"),
                        rs.getString("name_scientific"),
                        rs.getString("species"),
                        rs.getString("gender"),
                        rs.getString("habitat"),
                        rs.getString("health_status"),
                        rs.getDate("arrival_date").toString(),
                        rs.getString("enclosure_name")
                );
                animals.add(animal);
                System.out.println("LISTA PREENCHIDA");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return animals;
    }

    @Override
    public Optional<AnimalDTO> findById(Long id) {
        String sql = "SELECT * FROM animals WHERE id = ?";

        try (Connection conn = ConnectionConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setLong(1, id);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return Optional.of(new AnimalDTO(
                        rs.getLong("id"),
                        rs.getString("name_popular"),
                        rs.getString("name_scientific"),
                        rs.getString("species"),
                        rs.getString("gender"),
                        rs.getString("habitat"),
                        rs.getString("health_status"),
                        rs.getDate("arrival_date").toString(),
                        rs.getString("enclosure_name")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }

    @Override
    public boolean deleteById(Long id) {
        String sql = "DELETE FROM animals WHERE id = ?";

        try (Connection conn = ConnectionConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setLong(1, id);
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0)
                return true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<AnimalFoodDTO> findAllFoods() {
        String sql = "SELECT * FROM animal_foods";
        List<AnimalFoodDTO> foods = new ArrayList<>();

        try (Connection conn = ConnectionConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                AnimalFoodDTO food = new AnimalFoodDTO(
                        rs.getLong("id"),
                        rs.getLong("animal_id"),
                        rs.getString("food_name"),
                        rs.getString("quantity"),
                        rs.getTime("feeding_time").toString(),
                        rs.getDate("feeding_date").toString(),
                        rs.getString("notes")
                );
                foods.add(food);
                System.out.println("FOOD LIST PREENCHIDA");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return foods;
    }

    @Override
    public boolean saveFood(AnimalFood animalFood) {
        String sql = "INSERT INTO animal_foods (animal_id, food_name, quantity, feeding_time, feeding_date, notes) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = ConnectionConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setLong(1, animalFood.getAnimalId());
            stmt.setString(2, animalFood.getFoodName());
            stmt.setString(3, animalFood.getQuantity());
            stmt.setTime(4, Time.valueOf(LocalTime.parse(animalFood.getFeedingTime())));
            stmt.setDate(5, Date.valueOf(animalFood.getFeedingDate()));
            stmt.setString(6, animalFood.getNotes());
            stmt.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean editAnimal(Long id , String nomePopular ,String nomeCientifico ,String especie ,String habitat ,String recinto ,String genero ,String estadoSaude) {
        String sql = "UPDATE animals SET name_popular = ?, name_scientific = ?, species = ? , habitat = ? , enclosure_name = ? ,gender = ? ,health_status = ?   WHERE id = ?";
        try (Connection conn = ConnectionConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, nomePopular);
            stmt.setString(2, nomeCientifico);
            stmt.setString(3, especie);
            stmt.setString(4, habitat);
            stmt.setString(5, recinto);
            stmt.setString(6, genero);
            stmt.setString(7, estadoSaude);
            stmt.setLong(8, id);

            stmt.executeUpdate();
            return true;

        } catch (Exception e) {
            System.err.println("Erro ao editar Animal: " + e.getMessage());
        }
        return false;
    }


}
