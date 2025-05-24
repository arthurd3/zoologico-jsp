package com.zoologico.repository.animal;

import com.zoologico.config.ConnectionConfig;
import com.zoologico.dtos.animal.EnclosureDTO;
import com.zoologico.model.animal.Enclosure;


import java.sql.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class EnclosureRepository implements IEnclosureRepository {

    @Override
    public List<EnclosureDTO> findAllEnclosures() {
        String sql = "SELECT * FROM enclosures";
        List<EnclosureDTO> enclosures = new ArrayList<>();

        try (Connection conn = ConnectionConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                EnclosureDTO dto = new EnclosureDTO(
                        rs.getLong("id"),
                        rs.getString("name"),
                        rs.getString("type"),
                        rs.getBigDecimal("size_m2"),
                        rs.getString("description"),
                        rs.getLong("animal_id"),
                        rs.getString("cleaned_by"),
                        rs.getDate("clean_date").toLocalDate(),
                        rs.getTime("clean_time").toLocalTime()
                );
                enclosures.add(dto);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return enclosures;
    }

    @Override
    public boolean save(Enclosure enclosure) {
        String sql = "INSERT INTO enclosures (name, type, size_m2, description, animal_id) " +
                "VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = ConnectionConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, enclosure.getName());
            stmt.setString(2, enclosure.getType());
            stmt.setBigDecimal(3, enclosure.getSizeM2());
            stmt.setString(4, enclosure.getDescription());
            stmt.setLong(5, enclosure.getAnimalId());
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteById(Long id) {
        String sql = "DELETE FROM enclosures WHERE id = ?";

        try (Connection conn = ConnectionConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setLong(1, id);
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected == 0) {
                System.out.println("Nenhum Recinto foi deletado:" + id);
                return false;
            } else {
                System.out.println("Recinto deletado: " + id);
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Optional<EnclosureDTO> findById(Long id) {
        String sql = "SELECT * FROM enclosures WHERE id = ?";
        try (Connection conn = ConnectionConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setLong(1, id);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                EnclosureDTO enclosure = new EnclosureDTO(
                        rs.getLong("id"),
                        rs.getString("name"),
                        rs.getString("type"),
                        rs.getBigDecimal("size_m2"),
                        rs.getString("description"),
                        rs.getLong("animal_id"),
                        rs.getString("cleaned_by"),
                        rs.getDate("clean_date").toLocalDate(),
                        rs.getTime("clean_time").toLocalTime()
                );
                return Optional.of(enclosure);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }


    @Override
    public boolean cleanEnclosure(Long id, String cleanedBy, String cleanDate, String cleanTime) {
        String sql = "UPDATE enclosures SET cleaned_by = ?, clean_date = ?, clean_time = ? WHERE id = ?";
        try (Connection conn = ConnectionConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, cleanedBy);

            LocalDate date = LocalDate.parse(cleanDate);
            LocalTime time = LocalTime.parse(cleanTime);

            stmt.setDate(2, Date.valueOf(date));
            stmt.setTime(3, Time.valueOf(time));
            stmt.setLong(4, id);

            stmt.executeUpdate();
            return true;

        } catch (Exception e) {
            System.err.println("Erro ao registrar limpeza: " + e.getMessage());
        }
        return false;
    }
}
