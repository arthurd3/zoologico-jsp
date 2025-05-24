CREATE TABLE enclosures (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50),
    size_m2 DECIMAL(10,2),
    description TEXT,
    animal_id INT,
    cleaned_by VARCHAR(50) DEFAULT 'NINGUEM' NOT NULL,
    clean_date DATE DEFAULT '0001-01-01',
    clean_time TIME DEFAULT '00:00:00',
    FOREIGN KEY (animal_id) REFERENCES animals(id) ON DELETE CASCADE
);


INSERT INTO enclosures ( name, type, size_m2, description, animal_id, cleaned_by, clean_date, clean_time) VALUES
('Jaula A', 'Jaula', 25.50, 'Recinto para leões adultos.', 1, 'João Silva', '2025-05-10', '08:30:00'),
('Aquário 1', 'Aquário', 15.00, 'Tanque com filtragem especial para peixes tropicais.', 2, 'Maria Costa', '2025-05-11', '09:00:00'),
('Terrário B', 'Terrário', 12.75, 'Recinto quente para répteis.', 3, 'Carlos Lima', '2025-05-09', '10:15:00'),
('Aviário Central', 'Aviário', 30.00, 'Espaço amplo para aves tropicais.', 4, 'Ana Souza', '2025-05-12', '07:45:00');

