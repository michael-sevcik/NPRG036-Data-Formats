.[] | select(.streets[] | .houses[] | .occupants[] | .firstName.cs == "Michael") | .townName.cs