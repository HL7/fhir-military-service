Instance: sam-share-ssgt-veteran
InstanceOf: USVeteran
Description: "SamShare Example"	
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"	
* identifier.use = #usual	
* identifier.value = "1032702"	
* identifier.type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier.type.coding.code = #MR
* identifier.type.coding.display = "VA Medical Record Number"
* identifier.type.text = "VA Medical Record Number"
* identifier.system = "urn:oid:1.1.1.1.1"
* name[0].family = "Share"	
* name[0].given[0] = "Sam"	
* name[0].given[1] = "V."	
* name[0].suffix[0] = "Ssgt"
* name[0].period.start = "2016-12-06"
* name[0].period.end = "2020-07-22"
* name[1].family = "Share"	
* name[1].given[0] = "Sam"	
* name[1].given[1] = "V."	
* name[1].suffix[0] = "Retired Ssgt"
* name[1].period.start = "2020-07-22"
* gender = #male	
* active = true
* birthDate = "1987-02-20"

* extension[USVeteranStatus].valueBoolean = true

* extension[race].extension[ombCategory].valueCoding = OmbRaceCat#2106-3 "White"
* extension[race].extension[detailed].valueCoding = OmbRaceCat#2036-2 "Filipino"
* extension[race].extension[text].valueString = "Mixed"

* extension[ethnicity].extension[ombCategory].valueCoding = OmbRaceCat#2135-2 "Hispanic or Latino"
* extension[ethnicity].extension[detailed].valueCoding = OmbRaceCat#2184-0 "Dominican"
* extension[ethnicity].extension[text].valueString = "Hispanic or Latino"

* extension[birthsex].valueCode = #M


* address[0].line[0] = "49 Pleasant Hill St"
* address[0].city = "Anytowm"
* address[0].state =  "NH"
* address[0].country =  "US"
* address[0].postalCode =  "03088"
* address[0].period.start = "2016-12-06"
* address[0].period.end = "2020-07-22"
* address[1].line[0] = "183 Mountain View St"
* address[1].city = "Anytown"
* address[1].state =  "NH"
* address[1].country =  "US"
* address[1].postalCode =  "03088"
* address[1].period.start = "2020-07-22"
* telecom[0].system = #phone
* telecom[0].value = "555-555-5555"
* telecom[0].use = #home
* telecom[1].system = #email
* telecom[1].value = "sam.share@veterans-org.com"


Instance: MilitaryServiceEpisode1	
InstanceOf: MilitaryServiceEpisode	
Description: "MilitaryServiceEpisode Example"
* status = #final "final"
* subject = Reference(sam-share-ssgt-veteran)
* effectivePeriod.start = "2019-04-01"
* component[mseo-Industry].valueCodeableConcept = ODH#928110.000255	"Air Force"
* component[mseo-DischargeStatus].valueCodeableConcept = SOLOR#79A512F77CFC4E63B9969930FC8787DB "Honorable"
* component[mseo-SeparationReason].valueCodeableConcept = SOLOR#034 "Medal of Honor Recipient"


Instance: DeploymentEpisode1	
InstanceOf: DeploymentEpisode	
Description: "DeploymentEpisode Example"	
* id = "DeploymentEpisode1"	
* status = #final "final"
* subject = Reference(sam-share-ssgt-veteran)
* effectivePeriod.start = "2019-04-01"
* effectivePeriod.end = "2019-04-01"
* component[mshs-CombatEpisodeCountryCode].valueCodeableConcept = #AFG
* component[mshs-CombatEpisodeMissionCode].valueCodeableConcept = SOLOR#46a15b13-b5c1-4ae8-acde-48c31f30175a "Enduring Freedom"

Instance: DeploymentEpisode2	
InstanceOf: DeploymentEpisode	
Description: "DeploymentEpisode Example"	
* id = "DeploymentEpisode2"	
* status = #final "final"
* subject = Reference(sam-share-ssgt-veteran)
* effectivePeriod.start = "2019-04-01"
* effectivePeriod.end = "2019-04-01"
* component[mshs-CombatEpisodeCountryCode].valueCodeableConcept = #IRQ
* component[mshs-CombatEpisodeMissionCode].valueCodeableConcept = SOLOR#46a15b13-b5c1-4ae8-acde-48c31f30175a "Enduring Freedom"


Instance: DeploymentEpisode3
InstanceOf: DeploymentEpisode	
Description: "DeploymentEpisode Example"	
* id = "DeploymentEpisode"	
* status = #final "final"
* subject = Reference(sam-share-ssgt-veteran)
* effectivePeriod.start = "2019-04-01"
* effectivePeriod.end = "2019-04-01"
* component[mshs-CombatEpisodeCountryCode].valueCodeableConcept = #IRQ
* component[mshs-CombatEpisodeMissionCode].valueCodeableConcept = SOLOR#46a15b13-b5c1-4ae8-acde-48c31f30175a "Enduring Freedom"

