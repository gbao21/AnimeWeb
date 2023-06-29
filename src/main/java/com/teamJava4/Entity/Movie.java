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
@Table(name = "Movie")
public class Movie implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long movie_id;
	private Boolean is_movie;
	private String name_movie;
	private String Movie_img;
	private String movie_desc;
	private Timestamp createBy;
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "category_id", referencedColumnName = "category_id")
	@JsonIgnoreProperties(value = { "applications", "hibernateLazyInitializer" })
	private Categories category;

	public Movie() {
		super();
	}

	
	





	public Movie(Long movie_id, Boolean is_movie, String name_movie, String movie_img, String movie_desc, Timestamp createBy,
			Categories category) {
		super();
		this.movie_id = movie_id;
		this.is_movie = is_movie;
		this.name_movie = name_movie;
		this.Movie_img = movie_img;
		this.movie_desc = movie_desc;
		this.createBy = createBy;
		this.category = category;
	}








	public Long getMovie_id() {
		return movie_id;
	}

	public void setMovie_id(Long movie_id) {
		this.movie_id = movie_id;
	}

	public Boolean getIs_movie() {
		return is_movie;
	}

	public void setIs_movie(Boolean is_movie) {
		this.is_movie = is_movie;
	}

	public String getName_movie() {
		return name_movie;
	}

	public void setName_movie(String name_movie) {
		this.name_movie = name_movie;
	}

	public Categories getCategory() {
		return category;
	}

	public void setCategory(Categories category) {
		this.category = category;
	}

	
	public String getMovie_img() {
		return Movie_img;
	}

	public void setMovie_img(String movie_img) {
		Movie_img = movie_img;
	}




	public String getMovie_desc() {
		return movie_desc;
	}




	public void setMovie_desc(String movie_desc) {
		this.movie_desc = movie_desc;
	}








	public Timestamp getCreateBy() {
		return createBy;
	}








	public void setCreateBy(Timestamp createBy) {
		this.createBy = createBy;
	}








	@Override
	public String toString() {
		return "Movie [movie_id=" + movie_id + ", is_movie=" + is_movie + ", name_movie=" + name_movie + ", Movie_img="
				+ Movie_img + ", movie_desc=" + movie_desc + ", createBy=" + createBy + ", category=" + category + "]";
	}




	
	

	
}
