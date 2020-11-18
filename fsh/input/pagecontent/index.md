<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://hl7.org/fhir ../../input-cache/schemas-r5/fhir-single.xsd">


<ul>
    <li><a href="#Background">Background</a></li>
    <li><a href="#Modeling">Scope and Conceptual Model</a></li>
    <li><a href="#Information">Information Requirements</a></li>
    <li><a href="#Deferred">Deferred Requirements</a></li>
    
</ul>

<h3><a name="Background">Background</a></h3>
<p>Military Service and Status Profile: This implementation guide design document is intended to create a set of profiles and extensions to support Military Service History and Status reporting. It harmonizes the requirements of the U.S. Department of Veterans Affairs (VA) and the Centers for Disease Control and Prevention (CDC) to more easily record this information in support of administrative and clinical workflows and the work and social history of patients who are also Veterans.  ZMH (Military Service History) Z-segment used to represent service and deployment history in HL7 Version 2 transactions.ServiceHistoryEpisode and Deployment Schemas for the VA Veteran Verification API (https://developer.va.gov/explore/verification/docs/veteran_verification?version=current)HL7 FHIR Profile: odh-CombatZonePeriod from Occupational Data for Health (ODH), Release 1.0 (Standard for Trial Use) (http://hl7.org/fhir/us/odh/)    ",</p>
<h3><a name="Modeling">Scope and Conceptual Model</a></h3>

<img src="mshusecase.png" alt="Use Case Analysis Model" width="1100" />

<h3><a name="Information">Information Requirements</a></h3>

<h2 style="margin-top:12.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;font-size:19px;font-family:Arial;color:#004080;"><span style="color:#0F0F0F;">&nbsp;&nbsp;</span> Information Requirements</h2>
<p style="margin:0in;margin-bottom:.0001pt;font-size:16px;font-family:Arial;"><span style="font-size:13px;color:black;">&nbsp;</span></p>
<p style="margin:0in;margin-bottom:.0001pt;font-size:16px;font-family:Arial;"><span style="font-size:13px;font-family:Verdana;color:black;">In HL7 Version 2 interfaces, the data required to exchange military service history and status is accomplished using extensions segments (i.e. Z-segments). The naming convention for extensions in HL7 Version 2 requires that new segment names start with the letter &quot;Z&quot;.&nbsp;</span></p>
<p style="margin:0in;margin-bottom:.0001pt;font-size:16px;font-family:Arial;"><span style="font-size:13px;font-family:Verdana;color:black;">For instance, the VA extension for &quot;Military Service&quot; is &quot;ZMH&quot;. This extension can be added to message payloads (e.g. administrative transactions) to convey this content.&nbsp;</span></p>
<p style="margin:0in;margin-bottom:.0001pt;font-size:16px;font-family:Arial;"><span style="font-size:13px;color:black;">&nbsp;</span></p>
<p style="margin:0in;margin-bottom:.0001pt;font-size:16px;font-family:Arial;"><span style="font-size:13px;font-family:Verdana;color:black;">This section represents a harmonization of HL7 Version 2 and RESTful APIs used at VA. It also harmonizes the content of the Occupational Data for Health Implementation Guide developed by CDC to enhance social history and employment history reporting from EHR systems.</span></p>
<p style="margin:0in;margin-bottom:.0001pt;font-size:16px;font-family:Arial;"><span style="font-size:13px;">&nbsp;</span></p>
<p style="margin:0in;margin-bottom:.0001pt;font-size:16px;font-family:Arial;"><span style="font-size:13px;font-family:Verdana;color:black;">Figure 2 summarizes the proposed profiles and extensions needed to document military service history. The profiles described here constrain and extend the normative Observation resources profile (Release 4 and later) to ensure stability and reusability. FHIR Release 4 marked the first time some FHIR resources have attained normative status and will be maintained in a manner that ensure backwards-compatibility. Furthermore,&nbsp;&nbsp;using&nbsp;</span><a href="http://build.fhir.org/observation.html"><span style="font-size:13px;font-family:Verdana;color:blue;">Observation R4 and later</span></a><span style="font-size:13px;font-family:Verdana;color:black;">&nbsp;- rather than&nbsp;</span><a href="http://build.fhir.org/basic.html"><span style="font-size:13px;font-family:Verdana;color:blue;">Basic</span></a><span style="font-size:13px;font-family:Verdana;color:black;">&nbsp;resource - is the recommended approach to creating extensible APIs based on FHIR.&nbsp;</span></p>
<p style="margin:0in;margin-bottom:.0001pt;font-size:16px;font-family:Arial;"><strong><span style="font-size:13px;font-family:Verdana;color:black;">Note:</span></strong><span style="font-size:13px;font-family:Verdana;color:black;">&nbsp;FHIR implementation, localization, and profiling best-practices are under development and evolving. This design document is intended to provide reasoning and context for future projects.&nbsp;</span></p>
<p style="margin:0in;margin-bottom:.0001pt;font-size:16px;font-family:Arial;"><span style="font-size:13px;">&nbsp;</span></p>

<img src="information.png" alt="Information Model" width="1100" />

<h3><a name="Deferred">Deferred Requirements</a></h3>

<p style="margin:0in;margin-bottom:.0001pt;font-size:16px;font-family:Arial;"><span style="font-size:13px;color:black;">&nbsp;</span></p>
<p style="margin:0in;margin-bottom:.0001pt;font-size:16px;font-family:Arial;"><span style="font-size:13px;font-family:Verdana;color:black;">The following use cases were discussed and deferred because they are out-of-scope for the profiles and extensions described in this implementation guide design document:</span></p>
<p style="margin:0in;margin-bottom:.0001pt;font-size:16px;font-family:Arial;"><span style="font-size:13px;">&nbsp;</span></p>
<h5 style="margin-top:12.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;font-size:17px;font-family:Arial;color:#004080;font-style:italic;"><span style="color:#0F0F0F;">Prior Authorization&nbsp;</span></h5>
<p style="margin:0in;margin-bottom:.0001pt;font-size:16px;font-family:Arial;"><span style="font-size:13px;font-family:Verdana;color:black;">U.S. Department of Defense (DoD) administrative transactions are currently used for prior authorization for healthcare services. This use case will not be addressed in this document but it may be relevant to future FHIR profiling efforts.&nbsp;</span></p>
<p style="margin:0in;margin-bottom:.0001pt;font-size:16px;font-family:Arial;"><span style="font-size:13px;">&nbsp;</span></p>
<h5 style="margin-top:12.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;font-size:17px;font-family:Arial;color:#004080;font-style:italic;"><span style="color:#0F0F0F;">Apply for coverage&nbsp;</span></h5>
<p style="margin:0in;margin-bottom:.0001pt;font-size:16px;font-family:Arial;"><span style="font-size:13px;font-family:Verdana;color:black;">A Veteran&#39;s military history and other service-related information are relevant to applying for healthcare coverage. This use case was discussed with the Financial Management Workgroup on March 31, 2020 and it will remain out-of-scope for this iteration of the specification. Military service history is relevant to establish level of care but will not be explored further in this document.&nbsp;&nbsp;</span></p>
<p style="margin:0in;margin-bottom:.0001pt;font-size:16px;font-family:Arial;"><span style="font-size:13px;">&nbsp;</span></p>
<h5 style="margin-top:12.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;font-size:17px;font-family:Arial;color:#004080;font-style:italic;"><span style="color:#0F0F0F;">Schedule service-connected visit&nbsp;</span></h5>
<p style="margin:0in;margin-bottom:.0001pt;font-size:16px;font-family:Arial;"><span style="font-size:13px;font-family:Verdana;color:black;">Another potential use case included scheduling a visit for a service-connected disorder or condition. This use case was discussed and deemed out-of-scope for now since it is related to level of disability and service-connected problems, as well as:</span></p>
<ul style="list-style-type: disc;margin-left:-0.25in;">
    <li><span style="font-family:Verdana;font-size:10.0pt;color:black;">an encounter related to a service-connected disability, special authority designation and those services are not billable;</span></li>
    <li><span style="font-family:Verdana;font-size:10.0pt;color:black;">care may be covered by special authority (e.g. neck/throat cancer); and,</span></li>
    <li><span style="font-family:Verdana;font-size:10.0pt;color:black;">coding system for special authority and service-related not in scope. &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span></li>
</ul>


</div>
