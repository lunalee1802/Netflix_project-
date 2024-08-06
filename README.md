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

### Data Cleaning
- **Handle Missing Values**: Checked for and addressed missing values in `imdb_score` and `imdb_votes`.
- **Remove Duplicate Rows**: Removed duplicate rows based on `id` and `release_year`.

### Calculation of Average IMDb Scores
- Computed the overall average IMDb score for Netflix titles.

### Analysis of the Impact of Genres on IMDb Scores
- Determined the average IMDb score per genre to understand which genres tend to have higher ratings.

### Examination of Trends in IMDb Scores Over Different Release Years
- Analyzed the trends in IMDb scores by release year to observe any patterns or changes over time.

### Analysis of the Influence of Production Countries on IMDb Scores
- Calculated the average IMDb scores for titles from different production countries to identify which countries produce higher-rated content.

### Exploration of the Relationship Between Release Year Trends and Genre Impact
- Investigated how different genres performed over various release years to see if certain genres gained or lost popularity.

### Analysis of Top 3 Genres per Country
- Identified the top 3 genres for each country along with their average IMDb scores. This provides valuable insights into regional preferences and can help in tailoring content strategies to suit different markets.

### Analysis of IMDb Scores by Continent
- Grouped countries into continents to identify continental trends and peculiarities in IMDb scores for top genres.

## Conclusion

The analysis of Netflix's movie and TV show data reveals several key insights that can guide future content strategies and enhance IMDb scores. Here's a summary of the findings:

### Overall IMDb Score
- **Average IMDb Score**: The average IMDb score for Netflix titles stands at 6.51. This suggests that while there are numerous popular titles, there is potential to improve the quality of content to raise the overall ratings.

### Content Distribution
- **Diversity in Content**: The dataset includes 5,850 unique titles spanning 19 genres and originating from 109 different countries. This diversity reflects Netflix's extensive and varied content library, catering to a broad audience base worldwide.

### Trends Over Time
- **IMDb Scores by Release Year**: Analysis of IMDb scores over the years shows significant fluctuations. There is a noticeable rise in average scores in the early years of Netflix's content offerings, peaking around the mid-2000s. However, there is a slight decline in more recent years, suggesting that newer content may not be resonating as well with audiences or that viewer expectations have changed.

### Top 3 Genres per Country
- **Genre Preferences by Country**: The analysis identified the top 3 genres for each country along with their average IMDb scores. This provides valuable insights into regional preferences and can help in tailoring content strategies to suit different markets.

## Key Insights and Recommendations

### Improve Overall Content Quality
- **Insight**: With an average IMDb score of 6.51, there is room for improvement.
- **Recommendation**: Focus on raising the overall quality of content by investing in higher production values, compelling storylines, and strong performances.

### Leverage Genre Popularity by Region
- **Insight**: The top genres for each country reveal important regional preferences. For instance, in the UAE, "documentation," "family," and "sport" genres are popular. Argentina shows a strong preference for "history," "crime," and "sport."
- **Recommendation**: Tailor content strategies to focus on the most popular genres in each region to enhance viewer satisfaction and engagement.

### Address Low-Scoring Regions and Continents
- **Insight**: Countries like Angola and the continent of Africa have low average IMDb scores, indicating potential dissatisfaction with the available content.
- **Recommendation**: Conduct targeted surveys or focus groups to understand viewer preferences and content gaps in regions with low IMDb scores, and use this feedback to improve content quality.

### Promote High-Scoring Genres
- **Insight**: Certain genres, such as "history" in Argentina, have high average IMDb scores.
- **Recommendation**: Promote high-scoring genres more aggressively in both local and international markets to attract new subscribers and retain existing ones.

### Focus on Genre Trends by Continent
- **Insight**:
  - **Africa**: The top genres include "crime" and "drama," but with low average IMDb scores (around 3.80). There is potential to improve the quality of these genres to meet viewer expectations.
  - **Asia**: Shows moderate average IMDb scores with genres such as "documentation," "family," and "sport" scoring around 6.04 to 6.30. Focusing on high-quality production in these genres could further enhance ratings.
  - **Europe**: Exhibits higher average IMDb scores for genres like "european," indicating a preference for regional content. Investing in European-themed content could be beneficial.
  - **South America**: Exhibits high average IMDb scores for genres such as "history," "crime," and "sport," with scores ranging from 7.02 to 7.60. Prioritizing these genres can help maintain high viewer engagement and satisfaction.
- **Recommendation**: Create and promote content that aligns with the popular genres in each continent. For example:
  - **Africa**: Invest in improving the quality of "crime" and "drama" genres.
  - **Asia**: Focus on producing high-quality "documentation," "family," and "sport" content.
  - **Europe**: Enhance and promote content that highlights "history" genre.
  - **South America**: Continue to invest in "history," "crime," and "sport" genres to leverage their high IMDb scores.



![PowerBI][(https://github.com/lunalee1802/Netflix_project-/blob/main/Netflix%20final%20video%20luna%20lee.gif)]



