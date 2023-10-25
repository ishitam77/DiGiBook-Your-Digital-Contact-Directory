package com.entity;

public class Contact {
	private int id;
	private String name;
	private String email;
	private String address;
	private String phone;
	private String about;
	private int userId;
	public Contact() {
		super();
	}
	public Contact(String name, String email, String address, String phone,String about, int userId) {
		super();
		this.name = name;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.about = about;
		this.userId = userId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	

}
