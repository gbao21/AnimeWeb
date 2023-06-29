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
@Table(name="History")

public class History  implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long history_id;
	private Timestamp watched_at;
	private Boolean isLike;
	
	private Timestamp likeDATE;
	
	
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "customer_id", referencedColumnName = "customer_id")
	@JsonIgnoreProperties(value = { "applications", "hibernateLazyInitializer" })
	private User user ;
	
	
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "video_id", referencedColumnName = "video_id")
	@JsonIgnoreProperties(value = { "applications", "hibernateLazyInitializer" })
	private Video video;



	public History() {
		super();
	}



	public History(Long history_id, Timestamp watched_at, Boolean isLike, Timestamp likeDATE, User user, Video video) {
		super();
		this.history_id = history_id;
		this.watched_at = watched_at;
		this.isLike = isLike;
		this.likeDATE = likeDATE;
		this.user = user;
		this.video = video;
	}



	public Long getHistory_id() {
		return history_id;
	}



	public void setHistory_id(Long history_id) {
		this.history_id = history_id;
	}



	public Timestamp getWatched_at() {
		return watched_at;
	}



	public void setWatched_at(Timestamp watched_at) {
		this.watched_at = watched_at;
	}



	public Boolean getIsLike() {
		return isLike;
	}



	public void setIsLike(Boolean isLike) {
		this.isLike = isLike;
	}



	public Timestamp getLikeDATE() {
		return likeDATE;
	}



	public void setLikeDATE(Timestamp likeDATE) {
		this.likeDATE = likeDATE;
	}



	public User getUser() {
		return user;
	}



	public void setUser(User user) {
		this.user = user;
	}



	public Video getVideo() {
		return video;
	}



	public void setVideo(Video video) {
		this.video = video;
	}


	@Override
	public String toString() {
		return "History [history_id=" + history_id + ", watched_at=" + watched_at + ", isLike=" + isLike + ", likeDATE="
				+ likeDATE + ", user=" + user + ", video=" + video + "]";
	}
	
	
	
}