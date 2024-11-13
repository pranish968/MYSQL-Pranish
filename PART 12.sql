CREATE DATABASE theater;
USE theater;


CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);


CREATE TABLE actors (
    actor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);


CREATE TABLE movie_actors (
    movie_id INT,
    actor_id INT,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (actor_id) REFERENCES actors(actor_id)
);


CREATE TABLE stores (
    store_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);


CREATE TABLE movie_stores (
    movie_id INT,
    store_id INT,
    PRIMARY KEY (movie_id, store_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);


INSERT INTO categories (name) VALUES ('Sports'), ('Drama'), ('Comedy');


INSERT INTO movies (title, category_id) VALUES 
('Wyoming Storm', 2),
('Football Fever', 1),
('The Great Race', 1),
('Drama King', 2),
('Comedy Nights', 3);


INSERT INTO actors (first_name, last_name) VALUES 
('Tom', 'Hanks'),
('Julia', 'Roberts'),
('Robert', 'Downey Jr.'),
('Scarlett', 'Johansson'),
('Chris', 'Evans');


INSERT INTO movie_actors (movie_id, actor_id) VALUES 
(1, 2), -- Wyoming Storm with Julia Roberts
(1, 3), -- Wyoming Storm with Robert Downey Jr.
(2, 4), -- Football Fever with Scarlett Johansson
(3, 5), -- The Great Race with Chris Evans
(4, 1), -- Drama King with Tom Hanks
(4, 2); -- Drama King with Julia Roberts


INSERT INTO stores (name) VALUES ('Store 1'), ('Store 2');


INSERT INTO movie_stores (movie_id, store_id) VALUES 
(1, 1), -- Wyoming Storm available only in Store 1
(2, 1), -- Football Fever available only in Store 1
(3, 2), -- The Great Race available only in Store 2
(4, 1); -- Drama King available only in Store 1




SELECT m.title
FROM movies m
JOIN categories c ON m.category_id = c.category_id
WHERE c.name = 'Sports'
ORDER BY m.title;


SELECT a.first_name, a.last_name
FROM actors a
JOIN movie_actors ma ON a.actor_id = ma.actor_id
JOIN movies m ON ma.movie_id = m.movie_id
WHERE m.title = 'Wyoming Storm'
ORDER BY a.first_name, a.last_name;


SELECT DISTINCT a.first_name, a.last_name
FROM actors a
JOIN movie_actors ma ON a.actor_id = ma.actor_id
JOIN movies m ON ma.movie_id = m.movie_id
JOIN categories c ON m.category_id = c.category_id
WHERE c.name = 'Drama'
ORDER BY a.first_name, a.last_name;


SELECT m.title
FROM movies m
JOIN movie_stores ms ON m.movie_id = ms.movie_id
WHERE ms.store_id = 1
  AND m.movie_id NOT IN (SELECT movie_id FROM movie_stores WHERE store_id != 1)
ORDER BY m.title;


SELECT DISTINCT a.first_name, a.last_name
FROM actors a
JOIN movie_actors ma ON a.actor_id = ma.actor_id
JOIN movies m ON ma.movie_id = m.movie_id
WHERE m.movie_id IN (
    SELECT ma2.movie_id
    FROM movie_actors ma2
    JOIN actors a2 ON ma2.actor_id = a2.actor_id
    WHERE a2.first_name = 'Julia' AND a2.last_name = 'Roberts'
)
AND a.actor_id != (SELECT actor_id FROM actors WHERE first_name = 'Julia' AND last_name = 'Roberts')
ORDER BY a.first_name, a.last_name;

#to remove SQL from safe mode.
 SET SQL_SAFE_UPDATES = 0;

