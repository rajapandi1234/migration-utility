do $$
begin 
create extension dblink;

select
	dblink_connect('auth_device_conn',
	'dbname=mosip_authdevice port=5432 host=dbhost user=postgres password=postgrespasswd');

insert
	into
	device_detail 
select
	*
from
	dblink('auth_device_conn',
	'SELECT id, dprovider_id, dtype_code, dstype_code, make, model, partner_org_name, approval_status, is_active, cr_by, cr_dtimes, upd_by, upd_dtimes, is_deleted, del_dtimes
FROM device_detail') as (id varchar,
	dprovider_id varchar,
	dtype_code varchar,
	dstype_code varchar,
	make varchar,
	model varchar,
	partner_org_name varchar,
	approval_status varchar,
	is_active bool,
	cr_by varchar,
	cr_dtimes timestamp,
	upd_by varchar,
	upd_dtimes timestamp,
	is_deleted bool,
	del_dtimes timestamp);

insert
	into
	secure_biometric_interface
select
	*
from
	dblink('auth_device_conn',
	'SELECT id, sw_binary_hash, sw_version, sw_cr_dtimes, sw_expiry_dtimes, approval_status, is_active, cr_by, cr_dtimes, upd_by, upd_dtimes, is_deleted, del_dtimes, provider_id, partner_org_name
FROM secure_biometric_interface') as (id varchar,
	sw_binary_hash bytea,
	sw_version varchar,
	sw_cr_dtimes timestamp,
	sw_expiry_dtimes timestamp,
	approval_status varchar,
	is_active bool,
	cr_by varchar,
	cr_dtimes timestamp,
	upd_by varchar,
	upd_dtimes timestamp,
	is_deleted bool,
	del_dtimes timestamp,
	provider_id varchar,
	partner_org_name varchar);

insert
	into
	secure_biometric_interface_h
select
	*
from
	dblink('auth_device_conn',
	'SELECT id, sw_binary_hash, sw_version, sw_cr_dtimes, sw_expiry_dtimes, approval_status, is_active, cr_by, cr_dtimes, upd_by, upd_dtimes, is_deleted, del_dtimes, eff_dtimes, provider_id, partner_org_name
FROM secure_biometric_interface_h') as(id varchar,
	sw_binary_hash bytea,
	sw_version varchar,
	sw_cr_dtimes timestamp,
	sw_expiry_dtimes timestamp,
	approval_status varchar,
	is_active bool,
	cr_by varchar,
	cr_dtimes timestamp,
	upd_by varchar,
	upd_dtimes timestamp,
	is_deleted bool,
	del_dtimes timestamp,
	eff_dtimes timestamp,
	provider_id varchar,
	partner_org_name varchar);

insert
	into
	device_detail_sbi
select
	*
from
	dblink('auh_device_conn',
	'select 	dd.dprovider_id,dd.partner_org_name,dd.id,id,is_active,cr_by,cr_dtimes,upd_by,upd_dtimes,is_deleted,del_dtimes from secure_biometric_interface inner join device_detail dd where 	device_detail_id = dd.id') as(dprovider_id varchar,
	partner_org_name varchar,
	device_detail_id varchar,
	sbi_id varchar,
	is_active bool,
	cr_by varchar,
	cr_dtimes timestamp,
	upd_by varchar,
	upd_dtimes timestamp,
	is_deleted bool,
	del_dtimes timestamp);

insert
	into
	ftp_chip_detail
select
	id,
	foundational_trust_provider_id,
	make,
	model,
	certificate_alias,
	partner_org_name,
	is_active,
	cr_by,
	cr_dtimes,
	upd_by,
	upd_dtimes,
	is_deleted,
	del_dtimes
from
	dblink('auth_device_conn',
	'select id, foundational_trust_provider_id, make, model, certificate_alias, partner_org_name, is_active, cr_by, cr_dtimes, upd_by, upd_dtimes, is_deleted, del_dtimes
from ftp_chip_detail') as(id varchar,
	foundational_trust_provider_id varchar,
	make varchar,
	model varchar,
	certificate_alias varchar,
	partner_org_name varchar,
	is_active bool,
	cr_by varchar,
	cr_dtimes timestamp,
	upd_by varchar,
	upd_dtimes timestamp,
	is_deleted bool,
	del_dtimes timestamp);

dblink_disconnect('auth_device_conn');
end $$

do $$
begin 
create extension dblink;

select
	dblink_connect('reg_device_conn',
	'dbname=mosip_regdevice port=5432 host=dbhost user=postgres password=postgrespasswd');

insert
	into
	device_detail 
select
	*
