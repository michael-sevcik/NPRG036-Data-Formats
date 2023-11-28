[.[].tenants[] | if .studyYear > 2 then 
    (if (.givenName.cs and .familyName.cs) then .givenName.cs + " " + .familyName.cs else 
        if (.givenName.en and .familyName.en) then .givenName.en + " " + .familyName.en else .givenName.sk + " " + .familyName.sk end end) else "Too Young" end ] 