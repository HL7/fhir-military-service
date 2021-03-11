## Introduction

The following is design document for FHIR profiles and extensions intended to
fill gaps in current implementations of HL7 Version 2 and RESTful APIs currently
available to implementers. This design document is an example of best practices
for organizations that are planning to reuse and extend profiles and apply them
to an expanded set of requirements.
This specification also identifies code systems and terminology gaps that
require extensions and change proposals to LOINC and SNOMED CT.

### Acknowledgements

This implementation guide builds upon existing FHIR implementation guidance and
best practices:
-   FHIR US Core Implementation Guide 3.1.1 (reusing US Core Patient profile)

-   Occupational Data for Health (ODH) 1.0 (reusing best practices,
    PastOrPresentJob profile)

The project team would like to thank our leadership and colleagues for their
support in the development of Application Programming Interface (API)
implementation guide:

**Department of Veterans Affairs:**

Dr. Steven Brown, MD, Director, CIDMO Knowledge Based Systems (KBS)

Mr. Javon Hyland, Deputy Program Manager,, KBS Standards & Interoperability

Ms. Catherine Hoang, Associate Director, KBS Terminology Services

Dr. Keith Campbell MD, Director, KBS Informatics Architecture

**VA Developer API:**

Andrew Fichter

Shawnee Petrosky

Derek Brown

**Defense Health Agency:**

Nancy Orvis

**CDC NIOSH:**

Genny Luensman

**ALTARUM:**

Craig Newman

**Project team:**

Ioana Singureanu MsCS, FHL7, Project Facilitator, Requirements Analysis,
Terminology Modeling, Book Zurman

Sean Muir, FHIR Implementation Guide Developer/Publisher, Book Zurman

Jayme Welty, Project Manager, Book Zurman

## Background

This implementation guide design document is intended to create a set of
profiles and extensions to support Military Service History and Status reporting
consistent with US regulatory requirements (i.e. Title 38 Veteran Benefits) and
extensible to other realms/jurisdictions (e.g. Canadian Forces) .

It harmonizes the requirements of the U.S. Department of Veterans Affairs (VA)
and the Centers for Disease Control and Prevention (CDC) to more easily record
this information in support of administrative and clinical workflows and the
work and social history of patients who are also Veterans.

-   **ZMH** (Military Service History) Z-segment used to represent service and
    deployment history in HL7 Version 2 transactions. This segment is used to
    exchange information about

