package com.teamJava4.Entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Customer")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long customer_id;
	private String customer_name;
	private String email;
	private String passwords;
	private Boolean isAdmin;
	private Boolean isActive;
	public User() {
		super();
	}
	public User(Long customer_id, String customer_name, String email, String passwords, Boolean isAdmin,
			Boolean isActive) {
		super();
		this.customer_id = customer_id;
		this.customer_name = customer_name;
		this.email = email;
		this.passwords = passwords;
		this.isAdmin = isAdmin;
		this.isActive = isActive;
	}
	public Long getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(Long customer_id) {
		this.customer_id = customer_id;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPasswords() {
		return passwords;
	}
	public void setPasswords(String passwords) {
		this.passwords = passwords;
	}
	public Boolean getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(Boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
	public Boolean getIsActive() {
		return isActive;
	}
	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
	@Override
	public String toString() {
		return "User [customer_id=" + customer_id + ", customer_name=" + customer_name + ", email=" + email
				+ ", passwords=" + passwords + ", isAdmin=" + isAdmin + ", isActive=" + isActive + "]";
	}
	
	
	
}
