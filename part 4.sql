#16-10-2024

CREATE DATABASE CountryDB;

USE CountryDB;

CREATE TABLE cities (
    postal_code VARCHAR(10),
    city_name VARCHAR(100),
    PRIMARY KEY (postal_code, city_name)
);

INSERT INTO cities (postal_code, city_name) 
VALUES
('44600', 'Kathmandu'),
('33700', 'Pokhara'),
('44601', 'Bhaktapur'),
('32900', 'Biratnagar'),
('56300', 'Lalitpur');

SELECT * FROM cities;
