package com.example.Civic_Citizen_Help_Desk.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.Civic_Citizen_Help_Desk.entity.Civic_HelpDeskEntity;

public interface Civic_Citizen_HelpDesk_Repository extends JpaRepository<Civic_HelpDeskEntity, Integer> {

    @Query("SELECT COUNT(c) FROM Civic_HelpDeskEntity c WHERE c.email = :email AND c.password = :password")
    long countByEmailAndPassword(@Param("email") String email, @Param("password") String password);

    @Query("SELECT COUNT(c) FROM Civic_HelpDeskEntity c WHERE c.email = :email")
	long countOfEmail(@Param("email") String email);

    @Query("SELECT COUNT(c) FROM Civic_HelpDeskEntity c WHERE c.mobile = :mobile")
	long countOfMobile(@Param("mobile") String mobile);

    @Query("SELECT COUNT(c) FROM Civic_HelpDeskEntity c WHERE c.aadhar = :aadhar")
	long countOfAadhar(@Param("aadhar") String aadhar);

    @Query("SELECT c.fullname FROM Civic_HelpDeskEntity c WHERE c.email = :email")
	String GetUserByEmail(@Param("email") String email);

}
