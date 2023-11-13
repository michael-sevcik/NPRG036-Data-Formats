// Select 2 occupants of the town hall of Zlín that are living there the longest

MATCH 
    (town:Town)<-[:townHall]-(building:Building)<-[occ:livesIn]-(person:Person)
WHERE
    town.townName = "Zlín"
RETURN person.firstName, occ.dateFrom
ORDER BY occ.dateFrom
LIMIT 2
