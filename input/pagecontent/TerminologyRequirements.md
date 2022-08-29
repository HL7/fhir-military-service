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

|                                          |  **Description**                                                                                                                                                                                                 |
|------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **general**                              |  General status. This concept is a gap in SNOMED CT. **subtype** of **"Left Military Service" 266964007 concept. local concept id:**                                                                                                                                                                                                                 |
| **honorable**                            | Additional description pending.] This concept is a gap in SNOMED CT.                                                                                                                                                                                                                                                                               |
| **dishonorable discharge**               | This status has an equivalent concept in SNOMED CT: **276086007**                                                                                                                                                                                                                                                                                   |
| **bad-conduct**                          | This concept is a gap in SNOMED CT.                                                                                                                                                                                                                                                                               |
| **other-than-honorable**                 | This concept is a gap in SNOMED CT. Relationships: This concept has two child concepts: honorable-for-va-purposes dishonorable-for-va-purposes During the review process, the Veteran will in "Pending Character of Discharge" (COD) state defined as "                                                           |
| **dishonorable-for-va-purposes**         |  This status is obtained when "other-than-honorable" is later deemed to be **dishonorable** for Title 38 Veteran Benefits criteria. This concept is a gap in SNOMED CT. "Has a Character of Discharge (COD) review from VBA ruling the individual Dishonorable for VA Purposes (DVA), and was originally one of the discharge types in the second row of this table." Relationships: This concept is a subtypes of **"Other-than-honorable" .**                                                |
| **honorable-for-va-purposes**            | This status is obtained when "other-than-honorable" is later deemed to be **honorable** for Title 38 Veteran Benefits criteria. This concept is a gap in SNOMED CT. "Has a character of discharge of: • Honorable • Under Honorable Conditions (General) • Uncharacterized (Entry level separation) **OR** Has a Character of Discharge (COD) review from VBA ruling the individual Honorable for VA Purposes (HVA)." Relationships: This concept is a subtypes of **"Other-than-honorable"** |
| **honorable-absence-of-negative-report** | This concept is a gap in SNOMED CT. Relationships: This concept is a subtype of **"honorable-discharge ?"**                                                                                                                                                                                                       |
| **uncharacterized**                      |  This concept is a gap in SNOMED CT.                                                                                                                                                                                                                                                                               |
| **unknown**                              | This concept is a gap in SNOMED CT. Missing information about discharge status.                                                                                                                                                                                                                                   |

#### Military Branch Code

"The military branch associated with service, National Guard, and Reserve."

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

|                                               |  **Description**                                                                                                                                                                                   |
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

