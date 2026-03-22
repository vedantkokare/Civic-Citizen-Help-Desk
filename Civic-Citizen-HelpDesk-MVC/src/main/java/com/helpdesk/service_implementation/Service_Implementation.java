package com.helpdesk.service_implementation;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.helpdesk.entity.Civic_HelpDeskEntity;
import com.helpdesk.entity.Complaint;
import com.helpdesk.entity.Taluka;
import com.helpdesk.entity.village;

@Service
public class Service_Implementation {

    @Autowired
    private RestTemplate restTemplate;

    // ===== BASE URLs =====
    private static final String ROOT = "http://localhost:8282";
    private static final String API  = "http://localhost:8282/api";

    // ================= VALIDATORS (ROOT) =================

    public Boolean emailValidator(String email) {
        String url = ROOT + "/emailValidator";
        System.out.println("Calling: " + url);
        return restTemplate.postForObject(url, email, Boolean.class);
    }

    public Boolean mobileValidator(String mobile) {
        String url = ROOT + "/mobileValidator";
        System.out.println("Calling: " + url);
        return restTemplate.postForObject(url, mobile, Boolean.class);
    }

    public Boolean aadharValidator(String aadhar) {
        String url = ROOT + "/aadharValidator";
        System.out.println("Calling: " + url);
        return restTemplate.postForObject(url, aadhar, Boolean.class);
    }

    // ================= USER LOGIN (ROOT) =================

    public boolean login(Civic_HelpDeskEntity entity) {

        String url = ROOT + "/login";
        System.out.println("Calling LOGIN: " + url);

        Map<String,String> body = new HashMap<>();
        body.put("email", entity.getEmail());
        body.put("password", entity.getPassword());

        Boolean response = restTemplate.postForObject(url, body, Boolean.class);
        return response != null && response;
    }

    // ================= REGISTER (ROOT — TEXT RESPONSE FIXED) =================

    public String register_user(Civic_HelpDeskEntity user) {

        String url = ROOT + "/register";
        System.out.println("Calling REGISTER: " + url);

        return restTemplate.postForObject(url, user, String.class);
    }


    // ================= ADMIN LOGIN (ROOT) =================

    public boolean adminLogin(String adminId,String adminPassword) {

        String url = ROOT + "/admin/login";
        System.out.println("Calling ADMIN LOGIN: " + url);

        Map<String,String> body = new HashMap<>();
        body.put("adminId", adminId);
        body.put("adminPassword", adminPassword);

        Boolean response = restTemplate.postForObject(url, body, Boolean.class);
        return response != null && response;
    }

    // ================= COMPLAINT (API) =================

    public Complaint sendComplaintToBoot(Complaint complaint) {

        String url = ROOT + "/complaintsData";
        System.out.println("Calling: " + url);

        return restTemplate.postForObject(url, complaint, Complaint.class);
    }

    public List<Complaint> getComplaintData() {

        String url = ROOT + "/getcomplaintdata";
        System.out.println("Calling: " + url);

        ResponseEntity<Complaint[]> response =
                restTemplate.getForEntity(url, Complaint[].class);

        return response.getBody()!=null ?
                Arrays.asList(response.getBody()) :
                Collections.emptyList();
    }

    public Complaint getComplaintById(String id) {

        String url = ROOT + "/getcomplain?id=" + id;
        System.out.println("Calling: " + url);

        return restTemplate.getForObject(url, Complaint.class);
    }

    public void deleteComplaint(Long id) {

        String url = ROOT + "/admincomplaint/" + id;
        System.out.println("Calling DELETE: " + url);

        restTemplate.exchange(url, HttpMethod.DELETE, null, String.class);
    }

    // ================= LOCATION (API) =================

    public List<Taluka> findAll() {

        String url = API + "/getTaluka";
        System.out.println("Calling: " + url);

        ResponseEntity<Taluka[]> response =
                restTemplate.getForEntity(url, Taluka[].class);

        return response.getBody()!=null ?
                Arrays.asList(response.getBody()) :
                List.of();
    }

    public List<village> findByTalukaId(Long id) {

        String url = API + "/getVillageByTaluka/{id}";
        System.out.println("Calling: " + url);

        ResponseEntity<village[]> response =
                restTemplate.getForEntity(url, village[].class, id);

        return response.getBody()!=null ?
                Arrays.asList(response.getBody()) :
                List.of();
    }
}
