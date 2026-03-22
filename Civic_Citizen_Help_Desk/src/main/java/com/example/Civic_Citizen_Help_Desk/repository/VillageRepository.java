package com.example.Civic_Citizen_Help_Desk.repository;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.Civic_Citizen_Help_Desk.entity.village;

@Repository
public interface VillageRepository extends JpaRepository<village, Long> {
    
	List<village> findByTalukaId(Long talukaId);
	
	
}
