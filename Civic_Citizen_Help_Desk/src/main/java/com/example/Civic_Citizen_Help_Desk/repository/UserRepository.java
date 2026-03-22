package com.example.Civic_Citizen_Help_Desk.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.Civic_Citizen_Help_Desk.entity.Civic_HelpDeskEntity;

public interface UserRepository extends JpaRepository<Civic_HelpDeskEntity, Long> {
    boolean existsByEmail(String email);
    boolean existsByMobile(String mobile);
    boolean existsByAadhar(String aadhar);
}
