package com.example.Civic_Citizen_Help_Desk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.example.Civic_Citizen_Help_Desk.entity.Admin;
import com.example.Civic_Citizen_Help_Desk.service.AdminService;

@RestController
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @PostMapping("/login")
    public ResponseEntity<Boolean> adminLogin(@RequestBody Admin admin) {

        boolean valid = adminService.adminLogin(admin);
        return ResponseEntity.ok(valid);
    }
}
