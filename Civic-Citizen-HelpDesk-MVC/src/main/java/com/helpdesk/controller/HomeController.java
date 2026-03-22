package com.helpdesk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.helpdesk.entity.Complaint;
import com.helpdesk.service.ComplaintService;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String home() {
        return "Home";
    }

    @RequestMapping("/home_page")
    public String homePage() {
        return "Home";
    }

    @RequestMapping("/register_page")
    public String showRegisterPage() {
        return "Register";
    }

    @RequestMapping("/login_page")
    public String loginPage() {
        return "Login";
    }
    
    @RequestMapping("/admin_login_page")
    public String admin_login() {
        return "AdminLogin";
    }
    
    @RequestMapping("/admindashboard")
    public String  admindashboard() {
    	return "AdminDashboard";
    }

    @RequestMapping("/complaint_page")
    public String complaint() {
        return "FileComplaint";
    }

    @RequestMapping("/dashboard")
    public String dashboard() {
        return "Dashboard";
    }

    @RequestMapping("/complaint_history")
    public String complaint_history() {
        return "ComplaintHistory";
    }
    
  
    
    

    @Autowired
    ComplaintService complaintService;

    // =========================== AUTO-FILL EMAIL PAGE ============================
    @RequestMapping("/mail")
    public String mail(@RequestParam(required = false) String complaintId, Model model) {

        if (complaintId != null) {

            Complaint comp = complaintService.getComplaintById(complaintId);

            if (comp != null) {

                String department = comp.getCategory(); // Department = Category
                String deptEmail = getDepartmentEmail(department);

                model.addAttribute("toEmail", deptEmail);
                model.addAttribute("subject", "Complaint regarding " + department);

                model.addAttribute("message",
                        "Dear " + department + " Department,\n\n"
                        + "A new complaint has been registered by a citizen on the Civic Helpdesk Portal.\n\n"
                        + "Complaint Details:\n"
                        + comp.getDescription() + "\n\n"
                        + "⚠ IMPORTANT NOTICE:\n"
                        + "If timely action is not taken by your department, this complaint will automatically\n"
                        + "be escalated to higher authorities for further investigation.\n\n"
                        + "Regards,\n"
                        + "Civic Citizen Helpdesk System");

                // Attach image to JSP
                model.addAttribute("imageBase64", comp.getImageBase64());
            }
        }

        return "Email";
    }

    // ====================== DEPARTMENT → EMAIL MAPPING ======================
    private String getDepartmentEmail(String department) {

        if (department == null) return "admin@gov.in";

        switch (department.toLowerCase().trim()) {

            case "road":
                return "road.infrastructure@gov.in";

            case "water":
                return "watersupply@gov.in";

            case "electricity":
                return "electricitydept@gov.in";

            case "waste":
                return "wastemanagement@gov.in";

            case "sanitation":
                return "sanitationdept@gov.in";

            case "other":
                return "admin@gov.in";

            default:
                return "admin@gov.in";
        }
    }


}
