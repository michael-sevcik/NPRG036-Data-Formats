
// get streets with sidewalk and count the number of occupants living on each of those streets

MATCH (building:Building)-[:situatedOn]->(street:Street)
WHERE street.hasSidewalk = true
OPTIONAL MATCH (person:Person)-[:livesIn]->(building)
WITH street, building, COLLECT(DISTINCT person) AS occupants
RETURN street.streetName, SIZE(occupants) AS occupantCount
