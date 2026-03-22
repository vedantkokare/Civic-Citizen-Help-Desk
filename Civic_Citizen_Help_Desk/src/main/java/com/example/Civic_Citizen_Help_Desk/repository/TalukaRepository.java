package com.example.Civic_Citizen_Help_Desk.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import com.example.Civic_Citizen_Help_Desk.entity.Taluka;

@Repository
public interface TalukaRepository extends JpaRepository<Taluka, Long> {

}
