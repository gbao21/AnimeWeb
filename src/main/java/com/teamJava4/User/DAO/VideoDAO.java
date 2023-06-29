package com.teamJava4.User.DAO;

import java.util.List;

public interface VideoDAO <E, K>{
	List<E> findAll();
	List<E> findByCategory(E entity);
	List<E> findAllVideosByTypes(E entity); // Find all movie for all the series
	List<E> findAllVideoByMovies(E entity); // Find all video for one series
	List<E> findTopVideoByView();
	Boolean create(E entity);
	Boolean update(E entity);
}
