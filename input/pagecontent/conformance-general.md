This section outlines requirements and recommendations for Military Service History participants. The
conformance verbs - SHALL or MUST, SHOULD, and MAY - are defined in [FHIR
Conformance Rules](http://hl7.org/fhir/R4/conformance-rules.html).

### Military Service History Participant Roles

Two roles for **Military Service History Participants** are defined:

-   **Military Service History and Status (Military Service History) Data Sender** - a system
    provides Military Service History data in response to a data query or autonomously pushes Military Service History
    data to an Military Service History receiver. The data sender does not have to be the originator
    of the data it possesses. The data sender role is similar to a [US Core
    Responder](https://www.hl7.org/fhir/us/core/#us-core-actors), except the
    data sent is not assumed to be a response to a query.

    -   This role may be played may be FHIR server enabled API.

-   **Military Service History Data Receiver** - a system involved in exchange of Military Service History data that
    accepts Military Service History data from an Military Service History Data Sender. The data receiver may receive data
    as part of a predetermined workflow or initiate the exchange via a query or
    on a regular basis via subscription. The receiver role is similar to a [US
    Core Requestor](https://www.hl7.org/fhir/us/core/#us-core-actors), except
    the data does not have to be explicitly requested.

    -   This role may be a played by an EHR system, web application,
        patient-facing application, etc.

This implementation currently only provides
[CapabilityStatements](https://www.hl7.org/fhir/us/core/capstatements.html)
consistent with FHIR US Core and documentation for "pull" (query-response)
architectures, however, regardless how exchanges occur, all participants MUST
follow the conformance requirements in this IG, **except** those specifically
identified as applying only to pull architectures.

### "MUST" Requirements for Conformance

-   Patient resources \*\* veteranStatus operation

-   Observation resource Both resources implemented consistent with US Core

#### Publish a CapabilityStatement Identifying Supported Profiles and Operations

Each Military Service History participant MUST publish a FHIR CapabilityStatement listing their
supported profiles, by declaring the profile in
`CapabilityStatement.rest.resource.supportedProfile`. The CapabilityStatement
SHALL be returned in response to a `GET [base]/metadata` request.

ALL Military Service History participants MUST at minimum support the [MilitaryServiceEpisode], 
[DeploymentEpisode] profiles. Ideally, the [MilitaryOccupation] will also be
included to specify what military occupation or occupations were performed
during military service.

#### Support US Core Conformance Requirements

Additional [conformance requirements from US
Core](http://hl7.org/fhir/us/core/capstatements.html) apply to RESTful
interactions, searches, and resource formats in Military Service History. Military Service History "inherits" all US Core
conformance requirements. US Core provides base profiles for many (but not all)
Military Service History profiles, defines the meaning of MustSupport, and outlines expectations for
handling of missing or unknown data elements. Likewise, US Core outlines how to
associate provenance information associated with collection, transfer, and
updating of clinical information.

International users of Military Service History may find US Core an impediment to implementation.
Application of Military Service History to other countries is open to further discussion.

### "SHOULD" Recommendations for Conformance

Military Service History participants SHOULD meet the following requirements for conformance:

1.  [Support all Military Service Profiles](#support-all-military-service-history-profiles)

2.  [Use to indicate Conformance](#use-metaprofile-to-signal-conformance)

#### Support All Military Service History Profiles

In addition to supporting the core profiles as described above, Military Service History participants
SHOULD support all profiles defined in Military Service History UNLESS the participant does not
anticipate supplying or consuming a certain type of data, usually by virtue of
playing a limited or specialized role in clinical or information workflows.

Participants SHOULD also support the custom operation (\$**veteranStatus**)
specified in this implementation

#### Use `meta.profile` to Signal Conformance

Participants SHOULD populate `meta.profile` elements for all resources to
indicate which profiles the resources should conform to. Participants SHOULD
also implement [profile search](https://www.hl7.org/fhir/search.html#profile),
which allows participants to query using the `_profile` parameter to return
resources conforming to the profiles declared in `meta.profile`.

Profile search and population of `meta.profile` originate as "SHALL"
requirements in the base FHIR specification; they are not an additional
requirements imposed by Military Service History. However, in practice, few implementations have
followed these requirements. Refer to the [FHIR Documentation on supported
profiles](https://www.hl7.org/fhir/profiling.html#CapabilityStatement.rest.resource.supportedProfile)
for details.

### Capability Statements

This implementation specifies a specialization of the generic US core
implementation guide and the capabilities:

{% include markdown-link-references.md %} [FHIR US Core Capability Statement -
[Server]:
https://www.hl7.org/fhir/us/core/CapabilityStatement-us-core-server.html [FHIR
US Core Capability Statement -
Client]:https://www.hl7.org/fhir/us/core/CapabilityStatement-us-core-client.html

-   The Verification API/Server will conform with US Core ([US Core
    Responder](https://www.hl7.org/fhir/us/core/#us-core-actors)) and SHALL
    support the profiles and custom operation specified in this implementation
    guide.

-   The application/Client will conform with US Core ([US Core
    Requestor](https://www.hl7.org/fhir/us/core/#us-core-actors)) and SHALL
    interpret and process the information specified in the profiles described in
    this implementation guide.

    {% include markdown-link-references.md %}
