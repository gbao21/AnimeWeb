package com.teamJava4.Entity;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="Comments")
public class Comments implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long comment_id;
	private String content;
	private Timestamp created_at;
	private Timestamp update_by;
	private Boolean isActive;
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "video_id", referencedColumnName = "video_id")
	@JsonIgnoreProperties(value = { "applications", "hibernateLazyInitializer" })
	private Video video;
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "customer_id", referencedColumnName = "customer_id")
	@JsonIgnoreProperties(value = { "applications", "hibernateLazyInitializer" })
	private User user;
	
	
	public Comments() {
		super();
	}

	public Comments(Long comment_id, String content, Timestamp created_at, Timestamp update_by, Boolean isActive,
			Video video, User user) {
		super();
		this.comment_id = comment_id;
		this.content = content;
		this.created_at = created_at;
		this.update_by = update_by;
		this.isActive = isActive;
		this.video = video;
		this.user = user;
	}
	
	public Long getComment_id() {
		return comment_id;
	}
	public void setComment_id(Long comment_id) {
		this.comment_id = comment_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}
	public Timestamp getUpdate_by() {
		return update_by;
	}
	public void setUpdate_by(Timestamp update_by) {
		this.update_by = update_by;
	}
	public Boolean getIsActive() {
		return isActive;
	}
	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public Video getVideo() {
		return video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Comments [comment_id=" + comment_id + ", content=" + content + ", created_at=" + created_at
				+ ", update_by=" + update_by + ", isActive=" + isActive + ", video=" + video + ", user=" + user + "]";
	}
	
	
	
	

}
