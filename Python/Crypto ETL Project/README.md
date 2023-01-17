# ETL Pipeline for Real-time Crypto Market Data Analysis ₿💸💱🖇️

This project is an ETL (Extract, Transform, Load) pipeline that extracts data on crypto coin market from CoinMarketCap API, transforms the data by cleaning and normalizing it, and loads it into a CSV database. The data can then be used to create a bar chart or line graph visualization to show the consumption trends over time.

## Introduction
The project is focused on analyzing and visualizing the crypto coin market data. The data is collected from the CoinMarketCap API, which provides real-time data on different crypto coins, including their prices, market capitalization, trading volume, etc. The pipeline starts by extracting the data from the API, then it transforms the data by cleaning and normalizing it, and finally loads it into a CSV file. The data in the CSV file can be used to perform further analysis or create visualizations.

## Libraries Used
The following libraries are imported in the project:

- **requests** to make a GET request to the CoinMarketCap API
- **json** tto work with JSON data
- **pandas** to create and manipulate dataframes
- **datetime** to create a timestamp of when data is collected
- **os** check if file already exist or not before writing new data to it

## Step-by-Step ETL Pipeline

    1. Extract: The pipeline starts by extracting data from the CoinMarketCap API using the **requests** library. The data is returned in a JSON format, which is then passed to the next stage of the pipeline.
    2. Transform: In this stage, the data is transformed by cleaning and normalizing it using the **pandas** library. The data is grouped by crypto coin name and then the mean value of percent change for different time periods is calculated. The data is then rearranged into a tabular ormat and the column names are modified for better readability.
    3. Load: In this stage, the transformed data is loaded into a CSV file using the **pandas** library. The pipeline also checks if the file already exists and if it does, it will append new data to the existing file.
    4. API Runner: The API runner is a separate function that repeatedly runs the ETL pipeline at regular intervals. This allows for the collection of new data at regular intervals and the data can be used to track the market trends over time.

## Running the Pipeline
To run the pipeline, simply execute the **run_etl()** function. The pipeline will extract data from the CoinMarketCap API, transform it by cleaning and normalizing, and load it into a CSV file. The pipeline will also run repeatedly to collect new data at regular intervals and the collected data is saved in a CSV file which can be used to perform further data analysis or visulaization.

## Conclusion
This project provides an ETL pipeline for extracting, transforming and loading crypto coin market data from CoinMarketCap API. The data can be used to perform further analysis or create visualizations to track the market trends over time (see [Crypto API Data Pull](https://github.com/muhammad-adil86/Data-Analytics-Portfolio-Projects/tree/main/Python/Crypto%20API%20Data%20Pull). The pipeline can be customized to extract data for different crypto coins or different time periods as per the requirement.
