# Rovinka -> RastosHouse -> Hlavna -> Rasto(mayor aj occupant)
# Zlin -> MichalsHouse -> Mramorova -> Michal(mayor aj occupant)
# SvatyJur -> MartinsHouse -> Sportova -> Martin(mayor aj occupant)

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

// Create persons
CREATE (Michal:Person {firstName: "Michal", surname: "Ševčík"})
CREATE (Rasto:Person {firstName: "Rastislav"})
CREATE (Martin:Person {firstName: "Martin"})

// Assign Mayors
CREATE (Rovinka)-[:mayor {dateFrom: date('2018-08-01'), termEnd: date('2022-08-01')}]->(Rastislav)
CREATE (SvatyJur)-[:mayor]->(Martin)
CREATE (Zlin)-[:mayor]->(Michal)

// Assign House
MATCH (p:Person {firstName: "Martin"}), (b:Building {houseNumber: 123})
CREATE (p)-[:livesIn {dateFrom: date('2018-09-01'), unpaidFees: true}]->(b)

MATCH (p:Person {firstName: "Rastislav"}), (b:Building {houseNumber: 466})
CREATE (p)-[:livesIn {dateFrom: date('2018-09-01'), unpaidFees: false}]->(b)

MATCH (p:Person {firstName: "Michal"}), (b:Building {houseNumber: 5656})
CREATE (p)-[:livesIn {dateFrom: date('2018-09-01'), unpaidFees: false}]->(b)

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