from
	dblink('reg_device_conn',
	'SELECT id, dprovider_id, dtype_code, dstype_code, make, model, partner_org_name, approval_status, is_active, cr_by, cr_dtimes, upd_by, upd_dtimes, is_deleted, del_dtimes
FROM device_detail') as (id varchar,
	dprovider_id varchar,
	dtype_code varchar,
	dstype_code varchar,
	make varchar,
	model varchar,
	partner_org_name varchar,
	approval_status varchar,
	is_active bool,
	cr_by varchar,
	cr_dtimes timestamp,
	upd_by varchar,
	upd_dtimes timestamp,
	is_deleted bool,
	del_dtimes timestamp);

insert
	into
	secure_biometric_interface
select
	*
from
	dblink('reg_device_conn',
	'SELECT id, sw_binary_hash, sw_version, sw_cr_dtimes, sw_expiry_dtimes, approval_status, is_active, cr_by, cr_dtimes, upd_by, upd_dtimes, is_deleted, del_dtimes, provider_id, partner_org_name
FROM secure_biometric_interface') as (id varchar,
	sw_binary_hash bytea,
	sw_version varchar,
	sw_cr_dtimes timestamp,
	sw_expiry_dtimes timestamp,
	approval_status varchar,
	is_active bool,
	cr_by varchar,
	cr_dtimes timestamp,
	upd_by varchar,
	upd_dtimes timestamp,
	is_deleted bool,
	del_dtimes timestamp,
	provider_id varchar,
	partner_org_name varchar);

insert
	into
	secure_biometric_interface_h
select
	*
from
	dblink('reg_device_conn',
	'SELECT id, sw_binary_hash, sw_version, sw_cr_dtimes, sw_expiry_dtimes, approval_status, is_active, cr_by, cr_dtimes, upd_by, upd_dtimes, is_deleted, del_dtimes, eff_dtimes, provider_id, partner_org_name
FROM secure_biometric_interface_h') as(id varchar,
	sw_binary_hash bytea,
	sw_version varchar,
	sw_cr_dtimes timestamp,
	sw_expiry_dtimes timestamp,
	approval_status varchar,
	is_active bool,
	cr_by varchar,
	cr_dtimes timestamp,
	upd_by varchar,
	upd_dtimes timestamp,
	is_deleted bool,
	del_dtimes timestamp,
	eff_dtimes timestamp,
	provider_id varchar,
	partner_org_name varchar);

insert
	into
	device_detail_sbi
select
	*
from
	dblink('reg_device_conn',
	'select 	dd.dprovider_id,dd.partner_org_name,dd.id,id,is_active,cr_by,cr_dtimes,upd_by,upd_dtimes,	is_deleted,del_dtimes from secure_biometric_interface inner join device_detail dd where 	device_detail_id = dd.id') as(dprovider_id varchar,
	partner_org_name varchar,
	device_detail_id varchar,
	sbi_id varchar,
	is_active bool,
	cr_by varchar,
	cr_dtimes timestamp,
	upd_by varchar,
	upd_dtimes timestamp,
	is_deleted bool,
	del_dtimes timestamp);

insert
	into
	ftp_chip_detail
select
	id,
	foundational_trust_provider_id,
	make,
	model,
	certificate_alias,
	partner_org_name,
	is_active,
	cr_by,
	cr_dtimes,
	upd_by,
	upd_dtimes,
	is_deleted,
	del_dtimes
from
	dblink('reg_device_conn',
	'select id, foundational_trust_provider_id, make, model, certificate_alias, partner_org_name, is_active, cr_by, cr_dtimes, upd_by, upd_dtimes, is_deleted, del_dtimes
from ftp_chip_detail') as(id varchar,
	foundational_trust_provider_id varchar,
	make varchar,
	model varchar,
	certificate_alias varchar,
	partner_org_name varchar,
	is_active bool,
	cr_by varchar,
	cr_dtimes timestamp,
	upd_by varchar,
	upd_dtimes timestamp,
	is_deleted bool,
	del_dtimes timestamp);

dblink_disconnect('reg_device_conn');
end $$
----This data required for pushing certs to websub--------------------------------------
 
do $$ 
begin	

insert
	into
	pms.policy_group (id,
	"name",
	descr,
	user_id,
	is_active,
	cr_by,
	cr_dtimes,
	upd_by,
	upd_dtimes,
	is_deleted,
	del_dtimes)
values
	 ('mpolicygroup-default-cert',
'mpolicygroup-default-cert',
'mpolicygroup-default-cert',
'superadmin',
true,
'superadmin',
'2021-10-26 13:30:27.598',
'superadmin',
'2021-10-26 13:30:27.598',
false,
null);

