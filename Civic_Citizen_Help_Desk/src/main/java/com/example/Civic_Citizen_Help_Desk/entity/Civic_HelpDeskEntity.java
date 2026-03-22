package com.example.Civic_Citizen_Help_Desk.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@JsonIgnoreProperties(ignoreUnknown = true)
@Entity
@Table(name = "citizen")
public class Civic_HelpDeskEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

   
    private String fullname;
    
    private String state;
    private String district;
    private String taluka;
    private String village;
    private String pincode;

    @Column(unique = true, nullable = false)
    private String email;

    @Column(unique = true, nullable = false)
    private String mobile;

    @Column(unique = true, nullable = false)
    private String aadhar;

    private String password;
    
    private String confirmpassword;


   public Civic_HelpDeskEntity(Long id, String fullname, String state, String district, String taluka,
		String village, String pincode, String email, String mobile, String aadhar, String password,String confirmpassword) {
	super();
	this.id = id;
	this.fullname = fullname;
	this.state = state;
	this.district = district;
	this.taluka = taluka;
	this.village = village;
	this.pincode = pincode;
	this.email = email;
	this.mobile = mobile;
	this.aadhar = aadhar;
	this.password = password;
	this.confirmpassword = confirmpassword;
   }

   public Civic_HelpDeskEntity() {
	super();
}

   public Civic_HelpDeskEntity(String email, String password) {
	super();
	this.email = email;
	this.password = password;
}
   

   public Long getId() {
	return id;
   }

   public void setId(Long id) {
	this.id = id;
   }

  
   public String getState() {
	return state;
   }

   public void setState(String state) {
	this.state = state;
   }

   public String getDistrict() {
	return district;
   }

   public void setDistrict(String district) {
	this.district = district;
   }

   public String getTaluka() {
	return taluka;
   }

   public void setTaluka(String taluka) {
	this.taluka = taluka;
   }

   public String getVillage() {
	return village;
   }

   public void setVillage(String village) {
	this.village = village;
   }

   public String getPincode() {
	return pincode;
   }

   public void setPincode(String pincode) {
	this.pincode = pincode;
   }

   public String getEmail() {
	return email;
   }

   public void setEmail(String email) {
	this.email = email;
   }

   public String getMobile() {
	return mobile;
   }

   public void setMobile(String mobile) {
	this.mobile = mobile;
   }

   public String getAadhar() {
	return aadhar;
   }

   public void setAadhar(String aadhar) {
	this.aadhar = aadhar;
   }

   public String getPassword() {
	return password;
   }

   public void setPassword(String password) {
	this.password = password;
   }

   public String getFullname() {
	return fullname;
   }

   public void setFullname(String fullname) {
	this.fullname = fullname;
   }

   public String getConfirmpassword() {
	return confirmpassword;
   }

   public void setConfirmpassword(String confirmpassword) {
	this.confirmpassword = confirmpassword;
   }
   
   
   
}
