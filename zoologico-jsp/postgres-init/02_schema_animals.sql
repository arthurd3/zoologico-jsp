CREATE TABLE IF NOT EXISTS animals (
    id SERIAL PRIMARY KEY,
    name_popular VARCHAR(100) NOT NULL,
    name_scientific VARCHAR(100) ,
    species VARCHAR(100) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    habitat VARCHAR(100) NOT NULL,
    health_status VARCHAR(100),
    arrival_date DATE NOT NULL,
    enclosure_name VARCHAR(100) NOT NULL
);

INSERT INTO animals (name_popular, name_scientific, species, gender, habitat, health_status, arrival_date, enclosure_name) VALUES
('Leão', 'Panthera leo', 'Felino', 'Macho', 'Savana', 'Saudável', '2024-02-15', 'Jaula 1'),
('Arara Azul', 'Anodorhynchus hyacinthinus', 'Ave', 'Fêmea', 'Floresta', 'Recuperação', '2024-03-20', 'Viveiro 2'),
('Tartaruga', 'Chelonoidis carbonaria', 'Réptil', 'Fêmea', 'Terrestre', 'Saudável', '2023-11-10', 'Terrário 3'),
('Macaco-Prego', 'Sapajus apella', 'Primata', 'Macho', 'Mata Atlântica', 'Observação', '2024-01-05', 'Jaula 4');