insert
	into
	pms.auth_policy (id,
	policy_group_id,
	"name",
	descr,
	policy_file_id,
	policy_type,
	"version",
	policy_schema,
	valid_from_date,
	valid_to_date,
	is_active,
	cr_by,
	cr_dtimes,
	upd_by,
	upd_dtimes,
	is_deleted,
	del_dtimes)
values
	 ('mpolicy-default-cert',
'mpolicygroup-default-cert',
'mpolicy-default-cert',
'mpolicy-default-cert',
'{"shareableAttributes":[{"attributeName":"fullName","source":[{"attribute":"fullName"}],"encrypted":true},{"attributeName":"dateOfBirth","source":[{"attribute":"dateOfBirth"}],"encrypted":true},{"attributeName":"gender","source":[{"attribute":"gender"}],"encrypted":true},{"attributeName":"phone","source":[{"attribute":"phone"}],"encrypted":true},{"attributeName":"email","source":[{"attribute":"email"}],"encrypted":true},{"attributeName":"addressLine1","source":[{"attribute":"addressLine1"}],"encrypted":true},{"attributeName":"addressLine2","source":[{"attribute":"addressLine2"}],"encrypted":true},{"attributeName":"addressLine3","source":[{"attribute":"addressLine3"}],"encrypted":true},{"attributeName":"region","source":[{"attribute":"region"}],"encrypted":true},{"attributeName":"province","source":[{"attribute":"province"}],"encrypted":true},{"attributeName":"city","source":[{"attribute":"city"}],"encrypted":true},{"attributeName":"postalCode","source":[{"attribute":"postalCode"}],"encrypted":true},{"attributeName":"individualBiometrics","group":"CBEFF","source":[{"attribute":"individualBiometrics"}],"encrypted":true,"format":"extraction"}],"dataSharePolicies":{"typeOfShare":"Data Share","validForInMinutes":"30","transactionsAllowed":"2","encryptionType":"none","shareDomain":"datashare-service","source":"ID Repository"}}',
'DataShare',
'1',
'https://schemas.mosip.io/v1/auth-policy',
'2021-10-26 13:30:27.712',
'2025-04-28 09:37:00.000',
true,
'admin',
'2021-10-26 13:30:27.712',
'admin',
'2021-10-26 13:30:27.712',
false,
null);

insert
	into
	pms.partner (id,
	policy_group_id,
	"name",
	address,
	contact_no,
	email_id,
	certificate_alias,
	user_id,
	partner_type_code,
	approval_status,
	is_active,
	cr_by,
	cr_dtimes,
	upd_by,
	upd_dtimes,
	is_deleted,
	del_dtimes)
values
	 ('mpartner-default-cert',
'mpolicygroup-default-cert',
'mpartner-default-cert',
'mpartner-default-cert',
'9232121212',
'info@mosip.io',
null,
'mpartner-default-cert',
'Internal_Partner',
'Activated',
true,
'superadmin',
'2021-10-26 13:30:27.447',
'superadmin',
'2021-10-26 13:30:27.447',
false,
null);

insert
	into
	pms.partner_policy_request (id,
	part_id,
	policy_id,
	request_datetimes,
	request_detail,
	status_code,
	cr_by,
	cr_dtimes,
	upd_by,
	upd_dtimes,
	is_deleted,
	del_dtimes)
values
	 ('mpartner_policy_cert_req',
'mpartner-default-cert',
'mpolicy-default-cert',
'2021-10-26 13:30:27.813',
'mpolicy-default-cert',
'approved',
'admin',
'2021-10-26 13:30:27.813',
'admin',
'2021-10-26 13:30:27.813',
null,
null);

insert
	into
	pms.partner_type (code,
	partner_description,
	is_policy_required,
	is_active,
	cr_by,
	cr_dtimes,
	upd_by,
	upd_dtimes,
	is_deleted,
	del_dtimes)
values
	 ('Internal_Partner',
'Used internally to share certs',
true,
true,
'superadmin',
'2021-10-26 13:30:27.258',
null,
null,
false,
null);

insert
	into
	pms.partner_policy (policy_api_key,
	part_id,
	policy_id,
	valid_from_datetime,
	valid_to_datetime,
	is_active,
	cr_by,
	cr_dtimes,
	upd_by,
	upd_dtimes,
	is_deleted,
	del_dtimes,
	"label")
values
	 ('mpolicy_part_cert_api',
'mpartner-default-cert',
'mpolicy-default-cert',
'2021-10-26 13:30:27.752',
'2025-12-01 05:31:00.000',
true,
'admin',
'2021-10-26 13:30:27.752',
'admin',
'2021-10-26 13:30:27.752',
false,
null,
'mpolicy_part_cert_api');
end $$
