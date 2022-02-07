Profile:  DeploymentEpisode
Parent:   EmploymentHistoryEpisode
Id:       deploymentepisode
Title:    "Deployment Episode"
Description:   "This profile definition similar to Combat Zone Period profile (url: http://hl7.org/fhir/us/odh/StructureDefinition/odh-CombatZonePeriod )  and includes the requirements specified in ZMH and Deployment Schema.
The base profile reuses the pattern Combat Zone Period profilee and adds new components. However, since it's intended to share 'deployment' information this profile is more generic than that specified in ODH."
* status and code and subject and effectivePeriod and component MS
* code 1..1
* code  = SOLOR#f6bb8fdc-89b0-4c0b-8d81-d3916f182c2f "Deployment Episode"
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
* component contains military-service-CombatEpisodeCountryCode 1..1 and 
                     military-service-CombatEpisodeMissionCode 0..1
* component[military-service-CombatEpisodeCountryCode].code =  SOLOR#7E33243654BB42F5BF3F3A59E0E6E6BD "Combat Episode Country Code"
* component[military-service-CombatEpisodeCountryCode].value[x] only CodeableConcept
* component[military-service-CombatEpisodeCountryCode].value[x] 1..1
* component[military-service-CombatEpisodeCountryCode].value[x] from http://hl7.org/fhir/ValueSet/iso3166-1-3 (required)
* component[military-service-CombatEpisodeCountryCode].dataAbsentReason 0..0
* component[military-service-CombatEpisodeCountryCode].interpretation 0..0
* component[military-service-CombatEpisodeCountryCode].referenceRange 0..0

* component[military-service-CombatEpisodeMissionCode].code =  SOLOR#BF3432CC716B4DC7AA0DF43C176F4F05 "Combat Episode Mission Code"
* component[military-service-CombatEpisodeMissionCode].value[x] only CodeableConcept
* component[military-service-CombatEpisodeMissionCode].value[x] 1..1
* component[military-service-CombatEpisodeMissionCode].value[x] from CombatEpisodeMissionVS
* component[military-service-CombatEpisodeMissionCode].dataAbsentReason 0..0
* component[military-service-CombatEpisodeMissionCode].interpretation 0..0
* component[military-service-CombatEpisodeMissionCode].referenceRange 0..0
