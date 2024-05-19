-- What were the total sales revenue for 2013, 2014 and 2015?

SELECT TOP 5 * FROM Sales.InvoiceLines

SELECT
	Years.Year as Year, 
	SUM(InvList.Quantity * InvList.UnitPrice) as Revenue
FROM  
		Sales.InvoiceLines as InvList,
		(
		SELECT
				Inv.InvoiceId,
				YEAR(Inv.InvoiceDate) as Year

		 FROM Sales.Invoices as Inv
		 WHERE YEAR(Inv.InvoiceDate) IN (2013,2014, 2015)
		) as Years
WHERE Years.InvoiceID = InvList.InvoiceID
GROUP BY Years.Year
ORDER BY Year