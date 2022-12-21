import (
    "strings"
    "time"
)
#Entity: {
    knownAs: string | *""
    ownership: "public investors" | "private investors" | "members" | *""
    organizationalForm: "individual" | "company" | "consortium" | *""
    description: string | *""
    comment: string | *""
    governmental: "federal" | "regional" | "state" | "local" | *""
    domain: string | *"electric power"
    name: string | *""
    endUser: true || false | *false
    serviceProvider: true || false | *false
    BUSINESS_RELATIONSHIP_WITH_Entity?: [...#EDGE_BUSINESS_RELATIONSHIP_WITH_Entity]
    ADOPTED_Initiative?: [...#EDGE_ADOPTED_Initiative]
    PROVIDES_Service?: {
        WHERE: #REF_TO_SERVICE
    }
    OPERATES_Project?: [...#EDGE_OPERATES_Project]
    LOCATED_IN_Place?: {
        WHERE: #REF_TO_PLACE
    }
}

Entity: #Entity & {
}

#Service: {
    powerDeliveryMW: float | *0.0
    solarPowerCapacityMWhYear: float | *0.0
    biomassCarbonImpact: "emissions neutral" | "reduces existing emissions" |  "non-positive impact" | *""
    hydroCaptureType: "run of river" | "dam" | *""
    powerStorageType: "battery (electrochemical)" | "heat or inertia" | "pumped storage" | "reservoir" | *""
    gridStabilization: "increases" | "neutral" | "decreases" | *""
    powerGenerationMW: float | *0.0
    geoThermalPowerCapacityMW: float | *0.0
    sustainabiltyFocused: true || false | *false
    electricUtilityService: true || false | *false
    solarCaptureTechnology: string | *""
    geoThermalCaptureType: string | *""
    domain: string | *"electric power"
    solarPlantType: "farm" | "virtual farm" | "non-farm" | *""
    windPowerCapacityMWhYear: float | *0.0
    windCaptureTechnology: "horizontal" | "vertical" | "bladeless" | *""
    economicModel: "community benefits" | "public benefits" | "financial returns" | *""
    geographicalScale: "local" | "regional" | "national" | *""
    electricTransmissionService: true || false | *false
    comment: string | *""
    description: string | *""
    nuclearPowerTechnology: string | *""
    powerStorageMW: float | *0.0
    windPowerCapacityMW: float | *0.0
    nuclearPowerCapacityMW: float | *0.0
    solarPowerCapacityMW: float | *0.0
    windPlantType: "onshore" | "offshore fixed" | "offshore floating" | *""
    biomassPowerMWhYear: float | *0.0
    biomassCaptureType: "waste-to-energy" | "methane capture" | *""
    targetUsers: "commercial" | "residential" | *""
    hydroPowerCapacityMW: float | *0.0
    electricWholesalingService: true || false | *false
    PROVIDED_TO_Entity?: {
        WHERE: #REF_TO_ENTITY
    }
}

Service: #Service & {
}

#Project: {
    operationalDate: string | *""
    usesNaturalResource: "river" | "enclosed water body" | "ocean" | "wetland"  | "unused land" | *""
    usesBuiltResource: "canal" | "reservoir" | "existing structure" | "new structure" | "industrial, transit or commercial facility" | "farmland" | "developed land" | "brownfield" | *""
    description: string | *""
    comment: string | *""
    domain: string | *"electric power"
    knownAs: string | *""
    projectState: "potential"| "proposed" | "in process" | "operational" | "upgrade" | "decomissioning" | *""
    LOCATED_IN_Place?: {
        WHERE: #REF_TO_PLACE
    }
    ENABLES_Service?: {
        WHERE: #REF_TO_SERVICE
    }
}

Project: #Project & {
}

#Initiative: {
    comment: string | *""
    domain: string | *"electric power"
    knownAs: string | *""
    purpose: string | *""
    decarbonizationPlan: true || false | *false
    mandatedDecarbonizationTargets: string | *"percent, date"
    voluntaryDecarbonizationTargets: string | *"percent, date"
    description: string | *""
    COMPLIES_WITH_Regulation?: [...#EDGE_COMPLIES_WITH_Regulation]
    SUPPORTS_Project?: {
        WHERE: #REF_TO_PROJECT
    }
    APPLIES_TO_Place?: {
        WHERE: #REF_TO_PLACE
    }
    SUPPORTS_Service?: {
        WHERE: #REF_TO_SERVICE
    }
}

Initiative: #Initiative & {
}

#Regulation: {
    relatedRegulation: string | *""
    description: string | *""
    comment: string | *""
    domain: string | *"electric power"
    knownAs: string | *""
    statutoryTextLink: string | *""
    purpose: string | *""
    APPLIES_TO_Place?: {
        WHERE: #REF_TO_PLACE
    }
    APPLIES_TO_Entity?: {
        WHERE: #REF_TO_ENTITY
    }
    APPLIES_TO_Service?: {
        WHERE: #REF_TO_SERVICE
    }
    APPLIES_TO_Project?: {
        WHERE: #REF_TO_PROJECT
    }
}

