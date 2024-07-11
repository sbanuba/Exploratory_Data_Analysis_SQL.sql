# Exploratory Data Analysis SQL
----
## Business Request:
- Finding the top-performing products and the states where the sales are coming from. In this case, you’ll need to pull out each product name, order, and state and LIMIT to 10 as specified.
- As a multi-channel business, management would like to know which sales channel brings in the most sales. To answer this, pull the sale channels and count the number of orders per channel.
- The marketing team would like to know all customers with total orders of less than 300 units in the year 2020.
- Customer acquisition and retention are vital for business growth. To understand the buying behavior of customers over time, cohort analysis is imperative. Based on that, the marketing department can measure the success of a marketing campaign, as well as implement a strong retention strategy.
- Print a table showing each day of the week and the respective order quantities.
- Calculate the total order quantities for each month
- Finally, management would like to know the annual trend of sales to assess the growth over the entire period.

## Code:
Click on the link below to review the documented codes. 
  SQL Queries: https://github.com/sbanuba/Exploratory_Data_Analysis_SQL.sql/blob/main/SQL_Code.sql
  
---
## Data Analysis Project Cycle 

### 1. Introduction:
SQL is indispensable for extracting critical information and performing data analysis for both for-profit and non-profit organizations. This project vividly illustrates my adeptness in utilizing SQL within MySQL Workbench to craft schemas, formulate queries, and merge tables for in-depth analysis of sales performance, consumer behavior, and market trends.

### 2. Schema (Tables):
There are six (6) tables used in the databases, namely:
- Customers
- Products
- Sales
- Stores
- Teams
- Regions

Except for the regions table, all are connected to the sales (child) table through foreign keys. A database called ‘product_sale’ is created to host the tables.


### 3 Data Sources
The data is sourced from data.world. The specific tables are from this link https://data.world/dataman-udit/us-regional-sales-data

### 4. Tool: 
- MySQL Workbench

### 4 The Entity Relation Diagram (ERD)

Showing an ERD to end-users is helpful for them to visualize how tables are related to one another. It also reflects the cardinality between the parent tables and child tables by connecting foreign keys and primary keys respectively.

![ER Diagram](https://miro.medium.com/v2/resize:fit:4800/format:webp/1*vzHgfRZgidN1_lQLlCFZmg.jpeg)



### References:

- https://www.w3schools.com
- https://www.mysqltutorial.org
- https://suaye.com/browse/childcategory?id=8&category=mysql


### Connect with me on:
- LinkedIn: linkedin.com/in/solomon-banuba-b5486016a
- Medium: https://medium.com/@solomonbanuba

