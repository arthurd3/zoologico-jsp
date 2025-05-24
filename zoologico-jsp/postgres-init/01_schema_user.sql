CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL ,
    email VARCHAR(100) NOT NULL UNIQUE ,
    phone VARCHAR(100) NOT NULL UNIQUE ,
    password VARCHAR(100) NOT NULL,
    userType VARCHAR(100) NOT NULL
);


INSERT INTO users (name, email, phone, password, userType) VALUES
('adm', 'adm@gmail.com', '11999998888', '123', 'ADMIN'),
('Carlos Lima', 'carlos@example.com', '11988887777', '123', 'CLIENT'),
('Beatriz Melo', 'beatriz@example.com', '11977776666', '123', 'CLIENT'),
('Daniel Costa', 'daniel@example.com', '11966665555', '123', 'EMPLOYEE');
