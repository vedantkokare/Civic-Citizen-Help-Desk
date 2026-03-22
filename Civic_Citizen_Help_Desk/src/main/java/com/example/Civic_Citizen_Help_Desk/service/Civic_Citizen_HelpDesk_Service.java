package com.example.Civic_Citizen_Help_Desk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Civic_Citizen_Help_Desk.entity.Civic_HelpDeskEntity;
import com.example.Civic_Citizen_Help_Desk.repository.Civic_Citizen_HelpDesk_Repository;

@Service
public class Civic_Citizen_HelpDesk_Service {

	@Autowired
	Civic_Citizen_HelpDesk_Repository repository;
	
	// Register Method
	public void register_user(Civic_HelpDeskEntity register) {
		repository.save(register);
	}

	// Login Method
	public boolean login_user(Civic_HelpDeskEntity user) {
		Long count = repository.countByEmailAndPassword(user.getEmail(),user.getPassword());
		if(count >= 1) {
			return true;
		}
		return false;
	}

	// Email Validation
	public boolean emailValidation(String email) {
		
		long count = repository.countOfEmail(email);
		
		if(count >= 1) {
			return true;
		}
		return false;
		
	}

	public boolean mobileValidation(String mobile) {
		long count = repository.countOfMobile(mobile);
				
		if(count >= 1) {
			return true;
		}
		return false;
	}

	public boolean aadharValidation(String aadhar) {
		long count = repository.countOfAadhar(aadhar);
		
		if(count >= 1) {
			return true;
		}
		return false;
	}

	public String GetUserByEmail(String email) {
		
		return repository.GetUserByEmail(email);
	}
}