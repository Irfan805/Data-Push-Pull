#Necessary libraries
library(odbc)
library(DBI)

#Create connection with DB
conn <- dbConnect(odbc(), Driver = "SQL Server", 
                  Server = "industry.database.windows.net", 
                  Database = "MyDatabase", UID = "username", 
                  PWD = "password", 
                  Port = 1433)

#Read table from DB
df = dbReadTable(conn, "Industry_mtcars")

#Export the data frame to DB
dbWriteTable(con, "Industry_mtcars_exported", df)
#or
dbWriteTable(con, "Industry_mtcars_exported", 
             df[1:1000, ], #First 1000 rows will be exported 
             overwrite = TRUE, #If want to overwrite the existing table 
             row.names = FALSE) #If don't want the row names of the data frame