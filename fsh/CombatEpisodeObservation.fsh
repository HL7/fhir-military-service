Profile:  CombatEpisodeObservation
Parent:   Observation
Id:       combatepisode-observation
Title:    "Combat Episode Observation"
Description:   "Combat Episode Observation: This profile definition extends Combat Zone Period profile (url: http://hl7.org/fhir/us/odh/StructureDefinition/odh-CombatZonePeriod )  and includes the requirements specified in ZMH and Deployment Schema. The base profile is: http://hl7.org/fhir/us/odh/StructureDefinition/odh-CombatZonePeriod"

* status and code and subject and effectivePeriod and component MS
* code 1..1
* code  = LNC#99999-9 "Combat Episode Observation"
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
* component contains 	mshs-CombatEpisodeCountryCode 1..1 and mshs-CombatEpisodeMissionCode 0..1
* component[mshs-CombatEpisodeCountryCode].code =  http://loinc.org#99999-9 "Combat Episode Country Code"
* component[mshs-CombatEpisodeCountryCode].value[x] only CodeableConcept
* component[mshs-CombatEpisodeCountryCode].valueCodeableConcept 1..1
* component[mshs-CombatEpisodeCountryCode].valueCodeableConcept from https://www.iso.org/iso-3166-country-codes (preferred)
* component[mshs-CombatEpisodeMissionCode].code =  http://loinc.org#99999-9 "Combat Episode Mission Code"
* component[mshs-CombatEpisodeMissionCode].value[x] only CodeableConcept
* component[mshs-CombatEpisodeMissionCode].valueCodeableConcept 1..1
* component[mshs-CombatEpisodeMissionCode].valueCodeableConcept from https://snomedtbd
* component[mshs-CombatEpisodeCountryCode].dataAbsentReason 0..0
* component[mshs-CombatEpisodeCountryCode].interpretation 0..0
* component[mshs-CombatEpisodeCountryCode].referenceRange 0..0
* component[mshs-CombatEpisodeMissionCode].dataAbsentReason 0..0
* component[mshs-CombatEpisodeMissionCode].interpretation 0..0
* component[mshs-CombatEpisodeMissionCode].referenceRange 0..0
