Profile:  CombatEpisode
Parent:   Observation
Id:       combatepisode
Title:    "Combat Episode"
Description:   "Combat Episode: This profile definition extends Combat Zone Period profile (url: http://hl7.org/fhir/us/odh/StructureDefinition/odh-CombatZonePeriod )  and includes the requirements specified in ZMH and Deployment Schema. The base profile is: http://hl7.org/fhir/us/odh/StructureDefinition/odh-CombatZonePeriod"
* status and code and subject and effectivePeriod and component MS
* code 1..1
* code  = SOLOR#3209820D5C9F4F4E855C5783E8F49228 "Combat Episode"
* subject only Reference(Patient)
* subject 1..1
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
* hasMember 0..0
* derivedFrom 0..0
* effective[x] only Period
* effectivePeriod 1..1
* effectivePeriod.start 1..1
* effectivePeriod.end 1..1
* note 0..1 
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Slice based on the component.code pattern"
* component contains mshs-CombatEpisodeCountryCode 1..1 and 
                     mshs-CombatEpisodeMissionCode 0..1
* component[mshs-CombatEpisodeCountryCode].code =  SOLOR#7E33243654BB42F5BF3F3A59E0E6E6BD "Combat Episode Country Code"
* component[mshs-CombatEpisodeCountryCode].value[x] only CodeableConcept
* component[mshs-CombatEpisodeCountryCode].valueCodeableConcept 1..1
* component[mshs-CombatEpisodeCountryCode].valueCodeableConcept from http://hl7.org/fhir/ValueSet/iso3166-1-3 (preferred)
* component[mshs-CombatEpisodeCountryCode].dataAbsentReason 0..0
* component[mshs-CombatEpisodeCountryCode].interpretation 0..0
* component[mshs-CombatEpisodeCountryCode].referenceRange 0..0

* component[mshs-CombatEpisodeMissionCode].code =  SOLOR#BF3432CC716B4DC7AA0DF43C176F4F05 "Combat Episode Mission Code"
* component[mshs-CombatEpisodeMissionCode].value[x] only CodeableConcept
* component[mshs-CombatEpisodeMissionCode].valueCodeableConcept 1..1
* component[mshs-CombatEpisodeMissionCode].valueCodeableConcept from CombatEpisodeMissionValueSet
* component[mshs-CombatEpisodeMissionCode].dataAbsentReason 0..0
* component[mshs-CombatEpisodeMissionCode].interpretation 0..0
* component[mshs-CombatEpisodeMissionCode].referenceRange 0..0
