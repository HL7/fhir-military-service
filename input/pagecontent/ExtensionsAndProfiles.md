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
"\$veteranStatus" operation using the Veteran's demographics (e.g. first name, last name,
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
