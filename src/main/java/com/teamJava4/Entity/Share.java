package com.teamJava4.Entity;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "shareVideo")
public class Share {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long hareVideo_id;
	private String email_reciver;
	private Timestamp share_date;

	public Share() {
		super();
	}

	public Share(Long hareVideo_id, String email_reciver, Timestamp share_date) {
		super();
		this.hareVideo_id = hareVideo_id;
		this.email_reciver = email_reciver;
		this.share_date = share_date;
	}

	public Long getHareVideo_id() {
		return hareVideo_id;
	}

	public void setHareVideo_id(Long hareVideo_id) {
		this.hareVideo_id = hareVideo_id;
	}

	public String getEmail_reciver() {
		return email_reciver;
	}

	public void setEmail_reciver(String email_reciver) {
		this.email_reciver = email_reciver;
	}

	public Timestamp getShare_date() {
		return share_date;
	}

	public void setShare_date(Timestamp share_date) {
		this.share_date = share_date;
	}

	@Override
	public String toString() {
		return "Share [hareVideo_id=" + hareVideo_id + ", email_reciver=" + email_reciver + ", share_date=" + share_date
				+ "]";
	}

}
