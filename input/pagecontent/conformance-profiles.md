### Profile Base

Most MSH profiles are based on US Core profiles defined in the [US Core Implementation Guide (v3.1.1)](http://hl7.org/fhir/us/core/index.html). For example, [USVeteran] is based on the [US Core Patient][USCorePatientProfile] profile. Because of the way profiles work in FHIR, any resource that validates against an MSH profile that is based a US Core profile will automatically be in compliance with the US Core profile.

Where US Core does not provide an appropriate base profile, MSH profiles FHIR resources.  

| Profile | Based on US Core?  | Immediate Parent Profile |
|---------|--------------------|--------------------------|
| [Combat Episode][CombatEpisode]| no | Observation |
| [Military Occupation][MilitaryOccupation] | no | Observation |
| [Military Service Episode][MilitaryServiceEpisode] | no | Observation |
| [Past Or Present Job][PastOrPresentJob] | no | Observation |
| [US Veteran][USVeteran] | no | Observation |
{: .grid }

### Conformance to MSH Profiles

Each MSH profile expresses requirements and expectations for FHIR instances in terms of structural constraints and terminology bindings. If an instance is required to conform with an MSH profile, it MUST [validate](https://www.hl7.org/fhir/validation.html) against that profile. 

#### Data Sender Expectations

Each MSH profile has a conformance statement describing what data or FHIR instances MUST or SHOULD conform to it.  

 
#### Data Receiver Expectations

An MSH Data Receiver SHOULD perform validation on instances it receives. The Receiver first of all needs to identify which profile to use for validation. There four ways to identify the correct profile:

1. The instance is received in response to a [profile search](https://www.hl7.org/fhir/search.html#profile), so the validating profile is known in advance.
2. The instance self-identifies using `meta.profile`. Every Data Sender SHOULD populate this element.
3. The Data Receiver can examine the contents of the instance to associate it with a profile (in particular, by looking for identifying code or category).
4. The Data Receiver can iteratively attempt to validate the instance against each of the Data Receiver's supported profiles.

If an instance fails validation, the Receiver may reject the instance.

### Element-Level Expectations

#### Sender and Receiver Expectations

For every element that is [required](#required-elements) and/or carries a [Must Support obligation](#must-support-obligations) (MS):

* MSH Data Senders SHALL be capable of populating the element, provided the Sender supports the profile (as indicated by its CapabilityStatement).
* If the Sender lacks the data necessary to populate the element:
  * If the element is required, the [US Core rules on missing data](http://hl7.org/fhir/us/core/general-guidance.html#missing-data) MUST be followed.
  * If the element is not required (but is MS), the element SHOULD be entirely omitted. If there is a specific reason the data is missing, a data absent reason MAY be substituted.
  * Senders MUST NOT substitute a nonsense or filler value just to satisfy MS or cardinality requirement.
* MSH Data Receivers SHALL be capable of meaningfully processing MS elements, provided the Receiver supports the profile. Depending on context, "meaningfully process" might mean displaying the data element for human use, reacting to it, or storing it for other purposes.

#### Required Elements

An MSH data element is **required** if any of the following criteria are met:

* The element is a top-level element (a first-level property of the resource) and its minimum cardinality is > 0 in the profile.
* The element not a top-level element (a second-level property or below), its minimum cardinality is > 0, and all elements directly containing that element have minimum cardinality > 0 in the profile.
* The element is not a top-level element, its minimum cardinality is > 0, and its immediate higher-level containing element exists in an _instance_ attempting to conform to the profile.

In other words, a data element may be `1..1`, but if it is contained by an optional element, then it is not required unless its containing element is actually present.

#### Must Support Obligations

Interpretation of MS is not straightforward, as there is a difference between a MS *obligation* and a MS *flag*. The MS *flag* is the red S displayed on profile pages: <span style="padding-left: 3px; padding-right: 3px; color: white; background-color: red" >S</span>. A MS *obligation* means the element must be treated as described in [Sender and Receiver Expectations](#sender-and-receiver-expectations). Significantly, an MS *flag* (<span style="padding-left: 3px; padding-right: 3px; color: white; background-color: red" >S</span>) does not necessarily imply an MS *obligation*, and MS *obligations* may be attached to elements lacking MS *flags*.

To see which elements have MS flags, consult the "Snapshot Table" view of the profile. The "Differential Table" view hides MS flags inherited from the parent profile. The "Snapshot Table (Must Support)" view reflects the IG Publisher's interpretation of how MS flags translate to MS obligations, which may or may not coincide with the US Core/MSH interpretation.

The following rules apply in MSH:

* A profile without a MS flag does not have to be supported [^1]. A participant MUST declare support for optional profiles in its CapabilityStatement.
* Any MS flag or flags on an unsupported profile (as stated in participant's CapabilityStatement) do not carry MS obligations.
* An element with an MS flag does not carry an MS obligation if it is nested and any one of the elements directly containing that element lacks an MS flag. However, if the participant *elects* to support the unflagged element or elements in that hierarchy, the elements below the gap then carry an MS obligation.
* An element with an MS flag whose cardinality is 0..0 does not carry an MS obligation [^2].
* A [required element](#required-elements) carries a MS obligation on the part of a Data Sender, regardless of whether that element has an MS flag. 
* A [required element](#required-elements) without an MS flag does not carry an MS obligation for the Data Receiver [^3].

 

#### Non-Must Support Elements

Data elements in MSH that *do not have* MS obligations still MAY be supported. If an element is supported, whether it has a MS flag or not, the profile must be interpreted as if the MS flag were present. For example, `TumorMarkerTest.performer` does not have an MS flag, but a data receiver may implement the capability to display it. In such a case, by virtue of the fact this element is a Reference() data type with no MS flag on any referenced resource or profile (case #7 above), the receiver would be obligated to support all resources or profiles in the Reference unless outside the scope of the Receiver's capability statement, namely, Practitioner, PractitionerRole, Organization, CareTeam, Patient, and RelatedPerson.

[^1]: Although not common practice, profiles can have MS flags at the very top level (see [CancerPatient] for example).

[^2]: When inheriting from another profile, it is possible to set the upper cardinality to zero on an element that was MS in the parent profile. For example, you could inherit from US Core Patient, but forbid the patient’s name for privacy reasons.  In this case, neither Sender nor Receiver are expected to populate or support the element – in fact, it would be an error if the element were present.

[^3]: An example is a Receiver that does not meaningfully process a required element even though it was populated by the Sender.

{% include markdown-link-references.md %}
