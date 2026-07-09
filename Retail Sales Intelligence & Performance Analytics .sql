CREATE DATABASE AdventureWorksAnalytics;
GO

USE AdventureWorksAnalytics;
GO

CREATE VIEW CleanSales AS
SELECT
    [Row ID],
    [Order ID],
    DATEADD(DAY, [Order Date] - 2, '1900-01-01') AS Order_Date,
    DATEADD(DAY, [Ship Date] - 2, '1900-01-01') AS Ship_Date,
    [Ship Mode],
    [Customer ID],
    [Customer Name],
    Segment,
    Country,
    City,
    State,
    Region,
    [Product ID],
    Category,
    [Sub-Category],
    [Product Name],
    Sales,
    Quantity,
    Discount,
    Profit
FROM dbo.[Dataset$];


SELECT TOP 10 *
FROM CleanSales;

SELECT
    ROUND(SUM(Sales), 2) AS Total_Sales,
    COUNT(DISTINCT [Order ID]) AS Total_Orders,
    SUM(Quantity) AS Total_Quantity,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM CleanSales;



SELECT
    YEAR(Order_Date) AS Order_Year,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM CleanSales
GROUP BY YEAR(Order_Date)
ORDER BY Order_Year;



SELECT
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM CleanSales
GROUP BY Category
ORDER BY Total_Sales DESC;



SELECT TOP 10
    [Product Name],
    Category,
    [Sub-Category],
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM CleanSales
GROUP BY
    [Product Name],
    Category,
    [Sub-Category]
ORDER BY Total_Sales DESC;


SELECT TOP 10
    [Product Name],
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM CleanSales
GROUP BY [Product Name]
ORDER BY Total_Profit;



SELECT TOP 10
    [Customer Name],
    Segment,
    Country,
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(DISTINCT [Order ID]) AS Total_Orders
FROM CleanSales
GROUP BY
    [Customer Name],
    Segment,
    Country,
    Region
ORDER BY Total_Sales DESC;


SELECT
    [Sub-Category],
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM CleanSales
GROUP BY [Sub-Category]
ORDER BY Total_Profit;




WITH RegionSales AS
(
    SELECT
        Region,
        ROUND(SUM(Sales), 2) AS Total_Sales,
        ROUND(SUM(Profit), 2) AS Total_Profit
    FROM CleanSales
    GROUP BY Region
)

SELECT *
FROM RegionSales
ORDER BY Total_Sales DESC;


SELECT
    [Product Name],
    ROUND(SUM(Sales), 2) AS Product_Sales
FROM CleanSales
GROUP BY [Product Name]
HAVING SUM(Sales) >
(
    SELECT AVG(Product_Total_Sales)
    FROM
    (
        SELECT
            [Product Name],
            SUM(Sales) AS Product_Total_Sales
        FROM CleanSales
        GROUP BY [Product Name]
    ) AS x
)
ORDER BY Product_Sales DESC;


SELECT
    [Product Name],
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    RANK() OVER
    (
        ORDER BY SUM(Sales) DESC
    ) AS Sales_Rank
FROM CleanSales
GROUP BY
    [Product Name],
    Category
ORDER BY Sales_Rank;



WITH YearlySales AS
(
    SELECT
        YEAR(Order_Date) AS Order_Year,
        SUM(Sales) AS Total_Sales
    FROM CleanSales
    GROUP BY YEAR(Order_Date)
)
SELECT
    Order_Year,
    ROUND(Total_Sales, 2) AS Total_Sales,
    ROUND(
        LAG(Total_Sales) OVER (ORDER BY Order_Year),
        2
    ) AS Previous_Year_Sales,
    ROUND(
        Total_Sales - LAG(Total_Sales) OVER (ORDER BY Order_Year),
        2
    ) AS Sales_Difference
FROM YearlySales
ORDER BY Order_Year;



SELECT
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(
        SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER(),
        2
    ) AS Sales_Percentage
FROM CleanSales
GROUP BY Category
ORDER BY Total_Sales DESC;