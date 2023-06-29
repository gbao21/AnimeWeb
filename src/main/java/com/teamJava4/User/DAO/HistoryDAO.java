package com.teamJava4.User.DAO;

import java.util.List;

import com.teamJava4.Entity.History;

public interface HistoryDAO{
	List<History> findAll();
	Boolean create(History history);
}
