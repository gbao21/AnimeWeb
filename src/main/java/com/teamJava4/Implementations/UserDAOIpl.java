package com.teamJava4.Implementations;

import java.util.List;

import com.teamJava4.Entity.User;
import com.teamJava4.User.DAO.SystemDAO;
import com.teamJava4.User.DAO.UserDAO;

public class UserDAOIpl extends SystemDAO<User> implements UserDAO<User, Long> {

	@Override
	public User findById(Long id) {
		return super.findById(User.class, id);
	}

	@Override
	public List<User> findAll() {
		return super.findAll(User.class);
	}

	@Override
	public User login(User entity) {
		String jpql = "select distinct o from User o where o.email=?0 and o.passwords=?1";
		return super.findOne(User.class, jpql, entity.getEmail(), entity.getPasswords());
	}

	@Override
	public User findByEmail(User entity) {
		String jpql = "select distinct o from User o where o.email =?0";
		return super.findOne(User.class, jpql, entity.getEmail());				
	}

	
	@Override
	public Boolean update(User entity) {
		return true;
	}
	
}
