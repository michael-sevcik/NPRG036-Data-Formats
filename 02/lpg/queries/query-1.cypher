// get town where michal lives

MATCH
    (p:Person)-[:livesIn]->(:Building)-[:situatedOn]->(:Street)-[:locatedIn]->(t:Town)
WHERE
    p.firstName = 'Michal"
RETURN
    t.townName
