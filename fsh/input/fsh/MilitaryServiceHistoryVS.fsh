Alias:   LNC = http://loinc.org
Alias:   SCT = http://snomed.info/sct
Alias:   UCUM = http://unitsofmeasure.org
Alias:   MTH = http://ncimeta.nci.nih.gov
Alias:   ICD10CM = http://hl7.org/fhir/sid/icd-10-cm 
Alias:   RXN = http://www.nlm.nih.gov/research/umls/rxnorm
Alias:   CPT = http://www.ama-assn.org/go/cpt
Alias:   ICD10PCS = http://www.nlm.nih.gov/research/umls/icd10pcs
Alias:   AJCC = http://cancerstaging.org
Alias:   GTR = http://www.ncbi.nlm.nih.gov/gtr
Alias:   CLINVAR = http://www.ncbi.nlm.nih.gov/clinvar
Alias:   IDTYPE = http://terminology.hl7.org/CodeSystem/v2-0203
Alias:   HGNC = http://www.genenames.org/geneId
Alias:   HGVS = http://varnomen.hgvs.org
Alias:   SPTY = http://terminology.hl7.org/CodeSystem/v2-0487
Alias:   ClinStatus = http://terminology.hl7.org/CodeSystem/condition-clinical
Alias:   VerStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status
Alias:   MedStatus = http://hl7.org/fhir/CodeSystem/medication-statement-status
Alias:   MedCat = http://terminology.hl7.org/CodeSystem/medication-statement-category
Alias:   ObsCat = http://terminology.hl7.org/CodeSystem/observation-category
Alias:   ObsInt = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation
Alias:   DiagnosticService = http://terminology.hl7.org/CodeSystem/v2-0074
Alias:   OmbRaceCat = urn:oid:2.16.840.1.113883.6.238
Alias:   ISO = urn:iso:std:iso:3166
Alias:   ODH = http://terminology.hl7.org/CodeSystem/PHOccupationalDataForHealthODH
Alias:   SOLOR = http://www.logicahealth.org/solutions/solor



ValueSet:    ODHSupervisoryLevelValueSet
Id: 2.16.840.1.114222.4.11.7613
Title: "Job Supervisory Level or Pay Grade ODH"
Description: "Reflects the amount of supervisory or management responsibilities for an individual’s job. In the military, this is the person’s pay grade, which serves as a proxy for supervisory level and can be interpreted across branches."

ValueSet:    ODHOccupationValueSet
Id: 2.16.840.1.114222.4.11.7901
Title: "Occupation CDC ONET-SOC 2010 ODH"
Description: "The Occupation CDC O*NET-SOC 2010 (ODH) value set is to be used to capture self-reported occupation within electronic health information systems to support direct patient care, population health and public health activities. Occupation is the type of work done by the subject. It is based on the 2010 O*Net-SOC Classification System. For more information, a mapping to 2010 Census Codes, and tips on using this value set go to the Occupational Data for Health (ODH) Hot Topics section on the PHIN VADS home page."

ValueSet:    ODHIndustryValueSet
Id: 2.16.840.1.114222.4.5.327
Title: "Industry CDC NAICS 2012 ODH"
Description: "The Industry CDC NAICS 2012 (ODH) value set is to be used to capture self-reported industry within electronic health information systems to support direct patient care, population health and public health activities. Industry is described as the economic or business sector of a business or enterprise. For more information, a mapping to 2012 Census Industry Codes, and tips on using this value set go to the Occupational Data for Health (ODH) Hot Topics section on the PHIN VADS home page." 



ValueSet:    MilitaryBranchCode
Id: msh-militarybranchcode-vs
Title: "Military Branch Value Set"
Description: "Military Branch Value Set" 
* ODH#928110.000255	"Air Force [National Security ]"
* ODH#928110.000275	"Air traffic control, military [National Security ]"
* ODH#928110.000809	"Armed forces [National Security ]"
* ODH#928110.000817	"Army [National Security ]"
* ODH#928110.004459	"Courts, military [National Security ]"
* ODH#928110.010506	"Marine Corps [National Security ]"
* ODH#928110.010877	"Military bases and camps [National Security ]"
* ODH#928110.010884	"Military police [National Security ]"
* ODH#928110.010885	"Military reserve armories and bases [National Security ]"
* ODH#928110.010887	"Military training schools (except academies) [National Security ]"
* ODH#928110.011393	"National Guard [National Security ]"
* ODH#928110.011438	"Navy [National Security ]"


