--# First, I pulled a dataset from Kaggle on Spotify Top 50 2021 information.
--# I created a table in MS SQL.
--# Then, I imported the table values.

CREATE TABLE spotify 
(
	id	INT IDENTITY  not null,
	artist_name	VARCHAR(255) not null ,
	track_name	VARCHAR(255) not null ,
	track_id	VARCHAR(255) not null,
	popularity	INT,
	danceability VARCHAR(55),
	energy		VARCHAR(55),
	loudness	VARCHAR(55),
	mode		INT,
	speechiness	VARCHAR(55),
	acousticness VARCHAR(55),
	instrumentalness VARCHAR(55),
	liveness	VARCHAR(55),
	valence		VARCHAR(55),
	tempo		VARCHAR(55),
	duration_ms	INT,
	time_signature	INT
);

-- Then I inserted the Spotify Data .csv into the table.

-- Next, I explored the data using the following SQL. 


-- How many songs on the list are by Olivia Rodrigo? 
SELECT COUNT(*) FROM spotify WHERE artist_name = "Olivia Rodrigo";

-- Which songs have a tempo at or above 150 and a duration of 200000 or longer? = id 33, 8, 13, 23, 18
SELECT * FROM spotify
WHERE	 tempo >= 150 AND duration_ms >= 200000
GROUP BY track_name;

-- What is the average popularity of all songs on the list? = 86.8
SELECT  avg(popularity)
From    spotify;

-- How many different artists made the cut? = 35
SELECT  count(distinct artist_name)
FROM    spotify;

-- Which artist had the most songs on the list? = Olivia Rodrigo and Doja Cat both had 4
SELECT   artist_name, COUNT(artist_name) AS count
FROM	 spotify
GROUP BY artist_name
ORDER BY count DESC;

-- What are the top 10 songs (include artist name), by popularity?
SELECT   track_name, artist_name, popularity 
FROM	 spotify
ORDER BY popularity DESC
		 LIMIT 10;

-- And finally determined the number of tracks by artist
SELECT   artist_name,
count	 (track_name)
FROM	 spotify
GROUP BY artist_name
ORDER BY artist_name

