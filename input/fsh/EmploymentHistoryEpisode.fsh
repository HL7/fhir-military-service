Alias: USCorePatient = http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient

Profile:  EmploymentHistoryEpisode
Parent:   Observation
Id:       odh-EmploymentHistoryEpisode
Title:    "Employment History Episode"
Description:   "Employment history consists of a series Employment Episodes. In the past these episodes have been represented as Z-segments and added to various transactions to support social history determination, benefit, etc. This profile is intended to represent employment history for International use and it may be localized by HL7, IHE, and other profile developers.
The Employment Episode profile is the base profile for Military Service Episode profile and ODH Past or Present Job profile and other profiles intended to describe specific types of employment. 
This profile is marked as 'constrainable' because it's intended to be reused to create additional profiles, more specific, or localized to jurisdiction."
* ^abstract = true
* category.coding = http://terminology.hl7.org/CodeSystem/observation-category#social-history
* status and code and subject and effective[x] and valueCodeableConcept MS

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

* component contains 	odh-Industry 0..1 and 
						odh-SupervisoryLevel 0..1  

* component[odh-Industry].code =  LNC#86188-0 "History of Occupation industry"
* component[odh-Industry].value[x] only CodeableConcept   
* component[odh-Industry].value[x] 1..1
* component[odh-Industry].value[x] from  https://phinvads.cdc.gov/vads/ViewValueSet.action?oid=2.16.840.1.114222.4.11.7187 (preferred) //"Industry CDC Census 2010 Value Set: Industry describes an economic/business sector comprised of businesses/ enterprises concerned with the output of a specified category of products or services (e.g., the construction industry or the agriculture industry). This industry code system includes 2007 U.S. Census Bureau industry codes and three additional codes developed by CDC for unpaid workers. The 2010 Census industry categories are based on the 2007 North American Industry Classification System (NAICS)."
 
* component[odh-SupervisoryLevel].code =  LNC#87707-6 "Supervisory level or pay grade"
* component[odh-SupervisoryLevel].value[x] only CodeableConcept
* component[odh-SupervisoryLevel].value[x] 1..1
* component[odh-SupervisoryLevel].value[x] from https://phinvads.cdc.gov/vads/ViewValueSet.action?oid=2.16.840.1.114222.4.11.7613 (preferred) //"Job Supervisory Level or Pay Grade (ODH) Value set: An indicator of responsibilities of a person's job for directing work and personnel management, as reported by the person. Pay grade is used to represent supervisory or personnel management responsibilities for U.S. military service, because it conveys similar meaning across branches of service."

* value[x] only CodeableConcept //Occupation Code
* value[x] from https://phinvads.cdc.gov/vads/ViewValueSet.action?oid=2.16.840.1.114222.4.11.7186 (preferred) //"Occupation CDC Census 2010 Value SEt: Occupation describes a set of activities or tasks that individuals are paid to perform or, if unpaid, define a person’s contribution to a household/family business/community. This code system includes 2010 U.S. Census Bureau occupation codes with modifications made by CDC for unpaid workers and military occupations. The 2010 Census occupation categories are based on the 2010 BLS Standard Occupational Classification (SOC) system. The PH_Industry_CDC_Census2010 code system should be used in conjunction with this occupation code system when coding both industry and occupation. For more information and instructions on using this coding system, see the instruction manual for CDC-Census I&O coding at: http://www.cdc.gov/niosh/topics/coding/"
