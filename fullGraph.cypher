MATCH  path = (:Person)-[r:FOLLOWS]->(:Person)
WITH path LIMIT 1000
with collect(path) as paths
call apoc.gephi.add(null,'bachelor', paths, 'weight',['image','twitter_handle','first_name','last_name']) yield nodes, relationships, time
return nodes, relationships, time
