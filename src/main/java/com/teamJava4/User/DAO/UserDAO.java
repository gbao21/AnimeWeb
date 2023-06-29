package com.teamJava4.User.DAO;

import java.util.List;

public interface UserDAO<E ,K>  {
	 E findById(K id);
	 List<E> findAll();	 
	 E login(E entity);
	 E findByEmail(E entity);
	 Boolean update(E entity);
	 
}

