package com.example.Civic_Citizen_Help_Desk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Civic_Citizen_Help_Desk.entity.Taluka;
import com.example.Civic_Citizen_Help_Desk.entity.village;
import com.example.Civic_Citizen_Help_Desk.repository.TalukaRepository;
import com.example.Civic_Citizen_Help_Desk.repository.VillageRepository;

@Service
public class LocationService {
	
	@Autowired
	TalukaRepository talukaRepository;
	
	@Autowired
	VillageRepository villageRepository;
	
	   public List<village> getdata(Long talukaId) {
		
		   return villageRepository.findByTalukaId(talukaId);
       }

	   public List<Taluka> gettaluka() {
		
		return talukaRepository.findAll();
	   
	   }
	   
	

}
