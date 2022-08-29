Alias: USCorePatient = http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient
Alias: ODHPastOrPresentJob = http://hl7.org/fhir/us/odh/StructureDefinition/odh-PastOrPresentJob


Profile:  MilitaryOccupation
Parent:    ODHPastOrPresentJob
Id:       military-service-Occupation
Title:    "Military Occupation"
Description:   "The profile reuses the ODH PastOrPresentJob profile to apply it specifically to military jobs/occupations.
The observation resource that conforms to this specification is referenced by Military Service Episode."
* subject 1..1
* valueCodeableConcept 1..1
* valueCodeableConcept from MilitaryOccupationVS 

