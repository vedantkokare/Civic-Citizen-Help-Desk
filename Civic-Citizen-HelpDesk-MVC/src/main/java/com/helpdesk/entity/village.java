package com.helpdesk.entity;

public class village {
	private Long id;
	private String name;
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
