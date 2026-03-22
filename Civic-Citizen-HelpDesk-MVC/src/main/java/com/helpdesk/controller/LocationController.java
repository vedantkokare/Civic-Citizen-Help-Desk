package com.helpdesk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.helpdesk.entity.Taluka;
import com.helpdesk.entity.village;
import com.helpdesk.service.LocationService;

@RestController
public class LocationController {
	
	@Autowired
	LocationService locationService;
	
	@GetMapping("/getTaluka")
	public List<Taluka> gettaluka() {
		
		List<Taluka> taluka = locationService.gettaluka();
		return taluka;
	}

	@GetMapping("/getVillageByTaluka/{talukaId}")
	public List<village> getVillage(@PathVariable("talukaId") Long talukaId) {
		
		List<village> villages = locationService.getdata(talukaId);
		
		return villages;
	}
	
}
