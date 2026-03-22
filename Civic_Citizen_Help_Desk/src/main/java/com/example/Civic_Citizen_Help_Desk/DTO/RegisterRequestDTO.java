package com.example.Civic_Citizen_Help_Desk.DTO;

public class RegisterRequestDTO {
    private String firstname;
    private String middlename;
    private String lastname;
    private String state;
    private String district;
    private String taluka;
    private String village;
    private String pincode;
    private String email;
    private String mobile;
    private String aadhar;
    private String password;
    private String confirmpassword;
    private String emailotp;  

    public RegisterRequestDTO() {
    	
    }

	public RegisterRequestDTO(String firstname, String middlename, String lastname, String state, String district,
			String taluka, String village, String pincode, String email, String mobile, String aadhar, String password,
			String confirmpassword, String emailotp) {
		super();
		this.firstname = firstname;
		this.middlename = middlename;
		this.lastname = lastname;
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
		this.emailotp = emailotp;
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

	public String getConfirmpassword() {
		return confirmpassword;
	}

	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}

	public String getEmailotp() {
		return emailotp;
	}

	public void setEmailotp(String emailotp) {
		this.emailotp = emailotp;
	}
    
    
    // Getters & Setters
}
