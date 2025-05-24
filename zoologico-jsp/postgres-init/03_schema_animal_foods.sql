CREATE TABLE IF NOT EXISTS animal_foods (
    id SERIAL PRIMARY KEY,
    animal_id INT NOT NULL,
    food_name VARCHAR(100) NOT NULL,
    quantity VARCHAR(50) NOT NULL,
    feeding_time TIME NOT NULL,
    feeding_date DATE NOT NULL,
    notes TEXT,

    FOREIGN KEY (animal_id) REFERENCES animals(id) ON DELETE CASCADE
);

INSERT INTO animal_foods (animal_id, food_name, quantity, feeding_time, feeding_date, notes) VALUES
(1, 'Carne', '2kg', '12:00', '2025-05-12', 'Alimentação principal'),
(2, 'Frutas', '300g', '08:00', '2025-05-12', 'Prefere banana e mamão'),
(3, 'Verduras', '150g', '09:30', '2025-05-12', 'Inclui alface e cenoura'),
(4, 'Frutas e sementes', '200g', '10:00', '2025-05-12', 'Mistura variada');