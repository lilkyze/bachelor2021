# Add the image location to your nodes. Image filenames are their twitter handles

MATCH (n)
SET n.image = "Directory/"+ n.twitter_handle + ".png"


# Append this to the end of your match query to send to gephi

WITH path LIMIT 1000
with collect(path) as paths
call apoc.gephi.add(null,'bachelor', paths, 'counts',['image','twitter_handle','first_name','last_name']) yield nodes, relationships, time
return nodes, relationships, time
