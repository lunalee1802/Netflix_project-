# Netflix Data Analysis Project

## Objective
The objective of this project is to analyze Netflix's movie and TV show data to derive insights about IMDb scores, the impact of genres, trends over release years, and the influence of production countries. By performing various data cleaning, transformation, and analysis tasks, this project aims to uncover interesting patterns and relationships within the dataset.

## About the Dataset
**Netflix - TV Shows and Movies**  
This dataset was created to list all shows available on Netflix streaming and analyze the data to find interesting facts. The data was acquired in July 2022 and contains information available in the United States.

- Source : [Netflix TV Shows and Movies](https://www.kaggle.com/datasets/victorsoeiro/netflix-tv-shows-and-movies?select=titles.csv)

## Content
The dataset consists of one file used in this project:

- `titles.csv`: Contains information about the titles available on Netflix.

The `titles.csv` file contains over 5,000 unique titles on Netflix with 15 columns providing various details about each title, including:

- `id`: The title ID on JustWatch.
- `title`: The name of the title.
- `show_type`: TV show or movie.
- `description`: A brief description of the title.
- `release_year`: The release year of the title.
- `age_certification`: The age certification of the title.
- `runtime`: The length of the episode (for shows) or movie.
- `genres`: A list of genres associated with the title.
- `production_countries`: A list of countries that produced the title.
- `seasons`: Number of seasons if it's a show.
- `imdb_id`: The title ID on IMDb.
- `imdb_score`: The IMDb score of the title.
- `imdb_votes`: The number of votes the title received on IMDb.
- `tmdb_popularity`: The popularity score on TMDB.
- `tmdb_score`: The score on TMDB.

## Tasks
The following tasks were performed as part of this analysis:

- Data cleaning to handle missing values and remove duplicate rows.
- Calculation of average IMDb scores.
- Analysis of the impact of genres on IMDb scores.
- Examination of trends in IMDb scores over different release years.
- Analysis of the influence of production countries on IMDb scores.
- Exploration of the relationship between release year trends and genre impact.

![PowerBI](https://github.com/lunalee1802/Netflix_project-/assets/171199873/386d367a-8253-4da2-887f-62eca249a4d3)

## Conclusion
The analysis of Netflix's movie and TV show data reveals several key insights that can guide future content strategies and enhance viewer engagement. Here's a summary of the findings:

### Overall IMDb Score
- Average IMDb Score: The average IMDb score for Netflix titles stands at 6.51. This suggests that while there are numerous popular titles, there is potential to improve the quality of content to raise the overall ratings.
### Content Distribution
- Diversity in Content: The dataset includes 5,850 unique titles spanning 19 genres and originating from 109 different countries. This diversity reflects Netflix's extensive and varied content library, catering to a broad audience base worldwide.
### Trends Over Time
- IMDb Scores by Release Year: Analysis of IMDb scores over the years shows significant fluctuations. There is a noticeable rise in average scores in the early years of Netflix's content offerings, peaking around the mid-2000s. However, there is a slight decline in more recent years, suggesting that newer content may not be resonating as well with audiences or that viewer expectations have changed.
