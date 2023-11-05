// Rovinka -> RastosHouse -> Hlavna -> Rasto(mayor aj occupant)
// Zlin -> MichalsHouse -> Mramorova -> Michal(mayor aj occupant)
// SvatyJur -> MartinsHouse -> Sportova -> Martin(mayor aj occupant)

//-- NODES --//
// Create Towns
CREATE (Rovinka:Town {townName: "Rovinka", hasFlag: true, hasBroadcast: true})
CREATE (SvatyJur:Town {townName: "Svätý Jur", hasFlag: false, hasBroadcast: false})
CREATE (Zlin:Town {townName: "Zlín", hasFlag: false, hasBroadcast: true})

// Create Buildings
CREATE (MartinsHouse:Building {houseNumber: 123, colour_hex_code: "db34eb", area: 50.5})
CREATE (MichalsHouse:Building {houseNumber: 5656})
CREATE (RastosHouse:Building {houseNumber: 466})

// Create Streets
CREATE (Hlavna:Street {streetName: "Hlavná", hasSidewalk: true})
CREATE (Sportova:Street {streetName: "Športová", hasSidewalk: false})
CREATE (Mramorova:Street {streetName: "Mramorová", hasSidewalk: true})

// Create People
CREATE (Michal:Person {firstName: "Michal", surname: "Ševčík"})
CREATE (Rasto:Person {firstName: "Rastislav"})
CREATE (Martin:Person {firstName: "Martin"})

//-- EDGES --//
// Assign Mayors
CREATE (Rovinka)-[:mayor {dateFrom: date('2018-08-01'), termEnd: date('2022-08-01')}]->(Rastislav)
CREATE (SvatyJur)-[:mayor]->(Martin)
CREATE (Zlin)-[:mayor]->(Michal)

// Assign Households
CREATE (Martin)-[:livesIn {dateFrom: date('2018-09-01'), unpaidFees: true}]->(MartinsHouse)
CREATE (Rasto)-[:livesIn {dateFrom: date('2018-09-01'), unpaidFees: false}]->(RastosHouse)
CREATE (Michal)-[:livesIn {dateFrom: date('2018-09-01'), unpaidFees: false}]->(MichalsHouse)

// Assign Town halls
CREATE (MartinsHouse)-[:townHall]->(SvatyJur)
CREATE (RastosHouse)-[:townHall]->(Rovinka)
CREATE (MichalsHouse)-[:townHall]->(Zlin)

// Assign Street to Town
CREATE (Hlavna)-[:locatedIn]->(Rovinka)
CREATE (Sportova)-[:locatedIn]->(SvatyJur)
CREATE (Mramorova)-[:locatedIn]->(Zlin)

// Assign House to Street
CREATE (MichalsHouse)-[:situatedOn]->(Mramorova)
CREATE (RastosHouse)-[:situatedOn]->(Hlavna)
CREATE (MartinsHouse)-[:situatedOn]->(Sportova)


