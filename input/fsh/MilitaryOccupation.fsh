Alias: USCorePatient = http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient
Alias: ODHPastOrPresentJob = http://hl7.org/fhir/us/odh/StructureDefinition/odh-PastOrPresentJob


Profile:  MilitaryOccupation
Parent:    ODHPastOrPresentJob
Id:       msh-militaryOccupation
Title:    "Military Occupation"
Description:   "The profile reuses the ODH PastOrPresentJob profile to apply it specifically to military jobs/occupations.
The observation  resource that conforms to this specification is referenced by Military Service Episode. A veteran may have several occupation during a single service episode."
* subject 1..1
* valueCodeableConcept 1..1  
* valueCodeableConcept from  MilitaryOccupationValueSet
//* code = SOLOR#4ec176a2-9afb-4b52-a011-d9a25c360d95

//* effective[x] only Period
//* effectivePeriod 1..1
//* effectivePeriod.start 1..1
//* effectivePeriod.end 0..1

// * component ^slicing.discriminator.type = #pattern
// * component ^slicing.discriminator.path = "code.coding.code"
// * component ^slicing.rules = #open
// * component ^slicing.description = "code.coding.code Slice based on the component.code pattern"
//* component contains mseo-Occupation 0..1

//* component[mseo-Occupation].code =  SOLOR#175ECB0F9DBC41708BC7ABD3468E7F53 "Military occupation"
//* component[mseo-Occupation].value[x] only CodeableConcept
//* component[mseo-Occupation].valueCodeableConcept 1..1
//* component[odh-PastOrPresentIndustry].valueCodeableConcept from  MilitaryOccupationValueSet
