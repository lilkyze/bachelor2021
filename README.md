# bachelor2021

# Neo4j Set up 

1. Download Neo4j 4.
 -  Neo4j Desktop is where you can maintain your databases, change config files, and start/stop/restart database. 
 -  Neo4j Browser is where you can query and view the database.
 -  Neo4j bolt is the port which you can reach your database through API or in our case a   python driver.

2. Download Neo4j python driver
 -  pip install neo4j

3. Configure database so that you can import csv quickly.
 -  Uncomment the line containing:
    dbms.security.allow_csv_import_from_file_urls=true
 -  Comment this line below:
    #dbms.directories.import=import
 Doucementation for this step can be found ger
 https://neo4j.com/docs/cypher-manual/current/clauses/load-csv/

4. Create Constraints on the Database and upload the database.
  - Run the queries from UploadData.cypher file.
 
5. Run Cypher queries to explore the data

  