ValueSet:    PayGradeCode 
Id: msh-paygradecode-vs
Title: "Pay Grade Code Value Set"
Description: "Pay Grade Code Value Set"
* ODH#C-0	"Civilian Non Supervisor"
* ODH#C-3	"First Line Supervisor"
* ODH#C-6	"Manager"
* ODH#E-1	"US Military Enlisted paygrade E-1"
* ODH#E-2	"US Military Enlisted paygrade E-2"
* ODH#E-3	"US Military Enlisted paygrade E-3"
* ODH#E-4	"US Military Enlisted paygrade E-4"
* ODH#E-5	"US Military Enlisted paygrade E-5"
* ODH#E-6	"US Military Enlisted paygrade E-6"
* ODH#E-7	"US Military Enlisted paygrade E-7"
* ODH#E-8	"US Military Enlisted paygrade E-8"
* ODH#E-9	"US Military Enlisted paygrade E-9"
* ODH#O-1	"US Military Commissioned Officer paygrade O-1"
* ODH#O-10	"US Military Commissioned Officer paygrade O-10"
* ODH#O-2	"US Military Commissioned Officer paygrade O-2"
* ODH#O-3	"US Military Commissioned Officer paygrade  O-3"
* ODH#O-4	"US Military Commissioned Officer paygrade O-4"
* ODH#O-5	"US Military Commissioned Officer paygrade O-5"
* ODH#O-6	"US Military Commissioned Officer paygrade O-6"
* ODH#O-7	"US Military Commissioned Officer paygrade O-7"
* ODH#O-8	"US Military Commissioned Officer paygrade O-8"
* ODH#O-9	"US Military Commissioned Officer paygrade O-9"
* ODH#W-1	"Warrant Officer paygrade W-1"
* ODH#W-2	"Warrant Officer paygrade W-2"
* ODH#W-3	"Warrant Officer paygrade W-3"
* ODH#W-4	"Warrant Officer paygrade W-4"
* ODH#W-5	"Warrant Officer paygrade W-5"


