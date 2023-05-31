package io.mosip.pms.ida.dao;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


/**
 * Repository class for create partner id.
 * @author sanjeev.shrivastava
 *
 */

@Repository
public interface PartnerRepository extends JpaRepository<Partner, String> {

	/**
	 * Method to fetch last updated partner id
	 * @param name partner name
	 * @return list of partner
	 */
	
	public List<Partner> findByName(String name);
	
	/**
	 * 
	 * @param partnerType
	 * @return
	 */
	@Query(value = "select * from partner ppr where ppr.partner_type_code=?", nativeQuery = true)
	public List<Partner> findByPartnerType(String partnerType);
	
	/**
	 * Method to fetch last updated partner id
	 * @param name partner name
	 * @return list of partner
	 */
	@Query(value = "select * from partner ppr where ((ppr.cr_dtimes>=?1 and ppr.cr_dtimes<?2) or (ppr.upd_dtimes>=?1 and ppr.upd_dtimes<?2)) and ( ppr.is_deleted = false or ppr.is_deleted is null)", nativeQuery = true)
	public List<Partner> findByCreatedDtimeOrUpdDtimeGreaterThanAndIsDeletedFalseOrIsDeletedIsNull(LocalDateTime crDtimes, LocalDateTime presentDtimes);
}
