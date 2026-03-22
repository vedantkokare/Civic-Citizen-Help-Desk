package com.example.Civic_Citizen_Help_Desk.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.Civic_Citizen_Help_Desk.entity.Complaint;

@Repository
public interface ComplaintRepository extends JpaRepository<Complaint, Long> {


	
	
	 List<Complaint> findByEmail(String email);
	  
	  List<Complaint> findByUsername(String username);
	  
	 List<Complaint> findByStatus(String status);
	  
	 long countByStatus(String status);
	  
	 List<Complaint> findAllByOrderByCreatedAtDesc();
	  
	 List<Complaint> findBySubjectContainingIgnoreCase(String keyword);

	    Optional<Complaint> findByComplaintId(String complaintId);

	    void deleteByComplaintId(String complaintId);

	


}
