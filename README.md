# AdventureWorks End-to-End Sales Analytics

## Overview

This project delivers a complete Business Intelligence solution using SQL Server and Power BI to analyze sales performance, customer behavior, product profitability, and business growth trends.

The solution follows an end-to-end analytics workflow starting from data preparation and modeling through advanced SQL analysis, DAX calculations, and interactive dashboard development.

---

## Objectives

The project aims to answer key business questions:

* Which products generate the highest revenue?
* Which products generate losses despite high sales?
* Who are the most valuable customers?
* Which product categories contribute the most to overall sales?
* How do sales perform across different periods?
* What are the key growth trends over time?
* Which regions and customer segments drive business performance?

---

## Technology Stack

* SQL Server
* Power BI
* DAX
* Power Query
* Excel
* Data Modeling

---

## Data Modeling

A Star Schema model was implemented to improve reporting performance and analytical flexibility.

### Fact Table

* FactSales

### Dimension Tables

* DimProducts
* DimCustomers
* DimDate

The model supports advanced filtering, drill-through functionality, and time intelligence calculations.

---

## SQL Analysis

Advanced SQL analysis was performed using SQL Server.

### SQL Concepts Applied

* Data Cleaning
* Views
* Aggregate Functions
* GROUP BY
* ORDER BY
* Common Table Expressions (CTE)
* Subqueries
* Window Functions
* RANK()
* LAG()
* HAVING Clause

### Business Analysis Performed

* Overall Sales Performance
* Category Profitability Analysis
* Product Performance Analysis
* Customer Revenue Analysis
* Regional Sales Analysis
* Top Products Ranking
* Above-Average Product Identification
* Year-over-Year Sales Comparison

---

## Power BI Dashboards

### Product Analysis

Key metrics:

* Total Sales
* Total Quantity
* Total Orders
* Average Order Value (AOV)

Visuals:

* Sales by Product Line
* Sales by Subcategory
* Top Products by Sales
* Product Drill-Through Analysis

---

### Customer Analysis

Customer-focused insights:

* Customers by Country
* Customers by Marital Status
* Top Customers by Sales
* Customer Growth Trends

---

### Trend Analysis

Time Intelligence Dashboard:

* Annual Sales Trend
* Orders vs Sales Trend
* Quarterly Sales Analysis
* Monthly Quantity Trend
* Year-over-Year Growth Analysis

---

## DAX Measures

The project includes custom DAX calculations such as:

* Total Sales
* Total Orders
* Total Quantity
* AOV Sales
* Previous Year Sales
* Previous Month Sales
* YoY Growth %
* MoM Growth %
* Orders YoY Growth %

---

## Key Insights

* Q4 generated the highest sales performance.
* Sales growth accelerated significantly in 2013.
* The United States contributed the largest customer base.
* Product profitability varies significantly across categories.
* Several products generated negative profit despite strong sales revenue.
* Sales and order volume demonstrated a strong positive relationship.
* A small group of customers generated a large share of total revenue.

---

## Repository Contents

* Power BI Dashboard (.pbix)
* SQL Analysis Queries
* Data Model Screenshot
* Product Analysis Dashboard
* Customer Analysis Dashboard
* Trend Analysis Dashboard
* Drill-Through Report

---

## Author

Mohamed Afify

Data Analyst | Power BI Developer | SQL Analyst
