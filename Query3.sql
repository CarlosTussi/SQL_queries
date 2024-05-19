--Return the billing information for every customer.

SELECT 
	Cu.CustomerID,
	Cu.CustomerName,
	Cb.CustomerName as BillingName,
	Cb.PostalAddressLine1,
	Cb.PostalAddressLine2,
	Cb.PostalPostalCode,
	Ci.CityName

FROM Sales.Customers as Cu, Sales.Customers as Cb, [Application].Cities as Ci

WHERE Cu.BillToCustomerID = Cb.CustomerID AND Ci.CityID = Cb.PostalCityID

ORDER BY Cu.CustomerID