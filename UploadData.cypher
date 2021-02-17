CREATE CONSTRAINT constraint_name ON (n:Contestant) ASSERT (n.firstname, n.lastname,n.twitter_handle) IS NODE KEY

LOAD CSV WITH HEADERS FROM 'file:////Users/samanthakaiser/Desktop/nodes.csv' AS line
CREATE (:Contestant{ twitter_handle: line.twitter_handle, firstname:line.first_name, lastname:line.last_name,image:line.image, season: line.season,hometown:line.hometown, age_on_show:line.age_on_show,role:line.role,occupation:line.occupation})
 
 
LOAD CSV WITH HEADERS FROM 'file:////Users/samanthakaiser/Desktop/edges.csv' AS line
MATCH (n:Contestant {twitter_handle:line.who}),(m:Contestant {twitter_handle:line.following})
CREATE (n)-[:FOLLOWS]->(m)
