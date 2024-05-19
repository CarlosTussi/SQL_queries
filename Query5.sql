--Return all the orders that has not been invoiced

--Option1: Left Join
SELECT

	Ord.OrderID,
	Ord.CustomerID

FROM Sales.Orders as Ord
LEFT JOIN Sales.Invoices as Inv ON Ord.OrderID = Inv.OrderID
WHERE Inv.OrderID IS NULL



--Option 2: Subquery
SELECT

	Ord.OrderID

FROM Sales.Orders as Ord
WHERE Ord.OrderID NOT IN (SELECT Inv.OrderID FROM Sales.Invoices as Inv)
--WHERE Ord.OrderID != ALL (SELECT Inv.OrderID FROM Sales.Invoices as Inv)  --Also possible�



--Option 3: EXISTS
SELECT 
	Ord.OrderID

FROM Sales.Orders as Ord
WHERE NOT EXISTS (SELECT Inv.OrderID FROM Sales.Invoices AS Inv WHERE Inv.OrderID = Ord.OrderID)