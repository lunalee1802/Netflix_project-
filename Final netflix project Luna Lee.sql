-- Create and use the database
CREATE DATABASE IF NOT EXISTS Netflix_project;
USE Netflix_project;

-- Verify table existence
SELECT COUNT(*)
FROM netflix_project;


-- Check for missing values in imdb_score and imdb_votes
SELECT *
FROM netflix_project
WHERE imdb_score IS NULL OR imdb_votes IS NULL;

-- Remove duplicate rows based on id and release_year
DELETE FROM netflix_project
WHERE id IN (
    SELECT id
    FROM (
        SELECT *,
               ROW_NUMBER() OVER (PARTITION BY id ORDER BY release_year DESC) AS rn
        FROM netflix_project
    ) AS subquery
    WHERE rn > 1
);

-- Verify changes
SELECT * FROM netflix_project;

-- Analysis Section

-- Average IMDB score
CREATE TABLE IF NOT EXISTS avg_IMDB_score AS
SELECT AVG(imdb_score) AS average_imdb_score
FROM netflix_project
WHERE imdb_score IS NOT NULL
AND imdb_score > 0;

SELECT *
FROM avg_IMDB_score;

-- Genre Impact: Average IMDb score per genre
CREATE TABLE IF NOT EXISTS genre_impact_table AS
SELECT
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(genres, ',', 1), '[', -1)) AS genre,
    ROUND(AVG(CAST(imdb_score AS FLOAT)), 2) AS avg_imdb_score
FROM
    netflix_project
GROUP BY
    genre;


SELECT * FROM genre_impact_table;

-- Calculating Average IMDb Scores per Genre
-- Splitting genres into individual entries and calculating average IMDb scores per genre
CREATE TABLE IF NOT EXISTS netflix_genre_scores AS
SELECT
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(genres, '/', numbers.n), '/', -1)) AS genre,
    imdb_score
FROM (
    SELECT
        netflix_project.genres,
        netflix_project.imdb_score
    FROM netflix_project
) AS genres_split
CROSS JOIN (
    SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
    UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8
    UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12
    UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15 UNION ALL SELECT 16
    UNION ALL SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19 UNION ALL SELECT 20
) numbers
WHERE numbers.n <= LENGTH(genres_split.genres) - LENGTH(REPLACE(genres_split.genres, '/', '')) + 1;

-- Calculate and display average IMDb scores per genre
SELECT
    genre,
    ROUND(AVG(CAST(imdb_score AS FLOAT)), 2) AS avg_imdb_score
FROM
    netflix_genre_scores
WHERE genre <> ''
GROUP BY
    genre;


--- - Release Year Trends: Average IMDb score per release year----
CREATE TABLE IF NOT EXISTS release_year_trends_table AS
SELECT
	release_year,
    ROUND(AVG(imdb_score), 2) AS avg_imdb_score
FROM
	netflix_project
WHERE
	imdb_score IS NOT NULL
GROUP BY
	release_year
ORDER BY
	release_year ASC;
 
	
select * from release_year_trends_table;

-- Create production_countries_impact_table and calculate average IMDb scores per country
CREATE TABLE IF NOT EXISTS production_countries_impact_table (
    country VARCHAR(255),  -- Adjust the data type and length as per your data
    avg_imdb_score FLOAT   -- Assuming IMDb scores are stored as numeric
);

INSERT INTO production_countries_impact_table(country, avg_imdb_score)
SELECT
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(`production countries`, '/', numbers.n), '/', -1)) AS country,
    ROUND(AVG(imdb_score), 2) AS avg_imdb_score
FROM
    netflix_project
CROSS JOIN (
    SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
    UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8
    UNION ALL SELECT 9 UNION ALL SELECT 10  -- Adjust the number of unions based on your maximum expected entries
) AS numbers
WHERE
    imdb_score IS NOT NULL
    AND numbers.n <= LENGTH(`production countries`) - LENGTH(REPLACE(`production countries`, '/', '')) + 1
GROUP BY
    country
ORDER BY
    avg_imdb_score DESC;

-- View the contents of the new table
SELECT * FROM production_countries_impact_table;

-- Create a table to store average IMDb scores per country and genre
CREATE TABLE IF NOT EXISTS production_countries_genres_impact_table AS
SELECT
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(netflix_project.`production countries`, '/', numbers.n), '/', -1)) AS country,
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(netflix_project.genres, '/', numbers.n), '/', -1)) AS genre,
    ROUND(AVG(netflix_project.imdb_score), 2) AS avg_imdb_score
FROM
    netflix_project
CROSS JOIN (
    SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 -- Adjust based on your maximum number of genres or countries
) AS numbers
WHERE
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(netflix_project.`production countries`, '/', numbers.n), '/', -1)) <> ''
    AND TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(netflix_project.genres, '/', numbers.n), '/', -1)) <> ''
GROUP BY
    country, genre;

SELECT * FROM production_countries_genres_impact_table;

-- Create the final table to store top 3 genres and their average IMDb scores per country
CREATE TABLE IF NOT EXISTS top_genres_per_country (
    country VARCHAR(100),
    genre1 VARCHAR(100),
    genre2 VARCHAR(100),
    genre3 VARCHAR(100),
    avg_imdb_score1 DECIMAL(5,2),
    avg_imdb_score2 DECIMAL(5,2),
    avg_imdb_score3 DECIMAL(5,2)
);

-- Insert top 3 genres and their average IMDb scores per country into the final table
INSERT INTO top_genres_per_country (country, genre1, genre2, genre3, avg_imdb_score1, avg_imdb_score2, avg_imdb_score3)
SELECT
    country,
    MAX(CASE WHEN rank_number = 1 THEN genre END) AS genre1,
    MAX(CASE WHEN rank_number = 2 THEN genre END) AS genre2,
    MAX(CASE WHEN rank_number = 3 THEN genre END) AS genre3,
    MAX(CASE WHEN rank_number = 1 THEN avg_imdb_score END) AS avg_imdb_score1,
    MAX(CASE WHEN rank_number = 2 THEN avg_imdb_score END) AS avg_imdb_score2,
    MAX(CASE WHEN rank_number = 3 THEN avg_imdb_score END) AS avg_imdb_score3
FROM (
    SELECT
        country,
        genre,
        avg_imdb_score,
        ROW_NUMBER() OVER (PARTITION BY country ORDER BY avg_imdb_score DESC) AS rank_number
    FROM
        production_countries_genres_impact_table
) AS ranked_genres
GROUP BY
    country;

-- View the contents of the final table
SELECT * FROM top_genres_per_country;

-- Create table to store release year, genre, and IMDb scores relationship
CREATE TABLE IF NOT EXISTS release_year_genre_relationship_table AS
SELECT
    release_year,
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(genres, '/', numbers.n), '/', -1)) AS genre,
    Round(AVG(CAST(imdb_score AS FLOAT)),2) AS avg_imdb_score
FROM
    netflix_project
CROSS JOIN (
    SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
    UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8
    UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12
    UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15 UNION ALL SELECT 16
    UNION ALL SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19 UNION ALL SELECT 20
) numbers
WHERE
    imdb_score IS NOT NULL
    AND numbers.n <= LENGTH(genres) - LENGTH(REPLACE(genres, '/', '')) + 1
GROUP BY
    release_year, TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(genres, '/', numbers.n), '/', -1))
ORDER BY
    release_year ASC, avg_imdb_score DESC;

-- View the contents of the new table
SELECT * FROM release_year_genre_relationship_table;




