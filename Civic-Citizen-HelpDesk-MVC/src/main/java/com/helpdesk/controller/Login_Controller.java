package com.helpdesk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.helpdesk.entity.Civic_HelpDeskEntity;
import com.helpdesk.service_implementation.Service_Implementation;

import jakarta.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class Login_Controller {

    @Autowired
    private Service_Implementation serviceimplementation;

    //  EMAIL CHECK 
    @PostMapping("/checkEmail")
    @ResponseBody
    public Map<String, Boolean> checkEmail(@RequestParam String email) {
        return Map.of("exists", serviceimplementation.emailValidator(email));
    }

    // MOBILE CHECK 
    @PostMapping("/checkMobile")
    @ResponseBody
    public Map<String, Boolean> checkMobile(@RequestParam String mobile) {
        return Map.of("exists", serviceimplementation.mobileValidator(mobile));
    }

    //  AADHAR CHECK 
    @PostMapping("/checkAadhar")
    @ResponseBody
    public Map<String, Boolean> checkAadhar(@RequestParam String aadhar) {
        return Map.of("exists", serviceimplementation.aadharValidator(aadhar));
    }

    //  REGISTER 
    @PostMapping("/register")
    public String newRegister(
            @ModelAttribute Civic_HelpDeskEntity register_entity,
            HttpSession session,
            Model model) {

        Boolean isOtpVerified = (Boolean) session.getAttribute("isOtpVerified");
        if (isOtpVerified == null || !isOtpVerified) {
            model.addAttribute("error", "Please verify your email with OTP first.");
            return "Register";
        }

        String fullname = register_entity.getFirstname() + " " +
                (register_entity.getMiddlename() != null
                        ? register_entity.getMiddlename() + " "
                        : "") +
                register_entity.getLastname();

        register_entity.setFullname(fullname.trim());

        serviceimplementation.register_user(register_entity);

        session.invalidate(); // clean OTP session

        return "redirect:/login_page?success=registered";
    }

    //  LOGIN 
    @PostMapping("/login")
    public String loginUser(
            @RequestParam String username,
            @RequestParam String password,
            @RequestParam String captchaEntered,
            @RequestParam String captchaGenerated,
            Model model,
            HttpSession session) {

        if (!captchaEntered.equals(captchaGenerated)) {
            model.addAttribute("error", "Invalid Captcha. Please try again.");
            return "Login";
        }

        Civic_HelpDeskEntity entity =
                new Civic_HelpDeskEntity(username, password);

        boolean isValid = serviceimplementation.login(entity);

        if (!isValid) {
            model.addAttribute("error", "Invalid username or password.");
            return "Login";
        }

        session.setAttribute("username", username);
        return "redirect:/dashboard";
    }

    //  LOGOUT
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login_page";
    }
}
