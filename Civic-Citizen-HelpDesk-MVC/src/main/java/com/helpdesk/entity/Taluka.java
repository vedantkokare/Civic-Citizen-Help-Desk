package com.helpdesk.entity;


public class Taluka {
	private Long id;
	private String name;
	private String dist_id;
	
	public Taluka() {
		
	}

	public Taluka(Long id, String name, String dist_id) {
		super();
		this.id = id;
		this.name = name;
		this.dist_id = dist_id;
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

	public String getDist_id() {
		return dist_id;
	}

	public void setDist_id(String dist_id) {
		this.dist_id = dist_id;
	}
}
