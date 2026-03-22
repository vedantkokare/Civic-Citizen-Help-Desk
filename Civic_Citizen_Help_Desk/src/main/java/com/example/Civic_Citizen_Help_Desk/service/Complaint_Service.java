package com.example.Civic_Citizen_Help_Desk.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Civic_Citizen_Help_Desk.entity.Complaint;
import com.example.Civic_Citizen_Help_Desk.repository.ComplaintRepository;

import jakarta.transaction.Transactional;

@Service
public class Complaint_Service {

    @Autowired
     ComplaintRepository complaintRepo;

    public Complaint Complaint_Save(Complaint complaint) {
    	
        return complaintRepo.save(complaint);
    }

    public List<Complaint> getdata() {
    	
        return complaintRepo.findAll();
    }

	
	  public long countAll() {
	  
	  return complaintRepo.count(); }
	 

    public long countByStatus(String status) {
    	
        try {
            return complaintRepo.countByStatus(status);
            
        } catch (UnsupportedOperationException e) {

        	return complaintRepo.findAll().stream()
                    .filter(c -> status != null && status.equals(c.getStatus()))
                    .count();
        }
        }
    
    
    public Complaint findByComplaintId(String complaintId) {
        return complaintRepo.findByComplaintId(complaintId)
                         .orElse(null);
    }
    
    

    @Transactional
    public boolean deleteByComplaintId(String complaintId) {

        Optional<Complaint> complaint =
                complaintRepo.findByComplaintId(complaintId);

        if (complaint.isEmpty()) {
            return false;
        }

        complaintRepo.delete(complaint.get());
        return true;
    }


       
    
}
