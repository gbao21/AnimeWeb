package com.teamJava4.Entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
@Entity
public class Report implements Serializable{
	@Id
	private String group;
	private Long episode;
	private String img;
	private Movie movie;
	
	public Report() {
		super();
	}

	public Report(String group, Long episode, String img, Movie movie) {
		super();
		this.group = group;
		this.episode = episode;
		this.img = img;
		this.movie = movie;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public Long getEpisode() {
		return episode;
	}

	public void setEpisode(Long episode) {
		this.episode = episode;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Movie getMovie() {
		return movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	@Override
	public String toString() {
		return "Report [group=" + group + ", episode=" + episode + ", img=" + img + ", movie=" + movie + "]";
	}


	
	
	
	
}
