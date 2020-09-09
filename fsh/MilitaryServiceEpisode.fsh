// Code Systems
Alias:   LNC = http://loinc.org
Alias:   SCT = http://snomed.info/sct
Alias:   UCUM = http://unitsofmeasure.org
Alias:   MTH = http://ncimeta.nci.nih.gov
Alias:   ICD10CM = http://hl7.org/fhir/sid/icd-10-cm 
Alias:   RXN = http://www.nlm.nih.gov/research/umls/rxnorm
Alias:   CPT = http://www.ama-assn.org/go/cpt
Alias:   ICD10PCS = http://www.nlm.nih.gov/research/umls/icd10pcs
Alias:   AJCC = http://cancerstaging.org
Alias:   GTR = http://www.ncbi.nlm.nih.gov/gtr
Alias:   CLINVAR = http://www.ncbi.nlm.nih.gov/clinvar
Alias:   IDTYPE = http://terminology.hl7.org/CodeSystem/v2-0203
Alias:   HGNC = http://www.genenames.org/geneId
Alias:   HGVS = http://varnomen.hgvs.org
Alias:   SPTY = http://terminology.hl7.org/CodeSystem/v2-0487
Alias:   ClinStatus = http://terminology.hl7.org/CodeSystem/condition-clinical
Alias:   VerStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status
Alias:   MedStatus = http://hl7.org/fhir/CodeSystem/medication-statement-status
Alias:   MedCat = http://terminology.hl7.org/CodeSystem/medication-statement-category
Alias:   ObsCat = http://terminology.hl7.org/CodeSystem/observation-category
Alias:   ObsInt = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation
Alias:   DiagnosticService = http://terminology.hl7.org/CodeSystem/v2-0074
Alias:   OmbRaceCat = urn:oid:2.16.840.1.113883.6.238
Alias:   ISO = urn:iso:std:iso:3166
Alias:   PHOccupationalDataForHealthODH = http://terminology.hl7.org/CodeSystem/PHOccupationalDataForHealthODH
Alias:   SOLOR = http://www.logicahealth.org/solutions/solor


Profile:  MilitaryServiceEpisode
Parent:   EmploymentHistoryEpisode
Id:       militaryserviceepisode
Title:    "Military Service Episode"
Description:   "Military Service Episode: A patient/Veteran may have zero or more military service episodes. The contents of this profile is based on the HL7 Version 2 ZMH segment and the ServiceHistoryEpisode schema specified in the current Veteran Verification API and it allows this API to migrate to FHIR and to be consistent with the prior work done by Center for Disease Control (CDC) National Institute for Occupational Safety and Health (NIOSH).  A service history episode may reference zero or more Combat episodes. This profile is based on the default FHIR Observation profile but may reuse ODD Past or Present Job profile ( http://hl.org/fhir/us/odh/StructureDefinition-odh-PastOrPresentJob.html)."
* status and code and subject and effectivePeriod and component MS
* id 1..1 
* identifier 0..1 
* code = LNC#87511-2 
* subject 1..1
* effective[x] only Period
* effectivePeriod 1..1
* effectivePeriod.start 1..1
* effectivePeriod.end 1..1
* category.coding = http://terminology.hl7.org/CodeSystem/observation-category#social-history


* hasMember ^slicing.discriminator.type = #profile // #pattern
* hasMember ^slicing.discriminator.path =  "$this.resolve()" // "$this.resolve().code"
* hasMember ^slicing.rules = #open
* hasMember contains CombatEpisode 0..*
* hasMember[CombatEpisode] only Reference(CombatEpisode)




* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Slice based on the component.code pattern"

* component contains mseo-Industry 1..1 and
					 mseo-DischargeStatus 1..1 and
					 mseo-SupervisoryLevel 1..1 and
					 mseo-SeparationReason 1..1
* component[mseo-Industry].code =  http://loinc.org#86188-0 "History of Occupation industry"
* component[mseo-Industry].value[x] only CodeableConcept   
* component[mseo-Industry].valueCodeableConcept 1..1
* component[mseo-Industry].valueCodeableConcept from MilitaryBranchCode

* component[mseo-DischargeStatus].code =  http://www.logicahealth.org/solutions/solor#9B7095A70B024CD789A36E48A3936592 "Discharge Status"
* component[mseo-DischargeStatus].value[x] only CodeableConcept   
* component[mseo-DischargeStatus].valueCodeableConcept 1..1
* component[mseo-DischargeStatus].valueCodeableConcept from  DischargeStatusValueSet


* component[mseo-SupervisoryLevel].code =  http://loinc.org#87707-6 "Job supervisory level or pay grade"
* component[mseo-SupervisoryLevel].value[x] only CodeableConcept
* component[mseo-SupervisoryLevel].valueCodeableConcept 1..1
* component[mseo-SupervisoryLevel].valueCodeableConcept from   https://phinvads.cdc.gov/2.16.840.1.114222.4.11.7613

* component[mseo-SeparationReason].code =  http://www.logicahealth.org/solutions/solor#9CEAD6537D6A4F198549F70598B8F8BF "Separation Reason "
* component[mseo-SeparationReason].value[x] only CodeableConcept   
* component[mseo-SeparationReason].valueCodeableConcept 1..1
* component[mseo-SeparationReason].valueCodeableConcept from  SeparationReasonValueSet



CodeSystem: VeteranStatusCodeSystem
Id: msh-VeteranStatusCodeSystem
Title: "Veteran Status Code System"
Description: "Veteran Status Code System"
* #NO "NO"
* #YES "YES"
* #NMI "Need More Information"

ValueSet:    VeteranStatusValueSet
Id: msh-veteranstatus-vs
Title: "Veteran Status Value Set"
Description: "Veteran Status Value Set" 
* VeteranStatusCodeSystem#NO	"NO"
* VeteranStatusCodeSystem#YES	"YES"
* VeteranStatusCodeSystem#NMI	"Need More Information"




Profile:  VeteranStatus
Parent:   Observation
Id:       veteranStatus
Title:    "Veteran Status"
Description:  "Veteran Status true/false"
* effectivePeriod 0..0
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
* valueCodeableConcept 1..1
* valueCodeableConcept from VeteranStatusValueSet



Instance: VeteranStatusQuery
InstanceOf: OperationDefinition
Title: "Veteran Status"
Usage: #definition
* name = "VeteranStatus"
* description = "Query to return the status of a veteran"
* status = #draft "draft"
* kind = #query "query"
* code = #veteranStatus "veteranStatus"
* system = true
* type = false
* instance = false
* resource = #Patient "Patient"
* parameter[0].name = #veteranName "veteranName"
* parameter[0].use = #in "in"
* parameter[0].min = 1
* parameter[0].max = "1"
* parameter[0].type = #HumanName "HumanName"
* parameter[1].name = #veteranSSN "veteranSSN"
* parameter[1].use = #in "in"
* parameter[1].min = 1
* parameter[1].max = "1"
* parameter[1].type = #Identifier "Identifier"
* parameter[2].name = #veteranDOB "veteranDOB"
* parameter[2].use = #in "in"
* parameter[2].min = 1
* parameter[2].max = "1"
* parameter[2].type = #date "date"
* parameter[3].name = #VeteranStatus "VeteranStatus"
* parameter[3].use = #out "out"
* parameter[3].min = 1
* parameter[3].max = "1"
* parameter[3].type = #Observation "Observation"
* parameter[3].targetProfile[1] = "VeteranStatus"
* parameter[1].targetProfile[1] = "VeteranStatus"




