Alias: USCorePatient = http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient
Alias: ODHPastOrPresentJob = http://hl7.org/fhir/us/odh/StructureDefinition/odh-PastOrPresentJob


Profile:  MilitaryOccupation
Parent:    ODHPastOrPresentJob
Id:       military-service-Occupation
Title:    "Military Occupation"
Description:   "The profile reuses the ODH PastOrPresentJob profile to apply it specifically to military jobs/occupations.
The observation resource that conforms to this specification is referenced by Military Service Episode."

* component contains msh-SupervisoryLevel 0..1  
 
* component[msh-SupervisoryLevel].code =  LNC#87707-6 "Supervisory level or pay grade"
* component[msh-SupervisoryLevel].value[x] only CodeableConcept
* component[msh-SupervisoryLevel].value[x] 1..1
* component[msh-SupervisoryLevel].value[x] from https://phinvads.cdc.gov/vads/ViewValueSet.action?oid=2.16.840.1.114222.4.11.7613  (preferred) 

* subject 1..1
* valueCodeableConcept 1..1
* valueCodeableConcept from MilitaryOccupationVS 

