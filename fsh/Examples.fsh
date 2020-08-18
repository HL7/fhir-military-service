
Instance: RussellFreemanPatient
InstanceOf: Patient
Description: ""

* id = "RussellFreemanPatient"
* meta.profile = "http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-cancer-patient"
* identifier.use = #usual
* identifier.value = "e883fd02-c733-5eb5-add9-dc14285c83a3"
* name.family = "Freeman"
* name.given[0] = "Russel"
* gender = #male

Instance: RussellFreemanMilitaryServiceEpisode1
InstanceOf: MilitaryServiceEpisode
Description: "Russell Freeman Military Service Episode"
* id = "ussellFreemanMilitaryServiceEpisode1"
* status = #final "final"
* subject = Reference(RussellFreemanPatient)
* effectivePeriod.start = "1987-12-05" 
* effectivePeriod.end = "1993-04-05" 
* hasMember[CombatEpisode] = Reference(RussellFreeman)
* component[mseo-Industry].valueCodeableConcept  = PHOccupationalDataForHealthODH#928110.000817 "Army National Security"
* component[mseo-DischargeStatus].valueCodeableConcept  = DischargeStatusCodeSystem#e37cd7384c954b9fa9226ecaec90c1bb "Honorable"
* component[mseo-SupervisoryLevel].valueCodeableConcept  = PHOccupationalDataForHealthODH#E-5	"US Military Enlisted paygrade E-5"
* component[mseo-SeparationReason].valueCodeableConcept  = SeparationReasonCodeSystem#044 "SURVIVING FAMILY MEMBER - SOLE SURVIVORSHIP"
* component[odh-IsCurrentJob].valueBoolean = false


Instance: RussellFreemanMilitaryServiceEpisode2
InstanceOf: MilitaryServiceEpisode
Description: "Russell Freeman Military Service Episode"
* id = "ussellFreemanMilitaryServiceEpisode2"
* status = #final "final"
* subject = Reference(RussellFreemanPatient)
* effectivePeriod.start = "2000-02-01" 
* effectivePeriod.end = "2004-06-14" 
* hasMember[CombatEpisode] = Reference(RussellFreeman)
* component[mseo-Industry].valueCodeableConcept  = PHOccupationalDataForHealthODH#928110.000255 "Air Force National Security"
* component[mseo-DischargeStatus].valueCodeableConcept  = DischargeStatusCodeSystem#026b71e322804ff4ad61b33e24dd309c "Dishonorable for Veterans Administration Purposes"
* component[mseo-SupervisoryLevel].valueCodeableConcept  = PHOccupationalDataForHealthODH#E-4	"US Military Enlisted paygrade E-4"
* component[mseo-SeparationReason].valueCodeableConcept  = SeparationReasonCodeSystem#033 "SUFFICIENT SERVICE FOR RETIREMENT"
* component[odh-IsCurrentJob].valueBoolean = false


Instance: RussellFreemanCombatEpisode
InstanceOf: CombatEpisode
Description: "Iraq"
* id = "RussellFreemanCombatEpisode"
* status = #final "final"
* subject = Reference(RussellFreemanPatient)
* effectivePeriod.start = "1988-12-05"
* effectivePeriod.end = "1989-12-05" 
* note.text = "Iraq"
* component[mshs-CombatEpisodeCountryCode].valueCodeableConcept  = ISO#3166-2:IQ "Iraq"
* component[mshs-CombatEpisodeMissionCode].valueCodeableConcept  = SCT#99999999 "Individual Augmentee" 



Instance: MeghanVeteranPersona
InstanceOf: Patient
Description: "Meghan joined the Navy after graduating high school in the summer following 9/11. She deployed to Afghanistan as an individual augmentee with the Combined Forces Command Afghanistan. It was there that she suffered a head injury when the truck in front of hers in a convoy was struck by an RPG, the resulting explosion causing her truck to flip. However, her best friend was not as lucky and died in the attack. Meghan advanced to the rank of Yeoman First Class before leaving the service; she and her first husband divorced near the end of her second enlistment. After a couple of years, she married a Navy Senior Chief. Meghan is a full-time mom for her three children. Still haunted by seeing her best friend killed, she sees a Mental Health Counselor at a VA Outpatient Clinic. Her new husband loves her and her children. She is taking a two year break from her career to get her youngest stabilized but plans to return to work after that."

* id = "MeghanVeteranPersona"
* meta.profile = "http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-cancer-patient"
* identifier.use = #usual
* identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#MR "Medical Record Number"
* identifier.system = "http://hospital.example.org"
* identifier.value = "m123"
* name.family = "Veteran"
* name.given[0] = "Meghan"
* contact.telecom[0].system = #phone
* contact.telecom[0].value = "555-555-5555"
* contact.telecom[0].use = #home
* contact.telecom[1].system = #email
* contact.telecom[1].value = "john.anyperson@example.com"
* gender = #female
* birthDate = "1983-01-20"
* address.line = "123 Main St"
* address.city = "Anytown"
* address.postalCode = "12345"
* address.country = "US"
* communication.language = urn:ietf:bcp:47#en-US "English (Region=United States)"
* communication.language.text = "English"


Instance: MeghanVeteranCombatEpisode
InstanceOf: CombatEpisode
Description: " She deployed to Afghanistan as an individual augmentee with the Combined Forces Command Afghanistan. "
* id = "MeghanVeteranCombatEpisode"
* status = #final "final"
* subject = Reference(MeghanVeteranPersona)
* effectivePeriod.start = "2002-09-15" 
* effectivePeriod.end = "2003-01-17" 
* note.text = "She deployed to Afghanistan as an individual augmentee with the Combined Forces Command Afghanistan. It was there that she suffered a head injury when the truck in front of hers in a convoy was struck by an RPG, the resulting explosion causing her truck to flip. "
* component[mshs-CombatEpisodeCountryCode].valueCodeableConcept  = ISO#3166-2:AF "Afghanistan"
* component[mshs-CombatEpisodeMissionCode].valueCodeableConcept  = SCT#99999999 "Individual Augmentee" 



Instance: MeghanVeteranMilitaryServiceEpisode
InstanceOf: MilitaryServiceEpisode
Description: "Military Service Episode"
* id = "MilitaryServiceEpisodeExample"
* status = #final "final"
* subject = Reference(MeghanVeteranPersona)
* effectivePeriod.start = "2002-06-01" 
* effectivePeriod.end = "2012-06-01" 
* hasMember[CombatEpisode] = Reference(MeghanVeteranCombatEpisode)
* component[mseo-Industry].valueCodeableConcept  = PHOccupationalDataForHealthODH#928110.01143 "Navy National Security"
* component[mseo-DischargeStatus].valueCodeableConcept  = SCT#99999999 "Honorable"
* component[mseo-SupervisoryLevel].valueCodeableConcept  = PHOccupationalDataForHealthODH#E-3	"US Military Enlisted paygrade E-3"
* component[mseo-SeparationReason].valueCodeableConcept  = SeparationReasonCodeSystem#035 "COMPLETION OF REQUIRED ACTIVE SERVICE "
* component[odh-IsCurrentJob].valueBoolean = false




