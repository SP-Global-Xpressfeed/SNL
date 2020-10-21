/***********************************************************************************************
Returns List Of Industry IDs

Packages Required:
SNL Data Item Master

Universal Identifiers:
NULL

Primary Columns Used:
snlIndustryId

Database_Type:
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
21/10/2020

DatasetKey:
40

The following sample queryreturns a list of SNL Industry IDs in Xpressfeed

***********************************************************************************************/

SELECT DISTINCT snlIndustryId, snlIndustryName
FROM snlInstnReference
ORDER BY snlIndustryId
