# Preparing Property Sales Data

This project covers the SQL queries designed to clean and standardize data from a property sales dataset of Nashville and prepare it for further analysis. The key objective of this project is to improve data integrity and optimize data for analysis by dealing with the issues such as:

- Standardizing the date format
- Populating missing property addresses by identifying and updating null values using a self join
- Breaking out address data into individual columns (Address, City, State)
- Converting Yes/No values to Yes/No respectively

The project uses various SQL commands such as SELECT, UPDATE, ALTER TABLE, and CASE statements, as well as functions like CONVERT, SUBSTRING, CHARINDEX, LEN, ISNULL, PARSENAME, and REPLACE. It also uses self joins to join a table to itself, to update missing values from one row to another with the same ID (PK).
