
# Automating Crypto Database using API Pull ₿💰📈

This project uses CoinMarketCap API to pull the crypto coin data and automate the data collection in order to study their trend over time. The data collected can be used for various purposes like:

- Studying the crypto market trends over time
- Building a machine learning model to predict crypto prices
- Keeping track of the top crypto coins by market capitalization
- Anomaly detection to identify the crypto coins that may be experiencing abnormal price movements

## Libraries Used

The following libraries are imported in the project:

- **requests** to make a GET request to the CoinMarketCap API
- **json** tto work with JSON data
- **pandas** to create and manipulate dataframes
- **datetime** to create a timestamp of when data is collected
- **os** o check if file already exist or not before writing new data to it

## Pull Data

The data was first pulled from CoinMarketCap API using the **requests** library and specifying parameters such as start and limit to determine the number of coins to pull and the conversion currency (i.e. USD) for easy interpretation.

## Data Transformation

The data collected was transformed using the **pandas** library to convert it into a readable dataframe format. The dataframe was also enriched by adding a timestamp of when the data was collected.

## Automate Data Pull & Storing

The data collection was automated by creating a function that collects data from the API, normalizes it and stores it into a dataframe. This data was then stored in a CSV file by specifying the file path and making use of the **pandas** library's **to_csv** function, which can be useful for tracking and analysis purposes.

## Data Standardization & Cleaning
Once the data is pulled, it was standardized and cleaned so that it is ready for analysis. Some of the steps performed were:

- Remove the exponential notations to be able to see the numbers clearly
- Coin trends are analyzed over time by grouping the data by the coin name and calculating the mean values of the different percent change
- Stacked data to make it easy to visualize

## Data Visualization

A catplot was used to visualize the crypto coin trend over different time frame, while a lineplot was used to show the trend of a specific crypto coin (in this case Bitcoin ₿) over time.

### Note
The above summary is a brief overview of the project, for more in-depth understanding refer to the Jupyter notebook.


