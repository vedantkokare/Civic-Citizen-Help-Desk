package com.helpdesk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helpdesk.entity.Complaint;
import com.helpdesk.service_implementation.Service_Implementation;

@Service
public class ComplaintService {


	@Autowired
	Service_Implementation  service_implementation;

  
	public Complaint sendComplaintToBoot(Complaint complaint) {
		
		return service_implementation.sendComplaintToBoot(complaint);
		
	}

	  public List<Complaint> getComplaintData() {
	        return service_implementation.getComplaintData();
	    }
	
	   public Complaint getComplaintById(String complaintId) {
	        return service_implementation.getComplaintById(complaintId);
	    }
	   
	  

		public void deleteComplaint(Long complaintId) {
		    service_implementation.deleteComplaint(complaintId);
		}

	
	
}
