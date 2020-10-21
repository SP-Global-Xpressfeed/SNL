/***********************************************************************************************
Returns Annual Flow Data For A Company

Packages Required:
SNL Data Item Master
SNL Fundamentals APAC FIG

Universal Identifiers:
instituitionId

Primary Columns Used:
dataItemId
flowPeriodId
stockPeriodId

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
21/10/2020

DatasetKey:
40

The following sample query returns annual flow data for a company using the SNL packages in Xpressfeed.
Note: This example uses Cost-to-Income for Deutsche Bank AG

***********************************************************************************************/

SELECT c.institutionId

, C.periodEndDate
, d.dataItemId
, d.dataItemName
, b.dataItemValue
, d.magnitude
, c.iscurrent
, e.filingdate
, e.filingtype

FROM snlFlowPeriod a

LEFT JOIN snlFlowPeriodData b ON a.flowPeriodId = b.flowPeriodId
JOIN snlStockPeriod c ON c.stockPeriodId = a.stockPeriodId
LEFT JOIN snlDataItem d ON d.dataItemId = b.dataItemId
LEFT JOIN snlfilings e ON e.stockPeriodId = a.stockPeriodId

WHERE c.institutionId = 113830 --Deutsche Bank AG

AND d.dataCollectionTypeId= 2 --Flow Items
AND d.dataItemId = 227031 --Cost-to-Income
AND a.periodTypeId = 1 --Annual
AND c.isCurrent=1 --Current

ORDER BY C.periodEndDate DESC