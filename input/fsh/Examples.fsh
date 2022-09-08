Instance: philip-scott-example-veteran
InstanceOf: USVeteran
Description: "Phillip Scott: Veteran's patient record"	
* meta.profile = "http://hl7.org/fhir/us/military-service/StructureDefinition/usveteran"	
* identifier.use = #usual	
* identifier.value = "1032702"	
* identifier.type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier.type.coding.code = #MR
* identifier.type.coding.display = "Medical Record Number"
* identifier.type.text = "Medical Record Number"
* identifier.system = "urn:oid:1.1.1.1.1"
* name[0].family = "Philip"	
* name[0].given[0] = "Scott"	
* name[0].given[1] = "Example"	
* gender = #male	
* active = true
* birthDate = "1954-01-22"
* extension[USVeteranStatus].valueBoolean = true
* extension[race].extension[ombCategory].valueCoding = OmbRaceCat#2054-5 "Black or African American"
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

Instance: hugo-cross-example-veteran
InstanceOf: USVeteran
Description: "Hugo Cross: Veteran's patient record"	
* meta.profile = "http://hl7.org/fhir/us/military-service/StructureDefinition/usveteran"	
* identifier.use = #usual	
* identifier.value = "1032702"	
* identifier.type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier.type.coding.code = #MR
* identifier.type.coding.display = "Medical Record Number"
* identifier.type.text = "Medical Record Number"
* identifier.system = "urn:oid:1.1.1.1.1"
* name[0].family = "Cross"	
* name[0].given[0] = "Hugo"	
* name[0].given[1] = "Example"	
* name[0].suffix[0] = "Ssgt"
* name[0].period.start = "2016-12-06"
* name[0].period.end = "2020-07-22"
* gender = #male	
* active = true
* birthDate = "1972-02-12"
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

Instance: huffman-crystal-example-veteran
InstanceOf: USVeteran
Description: "Sam Share: Veteran's patient record"	
* meta.profile = "http://hl7.org/fhir/us/military-service/StructureDefinition/usveteran"	
* identifier.use = #usual	
* identifier.value = "1032702"	
* identifier.type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier.type.coding.code = #MR
* identifier.type.coding.display = "Medical Record Number"
* identifier.type.text = "Medical Record Number"
* identifier.system = "urn:oid:1.1.1.1.1"
* name[0].family = "Huffman"	
* name[0].given[0] = "Crystal"	
* name[0].given[1] = "Example"	
* name[0].suffix[0] = "Ssgt"
* name[0].period.start = "2016-12-06"
* name[0].period.end = "2020-07-22"
* gender = #female	
* active = true
* birthDate = "1992-02-20"
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


Instance: philip-scott-example-military-service-episode
InstanceOf: MilitaryServiceEpisode	
Description: "Military Service Episode for Veteran Example, Philip Scott"
* status = #final "final"
* subject = Reference(philip-scott-example-veteran)
* effectivePeriod.start = "1971-04-01"
* effectivePeriod.end = "1973-04-01"
* hasMember[DeploymentHistoryEpisode] = Reference(philip-scott-example-deployment-history-episode)
* component[military-service-Industry].valueCodeableConcept = ODH#928110.010506	"Marine Corps [National Security ]"
* component[military-service-DischargeStatus].valueCodeableConcept = MSHCS#79A512F77CFC4E63B9969930FC8787DB "Honorable"
* component[military-service-SeparationReason].valueCodeableConcept = MSHCS#035 "COMPLETION OF REQUIRED ACTIVE SERVICE"


Instance: philip-scott-example-deployment-history-episode
InstanceOf: DeploymentHistoryEpisode
Description: "Deployment to Viet Nam"	
* id = "philip-scott-example-deployment-history-episode"	
* status = #final "final"
* subject = Reference(philip-scott-example-veteran)
* effectivePeriod.start = "1971-07-01"
* effectivePeriod.end = "1972-07-01"
* component[military-service-DeploymentEpisodeCountryCode].valueCodeableConcept = urn:iso:std:iso:3166#VNM
* component[military-service-DeploymentEpisodeMissionCode].valueCodeableConcept = MSHCS#46a15b13-b5c1-4ae8-acde-48c31f30175a "Viet Nam War"


Instance: philip-scott-example-military-occupation
InstanceOf: MilitaryOccupation
Description: "Example Military Occupation"	
* id = "philip-scott-example-military-occupation"	
* status = #final "final"
* subject = Reference(philip-scott-example-veteran)
* effectivePeriod.start = "1971-07-01"
* effectivePeriod.end = "1972-07-01"
* valueCodeableConcept =  ODH#55-3019.00.025711 "Marine [Military Enlisted Tactical Operations and Air/Weapons Specialists and Crew Members, All Other]"



// Instance: DeploymentHistoryEpisode2	
// InstanceOf: DeploymentHistoryEpisode
// Description: "Deployment to Iraq"	
// * id = "DeploymentHistoryEpisode2"	
// * status = #final "final"
// * subject = Reference(sam-share-ssgt-veteran)
// * effectivePeriod.start = "2019-02-01"
// * effectivePeriod.end = "2019-11-15"
// * component[military-service-DeploymentEpisodeCountryCode].valueCodeableConcept = urn:iso:std:iso:3166#IRQ
// * component[military-service-DeploymentEpisodeMissionCode].valueCodeableConcept = SOLOR#46a15b13-b5c1-4ae8-acde-48c31f30175a "Enduring Freedom"


// Instance: DeploymentHistoryEpisode3
// InstanceOf: DeploymentHistoryEpisode
// Description: "DeploymentHistoryEpisode Example"	
// * id = "DeploymentHistoryEpisode"	
// * status = #final "final"
// * subject = Reference(sam-share-ssgt-veteran)
// * effectivePeriod.start = "2019-04-01"
// * effectivePeriod.end = "2019-04-01"
// * component[military-service-DeploymentEpisodeCountryCode].valueCodeableConcept = urn:iso:std:iso:3166#IRQ
// * component[military-service-DeploymentEpisodeMissionCode].valueCodeableConcept = SOLOR#46a15b13-b5c1-4ae8-acde-48c31f30175a "Enduring Freedom"