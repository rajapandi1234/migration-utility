# Migration Utility

## Overview

This utility is used to migrate/publish all the data required for IDA from PMS through websub. With default configuration, this utility is used to migrate all the required data from PMS to IDA while performing database upgrade from 1.1.5.5 to 1.2.0.1-B1. The properties needed for this utility will be taken from [_pms-migration-utility-default.properties_](https://github.com/mosip/mosip-config/blob/develop-v3/pms-migration-utility-default.properties);

This utility can also be used as a cronjob for publishing data from 1.1.5.x PMS t0 1.2.0.1 IDA in scheduled time intervals with initial run being the migration of all necessary data from PMS to IDA and scheduling of this utility is expected to be done through kubernetes.

Before Running this utility either as a migrator or as a cronjob, these SQL commands need to be executed with respect to PMS db:

``` sql
INSERT INTO pms.policy_group (id,name,descr,user_id,is_active,cr_by,cr_dtimes,upd_by,upd_dtimes,is_deleted,del_dtimes) 
VALUES('mpolicygroup-default-cert','mpolicygroup-default-cert','mpolicygroup-default-cert','superadmin',true,'superadmin',now(),'superadmin',now(),false,NULL);

INSERT INTO pms.partner (id,policy_group_id,name,address,contact_no,email_id,certificate_alias,user_id,partner_type_code,approval_status,is_active,cr_by,cr_dtimes,upd_by,upd_dtimes,is_deleted,del_dtimes) 
VALUES('mpartner-default-cert','mpolicygroup-default-cert','mpartner-default-cert','mpartner-default-cert','9232121212','info@mosip.io',NULL,'mpartner-default-cert','Credential_Partner','approved',true,'superadmin',now(),'superadmin',now(),false,NULL);

INSERT INTO pms.partner_h (id,eff_dtimes,policy_group_id,name,address,contact_no,email_id,certificate_alias,user_id,partner_type_code,approval_status,is_active,cr_by,cr_dtimes,upd_by,upd_dtimes,is_deleted,del_dtimes) 
VALUES('mpartner-default-cert',now(),'mpolicygroup-default-cert','mpartner-default-cert','mpartner-default-cert','9232121212','info@mosip.io',NULL,'mpartner-default-cert','Credential_Partner','approved',true,'superadmin',now(),'superadmin',now(),false,NULL);


INSERT INTO pms.auth_policy (id,policy_group_id,name,descr,policy_file_id,policy_type,"version",policy_schema,valid_from_date,valid_to_date,is_active,cr_by,cr_dtimes,upd_by,upd_dtimes,is_deleted,del_dtimes) 
VALUES('mpolicy-default-cert','mpolicygroup-default-cert','mpolicy-default-cert','mpolicy-default-cert','{"shareableAttributes":[{"attributeName":"fullName","source":[{"attribute":"fullName"}],"encrypted":true},{"attributeName":"dateOfBirth","source":[{"attribute":"dateOfBirth"}],"encrypted":true},{"attributeName":"gender","source":[{"attribute":"gender"}],"encrypted":true},{"attributeName":"phone","source":[{"attribute":"phone"}],"encrypted":true},{"attributeName":"email","source":[{"attribute":"email"}],"encrypted":true},{"attributeName":"addressLine1","source":[{"attribute":"addressLine1"}],"encrypted":true},{"attributeName":"addressLine2","source":[{"attribute":"addressLine2"}],"encrypted":true},{"attributeName":"addressLine3","source":[{"attribute":"addressLine3"}],"encrypted":true},{"attributeName":"region","source":[{"attribute":"region"}],"encrypted":true},{"attributeName":"province","source":[{"attribute":"province"}],"encrypted":true},{"attributeName":"city","source":[{"attribute":"city"}],"encrypted":true},{"attributeName":"postalCode","source":[{"attribute":"postalCode"}],"encrypted":true},{"attributeName":"individualBiometrics","group":"CBEFF","source":[{"attribute":"individualBiometrics"}],"encrypted":true,"format":"extraction"}],"dataSharePolicies":{"typeOfShare":"Data Share","validForInMinutes":"30","transactionsAllowed":"2","encryptionType":"none","shareDomain":"datashare.datashare","source":"ID Repository"}}','DataShare','1','https://schemas.mosip.io/v1/auth-policy',now(),now()+interval '12 years',true,'admin',now(),'admin',now(),false,NULL);

INSERT INTO pms.partner_policy_request (id,part_id,policy_id,request_datetimes,request_detail,status_code,cr_by,cr_dtimes,upd_by,upd_dtimes,is_deleted,del_dtimes) 
VALUES('mpartner_policy_cert_req','mpartner-default-cert','mpolicy-default-cert',now(),'mpolicy-default-cert','approved','admin',now(),'admin',now(),NULL,NULL);

INSERT INTO pms.partner_policy (policy_api_key,part_id,policy_id,valid_from_datetime,valid_to_datetime,is_active,cr_by,cr_dtimes,upd_by,upd_dtimes,is_deleted,del_dtimes) 
VALUES('mpolicy_part_cert_api','mpartner-default-cert','mpolicy-default-cert',now(),now()+interval '12 years',true,'admin',now(),'admin',now(),false,NULL);

```

For Running this utility as a cronjob:
> This property need to be added in pms-migration-utility-default.properties file _mosip.pms.utility.run.mode:cronjob_
> A table need to be created in PMS database for which the [ddl script](https://github.com/mosip/migration-utility/blob/develop/pms-115-120/db_scripts/migration-scripts.sql) has been given in utility.


## Build & run 

Here is the link for [Helm Charts](https://github.com/mosip/mosip-helm/tree/develop/charts/pms-migration-utility) used to deploy this utility.

a. Build and run in local
    ```
    $ cd utility
    $ mvn install -DskipTests=true -Dmaven.javadoc.skip=true -Dgpg.skip=true
    $ java -jar target/Utility-0.0.1-SNAPSHOT.jar
    ```

for Building a docker image 
    ```
    $ docker build -t name:tag -f Dockerfile
    ```

