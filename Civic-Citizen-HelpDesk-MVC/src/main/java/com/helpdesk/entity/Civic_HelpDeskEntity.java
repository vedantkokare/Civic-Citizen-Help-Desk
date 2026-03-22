package com.helpdesk.entity;

public class Civic_HelpDeskEntity {
	
	private Long id;
	
	private String firstname;
	private String middlename;
	private String lastname;
	private String fullname;
	
	private String state;
	private String district;
	private String taluka;
	private String village;
	private String pincode;
	
	private String email;
	private String emailotp;
	
	private String mobile;
	private String aadhar;
	
	private String password;
	private String confirmpassword;
	
	
	public Civic_HelpDeskEntity() {
		super();
	}

	public Civic_HelpDeskEntity(Long id) {
		super();
		this.id = id;
	}
	
	public Civic_HelpDeskEntity(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}

	public Civic_HelpDeskEntity(Long id, String firstname, String middlename, String lastname, String fullname, String state,
			String district, String taluka, String village, String pincode, String email, String emailotp,
			String mobile, String aadhar, String password, String confirmpassword) {
		super();
		this.id = id;
		this.firstname = firstname;
		this.middlename = middlename;
		this.lastname = lastname;
		this.fullname = fullname;
		this.state = state;
		this.district = district;
		this.taluka = taluka;
		this.village = village;
		this.pincode = pincode;
		this.email = email;
		this.emailotp = emailotp;
		this.mobile = mobile;
		this.aadhar = aadhar;
		this.password = password;
		this.confirmpassword = confirmpassword;
	}

	public Civic_HelpDeskEntity(String firstname, String middlename, String lastname, String fullname, String state,
			String district, String taluka, String village, String pincode, String email, String emailotp,
			String mobile, String aadhar, String password, String confirmpassword) {
		super();
		this.firstname = firstname;
		this.middlename = middlename;
		this.lastname = lastname;
		this.fullname = fullname;
		this.state = state;
		this.district = district;
		this.taluka = taluka;
		this.village = village;
		this.pincode = pincode;
		this.email = email;
		this.emailotp = emailotp;
		this.mobile = mobile;
		this.aadhar = aadhar;
		this.password = password;
		this.confirmpassword = confirmpassword;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getMiddlename() {
		return middlename;
	}
	public void setMiddlename(String middlename) {
		this.middlename = middlename;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
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
	public String getEmailotp() {
		return emailotp;
	}
	public void setEmailotp(String emailotp) {
		this.emailotp = emailotp;
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
	public String getConfirmpassword() {
		return confirmpassword;
	}
	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}
}
