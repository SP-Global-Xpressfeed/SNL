/***********************************************************************************************
Returns InstituionId From Company Name

Packages Required:
SNL Fundamentals APAC FIG

Universal Identifiers:
instituitionId

Primary Columns Used:
instituitionId

Database_Type:
SNOWFLAKE

Query_Version:
V1

Query_Added_Date:
21/10/2020

DatasetKey:
40

The following sample query returns the institutionID from a company name using the SNL package in Xpressfeed

***********************************************************************************************/

SELECT *
FROM snlCorp
WHERE institutionName LIKE '%Boston Properties, Inc.%'