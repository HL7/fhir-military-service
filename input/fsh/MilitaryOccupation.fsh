Alias: USCorePatient = http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient
Alias: ODHPastOrPresentJob = http://hl7.org/fhir/us/odh/StructureDefinition/odh-PastOrPresentJob


Profile:  MilitaryOccupation
Parent:    EmploymentHistoryEpisode
Id:       military-service-Occupation
Title:    "Military Occupation"
Description:   "The profile is intended to reusee ODH PastOrPresentJob profile to apply it specifically to military jobs/occupations.
The observation  resource that conforms to this specification is referenced by Military Service Episode.  However, due to tooling issues
this profile is uses the abstract, base profile [Employment History Episode] (StructureDefinition-odh-EmploymentHistoryEpisode).
A veteran may have several occupation during a single service episode."
* subject 1..1
* valueCodeableConcept 1..1
* valueCodeableConcept from MilitaryOccupationValueSet
