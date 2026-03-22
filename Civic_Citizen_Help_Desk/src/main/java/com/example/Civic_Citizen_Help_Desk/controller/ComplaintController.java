package com.example.Civic_Citizen_Help_Desk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.Civic_Citizen_Help_Desk.entity.Complaint;
import com.example.Civic_Citizen_Help_Desk.repository.ComplaintRepository;
import com.example.Civic_Citizen_Help_Desk.service.Complaint_Service;

@RestController
public class ComplaintController {
	

    @Autowired
     ComplaintRepository complaintRepo;


	@Autowired
    Complaint_Service c_service;


    @PostMapping("/complaintsData")
    public ResponseEntity<Complaint> saveComplaint(@RequestBody Complaint complaint) {
        Complaint saved = c_service.Complaint_Save(complaint);
        return ResponseEntity.status(201).body(saved);
    }

   
    @GetMapping("/getcomplaintdata")
     public List<Complaint>GetComplaint(){
    	
    	return c_service.getdata();
    	
    }
    

    @DeleteMapping("/admincomplaint/{id}")
    public ResponseEntity<String> deleteComplaint(@PathVariable Long id) {
        complaintRepo.deleteById(id);
        return ResponseEntity.ok("Deleted");
    }

   
    @GetMapping("/getcomplain")
    public Complaint getComplaint(@RequestParam String id) {
        return c_service.findByComplaintId(id);
    }

    
}
