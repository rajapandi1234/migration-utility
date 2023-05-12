package io.mosip.pms.ida.dao;

import java.time.LocalDateTime;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface LastSyncRepository extends JpaRepository<LastSync, LocalDateTime> {
	/**
	 * Method to find last sync time stamp.
	 * 
	 * @return the entity.
	 */
	@Query(value = "select t.last_sync,t.cr_by,t.cr_dtimes,t.upd_by,t.upd_dtimes FROM pms.last_sync_time_stamp t where t.last_sync=(select max(t.last_sync) FROM pms.last_sync_time_stamp t)", nativeQuery = true)
	LastSync findLastSync();
}
