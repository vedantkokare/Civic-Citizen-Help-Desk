package com.helpdesk.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helpdesk.entity.Taluka;
import com.helpdesk.entity.village;
import com.helpdesk.service_implementation.Service_Implementation;

@Service
public class LocationService {
	
	@Autowired
	Service_Implementation service_implementation;
	
	   public List<village> getdata(Long talukaId) {
		
		   return service_implementation.findByTalukaId(talukaId);
       }

	   public List<Taluka> gettaluka() {
		
		return service_implementation.findAll();
	   
	   }
	   
	

}
