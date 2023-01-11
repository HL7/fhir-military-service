// Code Systems

Profile:  MilitaryServiceEpisode
Parent:   Observation
Id:       military-service-episode
Title:    "Military Service Episode"
Description:   "Military Service Episode describes a patient/veterans overall experiences of a militiary employment.  The profile references military deployments and occupations as well as military branche, seperation and discharge status.  A patient/Veteran may have zero or more military service episodes. The episode documents the time spent in the military organization, the dischage status and reason, and a collection of deployment episodes"
* status and code and subject and effectivePeriod and component MS
* id 1..1 
* identifier 0..1 
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
* code = LNC#87511-2 
* subject 1..1 MS
* subject only Reference(USVeteran)
* effective[x] only Period
* effectivePeriod 1..1 MS
* effectivePeriod.start 1..1 MS
* effectivePeriod.end 0..1 MS 
* category.coding = http://terminology.hl7.org/CodeSystem/observation-category#social-history


* hasMember ^slicing.discriminator.type = #profile // #pattern
* hasMember ^slicing.discriminator.path =  "$this.resolve()" // "$this.resolve().code"
* hasMember ^slicing.rules = #open
* hasMember contains DeploymentHistoryEpisode 0..* MS
* hasMember[DeploymentHistoryEpisode] only Reference(DeploymentHistoryEpisode)

* hasMember ^slicing.discriminator.type = #profile // #pattern
* hasMember ^slicing.discriminator.path =  "$this.resolve()" // "$this.resolve().code"
* hasMember ^slicing.rules = #open
* hasMember contains MilitaryOccupation 0..* MS
* hasMember[MilitaryOccupation] only Reference(MilitaryOccupation)

* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Slice based on the component.code pattern"

* component contains military-service-Industry 1..1 and
					 military-service-DischargeStatus 0..1 and
					 military-service-SeparationReason 0..1  


* component[military-service-Industry].code =  LNC#11341-5 "History of Occupation"
* component[military-service-Industry].value[x] only CodeableConcept   
* component[military-service-Industry].value[x] 1..1
* component[military-service-Industry].valueCodeableConcept from MilitaryBranchVS  (extensible)


* component[military-service-DischargeStatus].code =  MSHCS#9B7095A70B024CD789A36E48A3936592 "Discharge Status"
* component[military-service-DischargeStatus].value[x] only CodeableConcept   
* component[military-service-DischargeStatus].valueCodeableConcept 1..1 MS
* component[military-service-DischargeStatus].valueCodeableConcept from  DischargeStatusVS  (extensible)


* component[military-service-SeparationReason].code =  MSHCS#9CEAD6537D6A4F198549F70598B8F8BF "Separation Reason"
* component[military-service-SeparationReason].value[x] only CodeableConcept   
* component[military-service-SeparationReason].valueCodeableConcept 1..1 MS
* component[military-service-SeparationReason].valueCodeableConcept from  SeparationReasonVS  (extensible)






