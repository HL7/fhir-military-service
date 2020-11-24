Alias: USCorePatient = http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient


Profile:  MilitaryOccupation
Parent:   PastOrPresentJob
Id:       msh-militaryOccupation
Title:    "Military Occupation"
Description:   "Employment history consists of a   series Employment Episodes. In the past these episodes have been represented as Z-segments and added to    various transactions to    support social history determination, benefit, etc. This profile is   intended to    represent employment history for International use, and it may be localized by HL7, IHE, and other profile developers.The Employment Episode profile of is   the base profile for Military Service Episode profile and ODH Past or Present Jobprofile and other profiles intended to    describe specific types of employment. MultiplicityNotes"
* subject 1..1
* code = SOLOR#41C89BB67C9C48BFB718F57FAA6F3266

* effective[x] only Period
* effectivePeriod 1..1
* effectivePeriod.start 1..1
* effectivePeriod.end 1..1


* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Slice based on the component.code pattern"
* component contains mseo-Occupation 0..1

* component[odh-SupervisoryLevel].code =  http://loinc.org#87707-6 "Job supervisory level or pay grade"
* component[odh-SupervisoryLevel].value[x] only CodeableConcept
* component[odh-SupervisoryLevel].valueCodeableConcept 1..1
* component[odh-SupervisoryLevel].valueCodeableConcept from  PayGradeCode


* component[mseo-Occupation].code =  SOLOR#175ECB0F9DBC41708BC7ABD3468E7F53 "Military occupation"
* component[mseo-Occupation].value[x] only CodeableConcept
* component[mseo-Occupation].valueCodeableConcept 1..1
* component[mseo-Occupation].valueCodeableConcept from  MilitaryOccupationValueSet
