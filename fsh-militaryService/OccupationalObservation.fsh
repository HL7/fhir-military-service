Profile:  OccupationalObservation
Parent:   Observation
Id:       occupationalObservation
Title:    "Occupational Observation"
Description:   "Base observations for occupational experiences"



* category.coding = http://terminology.hl7.org/CodeSystem/observation-category#social-history
* status, code, subject, effective[x], valueCodeableConcept MS
* effective[x] only Period
* bodySite 0..0
* specimen 0..0
* device 0..0
* referenceRange 0..0
* hasMember 0..0
* interpretation 0..1
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Slice based on the component.code pattern"
* component contains 	odh-PastOrPresentIndustry 0..1 and 
						odh-WorkClassification 0..1 and 
						odh-SupervisoryLevel 0..1 and 
						odh-JobDuty 0..1 and 
						odh-OccupationalHazard 0..1 and
						odh-WorkSchedule 0..1 and
						odh-WeeklyWorkDays 0..1 and
						odh-DailyWorkHours 0..1 and
						odh-IsCurrentJob 0..1 
* component[odh-PastOrPresentIndustry].code =  http://loinc.org#86188-0 "History of Occupation industry"
* component[odh-PastOrPresentIndustry].value[x] only CodeableConcept   
* component[odh-PastOrPresentIndustry].valueCodeableConcept 1..1
* component[odh-PastOrPresentIndustry].valueCodeableConcept from https://phinvads.cdc.gov/2.16.840.1.114222.4.11.7187
* component[odh-WorkClassification].code =  http://loinc.org#85104-8 "Compensation and sector employment type"
* component[odh-WorkClassification].value[x] only CodeableConcept
* component[odh-WorkClassification].valueCodeableConcept 1..1
* component[odh-WorkClassification].valueCodeableConcept from http://terminology.hl7.org/ValueSet/v3-WorkClassificationODH
* component[odh-SupervisoryLevel].code =  http://loinc.org#87707-6 "Job supervisory level or pay grade"
* component[odh-SupervisoryLevel].value[x] only CodeableConcept
* component[odh-SupervisoryLevel].valueCodeableConcept 1..1
* component[odh-SupervisoryLevel].valueCodeableConcept from   https://phinvads.cdc.gov/2.16.840.1.114222.4.11.7613
* component[odh-JobDuty].code =  http://loinc.org#63761-1 "What were your main activities or duties for this job [NHANES]"
* component[odh-JobDuty].value[x] only string
* component[odh-JobDuty].valueString 1..1
* component[odh-OccupationalHazard].code =  http://loinc.org#87729-0 "History of Occupational hazard"
* component[odh-OccupationalHazard].value[x] only string
* component[odh-OccupationalHazard].valueString 1..1
* component[odh-WorkSchedule].code =  http://loinc.org#74159-5 "Work schedule NIOSH"
* component[odh-WorkSchedule].value[x] only CodeableConcept
* component[odh-WorkSchedule].valueCodeableConcept 1..1
* component[odh-WorkSchedule].valueCodeableConcept from http://terminology.hl7.org/ValueSet/v3-WorkScheduleODH
* component[odh-WeeklyWorkDays].code =  http://loinc.org#74160-3 "Work days per week"
* component[odh-WeeklyWorkDays].value[x] only Quantity
* component[odh-WeeklyWorkDays].valueQuantity 1..1
* component[odh-DailyWorkHours].code =  http://loinc.org#87512-0 "Work hours per day"
* component[odh-DailyWorkHours].value[x] only Quantity
* component[odh-DailyWorkHours].valueQuantity 1..1
* component[odh-IsCurrentJob].code =  http://loinc.org#999999 "IsCurrentJob: A flag indicating if this is the person's current job (at the time the resource was last updated)"
* component[odh-IsCurrentJob].value[x] only boolean
* component[odh-IsCurrentJob].valueBoolean 1..1
