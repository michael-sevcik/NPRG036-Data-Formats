## Get names of mayors whose term has ended

# Filter for towns
.[]
| select(.type == "Town")

# Filter for mayors with term end date before or equal to "2023-01-01"
| .mayor
| select(.termEnd | if . then . <= "2023-01-01" else false end)

# Map to extract mayor names
| { firstName: .firstName.cs, surname: .surname.cs }
