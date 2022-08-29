
The US Veteran profile specifies an additional extension to the set already supported by the FHIR US Core profile it extends. This extension is a boolean flag used to specify/store the confirmation/verification status. true: the Patient record describes a Veteran or false: the Patient is either not a verified yet or under review if the flag is absent, then the veteran status is undetermined. |

### Profile
[USVeteran]

### Extension
[USVeteranStatus]

### Verification
Using patient match [patientmatch] verify existence of extension [USVeteranStatus] to evaluate veteran status.  A return missing extension completely is a result of undetermined.

{% include markdown-link-references.md %}
