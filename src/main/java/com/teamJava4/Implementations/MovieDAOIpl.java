package com.teamJava4.Implementations;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.TypedQuery;

import com.teamJava4.Entity.Categories;
import com.teamJava4.Entity.Movie;
import com.teamJava4.Entity.Video;
import com.teamJava4.User.DAO.MovieDAO;
import com.teamJava4.User.DAO.SystemDAO;

public class MovieDAOIpl extends SystemDAO<Movie> implements MovieDAO<Movie, Long>{

	@Override
	public List<Movie> findAll() {
		return super.findAll(Movie.class);
	}

	@Override
	public List<Movie> findByCategory(Movie movie) {
		String jpql = "select o from Movie o where o.category.category_id=?0";
		return super.findMany(Movie.class, jpql, movie.getCategory().getCategory_id());
	}
	
	@Override
	public List<Movie> findByIsMovie() {
		String jpql = "select o from Movie o where o.is_movie=true";
		return super.findMany(Movie.class, jpql);
	}
	
	@Override
	public List<Movie> findByMovie() {
		try {
			String jpql = "select new Report(o.name_movie, count(o), o.Movie_img)"
					+ " from Movie o group by o.name_movie";
			TypedQuery<Movie> query = ENTITY_MANAGER.createQuery(jpql, Movie.class);
			return query.getResultList();
		} catch (Exception e) {
			return null;
		}
	}
	
	@Override
	public Boolean create(Movie entity) {
		entity.setIs_movie(true);
		entity.setCreateBy(new Timestamp(System.currentTimeMillis()));
		return super.create(entity);
	}
	
	@Override
	public Boolean update(Movie entity) {
		return super.update(entity);
	}
	
	public static void main(String[] args) {
		
	}

	
}
