
# Movie Data Correlations 🎬📽️🍿

## Project Overview
In this project, we aim to determine the correlations between the attributes of each movie using Python. It provides an overview of how to use Python to load, clean, and visualize movie data sourced from [KAGGLE](https://www.kaggle.com/datasets/danielgrijalvas/movies), where the data was scraped from IMDb. It also provides examples of how to group and order the data, and create different types of plots to visualize the data. The data includes several attributes of movies such as:

- name: name of the movie
- rating: rating of the movie (R, PG, etc.)
- genre: main genre of the movie.
- year: year of release
- released: release date (YYYY-MM-DD) & release country
- score: IMDb user rating
- votes: number of user votes
- director: director of the movie
- writer: writer of the movie
- star: main actor/actress
- country: country of origin
- budget: the budget of the movie
- gross: revenue of the movie
- company: the production company
- runtime: duration of the movie

## Libraries Used
The project uses several libraries including: pandas, numpy, seaborn, matplotlib, and figure.

## Data Cleaning

In this section, we performed tasks including:
- Checks for any missing data and removes the missing data from columns such as **'budget'** and **'gross'** to avoid bias.
- Removes unnecessary zeros after the decimal
- Drops any duplicate rows to ensure the integrity of the data

## Data Visulaization

In the next section, data was sorted based on the gross revenue; and plots such as scatter plot, bar and line plot were created to explore different ascpects of movie data with respect to gross revenue, including:

- Gross revenue for top 15 production companies
- Gross revenue for top 15 movies
- Gross revenue vs budget

## Correlations

- Different methods were used to find the correlation between the columns, including Pearson, Kendall, and Spearman
- Correlation matrix was created to study the relationship between not only the numeric columns, but also between numerical and categorical variables by numerizing the categorical variables.

## Conclusion

The results show that gross earnings are strongly correlated with the budget, whereas large production companies have a weaker correlation with gross earnings. Votes and budgets, on the other hand, have the highest correlation to gross earnings.

## Factorization (Alternative Method)
The project also included factorization as an alternate method to determine the correlations between the attributes of each movie in the dataset, where the factorization was applied on the whole dataset. The results of factorization show a high correlation between gross earnings and budget, production company, writer, director as well as votes/star. However:
- It is noted that factorization is not suitable for numeric values and can lead to inaccurate results because the integer values assigned by factorization may not accurately reflect the magnitude or ordering of the original values.
- Additionally, using factorized values for numeric variables can mask any non-linear relationships between the variables.

### Note
The above summary is a brief overview of the project, for more in-depth understanding refer to the Jupyter notebook.
