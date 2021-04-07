Alias: USCorePatient = http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient

Profile:  EmploymentHistoryEpisode
Parent:   Observation
Id:       odh-EmploymentHistoryEpisode
Title:    "Employment History Episode"
Description:   "Employment history consists of a series Employment Episodes. In the past these episodes have been represented as Z-segments and added to various transactions to support social history determination, benefit, etc. This profile is intended to represent employment history for International use and it may be localized by HL7, IHE, and other profile developers.
The Employment Episode profile of is the base profile for Military Service Episode profile and ODH Past or Present Job profile and other profiles intended to describe specific types of employment. 
This profile is marked as 'constrainable' because it's intended to be reused to create additional profile, more specific, or localized to jurisdiction."
* ^abstract = true
* category.coding = http://terminology.hl7.org/CodeSystem/observation-category#social-history
* status and code and subject and effective[x] and valueCodeableConcept MS
* value[x] only CodeableConcept
* value[x] from  2.16.840.1.114222.4.11.7901 (preferred)
* effective[x] only Period
* effectivePeriod.start 0..1 
* effectivePeriod.end 0..1
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
* referenceRange 0..0
* derivedFrom 0..0
* subject only Reference(Patient)
* subject 1..1
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Slice based on the component.code pattern"

* component contains 	odh-Industry 0..1 and 
						odh-SupervisoryLevel 0..1 and 
						odh-Occupation 0..1 and 
						odh-OccupationalHazard 0..1 and
//						odh-WorkSchedule 0..1 and
						odh-WeeklyWorkDays 0..1 and
						odh-DailyWorkHours 0..1 
//					and	odh-IsCurrentJob 0..1 

* component[odh-Industry].code =  LNC#86188-0 "History of Occupation industry"
* component[odh-Industry].value[x] only CodeableConcept   
* component[odh-Industry].value[x] 1..1
* component[odh-Industry].valueCodeableConcept from 2.16.840.1.114222.4.5.327
 
* component[odh-SupervisoryLevel].code =  LNC#87707-6
* component[odh-SupervisoryLevel].value[x] only CodeableConcept
* component[odh-SupervisoryLevel].value[x] 1..1
* component[odh-SupervisoryLevel].valueCodeableConcept from  2.16.840.1.114222.4.11.7613

* component[odh-Occupation].code =  LNC#63761-1
* component[odh-Occupation].value[x] only string
* component[odh-Occupation].valueString 1..1

* component[odh-OccupationalHazard].code =  LNC#87729-0
* component[odh-OccupationalHazard].value[x] only string

* component[odh-WeeklyWorkDays].code =  LNC#74160-3
* component[odh-WeeklyWorkDays].value[x] only Quantity
* component[odh-WeeklyWorkDays].valueQuantity.code = UCUM#h

* component[odh-DailyWorkHours].code =  LNC#87512-0
* component[odh-DailyWorkHours].value[x] only Quantity
* component[odh-DailyWorkHours].valueQuantity.code = UCUM#h

* valueCodeableConcept from 2.16.840.1.114222.4.11.7901
