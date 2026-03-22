package com.helpdesk.controller;

import java.util.Base64;
import jakarta.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class EmailSenderController {

    @Autowired
    private JavaMailSender mailSender;

    @PostMapping("/sendEmail")
    public String sendEmail(
            @RequestParam String to,
            @RequestParam String subject,
            @RequestParam String message,
            @RequestParam(required = false) String base64Image,
            RedirectAttributes redirectAttrs) {

        try {
            MimeMessage mime = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mime, true); // multipart email

            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(message);

            // ---------------- ADD IMAGE ATTACHMENT ----------------
            if (base64Image != null && !base64Image.isEmpty()) {

                // FIX: Remove prefix "data:image/jpeg;base64,"
                if (base64Image.contains(",")) {
                    base64Image = base64Image.substring(base64Image.indexOf(",") + 1);
                }

                byte[] imageBytes = Base64.getDecoder().decode(base64Image);

                helper.addAttachment("complaint_image.jpg",
                        new ByteArrayResource(imageBytes));
            }

            // Send email
            mailSender.send(mime);

            // Add success message
            redirectAttrs.addFlashAttribute("success", "Email sent successfully!");

            // ✅ Redirect to complaint history page
            return "redirect:/complaint_history";

        } catch (Exception e) {
            e.printStackTrace();

            // Add error message
            redirectAttrs.addFlashAttribute("error", "Failed to send email!");

            // Redirect back to mail page only if error occurs
            return "redirect:/mail";
        }
    }
}
