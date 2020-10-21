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
MSSQL

Query_Version:
V1

Query_Added_Date:
21/10/2020

DatasetKey:
40

The following sample query returns the Occupancy Rate percentage for the last five fiscal years using the SNL Real Estate package in Xpressfeed

***********************************************************************************************/

SELECT TOP 5 c.institutionID

, c.institutionName
, pfas.periodEndDate
, pfafd.dataItemID
, di.dataItemName
, pfafd.dataItemValue

FROM snlPropFinlAggStock pfas (NOLOCK)

JOIN snlPropFinlAggFlow pfaf (NOLOCK) ON pfas.stockPeriodID=pfaf.stockPeriodID AND pfaf.periodTypeID=1 --Annual, periodTypeID (2) for Quarterly
JOIN snlPropFinlAggFlowData pfafd (NOLOCK) ON pfaf.flowPeriodID=pfafd.flowPeriodID
JOIN snlDataItem di (NOLOCK) ON pfafd.dataItemID=di.dataItemID
LEFT JOIN ciqCompanyCrossRef cc (NOLOCK) ON pfas.institutionID=cc.identifierValue
JOIN snlCorp c (NOLOCK) ON pfas.institutionID=c.institutionID

WHERE pfas.institutionID=112885 --Boston Properties, Inc.

AND pfafd.dataItemID IN(SELECT dataItemID FROM snlDataItem WHERE dataItemName LIKE '%Occupancy Rate%') --MI KeyFieldID:131585

ORDER BY pfas.periodEndDate DESC