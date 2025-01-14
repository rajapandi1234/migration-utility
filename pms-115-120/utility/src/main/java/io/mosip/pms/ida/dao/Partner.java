package io.mosip.pms.ida.dao;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

import jakarta.persistence.*;

import lombok.Data;

/**
 * The persistent class for the partner database table.
 * 
 */
@Entity
@Table(schema = "pms", name = "partner")
@Data
public class Partner implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	@Column(name="address")
	private String address;

	@Column(name="contact_no")
	private String contactNo;

	@Column(name="cr_by")
	private String crBy;

	@Column(name="cr_dtimes")
	private Timestamp crDtimes;

	@Column(name="del_dtimes")
	private Timestamp delDtimes;

	@Column(name="email_id")
	private String emailId;

	@Column(name="is_active")
	private Boolean isActive;

	@Column(name="is_deleted")
	private Boolean isDeleted;

	@Column(name="name")
	private String name;

	@Column(name="policy_group_id")
	private String policyGroupId;

	@Column(name="certificate_alias")
	private String certificateAlias;

	@Column(name = "partner_type_code")
	private String partnerTypeCode;
	
	@Column(name="approval_status")
	private String approvalStatus;
	
	@Column(name="upd_by")
	private String updBy;

	@Column(name="upd_dtimes")
	private Timestamp updDtimes;

	@Column(name="user_id")
	private String userId;

	//bi-directional many-to-one association to PartnerPolicy
	@OneToMany(mappedBy="partner")
	private List<PartnerPolicy> partnerPolicies;

	//bi-directional many-to-one association to PartnerPolicyRequest
	@OneToMany(mappedBy="partner")
	private List<PartnerPolicyRequest> partnerPolicyRequests;
}