package com.teamJava4.User.DAO;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.teamJava4.Entity.Categories;
import com.teamJava4.Entity.Movie;
import com.teamJava4.Entity.User;
import com.teamJava4.User.Utils.JpaUtils;

public abstract class SystemDAO<T extends Serializable> {
public static  EntityManager ENTITY_MANAGER = JpaUtils.getManagerFactory();
	
	
	@Override
	protected void finalize() throws Throwable {
		ENTITY_MANAGER.close();
		super.finalize();
	}
		
	public T findById(Class<T> clazz ,Long id) {
		return ENTITY_MANAGER.find(clazz, id);
	}
	public T findOne(Class<T> clazz ,  String jpql, Object... args) {
		TypedQuery<T> query;
		try {
			query = ENTITY_MANAGER.createQuery(jpql, clazz);
			for (int i = 0; i < args.length; i++) {
				query.setParameter(i, args[i]);
			}
			return query.getSingleResult();
		} catch (Exception e) {
			return null;
		}	
	}
	public List<T> findAll(Class<T> clazz) {
		String getClassName = clazz.getSimpleName();
		String jpql = "Select o from "+getClassName +" o";
		TypedQuery<T> query = ENTITY_MANAGER.createQuery(jpql, clazz);
		return query.getResultList();
	}
	
	public List<T> findMany(Class<T> clazz, String jpql, Object... args){
		TypedQuery<T> query;
		try {
			query = ENTITY_MANAGER.createQuery(jpql, clazz);
			for (int i = 0; i < args.length; i++) {
				query.setParameter(i, args[i]);
			}
			return query.getResultList();
		} catch (Exception e) {
			return null;
		}	
	}
	
	
	
	public Boolean create(T entity) {
		try {
			ENTITY_MANAGER.getTransaction().begin();
			ENTITY_MANAGER.persist(entity);
			ENTITY_MANAGER.getTransaction().commit();
			System.out.println("Create successfully");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			ENTITY_MANAGER.getTransaction().rollback();
			System.out.println("Create error");
			return false;
		}
	}
	public Boolean update(T entity) {
		try {
			ENTITY_MANAGER.getTransaction().begin();
			ENTITY_MANAGER.merge(entity);
			ENTITY_MANAGER.getTransaction().commit();
			System.out.println("Update successfully");
			return true;
		} catch (Exception e) {
			System.out.println("Update error");
			return false;
		}
	}
	
	public Boolean delete (T entity) {
		
		try {
			ENTITY_MANAGER.getTransaction().begin();
			ENTITY_MANAGER.remove(entity);
			ENTITY_MANAGER.getTransaction().commit();
			System.out.println("Remove successfully");
			return true;
		} catch (Exception e) {
			System.out.println("Remove error");
			return false;
		}
	}
	
	
}
