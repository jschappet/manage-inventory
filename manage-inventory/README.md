# manage-inventory
===============================================

# Background
Brief description of what the what the application is and why it's important.

This component provides major feature one...

- It uses properties [example.properties](src/main/resources/config/example.properties)
- does cool thing one
- does cool thing two
- Uses neat spring feature
 - stuff
 - other stuff
 
 
This component provides major feature two...

- Opens Port 12345
- Listens for POST Request /foo/?bar=<bar>&baz=<baz>
- See the example html [test file](src/main/non-packaged-resources/test.html)



The project requires:
 - [Tomcat](http://tomcat.apache.org/)
 - JAVA >= 1.7 

This project is a maven project and should be built using:

    mvn clean install
    
To configure the Database run:

    mvn -p BuildDatabase    

To access the application run:

    mvn jetty:run

   Start Browser, [and click here](http://localhost:8080/): http://localhost:8080/



This application uses log4j, application logs are stored in <exe_root>/logs/.  There are three logs files of interest.

 - manage-inventory.log -- Main application log - Debug information is stored here
 - manage-inventory.audit.log -- Any audit information would be written here, should be empty for now
 - manage-inventory.sql.log -- Sql trace information is can be written here
 
The update [log4j.properties](src/main/resources/log4j.properties) to change location or log levels


# Project Details
List the customer for whom this application was developed, at a minimum include names and email addresses.

-Jane Doe <jane-doe@uiowa.edu>
-Bob Smith <bob-smith@uiowa.edu>

The project is released under version 2.0 of the [Apache License](http://www.apache.org/licenses/LICENSE-2.0). Install license header:

	mvn license:update-file-header
