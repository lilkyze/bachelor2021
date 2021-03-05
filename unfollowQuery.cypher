MATCH p = (n:Contestant)-[:FOLLOWS]->(m:Contestant) 
WHERE NOT (n)<-[:FOLLOWS]-(m)

WITH n.twitter_handle as twitter_handle, count(distinct m)  as counter
ORDER BY counter DESC
WITH COLLECT(twitter_handle) as lister, COLLECT(counter) as counts

MATCH path = (n:Contestant)-[:FOLLOWS]->(m:Contestant) 
WHERE NOT (n)<-[:FOLLOWS]-(m)
AND n.twitter_handle = lister[0]

