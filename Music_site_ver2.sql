CREATE TABLE IF NOT EXISTS Genres (
	genre_id SERIAL PRIMARY KEY,
	name VARCHAR(40) UNIQUE 
);

CREATE TABLE IF NOT EXISTS Artists (
	artist_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL
--	genre INTEGER REFERENCES Genres(genre_id)
);

CREATE TABLE IF NOT EXISTS Albums (
	album_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
--	artist INTEGER REFERENCES Artists(artist_id),
	year_of_production INTEGER CHECK(1950 <= year_of_production AND year_of_production <=2023)
);

CREATE TABLE IF NOT EXISTS Songs (
	song_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	duration INTEGER NOT NULL CHECK(duration > 0),
	album INTEGER REFERENCES Albums(album_id)
);

CREATE TABLE IF NOT EXISTS Artist_Genre (
	id SERIAL PRIMARY KEY,
	artist INTEGER REFERENCES Artists(artist_id),
	genre INTEGER REFERENCES Genres(genre_id)
);

CREATE TABLE IF NOT EXISTS Artist_Album (
	id SERIAL PRIMARY KEY,
	artist INTEGER REFERENCES Artists(artist_id),
	album INTEGER REFERENCES Albums(album_id)
);

CREATE TABLE IF NOT EXISTS Collections (
	collection_id SERIAL PRIMARY KEY,
	name VARCHAR(60),
	year_of_production INTEGER CHECK(1950 <= year_of_production AND year_of_production <=2023) 
);

CREATE TABLE IF NOT EXISTS Song_Collection (
--	song_collection_id SERIAL PRIMARY KEY,
	collection INTEGER REFERENCES Collections(collection_id),
	song INTEGER REFERENCES Songs(song_id),
	CONSTRAINT pk PRIMARY KEY (collection, song)
);