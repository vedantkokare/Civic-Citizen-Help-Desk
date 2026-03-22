package com.example.Civic_Citizen_Help_Desk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.example.Civic_Citizen_Help_Desk.entity.Civic_HelpDeskEntity;
import com.example.Civic_Citizen_Help_Desk.service.Civic_Citizen_HelpDesk_Service;

@RestController
public class LoginController {

    @Autowired
    private Civic_Citizen_HelpDesk_Service civicService;

    
    @PostMapping("/register")
    public ResponseEntity<String> registerUser(@RequestBody Civic_HelpDeskEntity user) {

        try {
            civicService.register_user(user);
            return ResponseEntity.ok("User registered successfully");

        } catch (Exception e) {

            e.printStackTrace();

          
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }


    // Login
    @PostMapping("/login")
    public ResponseEntity<Boolean> loginUser(@RequestBody Civic_HelpDeskEntity user) {
        boolean isValid = civicService.login_user(user);
        return ResponseEntity.ok(isValid);
    }
    
    //Email Validation
    @RequestMapping("/emailValidator")
    public boolean emailValidation(@RequestBody String email) {
    	boolean isValid = civicService.emailValidation(email);
    	return isValid;
    }
    //Email Validation
    @RequestMapping("/mobileValidator")
    public boolean mobileValidation(@RequestBody String mobile) {
    	boolean isValid = civicService.mobileValidation(mobile);
    	return isValid;
    }
    //Email Validation
    @RequestMapping("/aadharValidator")
    public boolean aadharValidation(@RequestBody String aadhar) {
    	boolean isValid = civicService.aadharValidation(aadhar);
    	return isValid;
    }
    
    @RequestMapping("/UserByEmail")
    public String GetUserByEmail(@RequestBody String email) {
    	
    	return civicService.GetUserByEmail(email);
    	
    }
    
}

