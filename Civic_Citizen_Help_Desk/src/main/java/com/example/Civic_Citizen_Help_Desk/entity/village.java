package com.example.Civic_Citizen_Help_Desk.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class village {
	@Id
	private Long id;
	private String name;
	@Column(name = "taluka_id") // maps DB column taluka_id -> field talukaId
    private Long talukaId;	
	
	public village() {
		
	}


	public village(Long id, String name, Long talukaId) {
		super();
		this.id = id;
		this.name = name;
		this.talukaId = talukaId;
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public Long gettalukaId() {
		return talukaId;
	}


	public void settalukaId(Long talukaId) {
		this.talukaId = talukaId;
	}


	
	

}
