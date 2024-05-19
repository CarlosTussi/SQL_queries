-- Customers that bought at least x% of different products type

CREATE PROCEDURE percentage_diff_products @percentage int
AS
SELECT
	Cu.CustomerID,
	Cu.CustomerName,
	COUNT(DISTINCT InvL.StockItemID) as TotalItemsType
FROM Sales.Invoices as Inv, Sales.InvoiceLines as InvL, Sales.Customers as Cu
WHERE Inv.InvoiceID = InvL.InvoiceID AND Cu.CustomerID = inv.CustomerID
GROUP BY Cu.CustomerID, Cu.CustomerName
HAVING  COUNT(DISTINCT InvL.StockItemID) >= (SELECT (COUNT(DISTINCT Wh.StockItemID)*@percentage)/100 FROM Warehouse.StockItems as Wh)
ORDER BY TotalItemsType DESC

--EXEC percentage_diff_products 85 --85%