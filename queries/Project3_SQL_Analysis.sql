-- ============================================================
--   PROJECT 3: SQL DATA ANALYSIS
--   DecodeLabs Industrial Training Kit | Batch 2026
--   Dataset: E-Commerce Orders (1200 Records)
--   Table Name: orders
-- ============================================================


-- ============================================================
-- Q1: SELECT - View All Orders
-- Concept: Basic SELECT to retrieve all data from the table
-- ============================================================

SELECT *
FROM orders
LIMIT 50;


-- ============================================================
-- Q2: WHERE (Text Filter) - Delivered Orders Only
-- Concept: WHERE clause to filter rows by a specific category
-- ============================================================

SELECT OrderID,
       CustomerID,
       Product,
       TotalPrice,
       OrderStatus
FROM orders
WHERE OrderStatus = 'Delivered'
ORDER BY TotalPrice DESC;


-- ============================================================
-- Q3: WHERE (Numeric Filter) - High Value Orders Above 2000
-- Concept: WHERE clause with a numeric threshold
-- ============================================================

SELECT OrderID,
       CustomerID,
       Product,
       Quantity,
       TotalPrice
FROM orders
WHERE TotalPrice > 2000
ORDER BY TotalPrice DESC;


-- ============================================================
-- Q4: GROUP BY + Aggregations - Sales Summary by Product
-- Concept: GROUP BY with COUNT, SUM, AVG to get insights per product
-- ============================================================

SELECT Product,
       COUNT(*)                    AS Total_Orders,
       SUM(Quantity)               AS Total_Quantity,
       ROUND(SUM(TotalPrice), 2)   AS Total_Revenue,
       ROUND(AVG(TotalPrice), 2)   AS Avg_Order_Value
FROM orders
GROUP BY Product
ORDER BY Total_Revenue DESC;


-- ============================================================
-- Q5: GROUP BY - Orders & Revenue by Payment Method
-- Concept: GROUP BY to compare performance across payment types
-- ============================================================

SELECT PaymentMethod,
       COUNT(*)                    AS Total_Orders,
       ROUND(SUM(TotalPrice), 2)   AS Total_Revenue,
       ROUND(AVG(TotalPrice), 2)   AS Avg_Order_Value
FROM orders
GROUP BY PaymentMethod
ORDER BY Total_Orders DESC;


-- ============================================================
-- Q6: GROUP BY - Order Status Distribution
-- Concept: GROUP BY to see how orders are split across statuses
-- ============================================================

SELECT OrderStatus,
       COUNT(*)                    AS Total_Orders,
       ROUND(SUM(TotalPrice), 2)   AS Total_Revenue
FROM orders
GROUP BY OrderStatus
ORDER BY Total_Orders DESC;


-- ============================================================
-- Q7: GROUP BY - Marketing Channel Analysis (Referral Source)
-- Concept: GROUP BY to evaluate which channel drives most revenue
-- ============================================================

SELECT ReferralSource,
       COUNT(*)                    AS Total_Orders,
       ROUND(SUM(TotalPrice), 2)   AS Total_Revenue,
       ROUND(AVG(TotalPrice), 2)   AS Avg_Order_Value
FROM orders
GROUP BY ReferralSource
ORDER BY Total_Revenue DESC;


-- ============================================================
-- Q8: GROUP BY - Coupon Usage Analysis
-- Concept: GROUP BY on CouponCode to measure coupon impact
-- ============================================================

SELECT CouponCode,
       COUNT(*)                    AS Times_Used,
       ROUND(SUM(TotalPrice), 2)   AS Total_Revenue,
       ROUND(AVG(TotalPrice), 2)   AS Avg_Order_Value
FROM orders
GROUP BY CouponCode
ORDER BY Times_Used DESC;


-- ============================================================
-- Q9: HAVING - Products with Average Order Value Above 1000
-- Concept: HAVING filters groups AFTER aggregation (not rows like WHERE)
-- ============================================================

SELECT Product,
       COUNT(*)                    AS Total_Orders,
       ROUND(AVG(TotalPrice), 2)   AS Avg_Order_Value
FROM orders
GROUP BY Product
HAVING AVG(TotalPrice) > 1000
ORDER BY Avg_Order_Value DESC;


-- ============================================================
-- Q10: WHERE + GROUP BY - Delivered Revenue by Product
-- Concept: Combine WHERE (filter rows first) then GROUP BY (aggregate)
-- ============================================================

SELECT Product,
       COUNT(*)                    AS Delivered_Count,
       ROUND(SUM(TotalPrice), 2)   AS Revenue_From_Delivered
FROM orders
WHERE OrderStatus = 'Delivered'
GROUP BY Product
ORDER BY Revenue_From_Delivered DESC;


-- ============================================================
-- END OF PROJECT 3 QUERIES
-- ============================================================
