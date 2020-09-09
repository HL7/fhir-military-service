Alias: USCorePatient = http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient

Profile:  EmploymentHistoryEpisode
Parent:   Observation
Id:       employmentHistoryEpisode
Title:    "Employment History Episode"
Description:   "Employment history consists of a   series Employment Episodes. In the past these episodes have been represented as Z-segments and added to    various transactions to    support social history determination, benefit, etc. This profile is   intended to    represent employment history for International use, and it may be localized by HL7, IHE, and other profile developers.The Employment Episode profile of is   the base profile for Military Service Episode profile and ODH Past or Present Jobprofile and other profiles intended to    describe specific types of employment. MultiplicityNotes
"



* category.coding = http://terminology.hl7.org/CodeSystem/observation-category#social-history
* status and code and subject and effective[x] and valueCodeableConcept MS
* valueCodeableConcept from  2.16.840.1.114222.4.11.7901  (preferred)
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
* subject only Reference(Patient)
* subject 1..1
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Slice based on the component.code pattern"
* component contains 	ehe-Industry 0..1 and 
						ehe-SupervisoryLevel 0..1 and 
						ehe-Occupation 0..1  
* component[ehe-Industry].code =  http://loinc.org#86188-0 "History of Occupation industry"
* component[ehe-Industry].value[x] only CodeableConcept   
* component[ehe-Industry].valueCodeableConcept 1..1
* component[ehe-Industry].valueCodeableConcept from 2.16.840.1.114222.4.5.327 (preferred)

* component[ehe-SupervisoryLevel].code =  http://loinc.org#87707-6 "Job supervisory level or pay grade"
* component[ehe-SupervisoryLevel].value[x] only CodeableConcept
* component[ehe-SupervisoryLevel].valueCodeableConcept 1..1
* component[ehe-SupervisoryLevel].valueCodeableConcept from  2.16.840.1.114222.4.11.7613 (preferred)

