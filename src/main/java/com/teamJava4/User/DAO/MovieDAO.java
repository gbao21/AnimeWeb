package com.teamJava4.User.DAO;

import java.util.List;

import com.teamJava4.Entity.Movie;

public interface MovieDAO <E, K>{
	List<E> findAll();
	List<E> findByCategory(E entity);
	List<E> findByMovie();
	List<E> findByIsMovie();
	Boolean create(E entity);
	Boolean update(E entity);
}