ValueSet:    SeparationReasonValueSet
Id: msh-SeparationReason-vs
Title: "Separation Reason Value Set"
Description: "Separation Reason Value Set"
*  SOLOR#001 "WEIGHT CONTROL FAILURE"
*  SOLOR#002 "FRAUDULENT ENTRY INTO MILITARY SERVICE"
*  SOLOR#003 "PARENTHOOD OR CUSTODY OF MINOR CHILDREN"
*  SOLOR#004 "MILITARY PERSONNEL SECURITY PROGRAM"
*  SOLOR#005 "FRAUDULENT ENTRY INTO MILITARY SERVICE (DRUG ABUSE)"
*  SOLOR#006 "FRAUDULENT ENTRY INTO MILITARY SERVICE (ALCOHOL ABUSE)"
*  SOLOR#007 "DISRUPTIVE BEHAVIOR DISORDER"
*  SOLOR#008 "MENTAL DISORDER (OTHER)"
*  SOLOR#009 "PHYSICAL STANDARDS"
*  SOLOR#010 "CONDITION, NOT A DISABILITY"
*  SOLOR#011 "PERSONALITY DISORDER"
*  SOLOR#012 "ADJUSTMENT DISORDER"
*  SOLOR#013 "IMPULSE CONTROL DISORDER"
*  SOLOR#014 "FAILURE TO COMPLETE A COURSE OF INSTRUCTION"
*  SOLOR#015 "UNSATISFACTORY PERFORMANCE"
*  SOLOR#016 "SUBSTANDARD PERFORMANCE"
*  SOLOR#017 "PATTERN OF MISCONDUCT"
*  SOLOR#018 "MISCONDUCT (CIVIL CONVICTION)"
*  SOLOR#019 "MISCONDUCT (DRUG ABUSE)"
*  SOLOR#020 "MISCONDUCT (SEXUAL PERVERSION)"
*  SOLOR#021 "MISCONDUCT (OTHER)"
*  SOLOR#022 "MISCONDUCT (MINOR INFRACTIONS)"
*  SOLOR#023 "MISCONDUCT (SERIOUS OFFENSE)"
*  SOLOR#024 "MISCONDUCT (ANTHRAX REFUSAL)"
*  SOLOR#025 "UNACCEPTABLE CONDUCT (ANTHRAX REFUSAL)"
*  SOLOR#026 "UNACCEPTABLE CONDUCT"
*  SOLOR#027 "DRUG REHABILITATION FAILURE"
*  SOLOR#028 "ALCOHOL REHABILITATION FAILURE"
*  SOLOR#029 "HOMOSEXUAL CONDUCT (ACTS)"
*  SOLOR#030 "HOMOSEXUAL CONDUCT (STATEMENT)"
*  SOLOR#031 "HOMOSEXUAL CONDUCT (MARRIAGE OR ATTEMPTED MARRIAGE)"
*  SOLOR#032 "IN LIEU OF TRIAL BY COURT MARTIAL"
*  SOLOR#033 "SUFFICIENT SERVICE FOR RETIREMENT"
*  SOLOR#034 "MEDAL OF HONOR RECIPIENT"
*  SOLOR#035 "COMPLETION OF REQUIRED ACTIVE SERVICE"
*  SOLOR#036 "EARLY RELEASE PROGRAM-VOLUNTARY SEPARATION INCENTIVE (VSI)"
*  SOLOR#037 "EARLY RELEASE PROGRAM-SPECIAL SEPARATION BENEFIT (SSB)"
*  SOLOR#038 "REDUCTION IN FORCE"
*  SOLOR#039 "ATTEND CIVILIAN SCHOOL"
*  SOLOR#040 "CIVIL OFFICE"
*  SOLOR#041 "CONSCIENTIOUS OBJECTOR"
*  SOLOR#042 "FORCE SHAPING (VSP)"
*  SOLOR#043 "ALIEN"
*  SOLOR#044 "SURVIVING FAMILY MEMBER - SOLE SURVIVORSHIP"
*  SOLOR#045 "HARDSHIP"
*  SOLOR#046 "PREGNANCY OR CHILDBIRTH"
*  SOLOR#047 "ECCLESIASTICAL ENDORSEMENT"
*  SOLOR#048 "HOLIDAY EARLY RELEASE PROGRAM"
*  SOLOR#049 "SECRETARIAL AUTHORITY"
*  SOLOR#050 "FAILED MEDICAL/PHYSICAL PROCUREMENT STANDARDS"
*  SOLOR#051 "INTERDEPARTMENTAL TRANSFER"
*  SOLOR#052 "INTRADEPARTMENTAL TRANSFER"
*  SOLOR#053 "IMMEDIATE ENLISTMENT OR REENLISTMENT"
*  SOLOR#054 "DISMISSAL - NO REVIEW"
*  SOLOR#055 "MISCELLANEOUS/GENERAL REASONS"
*  SOLOR#056 "FORCE SHAPING (BOARD SELECTED)"
*  SOLOR#057 "ERRONEOUS ENTRY (OTHER)"
*  SOLOR#058 "NON-RETENTION ON ACTIVE DUTY"
*  SOLOR#059 "MISCONDUCT (AWOL)"
*  SOLOR#060 "MISCONDUCT (DESERTION)"
*  SOLOR#061 "MAXIMUM AGE"
*  SOLOR#062 "MAXIMUM SERVICE OR TIME IN GRADE"
*  SOLOR#063 "INSUFFICIENT RETAINABILITY (ECONOMIC REASONS)"
*  SOLOR#064 "LACK OF JURISDICTION"
*  SOLOR#065 "DISABILITY, SEVERANCE PAY, COMBAT RELATED (ENHANCED)"
*  SOLOR#066 "DISABILITY, SEVERANCE PAY, NON COMBAT (ENHANCED)"
*  SOLOR#067 "DISABILITY, EXISTED PRIOR TO SERVICE, PEB (ENHANCED)"
*  SOLOR#068 "DISABILITY, SEVERANCE PAY (ENHANCED)"
*  SOLOR#069 "DISABILITY, EXISTED PRIOR TO SERVICE, MED BOARD (ENHANCED)"
*  SOLOR#070 "DISABILITY, NOT IN LINE OF DUTY (ENHANCED)"
*  SOLOR#071 "DISABILITY, AGGRAVATION (ENHANCED)"
*  SOLOR#072 "DISABILITY, OTHER (ENHANCED)"
*  SOLOR#073 "ERRONEOUS ENTRY (ALCOHOL ABUSE)"
*  SOLOR#074 "UNDER AGE"
*  SOLOR#075 "COMPETENT AUTHORITY, WITHOUT BOARD ACTION"
*  SOLOR#076 "DISABILITY, SEVERANCE PAY, COMBAT RELATED"
*  SOLOR#077 "DISABILITY, SEVERANCE PAY"
*  SOLOR#078 "DISABILITY, EXISTED PRIOR TO SERVICE, PEB"
*  SOLOR#079 "DISABILITY, EXISTED PRIOR TO SERVICE, MED BOARD"
*  SOLOR#080 "DISABILITY, SEVERANCE PAY, NON COMBAT"
*  SOLOR#081 "DISABILITY, NOT IN LINE OF DUTY"
*  SOLOR#082 "DISABILITY, AGGRAVATION"
*  SOLOR#083 "DISABILITY, OTHER"
*  SOLOR#084 "ERRONEOUS ENTRY (DRUG ABUSE)"
*  SOLOR#085 "ENTRY LEVEL PERFORMANCE AND CONDUCT"
*  SOLOR#086 "NON-SELECTION, PERMANENT PROMOTION"
*  SOLOR#087 "NON-SELECTION, TEMPORARY PROMOTION"
*  SOLOR#088 "FAILURE TO COMPLETE COMMISSIONING OR WARRANT PROGRAM"
*  SOLOR#089 "COURT MARTIAL (ALCOHOL)"
*  SOLOR#090 "COURT MARTIAL (HOMOSEXUAL CONDUCT)"
*  SOLOR#091 "COURT MARTIAL (DESERTION)"
*  SOLOR#092 "COURT MARTIAL (OTHER)"
*  SOLOR#093 "COURT MARTIAL (DRUG ABUSE)"
*  SOLOR#094 "COURT MARTIAL (ANTHRAX REFUSAL)"
*  SOLOR#095 "SURVIVING FAMILY MEMBER"
*  SOLOR#096 "DEFECTIVE ENLISTMENT AGREEMENT"
*  SOLOR#097 "FAILURE TO ACCEPT REGULAR APPOINTMENT"
*  SOLOR#098 "ACCEPT COMMISSION OR WARRANT IN SAME BRANCH OF SERVICE"
*  SOLOR#099 "ACCEPT COMMISSION OR WARRANT IN ANOTHER BRANCH OF SERVICE"
*  SOLOR#100 "ENTER OFFICER TRAINING PROGRAM"
*  SOLOR#101 "REQUEST FOR EXTENSION OF SERVICE DENIED"
*  SOLOR#102 "DISMISSAL - AWAITING APPELLATE REVIEW"
*  SOLOR#103 "ENROLLMENT IN SERVICE ACADEMY"
*  SOLOR#104 "EARLY RETIREMENT"
*  SOLOR#105 "DISABILITY, PERMANENT (ENHANCED)"
*  SOLOR#106 "DISABILITY, TEMPORARY (ENHANCED)"
*  SOLOR#107 "DISABILITY, PERMANENT"
*  SOLOR#108 "DISABILITY, TEMPORARY"
*  SOLOR#109 "PERSONAL ALCOHOL ABUSE"
*  SOLOR#110 "PERSONAL DRUG ABUSE"
*  SOLOR#900 "NOT APPLICABLE"
*  SOLOR#999 "UNKNOWN"


