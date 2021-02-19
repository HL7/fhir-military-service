# Introduction

The following is a set of requirements and associated capabilities
to manage and exchange information about Military Service History and Status.
All requirements are analyzed as use cases involving actors/participants and
system interactions.

This specification also identifies code systems and terminology
gaps that require extensions and change proposals to LOINC and SNOMED CT.

This implementation guide builds upon existing FHIR implementation
guidance and best practices:

FHIR US Core Implementation Guide 3.1.1 (reusing US Core Patient
profile)

Occupational Data for Health (ODH) 1.0 (reusing best practices, PastOrPresentJob
profile)

# Acknowledgements

The project team would like to thank our leadership and colleagues
for their support in the development of Application Programming Interface (API)
implementation guide:

* **Department of Veterans Affairs**
  * Dr. Steven Brown, MD Director, CIDMO Knowledge Based Systems (KBS)
  * Mr. Javon Hyland, Deputy Program Manager, KBS Standards & Interoperability
  * Ms. Catherine Hoang, Associate Director, KBS Terminology Services
  * Dr. Keith Campbell MD, Director, KBS Informatics Architecture

* **VA Developer API**
  * Andrew Fichter
  * Shawnee Petrosky
  * Derek Brown

* **Defense Health Agency**
  * Nancy Orvis

* **CDC NIOSH**
  * Genny Luensman

* **ALTARUM**
  * Craig Newman

* Project team
  * Ioana Singureanu MSCS, FHL7, Project Facilitator, Requirements Analysis, Terminology Modeling
  * Sean Muir, FHIR Implementation Guide Developer/Publisher
  * Jayme Welty, Project Manager, Book Zurman

# Military Service History and Status

## Use Case Analysis



Figure 1 is a summary of scenarios (use cases) representing the requirements for
recording self-reported military and combat history. It also illustrates how
FHIR-based APIs can be used to validate employment history information reported
by Veterans.

This implementation guide design document is intended to create a
set of profiles and extensions to support Military Service History and Status
reporting consistent with US regulatory requirements (i.e. Title 38 Veteran
Benefits) and extensible to other realms/jurisdictions (e.g. Canadian Forces) .

It harmonizes the requirements of the U.S. Department of Veterans
Affairs (VA) and the Centers for Disease Control and Prevention (CDC) to more
easily record this information in support of administrative and clinical
workflows and the work and social history of patients who are also Veterans.

· 
ZMH (Military Service History) Z-segment used to represent service and
deployment history in HL7 Version 2 transactions. This segment is used to
exchange information about

· 
ServiceHistoryEpisode and Deployment Schemas for
the VA Veteran Verification API ([https://developer.va.gov/explore/verification/docs/veteran_verification?version=curren](https://developer.va.gov/explore/verification/docs/veteran_verification?version=current)[t](https://developer.va.gov/explore/verification/docs/veteran_verification?version=current))

· 
HL7 FHIR Profile: [odh-CombatZonePeriod](http://hl7.org/fhir/us/odh/StructureDefinition-odh-CombatZonePeriod.html) from
Occupational Data for Health (ODH), Release 1.0 (Standard for Trial Use) ([HL7 FHIR Profile: Occupational Data for Health (ODH), Release 1.0 (Standard for Trial Use)](http://hl7.org/fhir/us/odh/))



Note: Certain requirements were discussed, deemed to be
out-of-scope, and deferred (see [Deferred Requirements](#BKM_CB4D4746_7B24_4E2C_AA4E_FA6CBF63E1F5) ).


### Understanding this Guide

The FHIR Military History Implementation Guide was developed using the standard HL7 FHIR publishing tools. The page layouts and symbols are explained [in the FHIR documentation](https://www.hl7.org/fhir/formats.html). In viewing a profile page, note that there are multiple views. The "Differential Table" view represents the difference between the current profile and its base resource or profile. When interpreting this view, bear in mind that the immediate parent may not be a base FHIR resource, but it could be a US Core profile or another profile in this guide. The "Snapshot Table" represents the entire profile, with all elements.

In the event there are differences between the page renderings in this IG and the associated FHIR artifacts, the FHIR artifacts should be taken as the source of truth. In the unlikely event that an artifact's snapshot is inconsistent with its differential, the differential should be taken as the source of truth.
