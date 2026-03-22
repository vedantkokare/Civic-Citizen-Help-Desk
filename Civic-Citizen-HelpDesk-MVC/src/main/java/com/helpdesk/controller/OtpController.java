package com.helpdesk.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.helpdesk.entity.Civic_HelpDeskEntity;

import jakarta.servlet.http.HttpSession;

@Controller
public class OtpController {

	    @Autowired
	    private JavaMailSender mailSender;

    @PostMapping("/sendotp")
    @ResponseBody
    public String sendOtp(@ModelAttribute Civic_HelpDeskEntity register_entity ,@RequestParam("email") String email, HttpSession session, Model model) {
        if (email == null || email.isEmpty()) {
            return "Email is required!";
        }	
        
        int otp = 100000 + new Random().nextInt(900000);

        session.setAttribute("otp", otp);
        session.setAttribute("otpEmail", email);
        session.setAttribute("isOtpVerified", false);

        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(email);
            message.setSubject("Your Civic Citizen HelpDesk OTP Code");
            message.setText("Dear User,\n\nYour OTP for registration is: " + otp +
                    "\n\nPlease do not share this code with anyone.\n\nThank you,\nCivic Citizen HelpDesk Team");

            mailSender.send(message);
            
            return "OTP sent successfully to your email!";
        } catch (Exception e) {
            e.printStackTrace();
            return "❌ Failed to send OTP. Please check your email address or SMTP configuration.";
        }
        
    }

    @PostMapping("/verifyotp")
    @ResponseBody
    public String verifyOtp(@RequestParam("otp") String enteredOtp, HttpSession session) {
        Object otpObj = session.getAttribute("otp");

        if (otpObj == null) {
            return "No OTP found. Please request a new one.";
        }

        String generatedOtp = otpObj.toString();
        if (enteredOtp.equals(generatedOtp)) {
            session.setAttribute("isOtpVerified", true);
            return "OTP verified successfully!";
        } else {
            return "Invalid OTP. Please try again.";
        }
    }
	
}
