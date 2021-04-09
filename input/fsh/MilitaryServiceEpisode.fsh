// Code Systems

Profile:  MilitaryServiceEpisode
Parent:   Observation
Id:       msh-militaryserviceepisode
Title:    "Military Service Episode"
Description:   "A patient/Veteran may have zero or more military service episodes. The contents of this profile is based on the HL7 Version 2 ZMH segment and the ServiceHistoryEpisode schema specified in the current Veteran Verification API and it allows this API to migrate to FHIR and to be consistent with the prior work done by Center for Disease Control (CDC) National Institute for Occupational Safety and Health (NIOSH).  A service history episode may reference zero or more Combat episodes. This profile is based on the default FHIR Observation profile but may reuse ODD Past or Present Job profile ( http://hl.org/fhir/us/odh/StructureDefinition-odh-PastOrPresentJob.html)."
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
* hasMember contains DeploymentEpisode 0..* MS
* hasMember[DeploymentEpisode] only Reference(DeploymentEpisode)

* hasMember ^slicing.discriminator.type = #profile // #pattern
* hasMember ^slicing.discriminator.path =  "$this.resolve()" // "$this.resolve().code"
* hasMember ^slicing.rules = #open
* hasMember contains MilitaryOccupation 0..* MS
* hasMember[MilitaryOccupation] only Reference(MilitaryOccupation)

* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Slice based on the component.code pattern"

* component contains mseo-Industry 1..1 and
					 mseo-DischargeStatus 1..1 and
					 mseo-SeparationReason 0..1  


* component[mseo-Industry].code =  LNC#86188-0 "History of Occupation industry"
* component[mseo-Industry].value[x] only CodeableConcept   
* component[mseo-Industry].value[x] 1..1
* component[mseo-Industry].valueCodeableConcept from MilitaryBranchCode


* component[mseo-DischargeStatus].code =  SOLOR#9B7095A70B024CD789A36E48A3936592 "Discharge Status"
* component[mseo-DischargeStatus].value[x] only CodeableConcept   
* component[mseo-DischargeStatus].valueCodeableConcept 1..1 MS
* component[mseo-DischargeStatus].valueCodeableConcept from  DischargeStatusValueSet


* component[mseo-SeparationReason].code =  SOLOR#9CEAD6537D6A4F198549F70598B8F8BF "Separation Reason"
* component[mseo-SeparationReason].value[x] only CodeableConcept   
* component[mseo-SeparationReason].valueCodeableConcept 1..1 MS
* component[mseo-SeparationReason].valueCodeableConcept from  SeparationReasonValueSet



Instance: VeteranStatus
InstanceOf: OperationDefinition
Title: "Veteran Status Verification and Confirmation - Operation"
Usage: #definition
* name = "VeteranStatus"
* description = "The Veteran Status Operation returns 'true' or 'false' based on the known veteran status of the patient.  The API should be used as part of use cases needing general veteran status and not neccesarily be used as part of eligibilty."
* status = #draft "draft"
* kind = #query "query"
* code = #veteranStatus "veteranStatus"
* system = true
* type = false
* instance = false
* resource = #Patient "Patient"
* parameter[0].name = #firstName "firstName" //Veteran's first name
* parameter[0].use = #in "in"
* parameter[0].min = 1
* parameter[0].max = "1"
* parameter[0].type = #string "String"
* parameter[1].name = #last "lastName" //Veteran's last
* parameter[1].use = #in "in"
* parameter[1].min = 1
* parameter[1].max = "1"
* parameter[1].type = #string "String"
* parameter[2].name = #middleName "middleName" //Veteran's middle name
* parameter[2].use = #in "in"
* parameter[2].min = 0
* parameter[2].max = "1"
* parameter[2].type = #string "String
"

* parameter[3].name = #veteranSSN "veteranSSN" //Social security number used for identity matching, not stored by the system
* parameter[3].use = #in "in"
* parameter[3].min = 1
* parameter[3].max = "1"
* parameter[3].type = #Identifier "Identifier"

* parameter[4].name = #dateOfBirth "dateOfBirth" // Date of Birth
* parameter[4].use = #in "in"
* parameter[4].min = 1
* parameter[4].max = "1"
* parameter[4].type = #date "date"

* parameter[5].name = #gender "gender" //Veteran's gender
* parameter[5].use = #in "in"
* parameter[5].min = 0
* parameter[5].max = "1"
* parameter[5].type = #code "code"

* parameter[6].name = #veterandateStatus "veteranStatus" //Veteran status confirmed by VA
* parameter[6].use = #out "out"
* parameter[6].min = 1
* parameter[6].max = "1"
* parameter[6].type = #boolean "boolean"



