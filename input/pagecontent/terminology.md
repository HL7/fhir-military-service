This implementation guide draws on a number of formal terminologies (code systems). Several guiding principles were applied in selecting terminologies for this implementation guide:

1. Fit for purpose
2. Conformance with US Core and FHIR
3. Commonly used in practice

The following table presents the external code systems (and naming conventions) adopted in this implementation guide, and their primary purpose:

| Code System | Application | [FHIR IG Publishing](https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation) support? |
|--------------|-------------|------------------|
| LOINC | Observation and laboratory codes, answer codes | Yes |
| SNOMED CT | Disorders, body structures, findings, qualifiers | Yes |
| UCUM | Units of measure | Yes |
| HL7 Terminology Authority  | HL7 V2 and FHIR-specific codes | Yes |
{: .grid }

**Key:**
* LOINC - Logical Observation Identifiers Names and Codes
* SNOMED CT - Systematized Nomenclature of Medicine Clinical Terms
* UCUM - Unified Code for Units of Measure
* ODH - Occupational Data for Health
* SOLOR - Solor Project sponsored by the Department of Veterans Affairs and Logica Health

New code systems were created when no existing code systems were deemed fit for purpose.  This implementation used SOLOR and its methodology to specify an extension for gap concepts intended to be added to LOINC and SNOMED CT:

### Code Systems Defined

* [msh-solor-extension]

### Value Sets Defined

* [ODHSupervisoryLevelValueSet]
* [ODHOccupationValueSet]
* [ODHIndustryValueSet]
* [MilitaryBranchCode]
* [PayGradeCode]
* [SeparationReasonValueSet]
* [DischargeStatusValueSet]
* [CombatEpisodeMissionValueSet]
* [MilitaryOccupationValueSet]



{% include markdown-link-references.md %}
