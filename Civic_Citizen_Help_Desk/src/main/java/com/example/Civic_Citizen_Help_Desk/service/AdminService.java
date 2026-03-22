package com.example.Civic_Citizen_Help_Desk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Civic_Citizen_Help_Desk.entity.Admin;
import com.example.Civic_Citizen_Help_Desk.repository.AdminRepository;

@Service
public class AdminService {

    @Autowired
    private AdminRepository adminRepository;

    public boolean adminLogin(Admin admin) {
        return adminRepository.existsByAdminIdAndAdminPassword(
                admin.getAdminId(),
                admin.getAdminPassword()
        );
    }
}
