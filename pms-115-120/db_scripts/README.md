# Database migration script

## Overview

This utility is used when Partner Management Services are moving from 1.1.5 to 1.2.0. This script will move data from 'mosip_authdevice' and 'mosip_regdevice' databases to 'mosip_pms' database.

## How To Run

 Prerequisites : Db user should have read permissions for 'mosip_authdevice' and 'mosip_regdevice' databases and write permissions for 'mosip_pms' database.
 
 Update 'host' and 'password' keys with corerct values and execute the script.