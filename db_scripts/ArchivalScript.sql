-- MOSIP-23246
-- Language: sql
-- Archival script for 1.1.3 re encrypt utility - Need SQL scripts to move applications demographic,
--  documents and appointment to CONSUMED tables based on createdDt or lastUpdatedDt whichever is latest.

DO $$
DECLARE startDate DATE='2020-01-11 05:15:34.709197';
DECLARE endDate DATE='2022-01-11 05:15:34.709197';
BEGIN
-- Temporary Table created to get pre_reg_id between startDate and endDate
    CREATE TEMPORARY TABLE applicant_demographic_temp AS SELECT prereg.applicant_demographic.prereg_id FROM prereg.applicant_demographic
    WHERE prereg.applicant_demographic.cr_dtimes BETWEEN startDate AND endDate OR prereg.applicant_demographic.upd_dtimes
    BETWEEN startDate AND endDate;

    CREATE TEMPORARY TABLE applicant_document_temp AS SELECT distinct(prereg_id) FROM prereg.applicant_document
    WHERE prereg.applicant_document.cr_dtimes BETWEEN startDate AND endDate OR prereg.applicant_document.upd_dtimes
    BETWEEN startDate AND endDate;

    CREATE TEMPORARY TABLE reg_appointment_temp AS SELECT distinct(prereg_id) FROM prereg.reg_appointment
    WHERE prereg.reg_appointment.cr_dtimes BETWEEN startDate AND endDate OR prereg.reg_appointment.upd_dtimes
    BETWEEN startDate AND endDate;

-- Union of pre_reg_id from applicant_demographic_temp, applicant_document_temp and reg_appointment_temp
    CREATE TEMPORARY TABLE uniquePreregid AS SELECT DISTINCT(prereg_id) FROM applicant_demographic_temp
    UNION ALL SELECT DISTINCT(prereg_id) FROM applicant_document_temp
    UNION ALL SELECT DISTINCT(prereg_id) FROM reg_appointment_temp;

-- insert in to prereg.applicant_demographic_consumed
    INSERT INTO prereg.consumed_applicant_demographic(SELECT * FROM prereg.applicant_demographic
        WHERE prereg.applicant_demographic.prereg_id IN (SELECT prereg_id FROM uniquePreregid));
-- delete from prereg.applicant_demographic
    DELETE FROM prereg.applicant_demographic WHERE prereg.applicant_demographic.prereg_id IN (SELECT prereg_id FROM uniquePreregid);
-- insert in to prereg.applicant_document_consumed
    INSERT INTO prereg.applicant_document_consumed(id, prereg_id, doc_name, doc_cat_code, doc_typ_code, doc_file_format, doc_id, doc_hash,
    encrypted_dtimes, status_code, lang_code, cr_by, cr_dtimes, upd_by, upd_dtimes)(SELECT prereg.applicant_document.id,
    prereg.applicant_document.prereg_id, prereg.applicant_document.doc_name, prereg.applicant_document.doc_cat_code,
    prereg.applicant_document.doc_typ_code, prereg.applicant_document.doc_file_format, prereg.applicant_document.doc_id,
    prereg.applicant_document.doc_hash, prereg.applicant_document.encrypted_dtimes, prereg.applicant_document.status_code,
    prereg.applicant_document.lang_code, prereg.applicant_document.cr_by, prereg.applicant_document.cr_dtimes, prereg.applicant_document.upd_by,
    prereg.applicant_document.upd_dtimes FROM prereg.applicant_document WHERE prereg.applicant_document.prereg_id IN
    (SELECT prereg_id FROM uniquePreregid));

-- delete from prereg.applicant_document
    DELETE FROM prereg.applicant_document WHERE prereg.applicant_document.prereg_id IN (SELECT prereg_id FROM uniquePreregid);

-- insert in to prereg.reg_appointment_consumed
    INSERT INTO prereg.reg_appointment_consumed(SELECT * FROM prereg.reg_appointment
        WHERE prereg.reg_appointment.prereg_id IN (SELECT prereg_id FROM uniquePreregid));

-- delete from prereg.reg_appointment
    DELETE FROM prereg.reg_appointment WHERE prereg.reg_appointment.prereg_id IN (SELECT prereg_id FROM uniquePreregid);
END $$;