ValueSet: DischargeStatusValueSet
Id: msh-DischargeStatusValueSet
Title: "Discharge Status Value Set"
Description: "Discharge Status Value Set"
* SOLOR#79A512F77CFC4E63B9969930FC8787DB "Honorable"
* SOLOR#B5BA882B31574AB0BF82DFE43765F264 "General"
* SOLOR#59B40AF3E8B44B0587743B08290C7AD1 "Bad Conduct"
* SOLOR#599671FC8E3046DEA0AFCA3E8D2640D3 "Other Than Honorable"
* SOLOR#42F13CAA1D894DFEB000908D0F467B76 "Dishonorable"
* SOLOR#A557979943014BF990E056D7BF3FB940 "Honorable absence of negative report"
* SOLOR#24B4895BFF3048BABB4B7708E8CFAADE "Honorable for VA purposes"
* SOLOR#E963385389BC4541AB6DD77F3EF31EEA "Dishonorable for VA purposes"
* SOLOR#8412EEBCB8354A06AAB445C9486CA268 "Uncharacterized"
* SOLOR#7A3CBF5D942F41A9889C9406BB1D951F "Unknown"

ValueSet: CombatEpisodeMissionValueSet
Id: msh-CombatEpisodeMissionValueSet
Title: "Combat Episode Mission Value Set"
Description: "Combat Episode Mission Value Set"
* SOLOR#CD1CAD19F5494F1981211F8634DD6AB1 "ANTIGUERRILLA OPERATIONS"
* SOLOR#469552D4E8AA4BBBBF075190F7ED430C "COMBAT PATROL"
* SOLOR#750988FBBD6148DCB85C062DEFC871E2 "Individual Augmentee"



ValueSet:    VeteranStatusValueSet
Id: msh-veteranstatus-vs
Title: "Veteran Status Value Set"
Description: "Veteran Status Value Set" 
* SOLOR#91DFBFFEB92A42FDB474142DD7B26EB5 "UNVERIFIED"
* SOLOR#91A4B033CC8C401AA46BD2B29E930BE9  "VERIFIED"

ValueSet:    MilitaryOccupationValueSet
Id: msh-militaryoccupation-vs
Title: "Military Occupation ValueSet"
Description: "Military Occupation ValueSet" 







