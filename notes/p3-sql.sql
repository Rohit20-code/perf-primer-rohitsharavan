/* =====================================================================
   P3.1 – SQL essentials
   Practice on temporary tables only. Anything starting with # lives in
   tempdb and disappears when this query window closes, so nothing real
   is touched.
   Run in SSMS against the training SQL Server (Trust server certificate ticked).
   ===================================================================== */

-- ---------- Setup ----------
CREATE TABLE #Customers (CustomerId INT PRIMARY KEY, Name NVARCHAR(50), City NVARCHAR(50));
CREATE TABLE #Orders (OrderId INT PRIMARY KEY, CustomerId INT, Amount DECIMAL(10,2), OrderDate DATE);

INSERT INTO #Customers VALUES (1,'Asha','Chennai'),(2,'Ben','Pune'),(3,'Chen','Chennai'),(4,'Divya','Bengaluru');
INSERT INTO #Orders VALUES (101,1,1200,'2026-10-01'),(102,1,450,'2026-10-03'),(103,2,980,'2026-10-03'),
  (104,3,300,'2026-10-04'),(105,3,2200,'2026-10-06'),(106,3,150,'2026-10-07');


-- ---------- 1. Orders above 500, largest first ----------
-- WHERE filters the rows, ORDER BY ... DESC puts the biggest on top.
SELECT OrderId, CustomerId, Amount, OrderDate
FROM #Orders
WHERE Amount > 500
ORDER BY Amount DESC;
/* Result (3 rows):
   OrderId | CustomerId | Amount  | OrderDate
   105     | 3          | 2200.00 | 2026-10-06
   101     | 1          | 1200.00 | 2026-10-01
   103     | 2          |  980.00 | 2026-10-03
*/


-- ---------- 2. Number of orders per customer ----------
-- GROUP BY squashes rows with the same CustomerId into one; COUNT(*) counts them.
SELECT CustomerId, COUNT(*) AS OrderCount
FROM #Orders
GROUP BY CustomerId
ORDER BY CustomerId;
/* Result (3 rows):
   CustomerId | OrderCount
   1          | 2
   2          | 1
   3          | 3
   Customer 4 (Divya) doesn't appear at all: she has no rows in #Orders to count.
*/


-- ---------- 3. Total amount per city ----------
-- City lives in #Customers and Amount lives in #Orders, so JOIN them first, then group.
SELECT c.City, SUM(o.Amount) AS TotalAmount
FROM #Customers c
JOIN #Orders o ON o.CustomerId = c.CustomerId
GROUP BY c.City
ORDER BY TotalAmount DESC;
/* Result (2 rows):
   City    | TotalAmount
   Chennai | 4300.00     -- Asha 1200+450 = 1650, Chen 300+2200+150 = 2650
   Pune    |  980.00
   Bengaluru is missing: an inner JOIN drops customers with no matching orders.
*/


-- ---------- 4. Customers with no orders ----------
-- LEFT JOIN keeps every customer; where there's no matching order the o.* columns
-- come back as NULL, so filtering on NULL leaves exactly the ones with nothing.
SELECT c.CustomerId, c.Name, c.City
FROM #Customers c
LEFT JOIN #Orders o ON o.CustomerId = c.CustomerId
WHERE o.OrderId IS NULL;
/* Result (1 row):
   CustomerId | Name  | City
   4          | Divya | Bengaluru
*/


-- ---------- 5. Top 3 orders ----------
-- TOP 3 only means something together with ORDER BY. Without it you get "any 3 rows".
SELECT TOP 3 OrderId, CustomerId, Amount
FROM #Orders
ORDER BY Amount DESC;
/* Result (3 rows):
   OrderId | CustomerId | Amount
   105     | 3          | 2200.00
   101     | 1          | 1200.00
   103     | 2          |  980.00
   (Same three as query 1 here, but only by coincidence: query 1 is "all over 500",
    this one is "the biggest three", whatever their size.)
*/


-- ---------- Clean up (optional: they vanish when the window closes anyway) ----------
DROP TABLE #Orders;
DROP TABLE #Customers;


/* =====================================================================
   Self-check:
   "After a load test that adds items to baskets, how would you prove in SQL
    how many baskets it created?"

   Count the rows the test created, and only those. Something like:

     SELECT COUNT(*) AS BasketsCreated
     FROM Baskets
     WHERE CreatedAt >= '2026-11-28 10:00' AND CreatedAt < '2026-11-28 10:30';  -- the test window

   or, better, filter on the test users (e.g. BuyerId LIKE 'loadtest_%') so real or
   earlier data isn't counted. Counting before and after the run and taking the
   difference also works. Then compare that number with what JMeter says it sent
   successfully. If JMeter reports 5,000 passed "create basket" requests but the
   database only has 4,800 new baskets, something was lost even though the
   requests "passed".
   ===================================================================== */
