CALL gds.alpha.degree.stream({
  nodeProjection: 'Contestant',
  relationshipProjection: {
    FOLLOWS: {
      type: 'FOLLOWS',
      orientation: 'REVERSE'
    }
  }
})
YIELD nodeId, score
SET gds.util.asNode(nodeId).degree = score

MATCH (n)
RETURN n.twitter_handle as name, n.betweennessscore as score ORDER BY n.betweennessscore DESC LIMIT 5
