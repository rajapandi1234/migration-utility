package io.mosip.pms.ida.dao;

import java.io.Serializable;
import java.time.Instant;
import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import lombok.Data;

@Entity
@Table(schema = "pms", name = "last_sync_time_stamp")
@Data
public class LastSync implements Serializable {
	/**
	 * the registration center id.
	 */
	@Id
	@Column(name = "last_sync")
	private LocalDateTime lastSync;

	/**
	 * The ID created by.
	 */
	@Column(name = "cr_by", nullable = false, length = 256)
	private String createdBy;

	/**
	 * The ID created at.
	 */
	@Column(name = "cr_dtimes", nullable = false)
	private LocalDateTime createdDateTime;

	/**
	 * The ID updated by.
	 */
	@Column(name = "upd_by", length = 256)
	private String updatedBy;

	/**
	 * The ID updated at.
	 */
	@Column(name = "upd_dtimes")
	private LocalDateTime updatedDateTime;
}
