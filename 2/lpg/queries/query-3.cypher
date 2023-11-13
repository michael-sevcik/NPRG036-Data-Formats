// select mayors and their addresses

MATCH 
    (town:Town)<-[:locatedIn]-(street:Street)<-[:situatedOn]-(house:Building)<-[:livesIn]-(person:Person)<-[:mayor]-(:Town)
RETURN person.firstName AS MayorName, [street.streetName, house.houseNumber, town.townName] AS Adress 
