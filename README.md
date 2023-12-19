# NPRG036-Data-Formats
Repository for collaborating on team assignments from MFF NPRG036 Data Formats course...

## How to generate Turtle with prefixes from N-Triples?

Create prefixes file containing all the desired prefix definitions
```ttl
@prefix dbo:  <http://dbpedia.org/resource/classes/> .
@prefix ex:   <http://example.org/vocabulary/> .
@prefix exH:  <http://example.org/houses/> .
@prefix exP:  <http://example.org/people/> .
@prefix exS:  <http://example.org/streets/> .
@prefix exT:  <http://example.org/towns/> .
@prefix foaf: <http://xmlns.com/foaf/0.1/> .
@prefix xsd:  <http://www.w3.org/2001/XMLSchema#> .
```

and use following command:
```cmd
docker run --rm --volume .:/rdf stain/jena riot --pretty Turtle prefixes.ttl output.nt > data.ttl
```
