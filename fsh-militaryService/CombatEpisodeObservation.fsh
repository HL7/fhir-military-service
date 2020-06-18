Profile:  CombatEpisodeObservation
Parent:   Observation
Id:       combatepisode-observation
Title:    "Combat Episode Observation"
Description:   "Combat Episode Observation: This profile definition extends Combat Zone Period profile (url: http://hl7.org/fhir/us/odh/StructureDefinition/odh-CombatZonePeriod )  and includes the requirements specified in ZMH and Deployment Schema. The base profile is: http://hl7.org/fhir/us/odh/StructureDefinition/odh-CombatZonePeriod"

* status, code, subject MS

* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Slice based on the component.code pattern"
* component contains 	mshs-CombatEpisodeCountryCode 1..1 and mshs-CombatEpisodeMissionCode 0..1
* component[mshs-CombatEpisodeCountryCode].code =  http://loinc.org#48018-6
* component[mshs-CombatEpisodeCountryCode].value[x] only CodeableConcept
* component[mshs-CombatEpisodeCountryCode].valueCodeableConcept 1..1
* component[mshs-CombatEpisodeCountryCode].valueCodeableConcept from https://www.iso.org/iso-3166-country-codes (preferred)
* component[mshs-CombatEpisodeMissionCode].code =  http://loinc.org#48018-6    
* component[mshs-CombatEpisodeMissionCode].value[x] only CodeableConcept
* component[mshs-CombatEpisodeMissionCode].valueCodeableConcept 1..1
* component[mshs-CombatEpisodeMissionCode].valueCodeableConcept from https://snomedtbd

