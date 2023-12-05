."@graph" | .[] | . as $town | .streets[] | .streetName as $street_name | .houses[] | .number as $house_number | .occupants[] | select(."@id" == $town.mayor."@id") | {
    firstName: .firstName,
    surname: .surname,
    address: {
        townName: $town.townName,
        streetName: $street_name,
        houseNumber: $house_number
    }
}