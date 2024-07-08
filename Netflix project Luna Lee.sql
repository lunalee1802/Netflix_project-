Create database Netflix_project;
Use Netflix_project;

SELECT COUNT(*)
FROM netflix_project;

-- Check for missing values in imdb_score and imdb_votes
SELECT *
FROM netflix_project
WHERE 'imdb_score' IS NULL OR 'imdb_votes' IS NULL;

-- Remove duplicate rows based on id and release_year
DELETE FROM netflix_project
WHERE id IN (
    SELECT id
    FROM (
        SELECT *, 
               ROW_NUMBER() OVER (PARTITION BY id ORDER BY 'release_year' DESC) AS rn
        FROM netflix_project
    ) AS subquery
    WHERE rn > 1
);


-- Verify changes
SELECT *
FROM netflix_project;


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
    AVG(CAST(imdb_score AS FLOAT)) AS avg_imdb_score
FROM 
    netflix_project
GROUP BY
    genre;
    
select * from genre_impact_table;

-- Calculating Average IMDb Scores per Genre" --
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
    UNION ALL SELECT 21 UNION ALL SELECT 22 UNION ALL SELECT 23 UNION ALL SELECT 24
    UNION ALL SELECT 25 UNION ALL SELECT 26 UNION ALL SELECT 27 UNION ALL SELECT 28
    UNION ALL SELECT 29 UNION ALL SELECT 30
) numbers
WHERE numbers.n <= LENGTH(genres_split.genres) - LENGTH(REPLACE(genres_split.genres, '/', '')) + 1;

SELECT 
    genre,
    AVG(CAST(imdb_score AS FLOAT)) AS avg_imdb_score
FROM 
    netflix_genre_scores
GROUP BY
    genre;

SELECT 
    GROUP_CONCAT(genre SEPARATOR ' / ') AS merged_genres,
    avg_imdb_score
FROM 
    genre_impact_table
GROUP BY
    avg_imdb_score;




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

-- Create the new table based on the code / this also include the collaboration movies 
CREATE TABLE production_countries_impact_table AS
SELECT 
    `production countries`, 
    ROUND(AVG(imdb_score), 2) AS avg_imdb_score
FROM 
    netflix_project
WHERE 
    imdb_score IS NOT NULL
GROUP BY 
    `production countries`
ORDER BY 
    avg_imdb_score DESC;



select * from production_countries_impact_table;

-- Create table to store individual countries and IMDb scores
CREATE TABLE IF NOT EXISTS production_countries_impact_table_new AS
SELECT 
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(`production countries`, '/', numbers.n), '/', -1)) AS country,
    ROUND(AVG(imdb_score), 2) AS avg_imdb_score
FROM 
    netflix_project
CROSS JOIN (
    SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
    UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8
    UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12
    UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15 UNION ALL SELECT 16
    UNION ALL SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19 UNION ALL SELECT 20
    UNION ALL SELECT 21 UNION ALL SELECT 22 UNION ALL SELECT 23 UNION ALL SELECT 24
    UNION ALL SELECT 25 UNION ALL SELECT 26 UNION ALL SELECT 27 UNION ALL SELECT 28
    UNION ALL SELECT 29 UNION ALL SELECT 30 UNION ALL SELECT 31 UNION ALL SELECT 32
    UNION ALL SELECT 33 UNION ALL SELECT 34 UNION ALL SELECT 35 UNION ALL SELECT 36
    UNION ALL SELECT 37 UNION ALL SELECT 38 UNION ALL SELECT 39 UNION ALL SELECT 40
    UNION ALL SELECT 41 UNION ALL SELECT 42 UNION ALL SELECT 43 UNION ALL SELECT 44
    UNION ALL SELECT 45 UNION ALL SELECT 46 UNION ALL SELECT 47 UNION ALL SELECT 48
    UNION ALL SELECT 49 UNION ALL SELECT 50
) numbers
WHERE 
    imdb_score IS NOT NULL
    AND numbers.n <= LENGTH(`production countries`) - LENGTH(REPLACE(`production countries`, '/', '')) + 1
GROUP BY 
    country
ORDER BY 
    avg_imdb_score DESC;

-- View the contents of the new table
SELECT * FROM production_countries_impact_table_new;


-- View the contents of the new table
SELECT * FROM production_countries_impact_table_new;


-- --  Relationship between Release Year Trends and Genres' Impact on IMDb Scores
CREATE TABLE IF NOT EXISTS release_year_genre_relationship_table AS
SELECT 
    release_year,
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(genres, ',', 1), '[', -1)) AS genre,
    AVG(CAST(imdb_score AS FLOAT)) AS avg_imdb_score
FROM 
    netflix_project
GROUP BY 
    release_year, TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(genres, ',', 1), '[', -1))
ORDER BY 
    release_year ASC, avg_imdb_score DESC;
    
select * from release_year_genre_relationship_table ;

-- Create table to store release year, genre, and IMDb scores relationship
CREATE TABLE IF NOT EXISTS release_year_genre_relationship_table_new AS
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
    UNION ALL SELECT 21 UNION ALL SELECT 22 UNION ALL SELECT 23 UNION ALL SELECT 24
    UNION ALL SELECT 25 UNION ALL SELECT 26 UNION ALL SELECT 27 UNION ALL SELECT 28
    UNION ALL SELECT 29 UNION ALL SELECT 30 UNION ALL SELECT 31 UNION ALL SELECT 32
    UNION ALL SELECT 33 UNION ALL SELECT 34 UNION ALL SELECT 35 UNION ALL SELECT 36
    UNION ALL SELECT 37 UNION ALL SELECT 38 UNION ALL SELECT 39 UNION ALL SELECT 40
    UNION ALL SELECT 41 UNION ALL SELECT 42 UNION ALL SELECT 43 UNION ALL SELECT 44
    UNION ALL SELECT 45 UNION ALL SELECT 46 UNION ALL SELECT 47 UNION ALL SELECT 48
    UNION ALL SELECT 49 UNION ALL SELECT 50
) numbers
WHERE 
    imdb_score IS NOT NULL
    AND numbers.n <= LENGTH(genres) - LENGTH(REPLACE(genres, '/', '')) + 1
GROUP BY 
    release_year, TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(genres, '/', numbers.n), '/', -1))
ORDER BY 
    release_year ASC, avg_imdb_score DESC;

-- View the contents of the new table
SELECT * FROM release_year_genre_relationship_table_new;