Regulation: #Regulation & {
}

#Place: {
    knownAs: string | *""
    description: string | *""
    state: string | *""
    city: string | *""
    internationalRegion: string | *""
    multistateRegion: string | *""
    gridCoordinates: [float | *0.0, float | *0.0]
    comment: string | *""
    country: string | *""
    county: string | *""
}

Place: #Place & {
}

#GovernmentAuthority: {
    regulatoryAgency: true || false | *false
    description: string | *""
    comment: string | *""
    knownAs: string | *""
    level: "federal" | "regional" | "state" | "local" | *"" 
    domain: string | *"electric power"
    ADOPTED_Regulation?: [...#EDGE_ADOPTED_Regulation]
    REGULATES_Project?: {
        WHERE: #REF_TO_PROJECT
    }
    REGULATES_Service?: {
        WHERE: #REF_TO_SERVICE
    }
    REGULATES_Entity?: {
        WHERE: #REF_TO_ENTITY
    }
    LOCATED_IN_Place?: {
        WHERE: #REF_TO_PLACE
    }
}

GovernmentAuthority: #GovernmentAuthority & {
}

#Graph: {
    Entities: [...Entity]
    Services: [...Service]
    Projects: [...Project]
    Initiatives: [...Initiative]
    Regulations: [...Regulation]
    Places: [...Place]
    GovernmentAuthorities: [...GovernmentAuthority]
}

graph: #Graph & {
}


#EDGE_BUSINESS_RELATIONSHIP_WITH_Entity: {
    businessRelationshipType: "partnership" | "contractual commitment" | "subsidiary of" | "affiliate of" | *""
    description: string | *""
    comment: string | *""
    WHERE: #REF_TO_ENTITY
}
#EDGE_ADOPTED_Initiative: {
    adoptionDate: string | *""
    WHERE: #REF_TO_INITIATIVE
}
#EDGE_PROVIDES_Service: {
    WHERE: #REF_TO_SERVICE
}
#EDGE_OPERATES_Project: {
    role: "owns" | "manages" | "oversees" | *""
    WHERE: #REF_TO_PROJECT
}
#EDGE_LOCATED_IN_Place: {
    WHERE: #REF_TO_PLACE
}
#EDGE_PROVIDED_TO_Entity: {
    WHERE: #REF_TO_ENTITY
}
#EDGE_LOCATED_IN_Place: {
    WHERE: #REF_TO_PLACE
}
#EDGE_ENABLES_Service: {
    WHERE: #REF_TO_SERVICE
}
#EDGE_COMPLIES_WITH_Regulation: {
    compliance: "mandatory" | "optional" | *""
    WHERE: #REF_TO_REGULATION
}
#EDGE_SUPPORTS_Project: {
    WHERE: #REF_TO_PROJECT
}
#EDGE_APPLIES_TO_Place: {
    WHERE: #REF_TO_PLACE
}
#EDGE_SUPPORTS_Service: {
    WHERE: #REF_TO_SERVICE
}
#EDGE_APPLIES_TO_Place: {
    WHERE: #REF_TO_PLACE
}
#EDGE_APPLIES_TO_Entity: {
    WHERE: #REF_TO_ENTITY
}
#EDGE_APPLIES_TO_Service: {
    WHERE: #REF_TO_SERVICE
}
#EDGE_APPLIES_TO_Project: {
    WHERE: #REF_TO_PROJECT
}
#EDGE_ADOPTED_Regulation: {
    adoptionDate: string | *""
    WHERE: #REF_TO_REGULATION
}
#EDGE_REGULATES_Project: {
    WHERE: #REF_TO_PROJECT
}
#EDGE_REGULATES_Service: {
    WHERE: #REF_TO_SERVICE
}
#EDGE_REGULATES_Entity: {
    WHERE: #REF_TO_ENTITY
}
#EDGE_LOCATED_IN_Place: {
    WHERE: #REF_TO_PLACE
}
#REF_TO_ENTITY: {
    domain: string | *"electric power"
    knownAs: string | *""
}
#REF_TO_INITIATIVE: {
    domain: string | *"electric power"
    knownAs: string | *""
    purpose: string | *""
}
#REF_TO_PLACE: {
    knownAs: string | *""
}
#REF_TO_PROJECT: {
    domain: string | *"electric power"
    knownAs: string | *""
}
#REF_TO_REGULATION: {
    knownAs: string | *""
}
#REF_TO_SERVICE: {
    description: string | *""
    domain: string | *"electric power"
}
graph: #Graph
