-- Which products are running low on stock?

SELECT
	Stk.StockItemName,
	Sth.QuantityOnHand

FROM Warehouse.StockItems as Stk, Warehouse.StockItemHoldings as StH
WHERE Stk.StockItemID = StH.StockItemID
ORDER BY StH.QuantityOnHand