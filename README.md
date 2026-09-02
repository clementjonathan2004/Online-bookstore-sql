# Online Bookstore SQL Project

## 1. Project Title

*Online Bookstore Database Using MySQL*

## 2. Project Overview

This project presents the design and implementation of an Online Bookstore database using MySQL. The database manages books, customers, orders, payments, and order activity logs.

The project demonstrates core SQL concepts including database creation, table relationships, data insertion, queries, joins, aggregation, triggers, stored procedures, and user privileges.

## 3. Problem Statement

An online bookstore needs a structured database system to manage information about books, customers, orders, payments, and order activities.

Without a properly designed relational database, it can be difficult to organize customer information, track orders and payments, calculate sales and revenue, and monitor changes made to order records.

This project addresses these challenges by developing a relational bookstore database using MySQL.

## 4. Data Source

The project uses sample bookstore data created and inserted into the MySQL database.

The database contains five main tables:

- *Books* – Stores book titles, authors, and prices.
- *Customers* – Stores customer information.
- *Orders* – Records customer book orders.
- *Payments* – Stores payment information for orders.
- *Order Log* – Records INSERT, UPDATE, and DELETE activities on orders.

## 5. Methodology

The project was implemented using *MySQL / SQL* through the following steps:

1. Created the bookstore database.
2. Created relational tables using appropriate data types and constraints.
3. Established relationships using primary and foreign keys.
4. Inserted sample data into the database.
5. Used SQL queries to retrieve and analyze information.
6. Used JOIN operations to combine information from related tables.
7. Used aggregation functions such as SUM() to calculate books sold and revenue.
8. Used sorting and filtering to identify important records.
9. Created triggers to automatically record INSERT, UPDATE, and DELETE activities.
10. Created a stored procedure named GetCustomerOrders to retrieve a customer's orders.
11. Demonstrated database user privileges for controlled access.

## Dashboard / SQL Analysis

This project does not use a Power BI dashboard. Instead, SQL queries were used to analyze the bookstore database and generate useful results.

Examples of SQL analysis performed include:

- Retrieving all customers.
- Listing books and authors.
- Calculating total books sold.
- Identifying customers who placed orders.
- Calculating total revenue.
- Finding the highest payment.
- Identifying the most expensive book.

## 6. Key Insights

The SQL analysis produced the following results:

- *9 books* were sold from the initial five orders.
- The five initial payments generated a total revenue of *111.91*.
- *Customer 4* recorded the highest payment of *31.98*.
- *Book 4* was the most expensive book at *15.99*.
- The database successfully recorded order activities using triggers.
- The GetCustomerOrders stored procedure can be used to retrieve orders belonging to a specific customer.
- Primary and foreign keys were used to maintain relationships and referential integrity between the tables.

## 7. Conclusion / Recommendations

### Conclusion

The Online Bookstore SQL project successfully demonstrates how MySQL can be used to design and manage a relational database for an online bookstore.

The database provides a structured way to manage books, customers, orders, payments, and order activities. SQL queries, joins, aggregation, triggers, stored procedures, and user privileges were used to demonstrate practical database management and analysis.

### Recommendations

- The bookstore should regularly monitor sales and payment information to understand revenue performance.
- Customer order information should be analyzed to identify purchasing patterns.
- Order activity logs should be monitored to maintain accountability and track changes.
- Database user privileges should be properly managed to prevent unauthorized access.
- The database can be expanded with additional features such as inventory management, book categories, customer reviews, and more detailed sales reporting.

## Project Files

- *SQL* – Contains the MySQL database script.
- *Report* – Contains the complete project report.

## Tools Used

- MySQL
- SQL
- MySQL Workbench

## Author

*Clement Jonathan*
