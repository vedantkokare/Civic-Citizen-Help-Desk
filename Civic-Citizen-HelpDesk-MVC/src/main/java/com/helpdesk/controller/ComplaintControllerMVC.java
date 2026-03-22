package com.helpdesk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.helpdesk.entity.Complaint;
import com.helpdesk.service.ComplaintService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ComplaintControllerMVC {

    @Autowired
    private ComplaintService c_service;

   
    @PostMapping("/complaint")
    public String submitForm(@ModelAttribute Complaint complaint,
                             RedirectAttributes redirectAttrs) {
        try {
            Complaint saved = c_service.sendComplaintToBoot(complaint);
            return "redirect:/mail?complaintId=" + saved.getComplaintId();
        } catch (Exception e) {
            redirectAttrs.addFlashAttribute("error", "Failed to submit complaint");
            return "redirect:/complaint_history";
        }
    }

    
    @GetMapping("/getComplaintDetails")
    @ResponseBody
    public Complaint getComplaintDetails(@RequestParam String id) {
        System.out.println("DEBUG complaintId = " + id);
        Complaint complaint = c_service.getComplaintById(id);
        System.out.println("DEBUG complaint = " + complaint);
        return complaint;
    }


  
    @GetMapping("/complaint_history")
    public String showComplaintHistory(Model model) {

        List<Complaint> complaints = c_service.getComplaintData();

        model.addAttribute("complaints", complaints);
        model.addAttribute("totalComplaints", complaints.size());

        return "ComplaintHistory";
    }

   
    @GetMapping("/adminComplaintDashboard")
    public String showAdminDashboard(HttpSession session, Model model) {

        if (session.getAttribute("adminId") == null) {
            return "redirect:/adminLogin";
        }

        List<Complaint> complaints = c_service.getComplaintData();

        model.addAttribute("complaints", complaints);
        model.addAttribute("totalComplaints", complaints.size());

        long newC = complaints.stream()
                .filter(c -> "NEW".equalsIgnoreCase(c.getStatus()))
                .count();

        long inProgressC = complaints.stream()
                .filter(c -> "IN_PROGRESS".equalsIgnoreCase(c.getStatus()))
                .count();

        long resolvedC = complaints.stream()
                .filter(c -> "RESOLVED".equalsIgnoreCase(c.getStatus()))
                .count();

        model.addAttribute("pendingComplaints", newC + inProgressC);
        model.addAttribute("resolvedComplaints", resolvedC);

        return "AdminDashboard";
    }
    
   

    //  DELETE COMPLAINT 
    @PostMapping("/admincomplaint/delete")
    @ResponseBody
    public ResponseEntity<String> deleteComplaint(
            @RequestParam Long id,
            HttpSession session) {

        if (session.getAttribute("adminId") == null) {
            return ResponseEntity.status(401).body("Unauthorized");
        }

        c_service.deleteComplaint(id);
        return ResponseEntity.ok("Deleted");
    }


   
    
    @GetMapping("/viewComplaint")
    public String viewComplaint(
            @RequestParam String id,
            Model model,
            HttpSession session) {

        Complaint complaint = c_service.getComplaintById(id);

        model.addAttribute("complaint", complaint);
        return "ViewComplaint";   
    }
    
    


}
