SELECT 
	Name, Description, Location
	, Owner, Stock
	, `Mfg Number`, MasterPartNo
	, `Index`, `Last Used`, Tag, OrigPrice, `Repair Depot`, `Bar Code`, `File Name Data Sheet`
	, `P/N History`, PartNo, `Min`, `Max`, Notes, LastQuoteDate, ownerID, DateTimeStamp, Editor
	, Picture1, Picture2, Picture3, FactoryPic, FactoryPicLg
	, MfgName, MfgPartNo, VendorName, VendorPartNo
	, NewPrice, UsedPrice, RepairedPrice, DistributorPrice
	, CoreValue, TaxValue, NewStock, RepairedStock
	, UsedStock, HighValue, WCoreNew, WCoreUsed, WCoreRepaired, WCoreDistributor, AdjDiscount, PricingDate
	, WeightLbs, WeightOzs, TotalTaxValue, ReplaceValue, RestockDate, TotalReplaceValue, ReorderDate, Size
	, PriceEditor, GuestPic, GuestPicLg, GuestViews, AdPrice, DisplayWebPicture
FROM partslist
