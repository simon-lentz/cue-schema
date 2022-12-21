package test_pkg

#Entity: {
	governmental:       "federal" | "regional" | "state" | "local" | *"N/A"
	domain:             string | *"electric power"
	name:               string | *"test"
	knownAs:            string | *"\( name )"
	organizationalForm: "individual" | "company" | "consortium" | *"unknown"
	description:        string | *"N/A"
	endUser:            true || false | *false
	serviceProvider:    true || false | *false
	ownership:          "public investors" | "private investors" | "members" | *"unknown"
	comment:            string | *"N/A"
}

#Location: {
	Country:       string | *"US"
	State:         string | *"N/A"
	streetAddress: string | *"unknown"
	gridCoordinates: {
		x: float | *0.0
		y: float | *0.0
	}
}

#Project: {
	customersServed: int & >=0 | *0
}

#Graph: {
	Projects: [...Project]
	Entities: [...Entity]
	Locations: [...Location]
}

Project: #Project & {
}

Entity: #Entity & {
}

Location: #Location & {
}

Graph: #Graph & {
}
