CALL gds.graph.create.cypher(
    'mygraph',
    'MATCH (n:Contestant) RETURN id(n) AS id',
    'MATCH (n:Contestant)-[r:FOLLOWS]->(m:Contestant) RETURN id(n) AS source, id(m) AS target, type(r) AS type'
)

CALL gds.betweenness.stream('mygraph')
YIELD nodeId, score
SET gds.util.asNode(nodeId).betweennessscore = score

MATCH (n)
RETURN n.twitter_handle as name, n.betweennessscore as score ORDER BY n.betweennessscore DESC LIMIT 5

