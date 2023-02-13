-- Заполняем жанры
INSERT INTO genres (name)
VALUES 
('Pop'), 
('Rock'),
('Classic'),
('Jazz'),
('Romance'),
('Rock-N-Roll');

-- Заполняем артистов
INSERT INTO artists (name)
VALUES 
('Andr Derzh'),
('Queen'),
('Malinin'),
('ABBA'),
('INNA'),
('Ed Sheeran'),
('BTS'),
('Coldplay'),
('Bon Jovi'),
('Victor Zinchuk'),
('Maksim');

-- связываем артистов и жанры
INSERT INTO artist_genre (artist, genre)
VALUES 
(1,1),
(2,1),
(2,2),
(3,5),
(4,1),
(5,1),
(6,1),
(7,1),
(8,2),
(9,2),
(10,3),
(11,3);

--Заполняем альбомы
INSERT INTO albums (name, year_of_production)
VALUES 
('The platinum', 2011),
('Bohemian Rhapsody', 2018),
('Innuendo', 1991),
('May', 2021),
('Песни о хорошем', 2019),
('Новости из первых рук', 2018),
('Voyage', 2021),
('Abba Gold', 2014),
('Live in Buenos Aires', 2018),
('ALIENS', 2017),
('Neoclassic', 2003),
('Neolyrics', 2000);

INSERT INTO songs (name, duration, album)
VALUES 
('Lolita', 206, 12),
('Greenleeves', 214, 12),
('Blues', 349, 11),
('Ave Maria', 434, 11),
('Aliens', 425, 10),
('Yellow', 350, 9),
('Paradise', 419, 9),
('Mamma Mia', 212, 8),
('SOS', 201, 8),
('Bumblebee', 237, 7),
('Little Things', 188, 7),
('Звезды', 279, 6),
('Я хочу дождя', 279, 6),
('Верю', 462, 5),
('Ночной город', 257, 5),
('Романс', 298, 4),
('Headlong', 277, 3),
('Somebody To Love', 297, 2),
('Killer Queen', 181, 2),
('My Dejavu', 300, 1),
('Мой ненаглядный', 231, 1);

INSERT INTO artist_album (artist, album)
VALUES 
(1, 5),
(1, 6),
(2, 1),
(2, 2),
(2, 3),
(3, 4),
(6, 7),
(4, 8),
(4, 9),
(9, 10),
(10, 11),
(10, 12);

INSERT INTO collections (name, year_of_production)
VALUES 
('Best', 2018),
('Gold', 2019),
('Very best',2021),
('Memory', 2018);

INSERT INTO song_collection 
VALUES 
(1,1),
(1,2),
(1,3),
(1,4),
(2,2),
(2,6),
(2,3),
(2,8),
(3,9),
(3,12),
(3,13),
(4, 1),
(4, 15),
(4, 16),
(4,18),
(4, 19);