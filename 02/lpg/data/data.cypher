# Rovinka -> RastosHouse -> Hlavna -> Rasto(mayor aj occupant)
# Zlin -> MichalsHouse -> Mramorova -> Michal(mayor aj occupant)
# SvatyJur -> MartinsHouse -> Sportova -> Martin(mayor aj occupant)

CREATE (:Town {townName: "Rovinka", hasFlag: true, hasBroadcast: true})
CREATE (:Town {townName: "Svätý Jur", hasFlag: false, hasBroadcast: false})
CREATE (:Town {townName: "Zlín", hasFlag: false, hasBroadcast: true})

CREATE (:Building {houseNumber: 123, colour_hex_code: "db34eb", area: 50.5})
CREATE (:Building {houseNumber: 5656})
CREATE (:Building {houseNumber: 466})

CREATE (:Street {streetName: "Hlavná", hasSidewalk: true})
CREATE (:Street {streetName: "Športová", hasSidewalk: false})
CREATE (:Street {streetName: "Mramorová", hasSidewalk: true})

CREATE (:Person {firstName: "Michal", surname: "Ševčík"})
CREATE (:Person {firstName: "Rastislav"})
CREATE (:Person {firstName: "Martin"})

CREATE (:Occupant {dateFrom: date('2018-09-01'), unpaidFees: false})
CREATE (:Occupant {dateFrom: date('2018-09-01'), unpaidFees: false})
CREATE (:Occupant {dateFrom: date('2018-09-01'), unpaidFees: true})

CREATE (:Mayor {dateFrom: date('2018-08-01'), termEnd: date('2022-08-01')})
CREATE (:Mayor)
CREATE (:Mayor)

MATCH (t:Town {townName: "Rovinka"}), (p:Person {firstName: "Rastislav"})
CREATE (t)-[:mayor]->(p)

MATCH (t:Town {townName: "Svätý Jur"}), (p:Person {firstName: "Martin"})
CREATE (t)-[:mayor]->(p)

MATCH (t:Town {townName: "Zlín"}), (p:Person {firstName: "Michal"})
CREATE (t)-[:mayor]->(p)

MATCH (p:Person {firstName: "Martin"}), (b:Building {houseNumber: 123})
CREATE (p)-[:livesIn]->(b)

MATCH (p:Person {firstName: "Rastislav"}), (b:Building {houseNumber: 466})
CREATE (p)-[:livesIn]->(b)

MATCH (p:Person {firstName: "Michal"}), (b:Building {houseNumber: 5656})
CREATE (p)-[:livesIn]->(b)

MATCH (b:Building {houseNumber: 123}), (t:Town {townName: "Svätý Jur"})
CREATE (b)-[:town_hall]->(t)

MATCH (b:Building {houseNumber: 466}), (t:Town {townName: "Rovinka"})
CREATE (b)-[:town_hall]->(t)

MATCH (b:Building {houseNumber: 5656}), (t:Town {townName: "Zlín"})
CREATE (b)-[:town_hall]->(t)

MATCH (s:Street {streetName: "Hlavná"}), (t:Town {townName: "Rovinka"})
CREATE (s)-[:locatedIn]->(t)

MATCH (s:Street {streetName: "Športová"}), (t:Town {townName: "Svätý Jur"})
CREATE (s)-[:locatedIn]->(t)

MATCH (s:Street {streetName: "Mramorová"}), (t:Town {townName: "Zlín"})
CREATE (s)-[:locatedIn]->(t)

MATCH (b:Building {houseNumber: 5656}), (s:Street {streetName: "Mramorová"})
CREATE (b)-[:situatedOn]->(s)

MATCH (b:Building {houseNumber: 466}), (s:Street {streetName: "Hlavná"})
CREATE (b)-[:situatedOn]->(s)

MATCH (b:Building {houseNumber: 123}), (s:Street {streetName: "Športová"})
CREATE (b)-[:situatedOn]->(s)







#DALSIE

// Create nodes for towns
CREATE (town_Rovinka:Town {townName: "Rovinka", hasFlag: true, hasBroadcast: true})
CREATE (town_SvatyJur:Town {townName: "Svätý Jur", hasFlag: false, hasBroadcast: false})
CREATE (town_Zlin:Town {townName: "Zlín", hasFlag: false, hasBroadcast: true})

// Create nodes for buildings
CREATE (building_MartinsHouse:Building {houseNumber: 123, area: 50.5, colour_hex_code: "db34eb"})
CREATE (building_MichalsHouse:Building {houseNumber: 5656})
CREATE (building_RastosHouse:Building {houseNumber: 466})

// Create nodes for streets
CREATE (street_Hlavna:Street {streetName: "Hlavná", hasSidewalk: true})
CREATE (street_Sportova:Street {streetName: "Športová", hasSidewalk: false})
CREATE (street_Mramorova:Street {streetName: "Mramorová", hasSidewalk: true})

// Create nodes for people
CREATE (person_Michal:Person {firstName: "Michal", surname: "Ševčík"})
CREATE (person_Rasto:Person {firstName: "Rastislav"})
CREATE (person_Martin:Person {firstName: "Martin"})

// Create nodes for occupants
CREATE (occupant_Michal:Occupant {dateFrom: date('2018-09-01'), unpaidFees: false})
CREATE (occupant_Rasto:Occupant {dateFrom: date('2018-09-01'), unpaidFees: false})
CREATE (occupant_Martin:Occupant {dateFrom: date('2018-09-01'), unpaidFees: true})

// Create nodes for mayors
CREATE (mayor_Rasto:Mayor {dateFrom: date('2018-08-01'), until: date('2022-08-01')})
CREATE (mayor_Martin:Mayor)
CREATE (mayor_Michal:Mayor)

// Create relationships
CREATE (town_Rovinka)-[:townHall]->(building_SvatyJur)
CREATE (town_SvatyJur)-[:townHall]->(building_Rovinka)
CREATE (town_Zlin)-[:townHall]->(building_Zlin)

CREATE (building_MartinsHouse)-[:situatedOn]->(street_Sportova)
CREATE (building_MichalsHouse)-[:situatedOn]->(street_Mramorova)
CREATE (building_RastosHouse)-[:situatedOn]->(street_Hlavna)

CREATE (person_Michal)-[:livesIn]->(building_MichalsHouse)
CREATE (person_Rasto)-[:livesIn]->(building_RastosHouse)
CREATE (person_Martin)-[:livesIn]->(building_MartinsHouse)

CREATE (town_Rovinka)-[:mayor]->(person_Rasto)
CREATE (town_SvatyJur)-[:mayor]->(person_Martin)
CREATE (town_Zlin)-[:mayor]->(person_Michal)

CREATE (street_Hlavna)-[:locatedIn]->(town_Rovinka)
CREATE (street_Sportova)-[:locatedIn]->(town_SvatyJur)
CREATE (street_Mramorova)-[:locatedIn]->(town_Zlin)

CREATE (building_MichalsHouse)-[:livesIn]->(person_OrihoTatko)
CREATE (building_MichalsHouse)-[:livesIn]->(person_OrihoMamka)
CREATE (building_MichalsHouse)-[:livesIn]->(person_Rebeka)
