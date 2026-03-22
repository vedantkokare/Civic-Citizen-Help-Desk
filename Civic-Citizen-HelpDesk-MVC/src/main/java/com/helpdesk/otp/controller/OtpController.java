//package com.helpdesk.otp.controller;
//
//import java.util.Random;
//import jakarta.servlet.http.HttpSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mail.SimpleMailMessage;
//import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.web.bind.annotation.*;
//@RestController
//@RequestMapping("/email") 
//public class OtpController {
//
//    @Autowired
//    private JavaMailSender mailSender;
//
//    @PostMapping("/sendotp")
//    public String sendOtp(@RequestParam String email, HttpSession session) {
//        int otp = new Random().nextInt(900000) + 100000;
//        session.setAttribute("emailOtp", otp);
//
//        try {
//            SimpleMailMessage message = new SimpleMailMessage();
//            message.setFrom("civiccitizenhelpdesk@gmail.com");
//            message.setTo(email);
//            message.setSubject("Civic Citizen HelpDesk - OTP Verification");
//
//            String text = String.format("""
//                Dear Citizen,
//
//                Your One-Time Password (OTP) for verification on the Civic Citizen HelpDesk portal is:
//
//                👉 [%d]
//
//                ⚠️ Please do not share this OTP with anyone.
//                This OTP is valid for 5 minutes.
//
//                Regards,
//                Civic Citizen HelpDesk Team
//                Government of India
//            """, otp);
//
//            message.setText(text);
//            mailSender.send(message);
//
//            
//            return "OTP sent successfully to your email: " + email;
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            return "❌ Failed to send OTP. Error: " + e.getMessage();
//        }
//    }
//
//    @PostMapping("/verifyotp")
//    public String verifyOtp(@RequestParam int otp, HttpSession session) {
//        Integer savedOtp = (Integer) session.getAttribute("emailOtp");
//
//        if (savedOtp != null && savedOtp == otp) {
//            session.removeAttribute("emailOtp");
//            session.setAttribute("isOtpVerified", true);
//            return "OTP Verified ✅";
//        }
//        return "Invalid OTP ❌";
//    }
//}
