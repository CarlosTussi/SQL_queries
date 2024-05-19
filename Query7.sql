--Who are the top 5 customers in terms of revenue?


SELECT TOP 5
	Cu.CustomerName,
	Inv.CustomerID,
	COUNT(*) as TotalElemsInInvoice,
	SUM(InvL.Quantity*InvL.UnitPrice) as TotalSpendInvoice

FROM Sales.Invoices as Inv, Sales.InvoiceLines as InvL, Sales.Customers as Cu
WHERE Inv.InvoiceID = InvL.InvoiceID AND Inv.CustomerID = Cu.CustomerID
GROUP BY Inv.CustomerID, Cu.CustomerName
ORDER BY TotalSpendInvoice DESC