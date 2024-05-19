--Which suppliers provide the most products?

SELECT 
	Su.SupplierID,
	Su.SupplierName,
	SUM(PoL.ReceivedOuters) as TotalPurchase


FROM Purchasing.PurchaseOrders as Po, Purchasing.PurchaseOrderLines as PoL, Purchasing.Suppliers as Su
WHERE Po.PurchaseOrderID = PoL.PurchaseOrderID AND Su.SupplierID = Po.SupplierID
GROUP BY Su.SupplierID, Su.SupplierName
ORDER BY TotalPurchase DESC