package com.example.Civic_Citizen_Help_Desk.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.Civic_Citizen_Help_Desk.entity.Admin;

public interface AdminRepository extends JpaRepository<Admin, String> {

    boolean existsByAdminIdAndAdminPassword(String adminId, String adminPassword);
}
