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
@Table(name ="Video")
public class Video implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long video_id;
	private String video_title;
	private String video_url;
	private String descriptions;
	private Timestamp createBy;
	private Timestamp updateBy;
	private Long view_count;
	private Long view_share;
	private Boolean isActive;	
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "movie_id", referencedColumnName = "movie_id")
	@JsonIgnoreProperties(value = { "applications", "hibernateLazyInitializer" })
	private Movie movie;

	
	public Video() {
		super();
	}

	public Video(Long video_id, String video_title, String video_url, String descriptions, Timestamp createBy,
			Timestamp updateBy, Long view_count, Long view_share, Boolean isActive, Movie movie) {
		super();
		this.video_id = video_id;
		this.video_title = video_title;
		this.video_url = video_url;
		this.descriptions = descriptions;
		this.createBy = createBy;
		this.updateBy = updateBy;
		this.view_count = view_count;
		this.view_share = view_share;
		this.isActive = isActive;
		this.movie = movie;
	}

	public Long getVideo_id() {
		return video_id;
	}

	public void setVideo_id(Long video_id) {
		this.video_id = video_id;
	}

	public String getVideo_title() {
		return video_title;
	}

	public void setVideo_title(String video_title) {
		this.video_title = video_title;
	}

	public String getVideo_url() {
		return video_url;
	}

	public void setVideo_url(String video_url) {
		this.video_url = video_url;
	}

	public String getDescriptions() {
		return descriptions;
	}

	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
	}

	public Timestamp getCreateBy() {
		return createBy;
	}

	public void setCreateBy(Timestamp createBy) {
		this.createBy = createBy;
	}

	public Timestamp getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(Timestamp updateBy) {
		this.updateBy = updateBy;
	}

	public Long getView_count() {
		return view_count;
	}

	public void setView_count(Long view_count) {
		this.view_count = view_count;
	}

	public Long getView_share() {
		return view_share;
	}

	public void setView_share(Long view_share) {
		this.view_share = view_share;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public Movie getMovie() {
		return movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	@Override
	public String toString() {
		return "Video [video_id=" + video_id + ", video_title=" + video_title + ", video_url=" + video_url
				+ ", descriptions=" + descriptions + ", createBy=" + createBy + ", updateBy=" + updateBy
				+ ", view_count=" + view_count + ", view_share=" + view_share + ", isActive=" + isActive + ", movie="
				+ movie + "]";
	}
	
	
}
