# Tracking Global Warming: A Study of Greenhouse Gas Indices 🏭🌍🌡️

This Tableau project utilizes the annual greenhouse gas index (AGGI) database from the [National Oceanic and Atmospheric Administration (NOAA)](https://gml.noaa.gov/aggi/aggi.html) to identify the greenhouse gases (GHGs) responsible for global warming and track their trends over time. The dashboard focuses on the period between 1979 and 2021, providing a 23-year perspective on the changes in GHG emissions.

This project is an ETL (Extract, Transform, Load) pipeline that extracts data on crypto coin market from CoinMarketCap API, transforms the data by cleaning and normalizing it, and loads it into a CSV database. The data can then be used to create a bar chart or line graph visualization to show the consumption trends over time.

## Introduction
The project is focused on analyzing and visualizing the crypto coin market data. The data is collected from the CoinMarketCap API, which provides real-time data on different crypto coins, including their prices, market capitalization, trading volume, etc. The pipeline starts by extracting the data from the API, then it transforms the data by cleaning and normalizing it, and finally loads it into a CSV file. The data in the CSV file can be used to perform further analysis or create visualizations.

## Data Source
The AGGI data used in this project was obtained from [NOAA](https://gml.noaa.gov/aggi/aggi.html) by [Makeover Monday](https://data.world/makeovermonday/2023w1). The data includes information on several different GHGs, including carbon dioxide, methane, and nitrous oxide, as well as their respective concentrations and trends over time.

## Data Analysis and Visualization
The dashboard includes several different visualizations to help understand the data. The first is an area chart that compares the concentrations of different GHGs over time. To compare the GHGs emission to any previous year we have used Level of Detail (LOD) to run complex queries.

The second is a bar chart that shows how the AGGI has changed over the past 23 years. Both these charts uses the data from year 1979-2021. Additionally, the dashboard includes a parameter that allows users to focus on specific year.

## Conclusion
The data in this dashboard illustrates the significant increase in GHG concentrations over the past 23 years, with carbon dioxide and methane being the primary contributors to global warming. By understanding the trends in GHG emissions, policymakers and individuals can take action to reduce emissions and slow the effects of global warming.
