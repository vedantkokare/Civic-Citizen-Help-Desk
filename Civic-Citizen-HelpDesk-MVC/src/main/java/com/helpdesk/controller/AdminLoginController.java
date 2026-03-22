package com.helpdesk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.helpdesk.service_implementation.Service_Implementation;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminLoginController {

    @Autowired
    private Service_Implementation service;

    //  ADMIN LOGIN PAGE 
    @GetMapping("/adminLogin")
    public String adminLoginPage() {
        return "AdminLogin";
    }

    //  ADMIN LOGIN SUBMIT 
    @PostMapping("/adminLogin")
    public String adminLoginSubmit(
            @RequestParam String adminId,
            @RequestParam String adminPassword,
            @RequestParam String captchaEntered,
            @RequestParam String captchaGenerated,
            HttpSession session,
            Model model) {

        // Captcha validation
        if (!captchaEntered.equals(captchaGenerated)) {
            model.addAttribute("error", "Invalid Captcha");
            return "AdminLogin";
        }

        // Service call (Boot)
        boolean success = service.adminLogin(adminId, adminPassword);

        if (!success) {
            model.addAttribute("error", "Invalid Admin Credentials");
            return "AdminLogin";
        }

       
        session.setAttribute("adminId", adminId);

        // Redirect ONLY to main admin dashboard controller
        return "redirect:/adminComplaintDashboard";
    }

    //  LOGOUT 
    @GetMapping("/adminLogout")
    public String adminLogout(HttpSession session) {
        session.invalidate();
        return "redirect:/adminLogin";
    }
}
