package com.teamJava4.User.DAO;

import java.util.List;

public interface CategoryDAO<E , K> {
	List<E> findAllCategories();
}
