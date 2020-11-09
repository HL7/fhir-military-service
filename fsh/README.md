# Military Service 

### Find the online build version of the IG

http://build.fhir.org/ig/HL7/fhir-military-service/index.html


# Building Military Service IG

## Compiling with SUSHI

Military Service is developed in [FHIR Shorthand (FSH)](http://build.fhir.org/ig/HL7/fhir-shorthand/), a domain-specific language (DSL) for defining the content of FHIR Implementation Guides (IG).

After you check out Military Service from Github, install SUSHI (the FSH compiler), [as instructed here](http://build.fhir.org/ig/HL7/fhir-shorthand/sushi.html). 

To compile Military Service, open a command window and navigate to the directory where Military Service has been checked out. Issue the following command:

`$ sushi .

## Running the IG Publisher

Next, change directories to ./build. 

Now run:

Windows:   `$ _genonce`

Mac:   `$ ./_genonce.sh`

This will run the HL7 IG Publisher, which will take several minutes to complete. After the publisher is finished, open the file _/build/output/index.html_ to see the resulting IG.

To get a clean build, you may delete the _./build/input/resources_ and/or the _./build/output_ directories. However, DO NOT delete the entire _./build_ directory!


# Further Customization of the IG

Introduce customizations of the IG into the following files:

* **Menus:** Edit the _/build/input/include/menu.xml_ file
* **List of pages and artifacts to be included in the IG:** Edit _/build/input/ImplementationGuide-fhir.us.Military Service.json_ file. See [ImplementationGuide resource](https://www.hl7.org/fhir/implementationguide.html) for details. Note that profiles, value sets and examples are NOT automatically included in the IG; they must be listed in this file. Also note that the IG Publisher will produce an error and exit prematurely if an artifact listed in the IG json file is not found in the _/build/input/resources_ directory.
* **Additional pages, images, other content:** Add files to _/build/input/pagecontent_ directory, and link them to menus or other pages.
* **Version history:** Edit _/build/package-list.json_.

