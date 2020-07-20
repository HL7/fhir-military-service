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


Instance: MeghanVeteranCombatEpisodeObservation
InstanceOf: CombatEpisodeObservation
Description: " She deployed to Afghanistan as an individual augmentee with the Combined Forces Command Afghanistan. "
* id = "MeghanVeteranCombatEpisodeObservation"
* status = #final "final"
* subject = Reference(MeghanVeteranPersona)
* effectivePeriod.start = "2002-09-15" 
* effectivePeriod.end = "2003-01-17" 
* note.text = "She deployed to Afghanistan as an individual augmentee with the Combined Forces Command Afghanistan. It was there that she suffered a head injury when the truck in front of hers in a convoy was struck by an RPG, the resulting explosion causing her truck to flip. "
* component[mshs-CombatEpisodeCountryCode].valueCodeableConcept  = ISO#3166-2:AF "Afghanistan"
* component[mshs-CombatEpisodeMissionCode].valueCodeableConcept  = SCT#99999999 "Individual Augmentee" 



Instance: MeghanVeteranMilitaryServiceEpisodeObservation
InstanceOf: MilitaryServiceEpisodeObservation
Description: "Military Service Episode Observation"
* id = "MilitaryServiceEpisodeObservationExample"
* status = #final "final"
* subject = Reference(MeghanVeteranPersona)
* effectivePeriod.start = "2002-06-01" 
* effectivePeriod.end = "2012-06-01" 
* hasMember[CombatEpisodeObservation] = Reference(MeghanVeteranCombatEpisodeObservation)
* component[mseo-Industry].valueCodeableConcept  = OccupationalDataforHealthCodeSystem#928110.01143 "Navy National Security"
* component[mseo-DischargeStatus].valueCodeableConcept  = SCT#99999999 "Honorable"
* component[mseo-SupervisoryLevel].valueCodeableConcept  = OccupationalDataforHealthCodeSystem#E-3	"US Military Enlisted paygrade E-3"
* component[mseo-SeparationReason].valueCodeableConcept  = SeparationReasonCodeSystem#035 "COMPLETION OF REQUIRED ACTIVE SERVICE "
* component[odh-IsCurrentJob].valueBoolean = false




