The FHIR profiles and extensions in this implementation guide are intended to
fill gaps in current implementations of HL7 Version 2 and RESTful APIs currently
available to implementers. This implementation guide expands FHIR best practices
to assist organizations that adapt and extend FHIR profiles and implementation
guides required in their jurisdictions (e.g. US, Canada) to apply them to
locally-applicable requirements that meet their stakeholders business needs.
Currently there are several US Realm projects that need to use, manage, and collect information about military service, discharge, status, combat, etc. using information provided by patients/Veterans, validated based on service records. This project will help coordinate the effort to create profiles and extensions needed to represent Military Service History, Veteran status, and associated risk factors
This specification also identifies code systems and terminology gaps that
require require subsequent change proposals to LOINC and SNOMED CT consistent
with the requirements summarized in the use cases.

                                                                 
### Background

This implementation guide design document is intended to create a set of
profiles and extensions to support Military Service History and Status reporting
consistent with US regulatory requirements (i.e. Title 38 Veteran Benefits) and
extensible to other realms/jurisdictions (e.g. Canadian Forces).
It harmonizes the requirements of the U.S. Department of Veterans Affairs (VA)
and the Centers for Disease Control and Prevention (CDC) to record this
information more easily in support of administrative and clinical workflows and
the work and social history of patients who are also Veterans.
-   **ZMH** (Military Service History) Z-segment used to represent service and
    deployment history in HL7 Version 2 transactions. This segment is used to
    exchange information about military service history,
