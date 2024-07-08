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

- Overall IMDb Score
Average IMDb Score: The average IMDb score for Netflix titles stands at 6.51. This suggests that while there are numerous popular titles, there is potential to improve the quality of content to raise the overall ratings.
- Content Distribution
Diversity in Content: The dataset includes 5,850 unique titles spanning 19 genres and originating from 109 different countries. This diversity reflects Netflix's extensive and varied content library, catering to a broad audience base worldwide.
- Trends Over Time
IMDb Scores by Release Year: Analysis of IMDb scores over the years shows significant fluctuations. There is a noticeable rise in average scores in the early years of Netflix's content offerings, peaking around the mid-2000s. However, there is a slight decline in more recent years, suggesting that newer content may not be resonating as well with audiences or that viewer expectations have changed.
- Genre Analysis
High-Performing Genres: Genres such as Documentaries and Stand-Up Comedy tend to have higher average IMDb scores. These genres often appeal to niche audiences that appreciate high-quality, informative, or humorous content.
Low-Performing Genres: On the other hand, genres like Reality TV and Kids' content tend to have lower average IMDb scores. This might be due to the varying production quality or different audience expectations for these types of content.
Genre Trends: Over the years, genres like Drama and Thriller have shown a consistent performance in terms of IMDb scores, while genres like Science Fiction have seen more variability.
- Country Analysis
High-Performing Countries: Content from the United States and the United Kingdom generally receives higher average IMDb scores. This could be attributed to well-established production industries and higher budgets for content creation.
Low-Performing Countries: Countries with lower average IMDb scores include some with emerging film industries or less international exposure. However, there's significant potential for growth and improvement in these regions.
Regional Insights: Countries such as South Korea and Japan have shown strong performance in specific genres like Animation and Thriller, reflecting their unique cultural contributions to global entertainment.
- Combined Analysis
Genres and Release Years: The combined analysis of genres over different release years reveals interesting trends. For example, the genre of Superhero content saw a significant rise in average scores during the early 2010s, likely due to the popularity of superhero franchises during that period. Conversely, genres like Horror have shown more stability but lower average scores over time.
Notable Years: The mid-2000s appear to be a peak period for average IMDb scores, possibly due to the initial surge in high-quality original content from Netflix. Recent years have shown a more mixed performance, highlighting the need for continuous innovation and quality improvement.
- Production Countries
Detailed Breakdown: The detailed breakdown of IMDb scores by individual countries highlights that content from countries like Canada and Australia also performs well, especially in genres like Drama and Comedy. This indicates strong regional film industries that can compete on the global stage.
Opportunities: Countries with emerging film markets, such as India and Brazil, show a diverse range of content with varying scores, suggesting opportunities for Netflix to invest in these regions to boost production quality and viewer engagement.
## Final Thoughts
The comprehensive analysis of Netflix's movie and TV show data offers valuable insights into how various factors such as genre, release year, and production country influence IMDb scores. Specific findings include:

Focusing on high-performing genres like Documentaries and Stand-Up Comedy while exploring ways to enhance the appeal of lower-rated genres like Reality TV and Kids' content.
Leveraging successful content from countries like the USA, UK, Canada, and Australia while investing in emerging markets like India and Brazil to improve content quality and diversity.
Recognizing temporal trends to understand the evolving preferences of viewers and making data-driven decisions on future content production and acquisition.
By leveraging these insights, Netflix can continue to refine its content offerings, ensuring a diverse and high-quality library that meets the evolving tastes and preferences of its global audience.

