/***********************************************************************************************
Returns SNL Real Estate Property Reported Summary Data

Packages Required:
BECRS CMA Americas Daily
SNL Corporate Data
SNL Data Item Master
SNL Property Aggregate Data

Universal Identifiers:
instituitionID

Primary Columns Used:
dataItemId
flowPeriodId
institutionId
stockPeriodId

Database_Type:
PSOTGRESQL

Query_Version:
V1

Query_Added_Date:
21/10/2020

DatasetKey:
40

The following sample query returns the Occupancy Rate percentage for the last five fiscal years using the SNL Real Estate package in Xpressfeed

***********************************************************************************************/

 

SELECT  c.institutionID

 

, c.institutionName
, pfas.periodEndDate
, pfafd.dataItemID
, di.dataItemName
, pfafd.dataItemValue

 

FROM snlPropFinlAggStock pfas 

 

JOIN snlPropFinlAggFlow pfaf  ON pfas.stockPeriodID=pfaf.stockPeriodID AND pfaf.periodTypeID=1 --Annual, periodTypeID (2) for Quarterly
JOIN snlPropFinlAggFlowData pfafd  ON pfaf.flowPeriodID=pfafd.flowPeriodID
JOIN snlDataItem di  ON pfafd.dataItemID=di.dataItemID
LEFT JOIN ciqCompanyCrossRef cc  ON CAST(pfas.institutionID as varchar(500)) = CAST(cc.identifierValue as varchar(500))
JOIN snlCorp c  ON pfas.institutionID=c.institutionID

 

WHERE pfas.institutionID='112885' --Boston Properties, Inc.

 

AND pfafd.dataItemID IN(SELECT dataItemID FROM snlDataItem WHERE dataItemName LIKE '%Occupancy Rate%') --MI KeyFieldID:131585

 

ORDER BY pfas.periodEndDate desc

 

limit 5