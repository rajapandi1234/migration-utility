# Migration Utility

## Overview

This utility is used when Partner Management Services 1.1.5 version is used with ID-Authentication 1.2.0 version. This utility will migrate/publish all the data required for IDA from PMS to websub in the initial run and migrate/publish the newly created or updated data after the last run thereafter.

## Build & run 

Provide all the required properties and configurations in application.properties file like data base connection configurations, clientId and secret etc.

a. Build
    ```
    $ cd utility
    $ mvn install -DskipTests=true -Dmaven.javadoc.skip=true -Dgpg.skip=true

for Building a docker image
    ```
    $ docker build -t name:tag -f Dockerfile


