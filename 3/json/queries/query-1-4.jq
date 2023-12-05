."@graph" | .[] | .streets[] | select(.hasSidewalk) | .streetName as $street_name | reduce .houses[] as $house (0; . + ($house.occupants | length)) | {
    streetName: $street_name,
    numberOfOccupants: .
}