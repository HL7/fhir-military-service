Alias: USCorePatient = http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient

Profile:  MilitaryOccupation
Parent:    Observation
Id:       military-service-Occupation
Title:    "Military Occupation"
Description:   "The profile reuses the ODH PastOrPresentJob profile to apply it specifically to military jobs/occupations.
The observation resource that conforms to this specification is referenced by Military Service Episode."
* category and status and code and subject and effectivePeriod and component and valueCodeableConcept MS
* id 1..1 
* code 1..1 MS
* code  = LNC#11341-5 "History of Occupation"
* subject only Reference(USVeteran)
* subject 1..1 MS
* basedOn 0..0
* partOf 0..0
* focus 0..0
* encounter 0..0
* issued 0..0
* performer 0..0
* dataAbsentReason 0..0
* interpretation 0..0
* bodySite 0..0
* method 0..0
* specimen 0..0
* device 0..0
* derivedFrom 0..0
* effective[x] only Period
* effectivePeriod 1..1 
* effectivePeriod.start 1..1
* effectivePeriod.start ^short = "Start date of the completed deployment"
* effectivePeriod.end 1..1 
* effectivePeriod.end ^short = "End date of the completed deployment"
* effectivePeriod ^short = "Period of the completed deployment"
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains msoca 1..1
* category[msoca] = http://terminology.hl7.org/CodeSystem/observation-category#social-history
* note 0..1 
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Slice based on the component.code pattern"
* component contains military-service-payGrade 0..1 MS
* component[military-service-payGrade].code =  LNC#87707-6 "Job supervisory level or pay grade"
* component[military-service-payGrade].value[x] only CodeableConcept
* component[military-service-payGrade].value[x] 0..1 MS
* component[military-service-payGrade].value[x] from PayGradeVS  (required) 
* valueCodeableConcept 1..1 MS
* valueCodeableConcept from MilitaryOccupationVS 