-   **ServiceHistoryEpisode** and **Deployment** Schemas for the VA Veteran
    Verification API
    ([https://developer.va.gov/explore/verification/docs/veteran_verification?version=curren](https://developer.va.gov/explore/verification/docs/veteran_verification?version=current)[t](https://developer.va.gov/explore/verification/docs/veteran_verification?version=current))

-   HL7 FHIR Profile:
    [odh-CombatZonePeriod](http://hl7.org/fhir/us/odh/StructureDefinition-odh-CombatZonePeriod.html)
    from Occupational Data for Health (ODH), Release 1.0 (Standard for Trial
    Use) (<http://hl7.org/fhir/us/odh/>)

## Use Case Analysis

The following is a set of requirements and associated capabilities to manage and
exchange information about Military Service History and Status. All requirements
are analyzed as use cases involving actors/participants and system interactions.

Note: Certain requirements were discussed, deemed to be out-of-scope, and
deferred (see [Deferred Requirements](#BKM_CB4D4746_7B24_4E2C_AA4E_FA6CBF63E1F5)
).

Figure 1 is a summary of scenarios (use cases) representing the requirements for
recording self-reported military and combat history. It also illustrates how
FHIR-based APIs can be used to validate employment history information reported
by Veterans.

![](ad17cfd7015f052596bc3be933031b9f.emf)

Figure 1: Use Case Analysis Overview

#### Clinician

The clinician may be working with Veteran in the community an needs asses the
health risks associate with military service,

### Military Service History Requirements

This section describes the use cases needed to manage Military Service History
both as self-reported employment history and API-supported verification of
detailed military service history.

##### Request Employment History part of Social History

The clinician is requesting employment information in conjunction with their
social history. If the patient is a Veteran, their employment history will
include military service information. This was a core requirement of the
Occupational Data for Heath (ODH) Implementation Guide we analyzed and reused.
The current specification expands this use case to specify application (i.e.
EHR) capabilities as well as reusable FHIR-based APIs that may be provided by an
authoritative organization (e.g. US Department of Veterans Affairs).

##### Record Military Service History and Status

The social history information reported by the patient - including employment
and military service history - is entered in the system of record (i.e. EHR).

##### Verify Veteran History

The EHR system, acting as a FHIR client, uses a standards-based VA RESTful API
(FHIR Observation with profiles and extensions) to verify that the patient is a
Veteran and served in the military.

The verification API is triggered by an EHR. Based on the verification result,
the EHR may validate the Veteran status and fill in the combat episodes as
needed to determine social history risks.

-   **Question:** Is there a similar DoD API?

##### Verify Veteran Status

The Verification API proposed in this document determines the Veteran’s status
by using demographic information submitted as a query (search operation) to a
FHIR server that supports **Observation** resource - - using the **Patient**
endpoint to determine whether a person is a verified veteran. Additional
information is provided using the [Search
Service](#BKM_1D0C200D_D352_4DF3_8863_57C1F1363AF2)
[History](#BKM_1D0C200D_D352_4DF3_8863_57C1F1363AF2) criteria using the profiles
described in the [Information
Requirements](#BKM_0837D0F3_42BA_4560_AB07_2F06324BBA47) section (see [Military
Service Episode](#BKM_1EE5C72B_FAB7_48FE_81D2_FE7E3F24BBE0)).

Testing note: "search" Patient resource and return a

**Operation**: \$**veteranStatus** returns true of the identity criteria match a
Veteran record.

##### Search Service History

This use case is part of in the proposed verification API based on FHIR. If this
search operation returns one or more **Observation** resources that conform
[Military Service Episode](#BKM_1EE5C72B_FAB7_48FE_81D2_FE7E3F24BBE0) to the
proposed profile, the Veteran's status confirmed. If the search operation does
not find any matching Observation resources, the Veteran's status could not be
confirmed.

The presence of one or more Observations that conform to the [Combat
Episode](#BKM_15AF665A_23CD_4387_A2F0_EA121D7063E0) profile proposed here
indicates that Veteran served in combat.

### Deferred Requirements

The following use cases were discussed and deferred because they are
out-of-scope for the profiles and extensions described in this implementation
guide design document:

##### Prior Authorization

U.S. Department of Defense (DoD) administrative transactions are currently used
for prior authorization for healthcare services. This use case will not be
addressed in this document but it may be relevant to future FHIR profiling
efforts.

##### Apply for coverage

A Veteran's military history and other service-related information are relevant
to applying for healthcare coverage. This use case was discussed with the
Financial Management Workgroup on March 31, 2020 and it will remain out-of-scope
for this iteration of the specification. Military service history is relevant to
establish level of care but will not be explored further in this document.

##### Schedule service-connected visit

Another potential use case included scheduling a visit for a service-connected
disorder or condition. This use case was discussed and deemed out-of-scope for
now since it is related to level of disability and service-connected problems,
as well as:

-   an encounter related to a service-connected disability, special authority
    designation and those services are not billable;

-   care may be covered by special authority (e.g. neck/throat cancer); and,

-   coding system for special authority and service-related not in scope.

## Information and Semantics Requirements

In HL7 Version 2 interfaces, the data required to exchange military service
history and status is accomplished using extensions segments (i.e. Z-segments).
The naming convention for extensions in HL7 Version 2 requires that new segment
names start with the letter "Z".

For instance, the VA extension for "Military Service" is "ZMH". This extension
can be added to message payloads (e.g. administrative transactions) to convey
this content.

This section represents a harmonization of HL7 Version 2 and RESTful APIs used
at VA. It also harmonizes the content of the Occupational Data for Health
Implementation Guide developed by CDC to enhance social history and employment
history reporting from EHR systems.

The profiles described in this design document are available at:
<https://github.com/HL7/fhir-military-service>

Figure 2 summarizes the proposed profiles and extensions needed to document
military service history. The profiles described here constrain and extend the
normative Observation resources profile (Release 4 and later) to ensure
stability and reusability. FHIR Release 4 marked the first time some FHIR
resources have attained normative status and will be maintained in a manner that
ensure backwards-compatibility. Furthermore, using [Observation R4 and
later](http://build.fhir.org/observation.html) - rather than
[Basic](http://build.fhir.org/basic.html) resource - is the recommended approach
to creating extensible APIs based on FHIR.

**Note:** FHIR implementation, localization, and profiling best-practices are
under development and evolving. This design document is intended to provide
reasoning and context for future projects.

![](b0c5621e902740627b1978c433c7f675.emf)

Figure 2: Information Requirements

#### Employment History Episode

Employment history consists of a series Employment Episodes. In the past these
episodes have been represented as Z-segments and added to various transactions
to support social history determination, benefit, etc. This profile is intended
to represent employment history for International use and it may be localized by
HL7, IHE, and other profile developers.

The Employment Episode profile of is the base profile for [Military Service
Episode profile](#BKM_1EE5C72B_FAB7_48FE_81D2_FE7E3F24BBE0) and [ODH Past or
Present
Job](http://hl7.org/fhir/us/odh/StructureDefinition-odh-PastOrPresentJob.html)
profile and other profiles intended to describe specific types of employment.

This profile is marked as "constrainable" because it's intended to be reused to
create additional profile, more specific, or localized to jurisdiction.

|                                      | **Multiplicity**                   | **Notes**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
|--------------------------------------|------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **id** uuid                          | [1...1]                            | Unique identifier of the episode- typically assigned by a FHIR server. It may be used to retrieve a specific or latest version of the FHIR resource (i.e. Observation) used to represent military service episode(s) for a Veteran. Path: **Oservation.id** as globally/universally unique identifier (uuid)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| **url** url                          | [1...1]                            | Profile canonical url used to reference this profile in an Observation that conforms this profile. Fixed value in the [StructureDefinition.url](#StructureDefinition.url) http://hl7.org/fhir/StructureDefinition/employment-episode Path: **Observation.meta.profile** This profile may be used along with other profiles met by the Observation resource.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| **identifier** Identifier            | [0...1]                            | This data element may be used to specify a business identifier of the employment episode that could be referenced across FHIR APIs. Path: **Observation.identifier**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| **code** CodeableConcept             | extensible LOINC value set [1...1] | Standard code that describes a generic employment episode using an extensible value set binding. This data element is mandatory (cannot be null) is this profile and any of its derivation. The value set binding is extensible but it requires a LOINC code. Path: **Observation.code** Binding strength: **Extensible**; to allow derived profiles to substitute the binding with a subset of the value set referenced here. Local temporary concept id: **f6341bf2-e765-4639-8800-6805520ece8e The value set associated with this data element includes:** 11341-5 (History of Occupation) 87511-2 (Combat zone AndOr hazardous duty work dates\*\*)\*\* **extensible LOINC value set**                                                                                                                                                                                                                                                                  |
| **startDate** date                   | [0...1]                            | Data when the employment period started. This data element is optional in profile. Path: **Observation.effectivePeriod.start**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| **endDate** date                     | [0...1]                            | End of employment date. if this employment episode is on-going, this data element is empty. Path: **Observation.effectivePeriod.end** Derived information: active employment episode if this data element is missing. A data-absent-reason extension may be used to clarify that the end of the period is [not-applicable](http://hl7.org/fhir/R4/codesystem-data-absent-reason.html).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| **industry** CodeableConcept         | [0...1]                            | For this profile, this component/element contains the industry in which the patient was or is currently employed. This data element optional in this profile but it may be mandatory, required, or conditionally used in a derived profile. It may also be localized for required terminology in each realm. For example in the US, implementers are expected to use “Industry CDC NAICS 2012 (ODH)” [https://phinvads.cdc.gov/vads/ViewValueSet.action?id=571](https://phinvads.cdc.gov/vads/ViewValueSet.action?id=5718C508-111B-4737-A48C-FDCFD301C0DF)[8C508-111B-4737-A48C-FDCFD301C0DF](https://phinvads.cdc.gov/vads/ViewValueSet.action?id=5718C508-111B-4737-A48C-FDCFD301C0DF)” Path\*\*: Observation.component.valueCodeableConcept\*\* Binding strength: **Preferred**; to allow derived profiles to substitute the binding with a subset of the value set referenced here. The **Observation.component.code** is fixed to: **86188-0 (LOINC**) |
| **supervisoryLevel** CodeableConcept | [0...1]                            | This data element corresponds to the Pay Grade associated with a military service episode. The value is intended to be a [CodeableConcept](#CodeableConcept). This data element may be localized to use a US-specific value set (e.g. "Supervisory Level or Pay Grade" : https://phinvads.cdc.gov/vads/ViewValueSet.action?oid=2.16.840.1.114222.4.11.7613) Path\*\*: Observation.component.valueCodeableConcept\*\* The **Observation.component.code** if fixed to: **87707-6 (LOINC)**. Binding strength: **Preferred**; to allow derived profiles to substitute the binding with a subset of the value set referenced here.                                                                                                                                                                                                                                                                                                                              |
| **category** CodeableConcept         | [1...1]                            | Employment history is a part of the patient's social history. Therefore this data element is fixed to ["social-history"](#observation-category-social-history). This information in inherited by profiles derived from this constrainable profile. Path: **Observation.category**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| **occupation** CodeableConcept       | [0...1]                            | The occupation during the episode as a coded value. **Path: Observation.valueCodeableConcept** The recommended value set binding uses the CDC PHVS_Occupation_CDC_ONET-SOC2010_ODH https://phinvads.cdc.gov/vads/ViewValueSet.action?id=3ED71C35-8147-492B-B88F-94953573E55F (Occupation CDC ONET-SOC 2010 (ODH)) The recommended value set binding references the CDC PH_OccupationalDataForHealth_ODH code system: OID: 2.16.840.1.114222.4.5.327 Code System Name: Occupational Data for Health (ODH) Code System Code: PH_OccupationalDataForHealth_ODH Content: https://phinvads.cdc.gov/vads/ViewCodeSystem.action?id=2.16.840.1.114222.4.5.327 Binding strength: **Preferred**; to allow derived profiles to substitute the binding with a subset of the value set referenced here.                                                                                                                                                                  |

#### US Veteran

The US Veteran profile specifies an additional extension to the set already
supported by the FHIR US Core profile it extends.

|                           | **Multiplicity** | **Notes**                                                                                                                                                                                                                                                                 |
|---------------------------|------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **veteranStatus** boolean | [1...1]          | This extension is a boolean flag used to specify/store the confirmation/verification status. true: the Patient record describes a Veteran false: the Patient is either not a verified yet or under review if the flag is absent, then the veteran status is undetermined. |

#### Military Service Episode

This profile design describes how we use Observation resources to represent
Military Service as a type of [Employment History
Episode](#BKM_10745799_4EB4_45E8_9722_23C558816347).

A patient/Veteran may have zero or more military service episodes. The contents
of this profile is based on the HL7 Version 2 **ZMH** segment and the
**ServiceHistoryEpisode** schema specified in the current [Veteran Verification
API](https://developer.va.gov/explore/verification/docs/veteran_verification?version=current)
and it allows this API to migrate to FHIR and to be consistent with the prior
work done by Center for Disease Control (CDC) National Institute for
Occupational Safety and Health (NIOSH).

A service history episode may reference zero or more Combat episodes. This
profile is based on the default FHIR Observation profile and The base profile is
a newly defined [Employment](#BKM_338246A9_68AC_41FA_BCF2_160954A8D9F2)
[Episode](#BKM_338246A9_68AC_41FA_BCF2_160954A8D9F2) profile. This profile is
similar **ODH Past or Present Job** profile (
http://hl7.org/fhir/us/odh/StructureDefinition-odh-PastOrPresentJob.html). The
major distinction from the ODH Is that Military Service History Episode does not
require any information the job performed by the Veteran during their service.

The following is a list of constraints applied to [Employment History
Episode](#BKM_10745799_4EB4_45E8_9722_23C558816347) to describe military service
episodes:

|                                           | **Multiplicity**     | **Notes**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
|-------------------------------------------|----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **url** url                               | [1...1]              | Profile canonical url used to reference this profile in an Observation that conforms this profile, **http://hl7.org/fhir/us/StructureDefinition/ms-military-service-episode** Path\*\*: Observation.meta.profile\*\*                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| **code** CodeableConcept                  | LN:Extension [1...1] | LOINC concept: to be defined - a member of "employment episode" value set. Path: **Observation.code Constraints**: Cardinality: [1,1] **Local concept id (fixed):** d3f8e4e1-874f-4ccc-b70e-76133b2e317d **LOINC concept: tbd LN:Extension**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| **startDate** date                        | [1...1]              | Start of military service episode. It is a mandatory data element for a valid military service episode. Path: Observation.effectivePeriod.start **Constraints**: Cardinality: [1,1]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| **endDate** date                          | [0...1]              | End of military service episode date. It must be specified (mandatory) for any valid military service episode. Path: **Observation.effectivePeriod.end Constraints**: Cardinality: [1,1]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| **industry** MilitaryBranchCode           | [1...1]              | For this profile, this component/element contains the branch military or a code indicating national guard or reserve. *"Branch of military including National Guard or Reserve status."* The CDC OMB 2010 (or 2020) *Industry* concepts are sufficient to describe the Military Branch including "National Guard or Reserve" - as a single concept. These US-specific concept will be added to the SNOMED CT US extension maintained by NLM. Based on feedback from VA implementers, it' snot necessary to distinguish “reserve” from “national guard” service. This profile will use a subset of Industry concepts related to military service. **Constraints**: Cardinality: [1,1] Value set binding for component.valueCodedConcept: [MilitaryBranchCode](#BKM_BE5D4E9C_A245_4F0E_A2F6_98F8B589AC43) Binding strength: **required**; to enforce the use of the value set. **LOINC code**: 86188-0 reused from ODH |
| **dischargeStatus** DischargeStatusCode   | [0...1]              | For this profile, the data element specifies to "discharge status" described as "Character of discharge from service episode." This data element is mandatory for service history reported by the VA but it may be empty if the patient is still active military. **Path:** Observation.component (code: **to be added to LOINC**). See Logica Solor page: https://logica.atlassian.net/wiki/spaces/SOLOR/pages/865271876/Military+Service+History+and+Status **Constraints**: Cardinality: [1,1] Value set binding for component.valueCodedConcept: [DischargeStatusCode](#BKM_69D9F4E3_FE3B_41BE_B6D9_CAAC44AE48D5) Binding strength: **required**; to enforce the use of the value set. Local concept id: 836df973-002b-4bb6-9eca-83626af0c05c                                                                                                                                                                    |
| **supervisoryLevel** PayGradeCode         | [1...1]              | This data element corresponds to the Pay Grade associated with a military service episode. **Constraints**: Cardinality: [1,1] Value set binding for component.valueCodedConcept: [PayGradeCode](#BKM_CCBE5EDA_C9CA_456F_9D80_186017054BA4) Binding strength: **required**; to enforce the use of the value set. **Fixed Value:** 87707-6 (Supervisory Level)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| **separationReason** SeparationReasonCode | [0...1]              | Additional text description for **separation** reason beyond discharge status value. It's an optional, coded data element (see [SeparationReasonCode](#BKM_B454F681_0DD8_4F97_BB93_55FEF75585D7) for a list of proposed concepts to be added to SNOMED CT). **Path:** Observation.component (code: **to be added to LOINC**). See Logica Solor page: https://logica.atlassian.net/wiki/spaces/SOLOR/pages/865271876/Military+Service+History+and+Status **Constraints**: Cardinality: [1,1] Value set binding for component.valueCodedConcept: [SeparationReasonCode](#BKM_E4F59E0A_7366_4ACB_94EB_E3D6CEB81063) Binding strength: **required**; to enforce the use of the value set. Local concept it: 066ccc24-04d1-4c58-a2cf-abe2e722d1a3                                                                                                                                                                         |

#### Deployment Episode

This profile definition similar to [Combat Zone Period
profile](http://hl7.org/fhir/us/odh/StructureDefinition-odh-CombatZonePeriod.html)
(url: http://hl7.org/fhir/us/odh/StructureDefinition/odh-CombatZonePeriod ) and
includes the requirements specified in ZMH and [Deployment
Schema](https://developer.va.gov/explore/verification/docs/veteran_verification?version=current).

The base profile reuses the pattern [Combat Zone Period
profile](http://hl7.org/fhir/us/odh/StructureDefinition-odh-CombatZonePeriod.html)e
and adds new components. However, since it's intended to share "deployment"
information this profile is more generic that the specifics ODH.

|                              | **Multiplicity**     | **Notes**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
|------------------------------|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **url** url                  | [1...1]              | Proposed canonical URL for this profile: http://hl7.org/fhir/us/odh/StructureDefinition/ms-combat-episode                                                                                                                                                                                                                                                                                                                                                                                                                   |
| **id** uuid                  | [1...1]              | Unique identifier of the episode. It may be used to retrieve a specific or latest version of the FHIR resource (i.e. Observation) used to represent combat episode(s) for a Veteran. The guidance to implementers is to use an auto-generated **UUID** rather than a long integer. Both options are supposed by the FHIR base standard by open-source FHIR server implementations (e.g. HAPI).                                                                                                                              |
| **code** CodeableConcept     | "deployment" [1...1] | LOINC concept based on the value set : **deployment training humanitarian/disaster relieve combat/war time "deployment"**                                                                                                                                                                                                                                                                                                                                                                                                   |
| **startDate**                | [1...1]              | The start date for combat episode; it must be specified for all combat episodes. Path: **Observation.effectivePeriod.start Constraints**: Cardinality: [1,1]                                                                                                                                                                                                                                                                                                                                                                |
| **endDate**                  | [1...1]              | The end date of the combat episode must be specified if this profile is used to specify historical data. Path: **Observation.effectivePeriod.end Constraints**: Cardinality: [1,1] Mandatory                                                                                                                                                                                                                                                                                                                                |
| **country** CountryCode      | [1...1]              | This data element is an additional component to the base profile. It's intended to specify the country where the deployment occurred. **Constraints**: Cardinality: [1,1] Mandatory Path\*\*: Observation.component.valueCodeableConcept\*\* The **Observation.component.code** is fixed to: a **concept (LOINC**) See resolution at: https://logica.atlassian.net/wiki/spaces/SOLOR/pages/865271876/Military+Service+History+and+Status Local concept id for "Country of Deployment": b18ae858-d1dd-4edb-89f2-b9835f2eba1e |
| **mission** MissionCode      | [0...1]              | This data element corresponds to “military service history type” (e.g. Persian Gulf, Operation Iraqi/Enduring Freedom) in addition to locale-based (e.g. Somalia, Lebanon, Grenada, Yugoslavia, Panama). Additional questions re: combat episodes: Do we need to identify POW status re: combat episode? Is the d the “service component” necessary (e.g. regular, activated reserve, activated national guard)?                                                                                                            |
| **category** CodeableConcept | [1...1]              | "social-history" - fixed value fort this profile.                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |

#### MilitaryOccupation

The profile reuses the ODH PastOrPresentJob profile to apply it specifically to
military jobs/occupations.

This resource is reference by

It uses a subset of data elements as seen below:

|                                | **Multiplicity**     | **Notes**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
|--------------------------------|----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **startDate.** date            | [1...1]              | Start of military service episode. It is a mandatory data element for a valid military service episode. Path: Observation.effectivePeriod.start **Constraints**: Cardinality: [1,1]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| **endDate.** date              | [0...1]              | End of military service episode date. It must be specified (mandatory) for any valid military service episode. Path: **Observation.effectivePeriod.end Constraints**: Cardinality: [1,1]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| **code** CodeableConcept       | LN:Extension [1...1] | LOINC concept: to be defined - a member of "employment episode" value set. Path: **Observation.code Constraints**: Cardinality: [1,1] **Fixed code value: TBD LN:Extension**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| **occupation** CodeableConcept | [0...1]              | The occupation during the military service episode as a coded value. Note: This data element his is not currently supported by the VA API, it would be an enhancement in the FHIR-based API Path: Observation.valueCodeableConcept) The recommended value set binding references is to a subset of occupations based on the Military Occupation Code taxonomy maintained by the Department of Defense. Proposed value set name: **military-occupation**; the value set will be based on "Occupation CDC ONET-SOC 2010 (ODH)": https://phinvads.cdc.gov/vads/ViewValueSet.action?id=3ED71C35-8147-492B-B88F-94953573E55F The occupation taxonomy/code can be used by clinicians to assess health risks of musculoskeletal disorders, heart disease, behavioral health, and hazardous chemical exposures. |
| **url.** url                   | [1...1]              | Profile canonical url used to reference this profile in an Observation that conforms this profile, **http://hl7.org/fhir/us/StructureDefinition/ms-military-service-episode** Path\*\*: Observation.meta.profile\*\*                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |

#### CountryCode

ISO 3166 country code.

#### MissionCode

A SNOMED CT concept (Observation.component.value) that describe additional
information about combat, mission, other criteria. This data element may be
elaborated along multiple components.

### Terminology Requirements

An initial gap analysis of SNOMED CT terminology identified that we are missing
significant content related to discharge status requirements in
[DischargeStatusCode](#BKM_69D9F4E3_FE3B_41BE_B6D9_CAAC44AE48D5).

Other terminology extension and harmonization targets are:

-   [MilitaryBranchCode](#BKM_BE5D4E9C_A245_4F0E_A2F6_98F8B589AC43)

-   [PayGradeCode](#BKM_CCBE5EDA_C9CA_456F_9D80_186017054BA4)

Another gap is "separation reason" that requires a coded concept for its
Observation component and its allowed values.

In the future, the [MissionCode](#BKM_52B053B5_943F_4ACA_BDF1_5A6B28C74F6B) may
also need a SNOMED CT extension if the VA API requires it.

For a complete set of terminology extension, refer to the Logica Solor page
intended to address the concept gaps:
https://logica.atlassian.net/wiki/spaces/SOLOR/pages/865271876/Military+Service+History+and+Status

The following diagram summarizes the terminology requirements for this
implementation guide.This analysis is further refined as a Logica Health Solor
activity:

https://logica.atlassian.net/wiki/spaces/SOLOR/pages/865271876/Military+Service+History+and+Status

![](40fce3e84ca958e5ae0a8141f6702a99.emf)

Figure 3: Terminology Requirements

##### Job Supervisory Level or Pay Grade (ODH)

This code system is used in value set:**" Job Supervisory Level or Pay Grade
(ODH)"**

https://phinvads.cdc.gov/vads/ViewValueSet.action?id=B35E2ABE-C20F-EA11-8183-005056ABE2F0

-   Canonical URL based on the current version of UT:
    **http://build.fhir.org/ig/HL7/UTG/CodeSystem-PHOccupationalDataForHealthODH.html**

##### Industry CDC NAICS 2012 (ODH)

This code system used in value set

**Code system url:** Currently the code system URL will be the one published by
the UT project.

-   **http://build.fhir.org/ig/HL7/UTG/CodeSystem-PHOccupationalDataForHealthODH.html**

##### SNOMED CT

SNOMED CT will be used to fill any terminology gaps that are not already
addressed by FDA code systems in the US.

##### SOLOR MSH Extension

A code system representing the SOLOR extension for Military Service History and
Status in Logica Health.

The extension for this IG addresses the following gaps:
https://logica.atlassian.net/wiki/spaces/SOLOR/pages/865271876/Military+Service+History+and+Status

**The proposed canonical URL
is:https://www.logicahealth.org/solutions/solor/MSH**

Reference issue: " https://jira.hl7.org/browse/FHIR-27926?filter=-2

##### ODH_Occupation

https://phinvads.cdc.gov/vads/ViewValueSet.action?id=5718C508-111B-4737-A48C-FDCFD301C0D

Value Set Name Industry NAICS Detail (ODH)

Value Set OID 2.16.840.1.114222.4.11.7900

Value Set Description Concepts describing the kind of business that compensates
the person for work (e.g., wages, training) or assigns work to a volunteer, as
reported by the person. The kind of business is determined based on the primary
business activity conducted by the company, organization, or individual (for
those who are self-employed), or, for a military position, the self-reported
branch of service. The value set was created by coding the NAICS index terms,
which are relatable to the general public, to facilitate collection and
validation by patients. A downloadable file available from the PHIN VADS ODH Hot
Topics section is structured to support computer-assisted searching of this
value set. The file also contains a crosswalk from the concepts in this value
set to Occupation_CDC_Census value set concepts.

##### DischargeStatusCode

A SNOMED CT Extension needed to describe the status when an individual leaves
military service.

The VA API and Z-segment specification declares local extensions to SNOMED CT
corresponding to **subtypes** of **"Left Military Service" 266964007 concept.**

**Question:** Should it include "active" because we may have a DoD API that
works in a similar way?

**Answer**: No, the cardinality should allow for this data element to omitted if
the service episode is the current episode.

|                                          | **Multiplicity** | **Notes**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
|------------------------------------------|------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **general**                              | [1...1]          | General status. This concept is a gap in SNOMED CT. **subtype** of **"Left Military Service" 266964007 concept. local concept id:**                                                                                                                                                                                                                                                                                                                                                           |
| **honorable**                            | [1...1]          | [Additional description pending.] This concept is a gap in SNOMED CT.                                                                                                                                                                                                                                                                                                                                                                                                                         |
| **dishonorable discharge**               | [1...1]          | This status has an equivalent concept in SNOMED CT: **276086007**                                                                                                                                                                                                                                                                                                                                                                                                                             |
| **bad-conduct**                          | [1...1]          | [Additional description pending.] This concept is a gap in SNOMED CT.                                                                                                                                                                                                                                                                                                                                                                                                                         |
| **other-than-honorable**                 | [1...1]          | [Additional description pending.] This concept is a gap in SNOMED CT. Relationships: This concept has two child concepts: honorable-for-va-purposes dishonorable-for-va-purposes During the review process, the Veteran will in "Pending Character of Discharge" (COD) state defined as "                                                                                                                                                                                                     |
| **dishonorable-for-va-purposes**         | [1...1]          | This status is obtained when "other-than-honorable" is later deemed to be **dishonorable** for Title 38 Veteran Benefits criteria. This concept is a gap in SNOMED CT. "Has a Character of Discharge (COD) review from VBA ruling the individual Dishonorable for VA Purposes (DVA), and was originally one of the discharge types in the second row of this table." Relationships: This concept is a subtypes of **"Other-than-honorable" .**                                                |
| **honorable-for-va-purposes**            | [1...1]          | This status is obtained when "other-than-honorable" is later deemed to be **honorable** for Title 38 Veteran Benefits criteria. This concept is a gap in SNOMED CT. "Has a character of discharge of: • Honorable • Under Honorable Conditions (General) • Uncharacterized (Entry level separation) **OR** Has a Character of Discharge (COD) review from VBA ruling the individual Honorable for VA Purposes (HVA)." Relationships: This concept is a subtypes of **"Other-than-honorable"** |
| **honorable-absence-of-negative-report** | [1...1]          | [Additional description pending.] This concept is a gap in SNOMED CT. Relationships: This concept is a subtype of **"honorable-discharge ?"**                                                                                                                                                                                                                                                                                                                                                 |
| **uncharacterized**                      | [1...1]          | [Additional description pending.] This concept is a gap in SNOMED CT.                                                                                                                                                                                                                                                                                                                                                                                                                         |
| **unknown**                              | [1...1]          | [Additional description pending.] This concept is a gap in SNOMED CT. Missing information about discharge status.                                                                                                                                                                                                                                                                                                                                                                             |

##### MilitaryBranchCode

"The military branch associated with service, National guard, and Reserve."

The **Military Branches** coded concepts are documented in PHIN VADS as
[Industry CDC](#BKM_88153D8A_5607_4708_BEE7_B475C00F042A) [NAICS 2012
(ODH)](#BKM_88153D8A_5607_4708_BEE7_B475C00F042A).

**Localization Note:**

-   From an occupational standpoint, any foreign military service should be
    captured as well as US military service. The profile allows an
    "**extensible**" terminology binding to allow a service history that
    includes service in US and foreign armed forces.

-   The VA API will be limited to US Armed Forces; similarly, Canadian Forces
    will implement a realm-specific approach that accommodates Canadian
    requirements.

**Note:** the following is complete list of concepts to describe the military
branch.

**Additional**: NOAA and Merchant Marine members may also be included in this
value set.

|                                               | **Multiplicity** | **Notes**                                                                                                                                                                                                                                                                                                                             |
|-----------------------------------------------|------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **U. S. Armed Forces - Branch not specified** | [1...1]          | Code: 9870: Military Reserves or National Guard System URL: [http://terminology.hl7.org/CodeSystem/PHIndustryCDCCens](http://terminology.hl7.org/CodeSystem/PHIndustryCDCCensus2010)[us2010](http://terminology.hl7.org/CodeSystem/PHIndustryCDCCensus2010)                                                                           |
| **U. S. Army**                                | [1...1]          | Code: 9670 (U.S. Army) System URL: [http://terminology.hl7.org/CodeSystem/PHIndustryCDCCens](http://terminology.hl7.org/CodeSystem/PHIndustryCDCCensus2010)[us2010](http://terminology.hl7.org/CodeSystem/PHIndustryCDCCensus2010)                                                                                                    |
| **U. S. Air Force**                           | [1...1]          | Code: 9680: U.S. Air Force System URL: [http://terminology.hl7.org/CodeSystem/PHIndustryCDCCens](http://terminology.hl7.org/CodeSystem/PHIndustryCDCCensus2010)[us2010](http://terminology.hl7.org/CodeSystem/PHIndustryCDCCensus2010)                                                                                                |
| **U. S. Marine Corps**                        | [1...1]          | Code: 9770 (U.S. Marines) System URL: [http://terminology.hl7.org/CodeSystem/PHIndustryCDCCens](http://terminology.hl7.org/CodeSystem/PHIndustryCDCCensus2010)[us2010](http://terminology.hl7.org/CodeSystem/PHIndustryCDCCensus2010)                                                                                                 |
| **U. S. Navy**                                | [1...1]          | Code: 9690: U.S. Navy System URL: [http://terminology.hl7.org/CodeSystem/PHIndustryCDCCens](http://terminology.hl7.org/CodeSystem/PHIndustryCDCCensus2010)[us2010](http://terminology.hl7.org/CodeSystem/PHIndustryCDCCensus2010)                                                                                                     |
| **U. S. Coast Guard**                         | [1...1]          | Code: 9780: U.S. Coast Guard System URL: [http://terminology.hl7.org/CodeSystem/PHIndustryCDCCens](http://terminology.hl7.org/CodeSystem/PHIndustryCDCCensus2010)[us2010](http://terminology.hl7.org/CodeSystem/PHIndustryCDCCensus2010)                                                                                              |
| **Military Reserves or National Guard**       | [1...1]          | Concept (id: 9870] is used to specify Reserves or National Guard service. Code: 9870: Military Reserves or National Guard System URL: [http://terminology.hl7.org/CodeSystem/PHIndustryCDCCens](http://terminology.hl7.org/CodeSystem/PHIndustryCDCCensus2010)[us2010](http://terminology.hl7.org/CodeSystem/PHIndustryCDCCensus2010) |
| **Non-US Armed Forces (out-of-scope)**        | [1...1]          | **Question**: Is it useful to document service in foreign armed forces? **Answer**: No, not at this time. This concept is out-of-scope at this time.                                                                                                                                                                                  |

##### PayGradeCode

Defines the level of compensation for a position, normalized across military
branches. This value set harmonizes the concepts used in VA wit those specified
by FDA for Occupational Data for Health implementations.

This specification will use the latest FDA value set specified in [Job
Supervisory Level or Pay](#BKM_0D6D76FC_1E59_4574_B56F_1BD12F5BD18F) [Grade
(ODH)](#BKM_0D6D76FC_1E59_4574_B56F_1BD12F5BD18F).

##### SeparationReasonCode

"Additional description for separation reason beyond discharge status value."

**Note:** This may need to be specified as a code value rather than a text
value.

Separation reason codes. These codes will be addressed as gaps/change requests
in SNOMED CT using the Solor Project:
https://logica.atlassian.net/wiki/spaces/SOLOR/pages/865271876/Military+Service+History+and+Status

Requirements:

![](553216a539187fb43795830bc4a65d80.png)

## Implementation

One of the requirements of this implementation guide is to provide an operation
for to confirm or verify that an individual has been confirmed to be a veteran.

The following represents the proposed API. It relies on a custom operation
(\$**veteranStatus**) associated with the **Patient** resource and
**Observation** resources to represent the military service history episode
including deployment and occupation :

![](92d8c332e8b6795960d057fd138d300b.emf)

Figure 4: Custom Operations

The following diagram uses Business Process Modeling Notation (BPMN) to describe
the pre-conditions/triggers and post-conditions/results of using the FHIR-based
API outlined in this IG:

![](51c4d2910afddb73976e4e98f8bb30ed.emf)

Figure 5: Retrieving status and military history using a FHIR-based API

#### FHIR API (server)

This API specifies the resources and operations required in an API that meets
the requirements specified in the [Use Case
Analysis](#BKM_AAE71534_C7E9_47A1_9421_6733DA4A8780):

-   **Patient/\$veteranStatus** with parameters: last name, first name, gender,
    date of birth, social security number

-   **Patient** resource needed to retrieve the id of the resources matching a
    verified veteran

-   **Observation** resource to manage the information associated with military
    service and veteran status

| **Transaction**                       | **Notes**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | **Parameters**                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
|---------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Patient/\$veteranStatus()** boolean | This operation provides verification and confirmation of a Patient's status as a Veteran based on the identifying traits. This operations addresses both the "verification" and "confirmation" capabilities currently available to application developers who use the VA Developer API "Veteran Verification" endpoint. This operation returns a true, if the patient is confirmed to be a Veteran, false if the patient is not validated/confirmed to be Veteran. Error 404 will specify that the patient could not be found. The client system may resubmit the operation with revised parameter or interpret the error to indicate that the Veteran status of an individual could not be confirmed or validated using the API. This operation implements the [Verify Veteran](#BKM_F5253531_B6E8_435B_8DB9_0F59C4BC497C) [Status](#BKM_F5253531_B6E8_435B_8DB9_0F59C4BC497C) use case described in the [Use Case](#BKM_AAE71534_C7E9_47A1_9421_6733DA4A8780) [Analysis](#BKM_AAE71534_C7E9_47A1_9421_6733DA4A8780) section. **Note**: This operation has a dependency on the implementation of a **Patient** resource that supports the capability to record that a Patient's veteran status was confirmed.                                                         | **Identifier** ] **identifier** Social Security Number or another identifier; only one, the most relevant identifier should be used. **string-primitive** ] **firstName** Patient's first name, mandatory **string-primitive** ] **lastName** Patient's last name, mandatory **date** ] **dateOfBirth** Patient's date of birth **code** ] **gender** Patients gender - as specified in the Administrative Gender value set: http://build.fhir.org/valueset-administrative-gender.html |
| **Observation()** Bundle              | The [Military Service Episode](#BKM_1EE5C72B_FAB7_48FE_81D2_FE7E3F24BBE0) , [Combat Episode](#BKM_15AF665A_23CD_4387_A2F0_EA121D7063E0), and [MilitaryOccupation](#BKM_4E409704_B7BB_4120_9A2B_701812EFF377) are all profiles of Observation resource and using a subset of [available parameters](#search) for Observation resource): **code** to search all Observations corresponding [Military Service Episode](#BKM_1EE5C72B_FAB7_48FE_81D2_FE7E3F24BBE0) for the patient specified in t **has-member** - to search by combat episode or military occupation **patient** - patient id of Veteran's Patient record, used to search for observations associated with a specific Patient who is a verified Veteran. A **search** operation that uses the search parameters described here meets the requirements specified in [Use Case Analysis](#BKM_AAE71534_C7E9_47A1_9421_6733DA4A8780) : [Search Service History](#BKM_1D0C200D_D352_4DF3_8863_57C1F1363AF2) use case. Note: the "code" values corresponding to [Military Service Episode](#BKM_1EE5C72B_FAB7_48FE_81D2_FE7E3F24BBE0) , [Combat Episode](#BKM_15AF665A_23CD_4387_A2F0_EA121D7063E0), and [MilitaryOccupation](#BKM_4E409704_B7BB_4120_9A2B_701812EFF377) will be submitted to post the ballot. | **code** ] **code** This parameter would be set to the LOINC code associated with Military Service and/or Combat History **reference** ] **has-member** This parameter set to the Military Occupation and/or Combat History **reference** ] **patient**                                                                                                                                                                                                                                |

### Associated Extensions and Profile

To record the confirmed Veteran status, this IG has identified the need to
specify an extension on the Patient to specify whether the patient was confirmed
to be a veteran.

-   [US Veteran](#BKM_3FC427E4_B1A8_477B_8C39_4F686B10ADD7) specifies a flag to
    indicate the veteran status as a boolean value.

A FHIR API may use veteran status extension specified in the US Patient profile
to implement the \$veteranStatus operation.

![](89dceec7af52bf0dbedfee5e6b568465.emf)

Figure 6: Associated Extensions related to Veteran Verificatoin

## Testing Guidance and Examples

The current VA API uses an ad-hoc verification operation and allows third-party
systems to retrieve the military service - including combat episodes. This track
will demonstrate how this API can be provided using a standards-based approach
that includes FHIR resources and terminology constraints using concepts from
LOINC, SNOMED CT, and CDC ODH - as specified in the associated Logica project
intended to validate the extensions needed to represent Military Service and
Combat Episodes using Observation resource similar to ODH. The current REST API
is used primarily verify veteran status for benefits associated with military
service (e.g., insurance coverage, discounts, education assistance, etc.). The
enhanced FHIR-based API will make this API readily available for health-related
purposes: social determinants of health, risk factors for specific conditions
(e.g. health disease, major depressive disorder, suicidal ideation).

In addition to proving the feasibility of FHIR resources to provide equivalent
capabilities to the current API, this project will also introduce
standards-based concepts in place of local VA terminology for discharge status
and separation reason as well we reusing CDC ODH concept to represent the
military branch and pay grade of a Veteran.

### Testing Workflow

This workflow identifies the activities and API calls required to address the
requirements specified in the [Use Case
Analysis](#BKM_AAE71534_C7E9_47A1_9421_6733DA4A8780).

##### Testing Workflow

The following is a testing workflow for this API. Successful testing may also
use test scripts and pre-conditions to results of an EHR invoking the proposed
API to verify status and retrieve the military history information of a Veteran
using FHIR-based resources.

![](0bed0cbf64e1174b1c3304f3a88d2e5a.emf)

Figure 7: Testing Workflow

### Verify Veteran Status: Step 1

Scenario \#1: Veteran Confirmation and Verification

A Veteran is receiving treatment in the community and invokes the
"\$veteranStatus" operation using the Veteran's demographics (e.g. fist, last,
date of birth, social security number). If the Veteran is verified then the
client application proceed to Step 2.

Scenario Step 1 : Search the Patient resource to evaluate whether "Sam Share" is
a confirmed/validated Veteran based on the VA-specific extension

### Search Military Service History: Step 2

Scenario Step 2: Search the Observation resource for a list of Military Service
Episodes: search by "subject" (i.e. Patient/Veteran) and by "patient" and "code"
search parameters

Action:

Client Code - Use the following code snippet to execute this action in your own
client.

// Create a client (only needed once)

FhirContext ctx = new FhirContext();

IGenericClient client =
ctx.newRestfulGenericClient("http://hapi.fhir.org/baseR4");

// Invoke the client

Bundle bundle = client.search().forResource(Observation.class)

.where(new
TokenClientParam("code").exactly().code("bdb89d1f-f2c1-497b-ad7e-9ab8078a124b"))

.where(new ReferenceClientParam("patient").hasId("sam-share-ssgt-veteran"))

.prettyPrint()

.execute();

Request GET
http://hapi.fhir.org/baseR4/Observation?code=bdb89d1f-f2c1-497b-ad7e-9ab8078a124b&patient=sam-share-ssgt-veteran&_pretty=true

Request Headers

Accept-Charset: utf-8

Accept: application/fhir+xml;q=1.0, application/fhir+json;q=1.0,
application/xml+fhir;q=0.9, application/json+fhir;q=0.9

User-Agent: HAPI-FHIR/5.2.0-SNAPSHOT (FHIR Client; FHIR 4.0.1/R4; apache)

Accept-Encoding: gzip

Response HTTP 200 OK

Response Headers

x-request-id: TnguHYocTUtM3Rl1

date: Thu, 10 Sep 2020 13:03:59 GMT

last-modified: Thu, 10 Sep 2020 13:03:58 GMT

server: nginx/1.14.0 (Ubuntu)

transfer-encoding: chunked

x-powered-by: HAPI FHIR 5.2.0-SNAPSHOT REST Server (FHIR Server; FHIR 4.0.1/R4)

connection: keep-alive

content-type: application/fhir+json;charset=utf-8

Result Body JSON bundle (4368 bytes)

Bundle contains 1 / 1 entries

Observation/military-service-episode/_history/1 12:42:36

Raw Message

{

"resourceType": "Bundle",

"id": "3d60dd95-8620-4542-af97-b2fa9a19e6cc",

"meta": {

"lastUpdated": "2020-09-10T13:03:58.951+00:00"

},

"type": "searchset",

"total": 1,

"link": [ {

"relation": "self",

"url":
"http://hapi.fhir.org/baseR4/Observation?_pretty=true&code=bdb89d1f-f2c1-497b-ad7e-9ab8078a124b&patient=sam-share-ssgt-veteran"

} ],

"entry": [ {

"fullUrl": "http://hapi.fhir.org/baseR4/Observation/military-service-episode",

"resource": {

"resourceType": "Observation",

"id": "military-service-episode",

"meta": {

"versionId": "1",

"lastUpdated": "2020-09-10T12:42:36.025+00:00",

"source": "\#5DZ27OcD1FKIROE9",

"profile": [
"http://hl7.org/fhir/militaryserviceandstatus/StructureDefinition/militaryserviceepisode"
]

},

"text": {

"status": "generated",

"div": "\<div xmlns=\\"http://www.w3.org/1999/xhtml\\"/\>"

},

"status": "final",

"category": [ {

"coding": [ {

"system": "http://terminology.hl7.org/CodeSystem/observation-category",

"code": "social-history",

"display": "Social History"

} ],

"text": "Social History: Military Service"

} ],

"code": {

"coding": [ {

"system": "http://www.logicahealth.org/solutions/solor",

"_system": {

"fhir_comments": [ " http://www.logicahealth.org/solutions/solor will be
replaced with http://loinc.org when the concept will be added to LOINC " ]

},

"code": "bdb89d1f-f2c1-497b-ad7e-9ab8078a124b",

"_code": {

"fhir_comments": [ " placeholder concept in Solor " ]

},

"display": "Military Service Episode"

} ],

"text": "Vital signs panel"

},

"subject": {

"fhir_comments": [ " Referenced Veteran's Patient resource insstance " ],

"reference": "Patient/sam-share-ssgt-veteran",

"display": "veteran"

},

"effectivePeriod": {

"fhir_comments": [ " Period of service " ],

"start": "2016-12-06",

"end": "2020-07-22"

},

"hasMember": [ {

"fhir_comments": [ " Associated combat episodes " ],

"reference": "Observation/combat-episode-1",

"display": "1st compbat episode"

}, {

"reference": "Observation/combat-episode-2",

"display": "2nd compbat episode"

} ],

"component": [ {

"fhir_comments": [ " Military branch/industry" ],

"code": {

"coding": [ {

"system": "http://loinc.org",

"code": "86188-0",

"display": "Industry"

} ]

},

"valueCodeableConcept": {

"coding": [ {

"system":
"http://terminology.hl7.org/CodeSystem/PHOccupationalDataForHealthODH",

"code": "928110.000255",

"display": "Air Force"

} ]

}

}, {

"fhir_comments": [ " Supervisory Level Pay grade " ],

"code": {

"coding": [ {

"system": "http://www.logicahealth.org/solutions/solor",

"code": "E-5",

"display": "US Military Enlisted paygrade E-5"

} ]

}

}, {

"fhir_comments": [ " Gaps managed in http://www.logicahealth.org/solutions/solor
", " Discharge status code " ],

"code": {

"coding": [ {

"system": "http://www.logicahealth.org/solutions/solor",

"code": "79A512F77CFC4E63B9969930FC8787DB",

"_code": {

"fhir_comments": [ " Placeholder concept from
http://build.fhir.org/ig/HL7/fhir-military-service/ValueSet-msh-DischargeStatusValueSet.html
" ]

},

"display": "Honorably Discharged"

} ]

}

}, {

"fhir_comments": [ " Separation Reason code: 034\\MEDAL OF HONOR RECIPIENT " ],

"code": {

"coding": [ {

"system": "http://www.logicahealth.org/solutions/solor",

"code": "034",

"_code": {

"fhir_comments": [ " Placeholder concept from
http://build.fhir.org/ig/HL7/fhir-military-service/ValueSet-msh-SeparationReason-vs.html
" ]

},

"display": "Medal of Honor Recipient"

} ]

}

} ]

},

"search": {

"mode": "match"

}

} ]

}

### Search Military History: Step 3

Scenario Step 3: Search the Observation resource for a list of Combat Episodes:
search by "subject" (i.e. Patient/Veteran) and by "patient" and "code" search
parameters

Action:

Request GET
http://hapi.fhir.org/baseR4/Observation?patient=sam-share-ssgt-veteran&code=4166ca15-bb96-4f7a-b968-7caab70e01b8&_pretty=true

Request Headers

Accept-Charset: utf-8

Accept: application/fhir+xml;q=1.0, application/fhir+json;q=1.0,
application/xml+fhir;q=0.9, application/json+fhir;q=0.9

User-Agent: HAPI-FHIR/5.2.0-SNAPSHOT (FHIR Client; FHIR 4.0.1/R4; apache)

Accept-Encoding: gzip

Response HTTP 200 OK

Response Headers

x-request-id: FoM14c2teQZPTigG

date: Thu, 10 Sep 2020 14:32:44 GMT

last-modified: Thu, 10 Sep 2020 14:32:44 GMT

server: nginx/1.14.0 (Ubuntu)

transfer-encoding: chunked

x-powered-by: HAPI FHIR 5.2.0-SNAPSHOT REST Server (FHIR Server; FHIR 4.0.1/R4)

connection: keep-alive

content-type: application/fhir+json;charset=utf-8

Result Body JSON bundle (6005 bytes)

Bundle contains 2 / 2 entries

Observation/combat-episode-2/_history/1 12:36:58

Observation/combat-episode-1/_history/1 12:35:24

Raw Message

{

"resourceType": "Bundle",

"id": "811f735d-26c4-411c-9602-347c7e37e5bb",

"meta": {

"lastUpdated": "2020-09-10T14:32:44.654+00:00"

},

"type": "searchset",

"total": 2,

"link": [ {

"relation": "self",

"url":
"http://hapi.fhir.org/baseR4/Observation?_pretty=true&code=4166ca15-bb96-4f7a-b968-7caab70e01b8&patient=sam-share-ssgt-veteran"

} ],

"entry": [ {

"fullUrl": "http://hapi.fhir.org/baseR4/Observation/combat-episode-2",

"resource": {

"resourceType": "Observation",

"id": "combat-episode-2",

"meta": {

"versionId": "1",

"lastUpdated": "2020-09-10T12:36:58.427+00:00",

"source": "\#UbUeKRDrKjlcufio",

"profile": [
"http://hl7.org/fhir/militaryserviceandstatus/StructureDefinition/combatepisode"
]

},

"text": {

"status": "generated",

"div": "\<div xmlns=\\"http://www.w3.org/1999/xhtml\\"/\>"

},

"status": "final",

"category": [ {

"coding": [ {

"system": "http://terminology.hl7.org/CodeSystem/observation-category",

"code": "social-history",

"display": "Social History"

} ],

"text": "Social History: Military Service"

} ],

"code": {

"coding": [ {

"system": "http://www.logicahealth.org/solutions/solor",

"_system": {

"fhir_comments": [ " http://www.logicahealth.org/solutions/solor will be
replaced with http://loinc.org when the concept will be added to LOINC " ]

},

"code": "4166ca15-bb96-4f7a-b968-7caab70e01b8",

"_code": {

"fhir_comments": [ " placeholder concept in Solor " ]

},

"display": "Combat Episode"

} ],

"text": "Vital signs panel"

},

"subject": {

"fhir_comments": [ " Referenced Veteran's Patient resource insstance " ],

"reference": "Patient/sam-share-ssgt-veteran",

"display": "veteran"

},

"effectivePeriod": {

"fhir_comments": [ " Period of service " ],

"start": "2018-07-22",

"end": "2020-07-22"

},

"component": [ {

"fhir_comments": [ " Location" ],

"code": {

"coding": [ {

"system": "http://loinc.org",

"code": "86188-0",

"display": "Combat Location"

} ]

},

"valueCodeableConcept": {

"coding": [ {

"system": "http://hl7.org/fhir/ValueSet/iso3166-1-3",

"code": "IRQ",

"display": "Iraq"

} ]

}

}, {

"fhir_comments": [ " Mission Details Code " ],

"code": {

"coding": [ {

"system": "http://www.logicahealth.org/solutions/solor",

"code": "ff83dbf9-592a-4e60-a979-4e4e10c9ace3",

"display": "Military Mission Code"

} ]

},

"valueCodeableConcept": {

"coding": [ {

"system": "http://www.logicahealth.org/solutions/solor",

"code": "46a15b13-b5c1-4ae8-acde-48c31f30175a",

"display": "Enduring Freedom"

} ]

}

} ]

},

"search": {

"mode": "match"

}

}, {

"fullUrl": "http://hapi.fhir.org/baseR4/Observation/combat-episode-1",

"resource": {

"resourceType": "Observation",

"id": "combat-episode-1",

"meta": {

"versionId": "1",

"lastUpdated": "2020-09-10T12:35:24.111+00:00",

"source": "\#gCSeRD2R1Usnwz05",

"profile": [
"http://hl7.org/fhir/militaryserviceandstatus/StructureDefinition/combatepisode"
]

},

"text": {

"status": "generated",

"div": "\<div xmlns=\\"http://www.w3.org/1999/xhtml\\"/\>"

},

"status": "final",

"category": [ {

"coding": [ {

"system": "http://terminology.hl7.org/CodeSystem/observation-category",

"code": "social-history",

"display": "Social History"

} ],

"text": "Social History: Military Service"

} ],

"code": {

"coding": [ {

"system": "http://www.logicahealth.org/solutions/solor",

"_system": {

"fhir_comments": [ " http://www.logicahealth.org/solutions/solor will be
replaced with http://loinc.org when the concept will be added to LOINC " ]

},

"code": "4166ca15-bb96-4f7a-b968-7caab70e01b8",

"_code": {

"fhir_comments": [ " placeholder concept in Solor " ]

},

"display": "Combat Episode"

} ],

"text": "Vital signs panel"

},

"subject": {

"fhir_comments": [ " Referenced Veteran's Patient resource insstance " ],

"reference": "Patient/sam-share-ssgt-veteran",

"display": "veteran"

},

"effectivePeriod": {

"fhir_comments": [ " Period of service " ],

"start": "2016-12-06",

"end": "2018-07-22"

},

"component": [ {

"fhir_comments": [ " Location" ],

"code": {

"coding": [ {

"system": "http://loinc.org",

"code": "86188-0",

"display": "Combat Location"

} ]

},

"valueCodeableConcept": {

"coding": [ {

"system": "http://hl7.org/fhir/ValueSet/iso3166-1-3",

"code": "AFG",

"display": "Afghanistan"

} ]

}

}, {

"fhir_comments": [ " Mission Details Code " ],

"code": {

"coding": [ {

"system": "http://www.logicahealth.org/solutions/solor",

"code": "ff83dbf9-592a-4e60-a979-4e4e10c9ace3",

"display": "Military Mission Code"

} ]

},

"valueCodeableConcept": {

"coding": [ {

"system": "http://www.logicahealth.org/solutions/solor",

"code": "46a15b13-b5c1-4ae8-acde-48c31f30175a",

"display": "Enduring Freedom"

} ]

}

} ]

},

"search": {

"mode": "match"

}

} ]

}
