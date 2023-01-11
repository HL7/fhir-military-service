# Military Service 

### Find the online build version of the IG

http://build.fhir.org/ig/HL7/fhir-military-service/index.html


# Building Military Service IG

## Installing and compiling the project with SUSHI

Military Service was developed using [FHIR Shorthand (FSH)](http://build.fhir.org/ig/HL7/fhir-shorthand/), a domain-specific language (DSL) for defining the content of FHIR Implementation Guides (IG): profiles, value set bindings, extensions, and custom operations.

After you check out the "fhir-military-service" project from Github, install SUSHI (the FSH compiler), [as instructed in FSH school](https://fshschool.org/quickstart/). 

To compile Military Service, open a command window and navigate to the directory where *"fhir-military-service"* has been checked out. 
Use the following command:

`$ sushi .

## Running the IG Publisher
The FHIR IG Publisher maintained by HL7 changes very frequently and the errors and warnings will change without notice.
Therefore, it's recommended to update the IG Pubslisher using the "_updatePublisher.bat" script. 
The tool is over 100MB in size and it will take several minutes to update. 

Windows:   `$ _genonce.bat`


* This will run the HL7 IG Publisher, which will take several minutes to complete. After the publisher is finished, open the file _/build/output/index.html_ to see the resulting IG.

* To get a clean build, you may delete the _./build/input/resources_ and/or the _./build/output_ directories. However, DO NOT delete the entire _./build_ directory!


# Further Customization of the IG

Introduce customizations of the IG into the following files:

* **Menus:** Edit the _/build/input/include/menu.xml_ file
* **List of pages and artifacts to be included in the IG:** Edit _/build/input/ImplementationGuide-fhir.us.Military Service.json_ file. See [ImplementationGuide resource](https://www.hl7.org/fhir/implementationguide.html) for details. Note that profiles, value sets and examples are NOT automatically included in the IG; they must be listed in this file. Also note that the IG Publisher will produce an error and exit prematurely if an artifact listed in the IG json file is not found in the _/build/input/resources_ directory.
* **Additional pages, images, other content:** Add files to _/build/input/pagecontent_ directory, and link them to menus or other pages.
* **Version history:** Edit _/build/package-list.json_.

