SELECT name, year_of_production FROM albums
WHERE year_of_production = 2018;

--выбираем самый длинный трек
SELECT name, duration FROM songs
WHERE duration IN (SELECT max(duration) FROM songs);

-- выбраем треки не менее 3,5 минут (210 сек)
SELECT name, duration FROM songs
WHERE duration >= 210;

-- сборники с 2018 по 2022 года
SELECT name FROM collections
WHERE year_of_production BETWEEN 2018 AND 2020;

--исполнители из 1 слова
SELECT name FROM artists
WHERE name NOT LIKE '% %';

--треки, содержащие в названии my(мой)
SELECT name FROM songs
WHERE name LIKE '%Мой%'OR name LIKE '%мой%' OR name LIKE '%My%' OR name LIKE '%my%'; 

