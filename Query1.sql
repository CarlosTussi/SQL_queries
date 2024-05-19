--Which products have the highest sales revenue?

SELECT
	Inv.StockItemID,
	Inv.[Description],
	COUNT(Inv.StockItemID) as UnitsSold,
	SUM(Inv.UnitPrice) as TotalSales
FROM Sales.InvoiceLines as Inv
GROUP BY Inv.[Description], Inv.StockItemID
ORDER BY TotalSales DESC
