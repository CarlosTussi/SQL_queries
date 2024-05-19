-- Give the list of items that are priced greater or equal than a USB item

use WideWorldImporters




--Possible solution 1
SELECT
	St1.StockItemID,
	St1.StockItemName,
	St1.UnitPrice

FROM 
	Warehouse.StockItems as St1
WHERE 
	St1.UnitPrice >= ANY (SELECT
								St.UnitPrice
						  FROM 
								Warehouse.StockItems as St
						  WHERE 
								LOWER(St.StockItemName) LIKE LOWER('USB%')
						 )
AND LOWER(St1.StockItemName) NOT LIKE LOWER('USB%')



--Possible solution 2
SELECT DISTINCT
	 St1.StockItemID,
	 St1.StockItemName,
	 St1.UnitPrice

FROM 
	  Warehouse.StockItems as St1, 
	  Warehouse.StockItems as St2

WHERE 
	  St1.UnitPrice >= St2.UnitPrice AND 
	  LOWER(St2.StockItemName) LIKE LOWER('%USB%') AND		
	  LOWER(St1.StockItemName) NOT LIKE LOWER('%USB%')
	  