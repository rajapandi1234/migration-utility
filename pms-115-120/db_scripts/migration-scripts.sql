-- -------------------------------------------------------------------------------------------------
-- Database Name: mosip_pms
-- Table Name 	: pms.last_sync_time_stamp
-- Purpose    	: to store last sync time stamp
--           
-- Create By   	: Balaji A
-- Created Date	: May-2023
-- 
-- Modified Date        Modified By         Comments / Remarks
-- ------------------------------------------------------------------------------------------

-- ------------------------------------------------------------------------------------------

-- object: pms.last_sync_time_stamp | type: TABLE --
-- DROP TABLE IF EXISTS pms.last_sync_time_stamp CASCADE;
CREATE TABLE pms.last_sync_time_stamp(
	last_sync timestamp NOT NULL,
	cr_by character varying(256) NOT NULL,
	cr_dtimes timestamp NOT NULL,
	upd_by character varying(256),
	upd_dtimes timestamp,
	CONSTRAINT pk_blwrd_code PRIMARY KEY (last_sync)

);
-- ddl-end --
COMMENT ON TABLE pms.last_sync_time_stamp IS 'Last Sync Time Stamp : List of Time Stamps of pms-ida sync.';
-- ddl-end --
COMMENT ON COLUMN pms.last_sync_time_stamp.last_sync IS 'Last Sync: Date and Timestamp when the Last Sync happened';
-- ddl-end --
COMMENT ON COLUMN pms.last_sync_time_stamp.cr_by IS 'Created By : ID or name of the user who create / insert record';
-- ddl-end --
COMMENT ON COLUMN pms.last_sync_time_stamp.cr_dtimes IS 'Created DateTimestamp : Date and Timestamp when the record is created/inserted';
-- ddl-end --
COMMENT ON COLUMN pms.last_sync_time_stamp.upd_by IS 'Updated By : ID or name of the user who update the record with new values';
-- ddl-end --
COMMENT ON COLUMN pms.last_sync_time_stamp.upd_dtimes IS 'Updated DateTimestamp : Date and Timestamp when any of the fields in the record is updated with new values.';
-- ddl-end --

