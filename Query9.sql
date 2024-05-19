--Biggest revenues by US state.

SELECT
	CustState.StateProvinceName,
	SUM(TotalCust.TotalPerCust) as TotalState
FROM (
	--Total spent per customer id
	SELECT 
		Cu.CustomerID,
		SUM(InvL.Quantity*InvL.UnitPrice) as TotalPerCust

	FROM Sales.Customers as Cu, Sales.Invoices as Inv, Sales.InvoiceLines as InvL
	WHERE Inv.CustomerID = Cu.CustomerID AND Inv.InvoiceID = InvL.InvoiceID
	GROUP BY Cu.CustomerID
	) AS TotalCust,
	(
	--Table with customers and its respective state
	SELECT 
		Cu.CustomerID,
		St.StateProvinceName

	FROM Sales.Customers as Cu, [Application].Cities as Ci, [Application].StateProvinces as St
	WHERE Cu.PostalCityID = Ci.CityID AND Ci.StateProvinceID = St.StateProvinceID
	) AS CustState
WHERE TotalCust.CustomerID = CustState.CustomerID
GROUP BY CustState.StateProvinceName
ORDER BY TotalState DESC