-   **ServiceHistoryEpisode** and **Deployment** Schemas for the [VA Veteran Verification API](https://developer.va.gov/explore/verification/docs/veteran_verification?version=current)
-   [HL7 FHIR Profiles and patterns from Occupational Data for Health (ODH),Release 1.0](http://hl7.org/fhir/us/odh/) as well
    of ODH concept for **Military Branch** and **Pay Grade**.
### Use Case Analysis

The use case anlaysis describes requirements and associated capabilities to manage and
exchange information about Military Service History and Status. All requirements
are analyzed as use cases involving actors/participants and system interactions.

*Note:* Certain requirements were discussed, deemed to be out-of-scope, and
deferred (see **Deferred Requirements**).

Figure 1 is a summary of scenarios (use cases) representing the requirements for
recording self-reported military and combat history. It also illustrates how
FHIR-based APIs can be used to validate employment history information reported
by Veterans.
<img src="Use Case Analysis Overview.png" alt="Use Case Analysis Overview*" width="100%" />
*Figure 1: Use Case Analysis Overview*

#### Use Case Analysis: Actors

##### Clinician
The clinician may be working with Veteran in the community and must assess the
health risks associate with military service.

##### Veteran
The Veteran is the focus of this specification. The API describe here allows
Veterans to access and share their military service history and status
information with community clinicians, community service agencies, vendors, and
employers, etc. The Veteran can access their information or make it available to
entities that assist Veterans. Military Service History may be combined with
other employment history information.

This section describes the use cases needed to manage Military Service History
both as self-reported employment history and API-supported verification of
detailed military service history.
#### Use Case Analysis: Use Cases

##### Request Employment History with Social History and Determinants of Health

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

##### Verify Veteran Status

The Verification API proposed in this document determines the Veteran’s status
by using demographic information submitted as a query (search operation) to a
FHIR server that supports **Observation** resource - - using the **Patient**
endpoint to determine whether a person is a verified veteran. Additional
information is provided using the Search Service History criteria using the
profiles described in the [Information Requirements](#information-and-semantics-requirements) section (see [Military Service Episode](#military-service-episode)).

This use cases requires a cutom operation:
**Operation**: \$**veteranStatus** returns true if a patient is a Vetern, false otherwise, 
or an error if the search crieria do not match a patient record.

##### Search Service History

This use case is part of in the proposed verification API based on FHIR. If this
search operation returns one or more **Observation** resources that conform
[Military Service Episode](#military-service-episode) to the proposed profile,
the Veteran's status confirmed. If the search operation does not find any
matching Observation resources, the Veteran's status could not be confirmed.

The presence of one or more Observations that conform to the [Deployment
Episode](#deployment-episode) profile proposed here indicates that Veteran
served in combat.

#### Deferred Requirements

The following use cases were discussed and deferred because they are
out-of-scope for the profiles and extensions described in this implementation
guide design document:


* **Prior Authorization:** U.S. Department of Defense (DoD) administrative transactions are currently used for prior authorization for healthcare services. This use case will not be addressed in this document but it may be relevant to future FHIR profiling efforts.
* **Apply for coverage:** A Veteran's military history and other service-related information are relevant to applying for healthcare coverage. This use case was discussed with theFinancial Management Workgroup on March 31, 2020 and it will remain out-of-scope for this iteration of the specification. Military service history is relevant to establish level of care but will not be explored further in this document.
* **Schedule service-connected visit:** Another potential use case included scheduling a visit for a service-connected disorder or condition. This use case was discussed and deemed out-of-scope for now since it is related to level of disability and service-connected problems, as well as:
- -  an encounter related to a service-connected disability, special authority designation and those services are not billable;
- - care may be covered by special authority (e.g. neck/throat cancer); and,
- - coding system for special authority and service-related not in scope.

### Information and Semantics Requirements

In HL7 Version 2 interfaces, the data required to exchange military service
history and status is accomplished using extensions segments (i.e. Z-segments).
The naming convention for extensions in HL7 Version 2 requires that new segment
names start with the letter "Z". For instance, the VA extension for "Military Service" is "ZMH". This extension
can be added to message payloads (e.g. administrative transactions) to convey
this content. 
This section describes the result harmonizing requiremetns and prior experience with HL7 Version 2 and RESTful APIs used to convey military service history and status at this time. It also harmonizes the content of the Occupational Data for Health
Implementation Guide developed by CDC to enhance social history and employment
history reporting from EHR systems.

Figure 2 summarizes the proposed profiles and extensions needed to document
military service history. The profiles described here constrain and extend the
normative Observation resources profile (Release 4 and later) to ensure
stability and reusability. FHIR Release 4 marked the first time some FHIR
resources have attained normative status and will be maintained in a manner that
ensure backwards-compatibility. Furthermore, using [Observation R4 and
later](http://build.fhir.org/observation.html) - rather than
[Basic](http://build.fhir.org/basic.html) resource - is the recommended approach
to creating extensible APIs based on FHIR.

<img src="Information Requirements.png" alt="Information Requirements" width="100%" />
*Figure 2: Information Requirements*

**Note:** FHIR implementation, localization, and profiling best-practices are
under development and evolving. This design document is intended to provide
reasoning and context for future projects.

#### Employment History Episode

Employment history consists of a series Employment Episodes. In the past these
episodes have been represented as Z-segments and added to various transactions
to support social history determination, benefit, etc. This profile is intended
to represent employment history for International use and it may be localized by
HL7, IHE, and other profile developers.

The Employment Episode profile of is the base profile for [Military Service
Episode profile](#military-service-episode) and [ODH Past or Present
Job](http://hl7.org/fhir/us/odh/StructureDefinition-odh-PastOrPresentJob.html)
profile and other profiles intended to describe specific types of employment.

This profile is marked as "constrainable" because it's intended to be reused to
create additional profile, more specific, or localized to jurisdiction.

|  Data Elements                       | **Multiplicity**                   | **Notes**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
|--------------------------------------|------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **id** uuid                          | [1...1]                            | Unique identifier of the episode- typically assigned by a FHIR server. It may be used to retrieve a specific or latest version of the FHIR resource (i.e. Observation) used to represent military service episode(s) for a Veteran. Path: **Oservation.id** as globally/universally unique identifier (uuid)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| **url** url                          | [1...1]                            | Profile canonical url used to reference this profile in an Observation that conforms this profile. Fixed value in the {StructureDefinition.url} to the value 'http://hl7.org/fhir/StructureDefinition/employment-episode' Path: **Observation.meta.profile** This profile may be used along with other profiles met by the Observation resource.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| **identifier** Identifier            | [0...1]                            | This data element may be used to specify a business identifier of the employment episode that could be referenced across FHIR APIs. Path: **Observation.identifier**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| **code** CodeableConcept             | [1...1] | Standard code that describes a generic employment episode using an extensible value set binding. This data element is mandatory (cannot be null) is this profile and any of its derivation. The value set binding is extensible but it requires a LOINC code. Path: **Observation.code** Binding strength: **Extensible**; to allow derived profiles to substitute the binding with a subset of the value set referenced here. Local temporary concept id: **f6341bf2-e765-4639-8800-6805520ece8e The value set associated with this data element includes:** 11341-5 (History of Occupation) 87511-2 (Combat zone AndOr hazardous duty work dates\*\*)\*\* **extensible LOINC value set**                                                                                                                                                                                                                                                                  |
| **startDate** date                   | [0...1]                            | Data when the employment period started. This data element is optional in profile. Path: **Observation.effectivePeriod.start**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| **endDate** date                     | [0...1]                            | End of employment date. if this employment episode is on-going, this data element is empty. Path: **Observation.effectivePeriod.end** Derived information: active employment episode if this data element is missing. A data-absent-reason extension may be used to clarify that the end of the period is [not-applicable](http://hl7.org/fhir/R4/codesystem-data-absent-reason.html).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| **industry** CodeableConcept         | [0...1]                            | For this profile, this component/element contains the industry in which the patient was or is currently employed. This data element optional in this profile but it may be mandatory, required, or conditionally used in a derived profile. It may also be localized for required terminology in each realm. For example in the US, implementers are expected to use “Industry CDC NAICS 2012 (ODH)” (https://phinvads.cdc.gov/vads/ViewValueSet.action?id=571)(https://phinvads.cdc.gov/vads/ViewValueSet.action?id=5718C508-111B-4737-A48C-FDCFD301C0DF)[8C508-111B-4737-A48C-FDCFD301C0DF](https://phinvads.cdc.gov/vads/ViewValueSet.action?id=5718C508-111B-4737-A48C-FDCFD301C0DF)” Path\*\*: Observation.component.valueCodeableConcept\*\* Binding strength: **Preferred**; to allow derived profiles to substitute the binding with a subset of the value set referenced here. The **Observation.component.code** is fixed to: **86188-0 (LOINC**) |
| **supervisoryLevel** CodeableConcept | [0...1]                            | This data element corresponds to the Pay Grade associated with a military service episode. The value is intended to be a **CodeableConcept**. This data element may be localized to use a US-specific value set (e.g. "Supervisory Level or Pay Grade" : https://phinvads.cdc.gov/vads/ViewValueSet.action?oid=2.16.840.1.114222.4.11.7613) Path\*\*: Observation.component.valueCodeableConcept\*\* The **Observation.component.code** if fixed to: **87707-6 (LOINC)**. Binding strength: **Preferred**; to allow derived profiles to substitute the binding with a subset of the value set referenced here.                                                                                                                                                                                                                                                                                                                              |
| **category** CodeableConcept         | [1...1]                            | Employment history is a part of the patient's social history. Therefore this data element is fixed to **"social-history"**. This information in inherited by profiles derived from this constrainable profile. Path: **Observation.category**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| **occupation** CodeableConcept       | [0...1]                            | The occupation during the episode as a coded value. **Path: Observation.valueCodeableConcept** The recommended value set binding uses the CDC PHVS_Occupation_CDC_ONET-SOC2010_ODH https://phinvads.cdc.gov/vads/ViewValueSet.action?id=3ED71C35-8147-492B-B88F-94953573E55F (Occupation CDC ONET-SOC 2010 (ODH)) The recommended value set binding references the CDC PH_OccupationalDataForHealth_ODH code system: OID: 2.16.840.1.114222.4.5.327 Code System Name: Occupational Data for Health (ODH) Code System Code: PH_OccupationalDataForHealth_ODH Content: https://phinvads.cdc.gov/vads/ViewCodeSystem.action?id=2.16.840.1.114222.4.5.327 Binding strength: **Preferred**; to allow derived profiles to substitute the binding with a subset of the value set referenced here.                                                                                                                                                                  |

#### US Veteran

The US Veteran profile specifies an additional extension to the set already
supported by the FHIR US Core profile it extends.

|        Operation          |  **Notes**                                                                                                                                                                                                                                                                 |
|---------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **veteranStatus** boolean |  This extension is a boolean flag used to specify/store the confirmation/verification status. true: the Patient record describes a Veteran false: the Patient is either not a verified yet or under review if the flag is absent, then the veteran status is undetermined. |

#### Military Service Episode

This profile design describes how we use Observation resources to represent
Military Service as a type of [Employment History Episode](#employment-history-episode).

A patient/Veteran may have zero or more military service episodes. The contents
of this profile is based on the HL7 Version 2 **ZMH** segment and the
**ServiceHistoryEpisode** schema specified in the current [Veteran Verification
API](https://developer.va.gov/explore/verification/docs/veteran_verification?version=current)
and it allows this API to migrate to FHIR and to be consistent with the prior
work done by Center for Disease Control (CDC) National Institute for Occupational Safety and Health (NIOSH).

A service history episode may reference zero or more deployment episodes. This
profile is based on the default FHIR Observation profile and The base profile is
a newly defined [Employment History Episeod](#employment-history-episode)
*abstract* profile. This profile is similar [ODH Past or Present Job profile](http://hl7.org/fhir/us/odh/StructureDefinition-odh-PastOrPresentJob.html). The
major distinction from the ODH Is that Military Service History Episode does not
require any information the job performed by the Veteran during their service.

The following is a list of constraints applied to [Employment History
Episode](#employment-history-episode) to describe military service episodes:

|                                           | **Multiplicity**     | **Notes**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
|-------------------------------------------|----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **url** url                               | [1...1]              | Profile canonical url used to reference this profile in an Observation that conforms this profile, **http://hl7.org/fhir/us/StructureDefinition/ms-military-service-episode** Path\*\*: Observation.meta.profile\*\*                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| **code** CodeableConcept                  | [1...1] | LOINC concept: to be defined - a member of "employment episode" value set. Path: **Observation.code Constraints**: Cardinality: [1,1] **Local concept id (fixed):** d3f8e4e1-874f-4ccc-b70e-76133b2e317d                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| **startDate** date                        | [1...1]              | Start of military service episode. It is a mandatory data element for a valid military service episode. Path: Observation.effectivePeriod.start **Constraints**: Cardinality: [1,1]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| **endDate** date                          | [0...1]              | End of military service episode date. It must be specified (mandatory) for any valid military service episode. Path: **Observation.effectivePeriod.end Constraints**: Cardinality: [1,1]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| **industry** [MilitaryBranchCode](#military-branch-code)           | [1...1]              | For this profile, this component/element contains the branch military or a code indicating national guard or reserve. *"Branch of military including National Guard or Reserve status."* The CDC OMB 2010 (or 2020) *Industry* concepts are sufficient to describe the Military Branch including "National Guard or Reserve" - as a single concept. These US-specific concept will be added to the SNOMED CT US extension maintained by NLM. Based on feedback from VA implementers, it' snot necessary to distinguish “reserve” from “national guard” service. This profile will use a subset of Industry concepts related to military service. **Constraints**: Cardinality: [1,1] Value set binding for component.valueCodedConcept: [Military Branch Code](#military-branch-code) Binding strength: **required**; to enforce the use of the value set. **LOINC code**: 86188-0 reused from ODH |
| **dischargeStatus** [DischargeStatusCode](#discharge-status-code)   | [0...1]              | For this profile, the data element specifies to "discharge status" described as "Character of discharge from service episode." This data element is mandatory for service history reported by the VA but it may be empty if the patient is still active military. **Path:** Observation.component (code: **to be added to LOINC**). See Logica Solor page: https://logica.atlassian.net/wiki/spaces/SOLOR/pages/865271876/Military+Service+History+and+Status **Constraints**: Cardinality: [1,1] Value set binding for component.valueCodedConcept: [DischargeStatusCode](#discharge-status-code) Binding strength: **required**; to enforce the use of the value set. Local concept id: 836df973-002b-4bb6-9eca-83626af0c05c                                                                                                                                                                   |
| **supervisoryLevel** [PayGradeCode](#pay-grade-code)         | [1...1]              | This data element corresponds to the Pay Grade associated with a military service episode. **Constraints**: Cardinality: [1,1] Value set binding for component.valueCodedConcept: [PayGradeCode](#pay-grade-code) Binding strength: **required**; to enforce the use of the value set. **Fixed Value:** 87707-6 (Supervisory Level)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| **separationReason** [SeparationReasonCode](#separation-reason-code) | [0...1]              | Additional text description for **separation** reason beyond discharge status value. It's an optional, coded data element (see [SeparationReasonCode](#separation-reason-code) for a list of proposed concepts to be added to SNOMED CT). **Path:** Observation.component (code: **to be added to LOINC**). See Logica Solor page: https://logica.atlassian.net/wiki/spaces/SOLOR/pages/865271876/Military+Service+History+and+Status **Constraints**: Cardinality: [1,1] Value set binding for component.valueCodedConcept: [SeparationReasonCode](#separation-reason-code) Binding strength: **required**; to enforce the use of the value set. Local concept it: 066ccc24-04d1-4c58-a2cf-abe2e722d1a3                                                                                                                                                                                           |

#### Deployment Episode

This profile definition similar to [Combat Zone Period
profile](http://hl7.org/fhir/us/odh/StructureDefinition-odh-CombatZonePeriod.html)
(url: http://hl7.org/fhir/us/odh/StructureDefinition/odh-CombatZonePeriod ) and
includes the requirements specified in ZMH and [Deployment
Schema](https://developer.va.gov/explore/verification/docs/veteran_verification?version=current).

The base profile reuses the pattern [Combat Zone Period
profile](http://hl7.org/fhir/us/odh/StructureDefinition-odh-CombatZonePeriod.html)
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

#### Military Occupation

The profile reuses the [ODH
PastOrPresentJob](http://hl7.org/fhir/us/odh/StructureDefinition-odh-PastOrPresentJob.html)
profile to apply it specifically to military jobs/occupations. One or more military occupations may be referenced by a single Military Service
History record. This profile uses a subset of data elements as seen below:

|                                | **Multiplicity**     | **Notes**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
|--------------------------------|----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **startDate.** date            | [1...1]              | Start of military service episode. It is a mandatory data element for a valid military service episode. Path: Observation.effectivePeriod.start **Constraints**: Cardinality: [1,1]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| **endDate.** date              | [0...1]              | End of military service episode date. It must be specified (mandatory) for any valid military service episode. Path: **Observation.effectivePeriod.end Constraints**: Cardinality: [1,1]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| **code** CodeableConcept       | LN:Extension [1...1] | LOINC concept: to be defined - a member of "employment episode" value set. Path: **Observation.code Constraints**: Cardinality: [1,1]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| **occupation** CodeableConcept | [0...1]              | The occupation during the military service episode as a coded value. Note: This data element his is not currently supported by the VA API, it would be an enhancement in the FHIR-based API Path: Observation.valueCodeableConcept) The recommended value set binding references is to a subset of occupations based on the Military Occupation Code taxonomy maintained by the Department of Defense. Proposed value set name: **military-occupation**; the value set will be based on "Occupation CDC ONET-SOC 2010 (ODH)": https://phinvads.cdc.gov/vads/ViewValueSet.action?id=3ED71C35-8147-492B-B88F-94953573E55F The occupation taxonomy/code can be used by clinicians to assess health risks of musculoskeletal disorders, heart disease, behavioral health, and hazardous chemical exposures. |
| **url.** url                   | [1...1]              | Profile canonical url used to reference this profile in an Observation that conforms this profile, **http://hl7.org/fhir/us/StructureDefinition/ms-military-service-episode** Path\*\*: Observation.meta.profile\*\*                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |

#### CountryCode

ISO 3166 country code.

#### Mission Code

A SNOMED CT concept (Observation.component.value) that describe additional
information about combat, mission, other criteria. This data element may be
elaborated along multiple components.

### Terminology Requirements

An initial gap analysis of SNOMED CT terminology identified that we are missing
significant content related to discharge status requirements in
[DischargeStatusCode](#discharge-status-code).

Other terminology extension and harmonization targets are:

-   [Military Branch Code](#military-branch-code)

-   [Pay Grade Code](#pay-grade-code)

Another gap is "separation reason" that requires a coded concept for its
Observation component and its allowed values.

In the future, the [Mission Code](#mission-code) may also need a SNOMED CT
extension if the VA API requires it.

For a complete set of terminology extension, refer to the Logica Solor page
intended to address the concept gaps:
https://logica.atlassian.net/wiki/spaces/SOLOR/pages/865271876/Military+Service+History+and+Status

The following diagram summarizes the terminology requirements for this
implementation guide.This analysis is further refined as a Logica Health Solor
activity:

https://logica.atlassian.net/wiki/spaces/SOLOR/pages/865271876/Military+Service+History+and+Status

<img src="Terminology Requirements.png" alt="Terminology Requirements" width="100%" />

*Figure 3: Terminology Requirements*

#### Job Supervisory Level or Pay Grade (ODH)

This code system is used in value set:**" Job Supervisory Level or Pay Grade
(ODH)"**

https://phinvads.cdc.gov/vads/ViewValueSet.action?id=B35E2ABE-C20F-EA11-8183-005056ABE2F0

-   Canonical URL based on the current version of UT:
    **http://build.fhir.org/ig/HL7/UTG/CodeSystem-PHOccupationalDataForHealthODH.html**

#### Industry CDC NAICS 2012 (ODH)

This code system used in value set [Military Branch Code](#military-branch-code)

**Code system url:** Currently the code system URL will be the one published by
the UT project.

-   **http://build.fhir.org/ig/HL7/UTG/CodeSystem-PHOccupationalDataForHealthODH.html**

#### SNOMED CT

SNOMED CT will be used to fill any terminology gaps that are not already
addressed by FDA code systems in the US.

#### SOLOR Military Service Extension

A code system representing the SOLOR extension for Military Service History and
Status in Logica Health.

The extension for this IG addresses the following gaps:
https://logica.atlassian.net/wiki/spaces/SOLOR/pages/865271876/Military+Service+History+and+Status

**The proposed canonical URL
is:https://www.logicahealth.org/solutions/solor/military-service**

Reference issue: " https://jira.hl7.org/browse/FHIR-27926?filter=-2

#### Industry NAICS Detail (ODH)

https://phinvads.cdc.gov/vads/ViewValueSet.action?id=5718C508-111B-4737-A48C-FDCFD301C0D

Value Set Name: Industry NAICS Detail (ODH)

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

#### Discharge Status Code

A SNOMED CT Extension needed to describe the status when an individual leaves
military service.

The VA API and Z-segment specification declares local extensions to SNOMED CT
corresponding to **subtypes** of **"Left Military Service" 266964007 concept.**

**Question:** Should it include "active" because we may have a DoD API that
works in a similar way?

**Answer**: No, the cardinality should allow for this data element to omitted if
the service episode is the current episode.

|                                          |  **Description**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
|------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **general**                              |  General status. This concept is a gap in SNOMED CT. **subtype** of **"Left Military Service" 266964007 concept. local concept id:**                                                                                                                                                                                                                                                                                                                                                           |
| **honorable**                            | Additional description pending.] This concept is a gap in SNOMED CT.                                                                                                                                                                                                                                                                                                                                                                                                                         |
| **dishonorable discharge**               | This status has an equivalent concept in SNOMED CT: **276086007**                                                                                                                                                                                                                                                                                                                                                                                                                             |
| **bad-conduct**                          | This concept is a gap in SNOMED CT.                                                                                                                                                                                                                                                                                                                                                                                                                         |
| **other-than-honorable**                 | This concept is a gap in SNOMED CT. Relationships: This concept has two child concepts: honorable-for-va-purposes dishonorable-for-va-purposes During the review process, the Veteran will in "Pending Character of Discharge" (COD) state defined as "                                                                                                                                                                                                     |
| **dishonorable-for-va-purposes**         |  This status is obtained when "other-than-honorable" is later deemed to be **dishonorable** for Title 38 Veteran Benefits criteria. This concept is a gap in SNOMED CT. "Has a Character of Discharge (COD) review from VBA ruling the individual Dishonorable for VA Purposes (DVA), and was originally one of the discharge types in the second row of this table." Relationships: This concept is a subtypes of **"Other-than-honorable" .**                                                |
| **honorable-for-va-purposes**            | This status is obtained when "other-than-honorable" is later deemed to be **honorable** for Title 38 Veteran Benefits criteria. This concept is a gap in SNOMED CT. "Has a character of discharge of: • Honorable • Under Honorable Conditions (General) • Uncharacterized (Entry level separation) **OR** Has a Character of Discharge (COD) review from VBA ruling the individual Honorable for VA Purposes (HVA)." Relationships: This concept is a subtypes of **"Other-than-honorable"** |
| **honorable-absence-of-negative-report** | This concept is a gap in SNOMED CT. Relationships: This concept is a subtype of **"honorable-discharge ?"**                                                                                                                                                                                                                                                                                                                                                 |
| **uncharacterized**                      |  This concept is a gap in SNOMED CT.                                                                                                                                                                                                                                                                                                                                                                                                                         |
| **unknown**                              | This concept is a gap in SNOMED CT. Missing information about discharge status.                                                                                                                                                                                                                                                                                                                                                                             |

#### Military Branch Code

"The military branch associated with service, National guard, and Reserve."

The **Military Branches** coded concepts are documented in PHIN VADS as
[Industry CDC NAICS 2012 (ODH)](https://phinvads.cdc.gov/vads/ViewValueSet.action?id=3ED34BBC-617F-DD11-B38D-00188B398520).

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

|                                               |  **Description**                                                                                                                                                                                                                                                                                                                             |
|-----------------------------------------------|------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **U. S. Armed Forces - Branch not specified** |         Code: 9870: Military Reserves or National Guard System URL: [http://terminology.hl7.org/CodeSystem/PHIndustryCDCCens](http://terminology.hl7.org/CodeSystem/PHIndustryCDCCensus2010)[us2010](http://terminology.hl7.org/CodeSystem/PHIndustryCDCCensus2010)                                                                           |
| **U. S. Army**                                |         Code: 9670 (U.S. Army) System URL: [http://terminology.hl7.org/CodeSystem/PHIndustryCDCCens](http://terminology.hl7.org/CodeSystem/PHIndustryCDCCensus2010)[us2010](http://terminology.hl7.org/CodeSystem/PHIndustryCDCCensus2010)                                                                                                    |
| **U. S. Air Force**                           |         Code: 9680: U.S. Air Force System URL: [http://terminology.hl7.org/CodeSystem/PHIndustryCDCCens](http://terminology.hl7.org/CodeSystem/PHIndustryCDCCensus2010)[us2010](http://terminology.hl7.org/CodeSystem/PHIndustryCDCCensus2010)                                                                                                |
| **U. S. Marine Corps**                        |         Code: 9770 (U.S. Marines) System URL: [http://terminology.hl7.org/CodeSystem/PHIndustryCDCCens](http://terminology.hl7.org/CodeSystem/PHIndustryCDCCensus2010)[us2010](http://terminology.hl7.org/CodeSystem/PHIndustryCDCCensus2010)                                                                                                 |
| **U. S. Navy**                                |          Code: 9690: U.S. Navy System URL: [http://terminology.hl7.org/CodeSystem/PHIndustryCDCCens](http://terminology.hl7.org/CodeSystem/PHIndustryCDCCensus2010)[us2010](http://terminology.hl7.org/CodeSystem/PHIndustryCDCCensus2010)                                                                                                     |
| **U. S. Coast Guard**                         |          Code: 9780: U.S. Coast Guard System URL: [http://terminology.hl7.org/CodeSystem/PHIndustryCDCCens](http://terminology.hl7.org/CodeSystem/PHIndustryCDCCensus2010)[us2010](http://terminology.hl7.org/CodeSystem/PHIndustryCDCCensus2010)                                                                                              |
| **Military Reserves or National Guard**       |          Concept (id: 9870] is used to specify Reserves or National Guard service. Code: 9870: Military Reserves or National Guard System URL: [http://terminology.hl7.org/CodeSystem/PHIndustryCDCCens](http://terminology.hl7.org/CodeSystem/PHIndustryCDCCensus2010)[us2010](http://terminology.hl7.org/CodeSystem/PHIndustryCDCCensus2010) |
| **Non-US Armed Forces (out-of-scope)**        |          This concept is out of scope but it was discussed as potential requirement.  This concept is out-of-scope at this time.                                                                                                                                                                                  |

#### Pay Grade Code

Defines the level of compensation for a position, normalized across military
branches. This value set harmonizes the concepts used in VA wit those specified
by FDA for Occupational Data for Health implementations.

This specification will use the latest FDA value set specified in [Job
Supervisory Level or Pay Grade](https://phinvads.cdc.gov/vads/ViewValueSet.action?id=D696FF02-C038-EB11-8196-005056ABE2F0).

#### Separation Reason Code

"Additional description for separation reason beyond discharge status value."

**Note:** This may need to be specified as a code value rather than a text
value.

Separation reason codes. These codes will be addressed as gaps/change requests
in SNOMED CT using the Solor Project:
https://logica.atlassian.net/wiki/spaces/SOLOR/pages/865271876/Military+Service+History+and+Status

### Implementation

One of the requirements of this implementation guide is to provide an operation
for to confirm or verify that an individual has been confirmed to be a veteran.


<img src="Retrieving status and military history using a FHIR-based API.png" 
alt="Retrieving status and military history using a FHIR-based API" width="100%" />
*Figure 5: Retrieving status and military history using a FHIR-based API*



<img src="Custom Operations.png" alt="Custom Operations" width="100%" />
*Figure 6: Custom Operations*


The following represents the proposed API. It relies on a custom operation
(\$**veteranStatus**) associated with the **Patient** resource and
**Observation** resources to represent the military service history episode
including deployment and occupation:

#### FHIR API (server)

This API specifies the resources and operations required in an API that meets
the requirements specified in the [Use Case Analysis](#use-case-analysis):

-   **Patient/\$veteranStatus** with parameters: last name, first name, gender,
    date of birth, social security number.

-   **Patient** resource needed to retrieve the id of the resources matching a
    verified veteran.

-   **Observation** resource to manage the information associated with military
    service and veteran status.

 ### Transactions
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
 #### Patient/\$veteranStatus()
                                                                                                                                            | This operation provides verification and confirmation of a Patient's status as a Veteran based on the identifying traits. This operations addresses both the "verification" and "confirmation" capabilities currently available to application developers who use the VA Developer API "Veteran Verification" endpoint. This operation returns a true, if the patient is confirmed to be a Veteran, false if the patient is not validated/confirmed to be Veteran. Error 404 will specify that the patient could not be found. The client system may resubmit the operation with revised parameter or interpret the error to indicate that the Veteran status of an individual could not be confirmed or validated using the API. This operation implements the [Verify Veteran Status](#verify-veteran-status) use case described in the [Use Case Analysis](#use-case-analysis) section.                                                                                                                                                                                                        |                                                                                                                                                                                                                                                             
| **Note**: This operation has a dependency on the implementation of a **Patient** resource that supports the capability to record that a Patient's veteran status was confirmed. ||

- **[IN] identifier** Social Security Number or another identifier; only one, the most relevant identifier should be used.
- **[IN] firstName** Patient's first name, mandatory **string-primitive**||
- **[IN] lastName** Patient's last name, mandatory **date**  
- **[IN] dateOfBirth** Patient's date of birth **code**  
- **[IN] gender** Patients gender - as specified in the [Administrative Gender value set](http://build.fhir.org/valueset-administrative-gender.html).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |                                                                                                                                                                                                                                                             |
- **[RETURN] true/false** ; error

|### Observation** search 
The [Military Service Episode](#military-service-episode) , [Deployment Episode](#deployment-episode), and [Military Occupation](#military-occupation) are all profiles of Observation resource and using a subset of [available parameters](#search-service-history) for Observation resource): 
 - **code** to search all Observations corresponding [Military Service Episode](#military-service-episode) for the patient specified in this IG 
 - **has-member** - to search by combat episode or military occupation 
 - **patient** - patient id of Veteran's Patient record, used to search for observations associated with a specific Patient who is a verified Veteran. 

A **search** operation that uses the search parameters described here meets the requirements specified in [Use Case Analysis](#use-case-analysis) : [Search Service History](#search-service-history) use case. Note: the "code" values corresponding to [Military Service Episode](#military-service-episode) , [Deployment Episode](#deployment-episode), and [Military Occupation](#military-occupation) will be submitted to post the ballot. | **code** This parameter would be set to the LOINC code associated with Military Service and/or Deployment History, **reference**,  **has-member** This parameter set to the Military Occupation and/or Combat History **reference** ] **patient** |

### Associated Extensions and Profile: US Veteran

To record the confirmed Veteran status, this IG has identified the need to
specify an extension on the Patient to specify whether the patient was confirmed
to be a veteran.
The US Vetrean profile extends the US Core Patient profile and adds the "vetaranStatus" data element as a true/false (boolean). If pilot projects need it, this extension can be revised to support a state machine for Veteran determination (e.g. submitted --> under verification --> verified:  eligible/ineligible/not a Veteran)
-   [US Veteran](StructureDefinition-usveteran.html) specifies a flag to indicate the veteran status
    as a boolean value.
A FHIR API may use veteran status extension specified in the US Patient profile
to implement the \$veteranStatus operation.

<img src="Associated Extensions related to Veteran Verification.png" 
alt="Associated Extensions related to Veteran Verification" width="100%" />
*Figure 6: Associated Extensions related to Veteran Verification*

#### Testing Guidance

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

#### Testing Workflow

This workflow identifies the activities and API calls required to address the
requirements specified in the [Use Case Analysis](#use-case-analysis).
Successful testing may also use test scripts and pre-conditions to results of an EHR invoking the proposed
API to verify status and retrieve the military history information of a Veteran
using FHIR-based resources. This diagram uses Object Management Group’s (OMG) Business Process
Modeling Notation (BPMN) to describe the pre-conditions/triggers and
post-conditions/results of using the FHIR-based API outlined in this
implementation guide:

<img src="Testing Workflow.png" alt="Testing Workflow" width="100%" />
*Figure 7: Testing Workflow*

##### Verify Veteran Status: Step 1

Scenario \#1: Veteran Confirmation and Verification

A Veteran is receiving treatment in the community and invokes the
"\$veteranStatus" operation using the Veteran's demographics (e.g. fist, last,
date of birth, social security number). If the Veteran is verified then the
client application proceed to Step 2.

Scenario Step 1 : Search the Patient resource to evaluate whether "Sam Share" is
a confirmed/validated Veteran based on the VA-specific extension

##### Search Military Service History: Step 2

Scenario Step 2: Search the Observation resource for a list of Military Service
Episodes: search by "subject" (i.e. Patient/Veteran) and by "patient" and "code"
search parameters

For more details on testing, you may refer to the [FHIR Connectathon 25 (September 2020) Track for Military Service History and Status](https://confluence.hl7.org/display/FHIR/2020-09+Social+History%3A++Verification+of+Military+Service+History+and+Status).

#### Examples

Example Patient and Observation resources conforming to this IG are available in this publication under [Examples](examples.html). 

### Acknowledgements

This implementation guide builds upon existing FHIR implementation guidance and
best practices:
-  [US Core Implementation Guide (v3.1.1)](http://hl7.org/fhir/us/core/index.html) (reusing US Core Patient profile)
-  [Occupational Data for Health (ODH) 1.0](http://hl7.org/fhir/us/odh/index.html) (reusing best practices, *PastOrPresentJob* profile)

The project team would like to thank our leadership and colleagues for their
support in the development of Application Programming Interface (API)
implementation guide:

**Department of Veterans Affairs:**
- Dr. Steven Brown, MD, Director, CIDMO Knowledge Based Systems (KBS)
- Mr, Christopher Shawn, Directory of Stndards  & Interoperability, KBS
- Mr. Javon Hyland, Deputy Program Manager, KBS Standards & Interoperability
- Ms. Catherine Hoang, Associate Director, KBS Terminology Services
- Dr. Keith Campbell MD, Director, KBS Informatics Architecture

**Work Group Co-chairs:**                                                                          
- Dr. Floyd Eisenberg                                                                                 
- Jean Duteau  

**Project team:** 
- Ioana Singureanu MsCS, FHL7, Project Facilitatorm BookZurman                                    
- Sean Muir, FHIR Implementation Guide Developer/Publisher, BookZurman                                       
- Jayme Welty, Project Manager, BookZurman                                                               
- Dr. Mark Janczewski, MD, BookZurman  
  
**VA Developer API (Lighthouse Project):**
- Andrew Fichter                                                                                  
- Shawnee Petrosky                                                                                  
- Derek Brown                     
                                                                   
**Defense Health Agency:**                                                                            
- Nancy Orvis
- Eric Strom
- Allyson Rigel    
                                                                                   |

**CDC NIOSH:**                                                      
- Genny Luensman  
                                                                                    
**MITRE**:              
 - Dr. Mark A. Kramer
 
 
**ESAC**
- Peter Muir
 
**ALTARUM**
- Craig Newman

{% include markdown-link-references.md %}

