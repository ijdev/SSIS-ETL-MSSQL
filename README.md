# SSIS-ETL-MSSQL

### Project Summary
Runs an ETL pipeline load csv files to staging tables and create fact and dimensions tables all in SQL Server Integration Services (SSIS) with a Microsoft SQL server instance

### Project Scopes
The scope of this project will be to build a data warehouse with Star conceptual schema on Microsoft SQL server fro BI and Data scientist

### Data Model
 *A SIMPLE OVERVIEW OF WHAT THE DATA SCHEMA LOOKS LIKE.*\
 **Please refer to the data dictionary to know more about all the fields.**

 ![Shcema](/helpers/schema.PNG)

The database uses the star schema with 1 fact table and 5 dimensions tables.

* `i94fact`: contains immigration information such as visa type, gender, country of origin, etc.
* `PORT`: contains port_code and port_name
* `VISA`: contains visa_code and visa_type
* `STATE`: contains state_id and state_name
* `COUNTRY`: contains country_code and country_name
* `CITY`: contains demographic information for a city

### Data Model Justifications
The star schema is a great way yo build a DW where it's
less normalized which lead to faster queries and to understand how table connected to each other.\
**Who can use this model?**\
Any government entity that is interesting in preforming
some analysis over the city and sates in respect to what immigrants are reallocating to.

**What insights can be retrieved?**\
With this model you can know the type of visa of the traveller is it for bossiness or school, etc. You can
learn what state is more appealing for students for example.\
Known the country of the immigrant, what country are most immigrants are from? are they located in 1 or two states or scattered?

### Data pipeline
![dag](/helpers/pipeline.PNG)

Each SQL Task is configured to connect to the SQL server and run a query. Queries can be found in the helpers folder.

#### What the staging data flow does
1. Create Flat File manager and connect to the csv file
![i94](/helpers/i94staging.png)
2. Connect to an OLE DB and map the columns if SSIS did not di for you
![i94](/helpers/i94staging_oledb.png)

The same for the demographic staging table.

#### The lookup data flow is simpler (Same in all lookup tables)
1. Flat file connection to csv
2. Load to to the appropriate table
![lookupExample](/helpers/lookup_example.png)


#### The Dimensions and fact table
All of them are SQL Task (queries are in the helpers folder)
an example how to configure the sql task for visa dim
![visa_dim](/helpers/excute_sql.png)

### Project files

#### Data folder
1. data_dictionary - excel file with 6 sheets correspond to each table.
2. i94 - the immigration
3. city_100_csv - the demographic information of each city
4. country - a simple lookup file to match each country code to its name
5. port- a simple lookup file to match each port code to a port name
6. visa - a simple lookup file to match each visa code to the type of visa


