                                                                 
### Background
This implementation guide design document is intended to create a set of profiles and extensions to support Military Service History and Status reporting
consistent with US regulatory requirements (i.e. Title 38 Veteran Benefits) and extensible to other realms/jurisdictions (e.g. Canadian Forces).
It harmonizes the requirements of the U.S. Department of Veterans Affairs (VA) and the Centers for Disease Control and Prevention (CDC) to record this
information more easily in support of administrative and clinical workflows and the work and social history of patients who are also Veterans.

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
health risks associated with military service.

##### Veteran
The Veteran is the focus of this specification. The API described here allows
Veterans to access and share their military service history and status
information with community and hospital-based clinicians, community service agencies, vendors, and
employers, etc. The Veteran can access their information or make it available to
entities that assist Veterans. Military Service History may be combined with
other employment history information.


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
and military service history - is entered into a system of record used to capture such information and not explicitly EHR. 

##### Verify Veteran History

The EHR system, acting as a FHIR client, uses a standards-based VA RESTful API (FHIR Observation with profiles and extensions) to verify that the patient is a
Veteran and served in the military.

The query is triggered by an EHR. Based on the verification result,the EHR may validate the Veteran status and fill in the combat episodes as
needed to determine social history risks.

Official records and documentation from the military service record, DD214, and other pre--existing documentation can be referenced in the verification process.

##### Verify Veteran Status

The Verification API proposed in this document determines the Veteran’s status
by using demographic information submitted as a query (search operation) to a
FHIR server that supports **Observation** resource - - using the **Patient**
endpoint to determine whether a person is a verified veteran. Additional
information is provided using the Search Service History criteria using the
profiles described in the [Information Requirements](#information-and-semantics-requirements) section (see [Military Service Episode](#military-service-episode)).

##### Search Service History

This use case is part of the proposed verification API based on FHIR. If this
search operation returns one or more **Observation** resources that conform
[Military Service Episode](#military-service-episode) to the proposed profile,
the Veteran's status confirmed. If the search operation does not find any
matching Observation resources, the Veteran's service history could not be confirmed.

The presence of one or more Observations that conform to the [Deployment
Episode](#deployment-episode) profile proposed here indicates that Veteran was deployed.

#### Deferred Requirements

The following use cases were discussed and deferred because they are
out-of-scope for the profiles and extensions described in this implementation
guide design document:


* **Prior Authorization:** U.S. Department of Defense (DoD) administrative transactions are currently used for prior authorization for healthcare services. This use case will not be addressed in this document but it may be relevant to future FHIR profiling efforts.
* **Apply for coverage:** A Veteran's military history and other service-related information are relevant to applying for healthcare coverage. This use case was discussed with the Financial Management Workgroup on March 31, 2020 and it will remain out-of-scope for this iteration of the specification. Military service history is relevant to establish level of care but will not be explored further in this document.
* **Schedule service-connected visit:** Another potential use case included scheduling a visit for a service-connected disorder or condition. This use case was discussed and deemed out-of-scope for now since it is related to level of disability and service-connected problems, as well as:
- -  an encounter related to a service-connected disability, special authority designation and those services are not billable;
- - care may be covered by special authority (e.g. neck/throat cancer); and,
- - coding system for special authority and service-related not in scope.

### Information and Semantics Requirements

 
This section describes the result harmonizing requirements to convey military service history and status at this time. It also harmonizes the content of the Occupational Data for Health Implementation Guide developed by CDC to enhance social history and employment history reporting from EHR systems.

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

### Acknowledgements

This implementation guide builds upon existing FHIR implementation guidance and
best practices:
-  [US Core Implementation Guide (v3.1.1)](http://hl7.org/fhir/us/core/index.html) (reusing US Core Patient profile)
-  [Occupational Data for Health (ODH) 1.0](http://hl7.org/fhir/us/odh/index.html) (reusing best practices, *PastOrPresentJob* profile)

The project team would like to thank our leadership and colleagues for their
support in the development of Application Programming Interface (API)
implementation guide:

**Department of Veterans Affairs:**
- Steven Brown, MD, Director, CIDMO Knowledge Based Systems (KBS)
- Christopher Shawn, Director of Stndards  & Interoperability, KBS
- Javon Hyland, Deputy Program Manager, KBS Standards & Interoperability
- Catherine Hoang, Associate Director, KBS Terminology Services
- Keith Campbell MD, Director, KBS Informatics Architecture

**Work Group Co-chairs:**                                                                          
- Floyd Eisenberg MD                                                                                
- Jean Duteau  

**Project team:** 
- Ioana Singureanu MsCS, FHL7, Project Facilitatorm BookZurman                                    
- Sean Muir, FHIR Implementation Guide Developer/Publisher, BookZurman                                       
- Jayme Welty, Project Manager, BookZurman                                                               
- Mark Janczewski, MD, MPH, BookZurman
  
**VA Developer API (Lighthouse Project):**
- Andrew Fichter                                                                                  
- Shawnee Petrosky                                                                                  
- Derek Brown                     
                                                                   
**Defense Health Agency:**                                                                            
- Nancy Orvis
- Eric Strom
- Allyson Rigel

**CDC NIOSH:**                                                      
- Genny Luensman  
                                                                                    
**MITRE**:              
 - Dr. Mark A. Kramer
 
 
**ESAC**
- Peter Muir
 
**ALTARUM**
- Craig Newman PhD

{% include markdown-link-references.md %}

