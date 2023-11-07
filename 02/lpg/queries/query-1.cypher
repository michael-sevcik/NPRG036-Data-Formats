
// get town where michal lives

MATCH
    (Person)-[:livesIn]->(House)-[:situatedOn]->(Street)-[:locatedIn]->(t:Town)
RETURN 
    t