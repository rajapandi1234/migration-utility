# Migration Utility

## Overview

This utility is used to migrate/publish all the data required for IDA from PMS through websub. With default configuration, this utility is used to migrate all the required data from PMS to IDA while performing database upgrade from 1.1.5.5 to 1.2.0.1-B1. The properties needed for this utility will be taken from [_pms-migration-utility-default.properties_](https://github.com/mosip/mosip-config/blob/develop-v3/pms-migration-utility-default.properties);

This utility can also be used as a cronjob for publishing data from 1.1.5.x PMS t0 1.2.0.1 IDA in scheduled time intervals with initial run being the migration of all necessary data from PMS to IDA and scheduling of this utility is expected to be done through kubernetes.

For Running this utility as a cronjob:
> This property need to be added in pms-migration-utility-default.properties file _mosip.pms.utility.run.mode:cronjob_
> A table need to be created in PMS database for which the [ddl script](https://github.com/mosip/migration-utility/blob/develop/pms-115-120/db_scripts/migration-scripts.sql) has been given in utility.


## Build & run 

a. Build
    ```
    $ cd utility
    $ mvn install -DskipTests=true -Dmaven.javadoc.skip=true -Dgpg.skip=true
    ```

for Building a docker image
    ```
    $ docker build -t name:tag -f Dockerfile
    ```

