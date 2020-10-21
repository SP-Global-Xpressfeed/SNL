/***********************************************************************************************
Returns List Of SNL Data Items By Industry

Packages Required:
SNL Data Item Master

Universal Identifiers:
NULL

Primary Columns Used:
dataItemId
snlIndustryId

Database_Type:
POSTGRESQL

Query_Version:
V1

Query_Added_Date:
21/10/2020

DatasetKey:
40

The following sample query  returns a list of SNL data items by industry in Xpressfeed

***********************************************************************************************/

SELECT *FROM snlDataItemDisplay sdd
JOIN snlDataItem sd ON sd.dataItemId = sdd.dataItemId
WHERE sdd.SNLIndustryId = 6 --- Enter the industry ID here
ORDER BY sdd.dataItemId
