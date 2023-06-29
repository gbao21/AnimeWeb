package com.teamJava4.Implementations;

import java.sql.Timestamp;
import java.util.List;

import com.teamJava4.Entity.History;
import com.teamJava4.User.DAO.HistoryDAO;
import com.teamJava4.User.DAO.SystemDAO;

public class HistoryDAOImpl extends SystemDAO<History>   implements HistoryDAO{

	@Override
	public List<History> findAll() {
		return super.findAll(History.class);
	}

	@Override
	public Boolean create(History history) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
