package com.example.Civic_Citizen_Help_Desk.entity;


import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "complaints")

@Builder
public class Complaint {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;


    @Column(name = "complaint_id", unique = true, nullable = false)
    private String complaintId;

    private String username;

    @Column(name = "full_name", nullable = false)
    private String fullName;

    private String email;
    private String phone;
    @Column(columnDefinition = "TEXT")
    private String address;

    private String category;
    private String subject;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Column(name="location_text")
    private String locationText;
    private String ward;
    private String area;
    private String village;
    private String taluka;
    private String city;
    private String pincode;

    private Double latitude;
    private Double longitude;

    @Column(name="location_address", columnDefinition = "TEXT")
    private String locationAddress;

    private LocalDateTime locationTimestamp;

    @Column(name="image_path", length = 1000)
    private String imagePath;

    @Column(name="image_base64", columnDefinition = "LONGTEXT")
    private String imageBase64;

    @Column(name="files_json", columnDefinition = "LONGTEXT")
    private String filesJson;

    private String status;

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    
   public Complaint() {
	   
   }
   
   
    
    public Complaint(Long id, String complaintId, String username, String fullName, String email, String phone,
		String address, String category, String subject, String description, String locationText, String ward,
		String area, String village, String taluka, String city, String pincode, Double latitude, Double longitude,
		String locationAddress, LocalDateTime locationTimestamp, String imagePath, String imageBase64, String filesJson,
		String status, LocalDateTime createdAt, LocalDateTime updatedAt) {
	super();
	this.id = id;
	this.complaintId = complaintId;
	this.username = username;
	this.fullName = fullName;
	this.email = email;
	this.phone = phone;
	this.address = address;
	this.category = category;
	this.subject = subject;
	this.description = description;
	this.locationText = locationText;
	this.ward = ward;
	this.area = area;
	this.village = village;
	this.taluka = taluka;
	this.city = city;
	this.pincode = pincode;
	this.latitude = latitude;
	this.longitude = longitude;
	this.locationAddress = locationAddress;
	this.locationTimestamp = locationTimestamp;
	this.imagePath = imagePath;
	this.imageBase64 = imageBase64;
	this.filesJson = filesJson;
	this.status = status;
	this.createdAt = createdAt;
	this.updatedAt = updatedAt;
}


    
    

	public Complaint(Long id2, String complaintId2, String subject2, String category2, String ward2, String area2,
			String locationText2, String city2, String status2, Object object) {
		
	}



	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public String getComplaintId() {
		return complaintId;
	}



	public void setComplaintId(String complaintId) {
		this.complaintId = complaintId;
	}



	public String getUsername() {
		return username;
	}



	public void setUsername(String username) {
		this.username = username;
	}



	public String getFullName() {
		return fullName;
	}



	public void setFullName(String fullName) {
		this.fullName = fullName;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getCategory() {
		return category;
	}



	public void setCategory(String category) {
		this.category = category;
	}



	public String getSubject() {
		return subject;
	}



	public void setSubject(String subject) {
		this.subject = subject;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public String getLocationText() {
		return locationText;
	}



	public void setLocationText(String locationText) {
		this.locationText = locationText;
	}



	public String getWard() {
		return ward;
	}



	public void setWard(String ward) {
		this.ward = ward;
	}



	public String getArea() {
		return area;
	}



	public void setArea(String area) {
		this.area = area;
	}



	public String getVillage() {
		return village;
	}



	public void setVillage(String village) {
		this.village = village;
	}



	public String getTaluka() {
		return taluka;
	}



	public void setTaluka(String taluka) {
		this.taluka = taluka;
	}



	public String getCity() {
		return city;
	}



	public void setCity(String city) {
		this.city = city;
	}



	public String getPincode() {
		return pincode;
	}



	public void setPincode(String pincode) {
		this.pincode = pincode;
	}



	public Double getLatitude() {
		return latitude;
	}



	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}



	public Double getLongitude() {
		return longitude;
	}



	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}



	public String getLocationAddress() {
		return locationAddress;
	}



	public void setLocationAddress(String locationAddress) {
		this.locationAddress = locationAddress;
	}



	public LocalDateTime getLocationTimestamp() {
		return locationTimestamp;
	}



	public void setLocationTimestamp(LocalDateTime locationTimestamp) {
		this.locationTimestamp = locationTimestamp;
	}



	public String getImagePath() {
		return imagePath;
	}



	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}



	public String getImageBase64() {
		return imageBase64;
	}



	public void setImageBase64(String imageBase64) {
		this.imageBase64 = imageBase64;
	}



	public String getFilesJson() {
		return filesJson;
	}



	public void setFilesJson(String filesJson) {
		this.filesJson = filesJson;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public LocalDateTime getCreatedAt() {
		return createdAt;
	}



	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}



	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}



	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}



	@PrePersist
    public void prePersist() {
        createdAt = LocalDateTime.now();
        updatedAt = createdAt;
        if (complaintId == null || complaintId.isEmpty()) {
            complaintId = generateComplaintId();
        }
        if (status == null) status = "NEW";
    }

    @PreUpdate
    public void preUpdate() {
        updatedAt = LocalDateTime.now();
    }

    private static String generateComplaintId() {
        String date = java.time.LocalDate.now().toString().replace("-", "");
        String rand = java.util.UUID.randomUUID().toString().substring(0,6).toUpperCase();
        return "CMP-" + date + "-" + rand;
    }
}
