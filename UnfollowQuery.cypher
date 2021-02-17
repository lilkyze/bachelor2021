MATCH p = (n:Contestant)-[:FOLLOWS]->(m:Contestant) 
WHERE NOT (n)<-[:FOLLOWS]-(m)

WITH n.twitter_handle as twitter_handle, count(distinct m)  as counter
ORDER BY counter DESC
WITH COLLECT(twitter_handle) as lister, COLLECT(counter) as counts

MATCH path = (n:Contestant)-[:FOLLOWS]->(m:Contestant) 
WHERE NOT (n)<-[:FOLLOWS]-(m)
AND n.twitter_handle = lister[0]

WITH path LIMIT 1000
with collect(path) as paths
call apoc.gephi.add(null,'bachelor', paths, 'counts',['image','twitter_handle','first_name','last_name']) yield nodes, relationships, time
return nodes, relationships, time
