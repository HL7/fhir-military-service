Alias: USCorePatient = http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient


Profile:  MilitaryOccupation
Parent:   EmploymentHistoryEpisode
Id:       msh-militaryOccupation
Title:    "Military Occupation"
Description:   "Military Occupation"
* subject 1..1
* code = SOLOR#41C89BB67C9C48BFB718F57FAA6F3266

* effective[x] only Period
* effectivePeriod 1..1
* effectivePeriod.start 1..1
* effectivePeriod.end 0..1

* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Slice based on the component.code pattern"
* component contains mseo-Occupation 0..1

* component[mseo-Occupation].code =  SOLOR#175ECB0F9DBC41708BC7ABD3468E7F53 "Military occupation"
* component[mseo-Occupation].value[x] only CodeableConcept
* component[mseo-Occupation].valueCodeableConcept 1..1
* component[mseo-Occupation].valueCodeableConcept from  MilitaryOccupationValueSet
