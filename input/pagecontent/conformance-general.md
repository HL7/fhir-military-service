
This section outlines requirements and recommendations for MSH participants. The conformance verbs - SHALL or MUST, SHOULD, and MAY - are defined in [FHIR Conformance Rules](http://hl7.org/fhir/R4/conformance-rules.html).

### MSH Participant Roles

Two roles for **MSH Participants** are defined:

* **MSH Data Sender** - a participant in exchange of MSH data who provides MSH data in response to a data query or autonomously pushes MSH data to an MSH receiver. The data sender does not have to be the originator of the data it possesses. The data sender role is similar to a [US Core Responder](https://www.hl7.org/fhir/us/core/#us-core-actors), except the data sent is not assumed to be a response to a query.
* **MSH Data Receiver** - a participant in exchange of MSH data who accepts MSH data from an MSH Data Sender. The data receiver may receive data as part of a predetermined workflow, or initiate the exchange via a query or on a regular basis via subscription. The receiver role is similar to a [US Core Requestor](https://www.hl7.org/fhir/us/core/#us-core-actors), except the data does not have to be explicitly requested.

This IG currently only provides CapabilityStatements and documentation for "pull" (query-response) architectures, however, regardless how exchanges occur, all participants MUST follow the conformance requirements in this IG, **except** those specifically identified as applying only to pull architectures.

### "MUST" Requirements for Conformance


<!-- @Max -- TODO: Provide examples of what this would look like. We can create a separate page for the queries if this gets lengthy -->
* Patient resources
** veteranStatus operation
* Observation resource
Both resources implemented consistent with US Core  
#### Publish a CapabilityStatement Identifying Supported Profiles and Operations

Each MSH participant MUST publish a FHIR CapabilityStatement listing their supported profiles, by declaring the profile in `CapabilityStatement.rest.resource.supportedProfile`. The CapabilityStatement SHALL be returned in response to a `GET [base]/metadata` request.

ALL MSH participants MUST at minimum support the [CancerPatient] and [PrimaryCancerCondition] profiles.

<!-- @Max -- TODO: Provide examples of what this would look like.-->

#### Support US Core Conformance Requirements

Additional [conformance requirements from US Core](http://hl7.org/fhir/us/core/capstatements.html) apply to RESTful interactions, searches, and resource formats in MSH. MSH "inherits" all US Core conformance requirements. US Core provides base profiles for many (but not all) MSH profiles, defines the meaning of MustSupport, and outlines expectations for handling of missing or unknown data elements. Likewise, US Core outlines how to associate provenance information associated with collection, transfer, and updating of clinical information.

International users of MSH may find US Core an impediment to implementation. Application of MSH to other countries is open to further discussion.

### "SHOULD" Recommendations for Conformance

MSH participants SHOULD meet the following requirements for conformance:

1. [Support all MSH Profiles](#support-all-msh-profiles)
1. [Use `meta.profile` to Signal Conformance](#use-metaprofile-to-signal-conformance)

#### Support All MSH Profiles

In addition to supporting the core profiles as described above, MSH participants SHOULD support all profiles defined in MSH UNLESS the participant does not anticipate supplying or consuming a certain type of data, usually by virtue of playing a limited or specialized role in clinical or information workflows.  

Participants SHOULD also support the non-MSH-specific profiles that are considered part of an [MSH Patient Bundle][MCODEPatientBundle], such as [blood pressure](http://hl7.org/fhir/StructureDefinition/bp).

#### Use `meta.profile` to Signal Conformance

Participants SHOULD populate `meta.profile` elements for all resources to indicate which profiles the resources should conform to. Participants SHOULD also implement [profile search](https://www.hl7.org/fhir/search.html#profile), which allows participants to query using the `_profile` parameter to return resources conforming to the profiles declared in `meta.profile`.

Profile search and population of `meta.profile` originate as "SHALL" requirements in the base FHIR specification; they are not an additional requirements imposed by MSH. However, in practice, few implementations have followed these requirements. Refer to the [FHIR Documentation on supported profiles](https://www.hl7.org/fhir/profiling.html#CapabilityStatement.rest.resource.supportedProfile) for details.

### Capability Statements
This implementation specifies a specialization of the generic US core implementation guide and the capabilities:

{% include markdown-link-references.md %}
[FHIR US Core Capability Statement - Server]: https://www.hl7.org/fhir/us/core/CapabilityStatement-us-core-server.html
[FHIR US Core Capability Statement - Client]:https://www.hl7.org/fhir/us/core/CapabilityStatement-us-core-client.html