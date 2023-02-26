-- 1. Количество исполнителей в каждом жанре
SELECT name, count(artist) FROM artist_genre ag
LEFT JOIN genres g ON ag.genre = g.genre_id  
GROUP BY name;


--2. Количество треков, вошедших в альбомы 2019–2020 годов
SELECT count(s.name) FROM songs s 
LEFT JOIN albums a ON s.album = a.album_id 
WHERE a.year_of_production IN (2019, 2020);


--3. Средняя продолжительность треков по каждому альбому
SELECT a.name, avg(duration) FROM songs s 
LEFT JOIN albums a ON s.album = a.album_id 
GROUP BY a.name;


--4. Все исполнители, которые не выпустили альбомы в 2020 году
SELECT a1.name FROM artists a1 
WHERE a1.name NOT IN (SELECT artists.name FROM artist_album aa  
						JOIN albums a2 ON aa.album = a2.album_id
						RIGHT JOIN artists ON aa.artist = artists.artist_id
						WHERE year_of_production IN (2020));


--5. Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)
SELECT c.name FROM collections c 
JOIN song_collection sc ON sc.collection = c.collection_id 
JOIN songs s ON sc.song = s.song_id 
JOIN albums a ON s.album = a.album_id 
JOIN artist_album aa ON a.album_id = aa.album 
JOIN artists a2 ON aa.artist = a2.artist_id 
WHERE a2.name = 'ABBA'
GROUP BY c.name;


--6.1 Названия альбомов, в которых присутствуют исполнители более чем одного жанра (альбом исполнителя, работающего более чем  1 жанре)
SELECT a.name FROM albums a
JOIN artist_album aa ON aa.album = a.album_id 
JOIN artists a2 ON aa.artist = a2.artist_id 
JOIN artist_genre ag ON ag.artist = a2.artist_id 
JOIN genres g ON ag.genre = g.genre_id 
GROUP BY a.name
HAVING count(DISTINCT g.name) > 1;

--6.2 Названия альбомов, в которых присутствуют исполнители более чем одного жанра (имеются в виду сборники из нескольких исполнеителей)
SELECT c.name FROM collections c 
JOIN song_collection sc  ON sc.collection = c.collection_id  
JOIN songs s  ON sc.song = s.song_id
JOIN albums a ON s.album = a.album_id 
JOIN artist_album aa ON aa.album = a.album_id 
JOIN artists a2 ON aa.artist = a2.artist_id 
JOIN artist_genre ag ON ag.artist = a2.artist_id 
JOIN genres g ON ag.genre = g.genre_id 
GROUP BY c.name
HAVING count(DISTINCT  g.name) > 1;


--7. Наименования треков, которые не входят в сборники
SELECT s.name FROM song_collection sc 
JOIN collections c ON sc.collection  = c.collection_id
RIGHT JOIN songs s ON sc.song = s.song_id 
WHERE c.name IS NULL;


--8. Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько
SELECT a.name  FROM artists a
JOIN artist_album aa ON aa.artist = a.artist_id 
JOIN albums a2 ON aa.album = a2.album_id 
JOIN songs s ON s.album = a2.album_id
WHERE s.duration = (SELECT min(duration) FROM songs)
GROUP BY a.name;

--9. Названия альбомов, содержащих наименьшее количество треков
SELECT a.name FROM albums a 
JOIN songs s ON s.album = a.album_id 
GROUP BY a.name
HAVING count(s.name) = (SELECT min(t.count) from (SELECT count(songs.name) FROM albums 
													JOIN songs ON songs.album = albums.album_id 
													GROUP BY albums.name) t)
