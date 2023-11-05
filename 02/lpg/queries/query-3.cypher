MATCH (mayor:Person)-[:livesIn]->(house)
MATCH (:Town )
MATCH (house)-[:situatedOn]->(street)
MATCH (street)-[:locatedIn]->(town)
RETURN mayor, town.townName AS townName, street.streetName AS streetName, house.houseNumber AS houseNumber
