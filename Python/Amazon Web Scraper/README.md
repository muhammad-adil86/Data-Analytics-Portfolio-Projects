
# Amazon Web Scraper 📦🛒🌐🕸️

This is an introductory project on web scraping and how to automate the price monitoring of any product on Amazon or any other e-commerce website to take advantage of holiday sales.

## Libraries Used

The following libraries were imported in the project:

- **beautifulsoup4** to parse the HTML content
- **requests** to request web page
- **time** to set time delays for requests
- **datetime** for date and time-related operations
- **csv** for reading and writing to CSV files
- **pandas** for data manipulation
- **smtplib** for sending email notifications

## Web Scraping

The following steps were performed for web scraping:

    1. Connect to the website using the **requests** library
    2. Use **beautifulsoup** to parse the HTML content
    3. Extract the product title and price
    4. Clean up the data to remove leading and trailing whitespaces and any other unnecessary characters
    5. Create a timestamp to track when the data was collected

## Storing Scraped Data

The following steps were performed to store the scraped data:

    1. Create a CSV file with headers
    2. Write the scraped data to the CSV file
    3. Append new data to the CSV file with each subsequent run of the script


## Automating Web Scraping & Storing Data

The whole script can be combined into a single function, **check_price()**, which can then be scheduled to run at specific intervals using **time** library.

## Additional:
This project can also be used to notify via email once a threshold is met or price is changed or when the scraping has been done.

### Note
The above summary is a brief overview of the project, for more in-depth understanding refer to the Jupyter notebook.


