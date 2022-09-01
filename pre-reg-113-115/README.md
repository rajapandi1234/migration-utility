# Migration-Utility

## Overview
In 1.1.5, version of MOSIP the encryption key was `REGISTRATION` that is changed to a new key `PRE_REGISTRATION`. <br />
This utility will help you to migrate your data from the old key to the new key.

## Scenario 1 - Two different environments 

Source Environment :  1.1.3 has a set of keys generated and data is encrypted with this set of keys. <br />
Destination Environment :  1.1.5 has a set of keys generated (different keys here, totally a new environment). <br />
For this scenario, the data will be decrypted with 1.1.3 environment keys and then encrypts with 1.1.5 environment. <br />

## Scenario 2 - Same environment 

In this scenario `1.1.5` version of MOSIP has got upgraded but no new keys will get generated here. <br />
It's just application upgrade. <br />
So, the data will be decrypted with the upgraded version of MOSIP and encrypted with upgraded version of MOSIP. <br />

## Functionality of Migration-Utility for both scenario
Scenario 1- Reads the database and object store data from the old key and re-encrypts with the new key and store it in new database and object store.<br />
Scenario 2- Reads the database and object store data from the upgraded version of MOSIP and re-encrypts with the upgraded version of MOSIP and store it in same database and object store. <br />

## Pre-requisites
1. Update [Properties](https://github.com/mosip/mosip-config/blob/develop1-v3/pre-reg-113-115-application-default.properties) from here.
2. Run [Config Server](https://oss.sonatype.org/service/local/repositories/snapshots/content/io/mosip/kernel/kernel-config-server/1.2.0-SNAPSHOT/kernel-config-server-1.2.0-20201016.134941-57.jar)
3. [Key-Manager Service](https://docs.mosip.io/1.2.0/modules/keymanager) should be running.
4. `mosip_prereg` database and `minio` should be there in source and destination environments.
## Setup steps:

### Linux (Docker) 

1. Pull the latest docker from below Command.

```
docker pull mosipdev/pre-reg-113-115:develop
```
2. Run docker image using below command.
```
docker run re-encrypt-utility
```

## Properties files details
1. For Scenario 1 change `isNewDatabase` property to true and for Scenario 2 change `isNewDatabase` property to false.
```
isNewDatabase=true
```
2. Change below properties in the [application.properties.](https://github.com/kameshsr/re-encrypt-utility/blob/master/src/main/resources/application.properties)

```
datasource.primary.jdbcUrl=jdbc:postgresql://{jdbc url}:{port}/{primary database name}
datasource.primary.username={username}
datasource.primary.password={password}
datasource.primary.driver-class-name=org.postgresql.Driver

mosip.base.url={Base URL for decryption}
cryptoResource.url=${mosip.base.url}/v1/keymanager

appId={appId}
clientId={clientId}
secretKey={secretKey}

decryptBaseUrl=${mosip.base.url}
encryptBaseUrl={encryptBaseUrl}

object.store.s3.url={object store url}
object.store.s3.accesskey={object store accesskey}
object.store.s3.secretkey={object store secretkey}

decryptAppId={app id for decryption}
decryptReferenceId={reference id for decryption}

encryptAppId={app id for encryption}
encryptReferenceId={reference id for encryption}

```

3. For Scenario 1 (Source and destination Environments), change the below properties in the `application.properties`.
```
datasource.secondary.jdbcUrl=jdbc:postgresql://{jdbc url}:{port}/{secondary database name}
datasource.secondary.username={username}
datasource.secondary.password={password}
datasource.secondary.driver-class-name=org.postgresql.Driver

destinationObjectStore.s3.url={destination object store url}
destinationObjectStore.s3.access-key={destination object store accesskey}
destinationObjectStore.s3.secret-key={destination object store secretkey}
```


## ArchivalScript.sql 
SQL scripts to move `applicant_demographic`, `applicant_document` and `reg_appointment` table to respective `CONSUMED`
tables based on `createdDt` or `lastUpdatedDt` whichever is latest.