/* 
 * Copyright
 * 
 */
package com.reencryptutility.entity;

import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import jakarta.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

/**
 * This entity class defines the database table details for PreRegistration.
 */
@Component
@Entity
@Table(name = "applicant_demographic", schema = "prereg")
@NoArgsConstructor
public class DemographicEntity implements Serializable {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 6705845720255847210L;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "demographicEntity")
	private List<DocumentEntity> documentEntity;

	/** The pre registration id. */
	@Id
	@Column(name = "prereg_id")
	private String preRegistrationId;

	/** The JSON */
	@Column(name = "demog_detail")
	private byte[] applicantDetailJson;

	/** The status_code */
	@Column(name = "status_code", nullable = false)
	private String statusCode;

	/** The lang_code */
	@Column(name = "lang_code", nullable = false)
	private String langCode;

	/** The created by. */
	@Column(name = "cr_by")
	private String createdBy;

	/** The created appuser by. */
	@Column(name = "cr_appuser_id")
	private String crAppuserId;

	/** The create date time. */
	@Column(name = "cr_dtimes")
	private LocalDateTime createDateTime;

	/** The updated by. */
	@Column(name = "upd_by")
	private String updatedBy;

	/** The update date time. */
	@Column(name = "upd_dtimes")
	private LocalDateTime updateDateTime;

	/**
	 * Encrypted Date Time
	 */
	@Column(name = "encrypted_dtimes")
	private LocalDateTime encryptedDateTime;

	@Column(name = "demog_detail_hash")
	private String demogDetailHash;

	public byte[] getApplicantDetailJson() {
		return (byte[]) applicantDetailJson.clone();
	}

	public void setApplicantDetailJson(byte[] applicantDetailJson) {
		this.applicantDetailJson = (byte[]) applicantDetailJson.clone();
	}

	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}

	public String getLangCode() {
		return langCode;
	}

	public void setLangCode(String langCode) {
		this.langCode = langCode;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getCrAppuserId() {
		return crAppuserId;
	}

	public void setCrAppuserId(String crAppuserId) {
		this.crAppuserId = crAppuserId;
	}

	public LocalDateTime getCreateDateTime() {
		return createDateTime;
	}

	public void setCreateDateTime(LocalDateTime createDateTime) {
		this.createDateTime = createDateTime;
	}

	public String getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}

	public LocalDateTime getUpdateDateTime() {
		return updateDateTime;
	}

	public void setUpdateDateTime(LocalDateTime updateDateTime) {
		this.updateDateTime = updateDateTime;
	}

	public LocalDateTime getEncryptedDateTime() {
		return encryptedDateTime;
	}

	public void setEncryptedDateTime(LocalDateTime encryptedDateTime) {
		this.encryptedDateTime = encryptedDateTime;
	}

	public String getDemogDetailHash() {
		return demogDetailHash;
	}

	public void setDemogDetailHash(String demogDetailHash) {
		this.demogDetailHash = demogDetailHash;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public List<DocumentEntity> getDocumentEntity() {
		return documentEntity;
	}

	public void setDocumentEntity(List<DocumentEntity> documentEntity) {
		this.documentEntity = documentEntity;
	}

	public String getPreRegistrationId() {
		return preRegistrationId;
	}

	public void setPreRegistrationId(String preRegistrationId) {
		this.preRegistrationId = preRegistrationId;
	}


}