#movies
CREATE (TheMatrix:Movie {title:'The Matrix', released:1999, tagline:'Welcome to the Real World'})
      CREATE (Keanu:Person {name:'Keanu Reeves', born:1964})
      CREATE (Carrie:Person {name:'Carrie-Anne Moss', born:1967})
      CREATE (Laurence:Person {name:'Laurence Fishburne', born:1961})
      CREATE (Hugo:Person {name:'Hugo Weaving', born:1960})
      CREATE (LillyW:Person {name:'Lilly Wachowski', born:1967})
      CREATE (LanaW:Person {name:'Lana Wachowski', born:1965})
      CREATE (JoelS:Person {name:'Joel Silver', born:1952})
      CREATE
      (Keanu)-[:ACTED_IN {roles:['Neo']}]->(TheMatrix),
      (Carrie)-[:ACTED_IN {roles:['Trinity']}]->(TheMatrix),
      (Laurence)-[:ACTED_IN {roles:['Morpheus']}]->(TheMatrix),
      (Hugo)-[:ACTED_IN {roles:['Agent Smith']}]->(TheMatrix),
      (LillyW)-[:DIRECTED]->(TheMatrix),
      (LanaW)-[:DIRECTED]->(TheMatrix),
      (JoelS)-[:PRODUCED]->(TheMatrix)

      CREATE (Emil:Person {name:"Emil Eifrem", born:1978})
      CREATE (Emil)-[:ACTED_IN {roles:["Emil"]}]->(TheMatrix)

      CREATE (TheMatrixReloaded:Movie {title:'The Matrix Reloaded', released:2003, tagline:'Free your mind'})
      CREATE
      (Keanu)-[:ACTED_IN {roles:['Neo']}]->(TheMatrixReloaded),
      (Carrie)-[:ACTED_IN {roles:['Trinity']}]->(TheMatrixReloaded),
      (Laurence)-[:ACTED_IN {roles:['Morpheus']}]->(TheMatrixReloaded),
      (Hugo)-[:ACTED_IN {roles:['Agent Smith']}]->(TheMatrixReloaded),
      (LillyW)-[:DIRECTED]->(TheMatrixReloaded),
      (LanaW)-[:DIRECTED]->(TheMatrixReloaded),
      (JoelS)-[:PRODUCED]->(TheMatrixReloaded)

      CREATE (TheMatrixRevolutions:Movie {title:'The Matrix Revolutions', released:2003, tagline:'Everything that has a beginning has an end'})
      CREATE
      (Keanu)-[:ACTED_IN {roles:['Neo']}]->(TheMatrixRevolutions),
      (Carrie)-[:ACTED_IN {roles:['Trinity']}]->(TheMatrixRevolutions),
      (Laurence)-[:ACTED_IN {roles:['Morpheus']}]->(TheMatrixRevolutions),
      (Hugo)-[:ACTED_IN {roles:['Agent Smith']}]->(TheMatrixRevolutions),
      (LillyW)-[:DIRECTED]->(TheMatrixRevolutions),
      (LanaW)-[:DIRECTED]->(TheMatrixRevolutions),
      (JoelS)-[:PRODUCED]->(TheMatrixRevolutions)

      CREATE (TheDevilsAdvocate:Movie {title:"The Devil's Advocate", released:1997, tagline:'Evil has its winning ways'})
      CREATE (Charlize:Person {name:'Charlize Theron', born:1975})
      CREATE (Al:Person {name:'Al Pacino', born:1940})
      CREATE (Taylor:Person {name:'Taylor Hackford', born:1944})
      CREATE
      (Keanu)-[:ACTED_IN {roles:['Kevin Lomax']}]->(TheDevilsAdvocate),
      (Charlize)-[:ACTED_IN {roles:['Mary Ann Lomax']}]->(TheDevilsAdvocate),
      (Al)-[:ACTED_IN {roles:['John Milton']}]->(TheDevilsAdvocate),
      (Taylor)-[:DIRECTED]->(TheDevilsAdvocate)

      CREATE (AFewGoodMen:Movie {title:"A Few Good Men", released:1992, tagline:"In the heart of the nation's capital, in a courthouse of the U.S. government, one man will stop at nothing to keep his honor, and one will stop at nothing to find the truth."})
      CREATE (TomC:Person {name:'Tom Cruise', born:1962})
      CREATE (JackN:Person {name:'Jack Nicholson', born:1937})
      CREATE (DemiM:Person {name:'Demi Moore', born:1962})
      CREATE (KevinB:Person {name:'Kevin Bacon', born:1958})
      CREATE (KieferS:Person {name:'Kiefer Sutherland', born:1966})
      CREATE (NoahW:Person {name:'Noah Wyle', born:1971})
      CREATE (CubaG:Person {name:'Cuba Gooding Jr.', born:1968})
      CREATE (KevinP:Person {name:'Kevin Pollak', born:1957})
      CREATE (JTW:Person {name:'J.T. Walsh', born:1943})
      CREATE (JamesM:Person {name:'James Marshall', born:1967})
      CREATE (ChristopherG:Person {name:'Christopher Guest', born:1948})
      CREATE (RobR:Person {name:'Rob Reiner', born:1947})
      CREATE (AaronS:Person {name:'Aaron Sorkin', born:1961})
      CREATE
      (TomC)-[:ACTED_IN {roles:['Lt. Daniel Kaffee']}]->(AFewGoodMen),
      (JackN)-[:ACTED_IN {roles:['Col. Nathan R. Jessup']}]->(AFewGoodMen),
      (DemiM)-[:ACTED_IN {roles:['Lt. Cdr. JoAnne Galloway']}]->(AFewGoodMen),
      (KevinB)-[:ACTED_IN {roles:['Capt. Jack Ross']}]->(AFewGoodMen),
      (KieferS)-[:ACTED_IN {roles:['Lt. Jonathan Kendrick']}]->(AFewGoodMen),
      (NoahW)-[:ACTED_IN {roles:['Cpl. Jeffrey Barnes']}]->(AFewGoodMen),
      (CubaG)-[:ACTED_IN {roles:['Cpl. Carl Hammaker']}]->(AFewGoodMen),
      (KevinP)-[:ACTED_IN {roles:['Lt. Sam Weinberg']}]->(AFewGoodMen),
      (JTW)-[:ACTED_IN {roles:['Lt. Col. Matthew Andrew Markinson']}]->(AFewGoodMen),
      (JamesM)-[:ACTED_IN {roles:['Pfc. Louden Downey']}]->(AFewGoodMen),
      (ChristopherG)-[:ACTED_IN {roles:['Dr. Stone']}]->(AFewGoodMen),
      (AaronS)-[:ACTED_IN {roles:['Man in Bar']}]->(AFewGoodMen),
      (RobR)-[:DIRECTED]->(AFewGoodMen),
      (AaronS)-[:WROTE]->(AFewGoodMen)

      CREATE (TopGun:Movie {title:"Top Gun", released:1986, tagline:'I feel the need, the need for speed.'})
      CREATE (KellyM:Person {name:'Kelly McGillis', born:1957})
      CREATE (ValK:Person {name:'Val Kilmer', born:1959})
      CREATE (AnthonyE:Person {name:'Anthony Edwards', born:1962})
      CREATE (TomS:Person {name:'Tom Skerritt', born:1933})
      CREATE (MegR:Person {name:'Meg Ryan', born:1961})
      CREATE (TonyS:Person {name:'Tony Scott', born:1944})
      CREATE (JimC:Person {name:'Jim Cash', born:1941})
      CREATE
      (TomC)-[:ACTED_IN {roles:['Maverick']}]->(TopGun),
      (KellyM)-[:ACTED_IN {roles:['Charlie']}]->(TopGun),
      (ValK)-[:ACTED_IN {roles:['Iceman']}]->(TopGun),
      (AnthonyE)-[:ACTED_IN {roles:['Goose']}]->(TopGun),
      (TomS)-[:ACTED_IN {roles:['Viper']}]->(TopGun),
      (MegR)-[:ACTED_IN {roles:['Carole']}]->(TopGun),
      (TonyS)-[:DIRECTED]->(TopGun),
      (JimC)-[:WROTE]->(TopGun)

      CREATE (JerryMaguire:Movie {title:'Jerry Maguire', released:2000, tagline:'The rest of his life begins now.'})
      CREATE (ReneeZ:Person {name:'Renee Zellweger', born:1969})
      CREATE (KellyP:Person {name:'Kelly Preston', born:1962})
      CREATE (JerryO:Person {name:"Jerry O'Connell", born:1974})
      CREATE (JayM:Person {name:'Jay Mohr', born:1970})
      CREATE (BonnieH:Person {name:'Bonnie Hunt', born:1961})
      CREATE (ReginaK:Person {name:'Regina King', born:1971})
      CREATE (JonathanL:Person {name:'Jonathan Lipnicki', born:1996})
      CREATE (CameronC:Person {name:'Cameron Crowe', born:1957})
      CREATE
      (TomC)-[:ACTED_IN {roles:['Jerry Maguire']}]->(JerryMaguire),
      (CubaG)-[:ACTED_IN {roles:['Rod Tidwell']}]->(JerryMaguire),
      (ReneeZ)-[:ACTED_IN {roles:['Dorothy Boyd']}]->(JerryMaguire),
      (KellyP)-[:ACTED_IN {roles:['Avery Bishop']}]->(JerryMaguire),
      (JerryO)-[:ACTED_IN {roles:['Frank Cushman']}]->(JerryMaguire),
      (JayM)-[:ACTED_IN {roles:['Bob Sugar']}]->(JerryMaguire),
      (BonnieH)-[:ACTED_IN {roles:['Laurel Boyd']}]->(JerryMaguire),
      (ReginaK)-[:ACTED_IN {roles:['Marcee Tidwell']}]->(JerryMaguire),
      (JonathanL)-[:ACTED_IN {roles:['Ray Boyd']}]->(JerryMaguire),
      (CameronC)-[:DIRECTED]->(JerryMaguire),
      (CameronC)-[:PRODUCED]->(JerryMaguire),
      (CameronC)-[:WROTE]->(JerryMaguire)

      CREATE (StandByMe:Movie {title:"Stand By Me", released:1986, tagline:"For some, it's the last real taste of innocence, and the first real taste of life. But for everyone, it's the time that memories are made of."})
      CREATE (RiverP:Person {name:'River Phoenix', born:1970})
      CREATE (CoreyF:Person {name:'Corey Feldman', born:1971})
      CREATE (WilW:Person {name:'Wil Wheaton', born:1972})
      CREATE (JohnC:Person {name:'John Cusack', born:1966})
      CREATE (MarshallB:Person {name:'Marshall Bell', born:1942})
      CREATE
      (WilW)-[:ACTED_IN {roles:['Gordie Lachance']}]->(StandByMe),
      (RiverP)-[:ACTED_IN {roles:['Chris Chambers']}]->(StandByMe),
      (JerryO)-[:ACTED_IN {roles:['Vern Tessio']}]->(StandByMe),
      (CoreyF)-[:ACTED_IN {roles:['Teddy Duchamp']}]->(StandByMe),
      (JohnC)-[:ACTED_IN {roles:['Denny Lachance']}]->(StandByMe),
      (KieferS)-[:ACTED_IN {roles:['Ace Merrill']}]->(StandByMe),
      (MarshallB)-[:ACTED_IN {roles:['Mr. Lachance']}]->(StandByMe),
      (RobR)-[:DIRECTED]->(StandByMe)

      CREATE (AsGoodAsItGets:Movie {title:'As Good as It Gets', released:1997, tagline:'A comedy from the heart that goes for the throat.'})
      CREATE (HelenH:Person {name:'Helen Hunt', born:1963})
      CREATE (GregK:Person {name:'Greg Kinnear', born:1963})
      CREATE (JamesB:Person {name:'James L. Brooks', born:1940})
      CREATE
      (JackN)-[:ACTED_IN {roles:['Melvin Udall']}]->(AsGoodAsItGets),
      (HelenH)-[:ACTED_IN {roles:['Carol Connelly']}]->(AsGoodAsItGets),
      (GregK)-[:ACTED_IN {roles:['Simon Bishop']}]->(AsGoodAsItGets),
      (CubaG)-[:ACTED_IN {roles:['Frank Sachs']}]->(AsGoodAsItGets),
      (JamesB)-[:DIRECTED]->(AsGoodAsItGets)

      CREATE (WhatDreamsMayCome:Movie {title:'What Dreams May Come', released:1998, tagline:'After life there is more. The end is just the beginning.'})
      CREATE (AnnabellaS:Person {name:'Annabella Sciorra', born:1960})
      CREATE (MaxS:Person {name:'Max von Sydow', born:1929})
      CREATE (WernerH:Person {name:'Werner Herzog', born:1942})
      CREATE (Robin:Person {name:'Robin Williams', born:1951})
      CREATE (VincentW:Person {name:'Vincent Ward', born:1956})
      CREATE
      (Robin)-[:ACTED_IN {roles:['Chris Nielsen']}]->(WhatDreamsMayCome),
      (CubaG)-[:ACTED_IN {roles:['Albert Lewis']}]->(WhatDreamsMayCome),
      (AnnabellaS)-[:ACTED_IN {roles:['Annie Collins-Nielsen']}]->(WhatDreamsMayCome),
      (MaxS)-[:ACTED_IN {roles:['The Tracker']}]->(WhatDreamsMayCome),
      (WernerH)-[:ACTED_IN {roles:['The Face']}]->(WhatDreamsMayCome),
      (VincentW)-[:DIRECTED]->(WhatDreamsMayCome)

      CREATE (SnowFallingonCedars:Movie {title:'Snow Falling on Cedars', released:1999, tagline:'First loves last. Forever.'})
      CREATE (EthanH:Person {name:'Ethan Hawke', born:1970})
      CREATE (RickY:Person {name:'Rick Yune', born:1971})
      CREATE (JamesC:Person {name:'James Cromwell', born:1940})
      CREATE (ScottH:Person {name:'Scott Hicks', born:1953})
      CREATE
      (EthanH)-[:ACTED_IN {roles:['Ishmael Chambers']}]->(SnowFallingonCedars),
      (RickY)-[:ACTED_IN {roles:['Kazuo Miyamoto']}]->(SnowFallingonCedars),
      (MaxS)-[:ACTED_IN {roles:['Nels Gudmundsson']}]->(SnowFallingonCedars),
      (JamesC)-[:ACTED_IN {roles:['Judge Fielding']}]->(SnowFallingonCedars),
      (ScottH)-[:DIRECTED]->(SnowFallingonCedars)

      CREATE (YouveGotMail:Movie {title:"You've Got Mail", released:1998, tagline:'At odds in life... in love on-line.'})
      CREATE (ParkerP:Person {name:'Parker Posey', born:1968})
      CREATE (DaveC:Person {name:'Dave Chappelle', born:1973})
      CREATE (SteveZ:Person {name:'Steve Zahn', born:1967})
      CREATE (TomH:Person {name:'Tom Hanks', born:1956})
      CREATE (NoraE:Person {name:'Nora Ephron', born:1941})
      CREATE
      (TomH)-[:ACTED_IN {roles:['Joe Fox']}]->(YouveGotMail),
      (MegR)-[:ACTED_IN {roles:['Kathleen Kelly']}]->(YouveGotMail),
      (GregK)-[:ACTED_IN {roles:['Frank Navasky']}]->(YouveGotMail),
      (ParkerP)-[:ACTED_IN {roles:['Patricia Eden']}]->(YouveGotMail),
      (DaveC)-[:ACTED_IN {roles:['Kevin Jackson']}]->(YouveGotMail),
      (SteveZ)-[:ACTED_IN {roles:['George Pappas']}]->(YouveGotMail),
      (NoraE)-[:DIRECTED]->(YouveGotMail)

      CREATE (SleeplessInSeattle:Movie {title:'Sleepless in Seattle', released:1993, tagline:'What if someone you never met, someone you never saw, someone you never knew was the only someone for you?'})
      CREATE (RitaW:Person {name:'Rita Wilson', born:1956})
      CREATE (BillPull:Person {name:'Bill Pullman', born:1953})
      CREATE (VictorG:Person {name:'Victor Garber', born:1949})
      CREATE (RosieO:Person {name:"Rosie O'Donnell", born:1962})
      CREATE
      (TomH)-[:ACTED_IN {roles:['Sam Baldwin']}]->(SleeplessInSeattle),
      (MegR)-[:ACTED_IN {roles:['Annie Reed']}]->(SleeplessInSeattle),
      (RitaW)-[:ACTED_IN {roles:['Suzy']}]->(SleeplessInSeattle),
      (BillPull)-[:ACTED_IN {roles:['Walter']}]->(SleeplessInSeattle),
      (VictorG)-[:ACTED_IN {roles:['Greg']}]->(SleeplessInSeattle),
      (RosieO)-[:ACTED_IN {roles:['Becky']}]->(SleeplessInSeattle),
      (NoraE)-[:DIRECTED]->(SleeplessInSeattle)

      CREATE (JoeVersustheVolcano:Movie {title:'Joe Versus the Volcano', released:1990, tagline:'A story of love, lava and burning desire.'})
      CREATE (JohnS:Person {name:'John Patrick Stanley', born:1950})
      CREATE (Nathan:Person {name:'Nathan Lane', born:1956})
      CREATE
      (TomH)-[:ACTED_IN {roles:['Joe Banks']}]->(JoeVersustheVolcano),
      (MegR)-[:ACTED_IN {roles:['DeDe', 'Angelica Graynamore', 'Patricia Graynamore']}]->(JoeVersustheVolcano),
      (Nathan)-[:ACTED_IN {roles:['Baw']}]->(JoeVersustheVolcano),
      (JohnS)-[:DIRECTED]->(JoeVersustheVolcano)

      CREATE (WhenHarryMetSally:Movie {title:'When Harry Met Sally', released:1998, tagline:'Can two friends sleep together and still love each other in the morning?'})
      CREATE (BillyC:Person {name:'Billy Crystal', born:1948})
      CREATE (CarrieF:Person {name:'Carrie Fisher', born:1956})
      CREATE (BrunoK:Person {name:'Bruno Kirby', born:1949})
      CREATE
      (BillyC)-[:ACTED_IN {roles:['Harry Burns']}]->(WhenHarryMetSally),
      (MegR)-[:ACTED_IN {roles:['Sally Albright']}]->(WhenHarryMetSally),
      (CarrieF)-[:ACTED_IN {roles:['Marie']}]->(WhenHarryMetSally),
      (BrunoK)-[:ACTED_IN {roles:['Jess']}]->(WhenHarryMetSally),
      (RobR)-[:DIRECTED]->(WhenHarryMetSally),
      (RobR)-[:PRODUCED]->(WhenHarryMetSally),
      (NoraE)-[:PRODUCED]->(WhenHarryMetSally),
      (NoraE)-[:WROTE]->(WhenHarryMetSally)

      CREATE (ThatThingYouDo:Movie {title:'That Thing You Do', released:1996, tagline:'In every life there comes a time when that thing you dream becomes that thing you do'})
      CREATE (LivT:Person {name:'Liv Tyler', born:1977})
      CREATE
      (TomH)-[:ACTED_IN {roles:['Mr. White']}]->(ThatThingYouDo),
      (LivT)-[:ACTED_IN {roles:['Faye Dolan']}]->(ThatThingYouDo),
      (Charlize)-[:ACTED_IN {roles:['Tina']}]->(ThatThingYouDo),
      (TomH)-[:DIRECTED]->(ThatThingYouDo)

      CREATE (TheReplacements:Movie {title:'The Replacements', released:2000, tagline:'Pain heals, Chicks dig scars... Glory lasts forever'})
      CREATE (Brooke:Person {name:'Brooke Langton', born:1970})
      CREATE (Gene:Person {name:'Gene Hackman', born:1930})
      CREATE (Orlando:Person {name:'Orlando Jones', born:1968})
      CREATE (Howard:Person {name:'Howard Deutch', born:1950})
      CREATE
      (Keanu)-[:ACTED_IN {roles:['Shane Falco']}]->(TheReplacements),
      (Brooke)-[:ACTED_IN {roles:['Annabelle Farrell']}]->(TheReplacements),
      (Gene)-[:ACTED_IN {roles:['Jimmy McGinty']}]->(TheReplacements),
      (Orlando)-[:ACTED_IN {roles:['Clifford Franklin']}]->(TheReplacements),
      (Howard)-[:DIRECTED]->(TheReplacements)

      CREATE (RescueDawn:Movie {title:'RescueDawn', released:2006, tagline:"Based on the extraordinary true story of one man's fight for freedom"})
      CREATE (ChristianB:Person {name:'Christian Bale', born:1974})
      CREATE (ZachG:Person {name:'Zach Grenier', born:1954})
      CREATE
      (MarshallB)-[:ACTED_IN {roles:['Admiral']}]->(RescueDawn),
      (ChristianB)-[:ACTED_IN {roles:['Dieter Dengler']}]->(RescueDawn),
      (ZachG)-[:ACTED_IN {roles:['Squad Leader']}]->(RescueDawn),
      (SteveZ)-[:ACTED_IN {roles:['Duane']}]->(RescueDawn),
      (WernerH)-[:DIRECTED]->(RescueDawn)

      CREATE (TheBirdcage:Movie {title:'The Birdcage', released:1996, tagline:'Come as you are'})
      CREATE (MikeN:Person {name:'Mike Nichols', born:1931})
      CREATE
      (Robin)-[:ACTED_IN {roles:['Armand Goldman']}]->(TheBirdcage),
      (Nathan)-[:ACTED_IN {roles:['Albert Goldman']}]->(TheBirdcage),
      (Gene)-[:ACTED_IN {roles:['Sen. Kevin Keeley']}]->(TheBirdcage),
      (MikeN)-[:DIRECTED]->(TheBirdcage)

      CREATE (Unforgiven:Movie {title:'Unforgiven', released:1992, tagline:"It's a hell of a thing, killing a man"})
      CREATE (RichardH:Person {name:'Richard Harris', born:1930})
      CREATE (ClintE:Person {name:'Clint Eastwood', born:1930})
      CREATE
      (RichardH)-[:ACTED_IN {roles:['English Bob']}]->(Unforgiven),
      (ClintE)-[:ACTED_IN {roles:['Bill Munny']}]->(Unforgiven),
      (Gene)-[:ACTED_IN {roles:['Little Bill Daggett']}]->(Unforgiven),
      (ClintE)-[:DIRECTED]->(Unforgiven)

      CREATE (JohnnyMnemonic:Movie {title:'Johnny Mnemonic', released:1995, tagline:'The hottest data on earth. In the coolest head in town'})
      CREATE (Takeshi:Person {name:'Takeshi Kitano', born:1947})
      CREATE (Dina:Person {name:'Dina Meyer', born:1968})
      CREATE (IceT:Person {name:'Ice-T', born:1958})


      (TheDaVinciCode),
      (JessicaThompson)-[:REVIEWED {summary:'You had me at Jerry', rating:92}]->(JerryMaguire)

      WITH TomH as a
      MATCH (a)-[:ACTED_IN]->(m)<-[:DIRECTED]-(d) RETURN a,m,d LIMIT 10;