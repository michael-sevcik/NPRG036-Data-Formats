
// get town where michal lives

MATCH
    (p:Person)-[:livesIn]->(House)-[:situatedOn]->(Street)-[:locatedIn]->(t:Town)
WHERE
    p.firstName = 'Michal"
RETURN
    t.townName