## Military Service Episode

This profile design describes how we use observations,  components, and member resources to represent an historical continual Military Service within on branch of service.

As such a veteran's Military Service Episode may have zero or more military service deployment episodes. 

As such a veteran's Military Service Episode may have zero or more military occupations. 

Additionally, the veteran's Military Service Episode contains military discharge and separation reasons.

## Deployment History Episode
Deployment History Episode describes a completed deployment.  This is not intended to describe active duty deployments.  The veterans Deployment History Episode code can contain the mission, the country, the industry, and the supervisory level.

## Military Occupation
The profile reuses the [ODHPastOrPresentJob](http://hl7.org/fhir/us/odh/StructureDefinition-odh-PastOrPresentJob.html)
profile to apply it specifically to military jobs/occupations. One or more military occupations may be referenced by a single Military Service
History record. This profile uses a subset of data elements as seen below:

### Profiles

### Terminolgy
Supervisory Level
[ODHSupervisoryLevelValueSet]

Occupation
[ODHOccupationValueSet] 

Industry
[ODHIndustryValueSet] 

Military Service Branch
[MilitaryServiceBranchValueSet] 

{% include markdown-link-references.md %}
