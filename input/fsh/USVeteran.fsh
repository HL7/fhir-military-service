Profile: USVeteran
Parent: USCorePatient
Id: usveteran
Title: "US Veteran"
Description: "US Veteran profile extends US Core Patient profile. It's intended to be used when the patient is Veteran was confirmed by the VA. 
This profile includes a ['US Veteran Status'] (usveteranstatus) extension to hold status information as a boolean (i.e. 'true' indicates that the patient's veteran status was confirmed)."
* extension contains
    USVeteranStatus named USVeteranStatus 0..1 MS

Extension:  USVeteranStatus
Id: military-service-veteran-status
Title: "us-veteran-status"
Description: "us-veteran-status is a boolean extension used to specify whether a patient was confirmed or verified to have Veteran status. Veteran status is not limited to Combat Status but reflects the status of yes/no they had indeed served in a military organization"
* value[x] only boolean
* valueBoolean 1..1 MS


 