Profile: USVeteran
Parent: USCorePatient
Id: usveteran
Title: "US Veteran"
Description: "US Veteran whose veteran status was confirmed or is about to be confirmed. This profile extends US Core Patient profile and includes a ['US Veteran Status'] (usveteranstatus) extension to hold additional coded or boolean information about the veteran status. This version of the profile specifies a boolean value but it's conceivable that pilot implementaiton may decide to support more that one status to match the veteran verification state machine."
* extension contains
    USVeteranStatus named USVeteranStatus 0..1 MS

Extension:  USVeteranStatus
Id: military-service-veteran-status
Title: "us-veteran-status"
Description: "us-veteran-status is a boolean extension used to specify whether a patient was confirmed or verified to have Veteran status. Veteran status is not limited to Combat Status but reflects the status of yes/no they had indeed served in a military organization"
* value[x] only boolean
* valueBoolean 1..1 MS


 