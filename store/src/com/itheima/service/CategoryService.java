package com.itheima.service;

import java.sql.SQLException;
import java.util.List;

import com.itheima.domain.Category;

public interface CategoryService {

	String findAll() throws Exception;

	String findAllFromRedis() throws Exception;

	List<Category> findList() throws Exception;

	void save(Category c) throws Exception;

	void update(Category c) throws SQLException;

	void delete(String cid) throws SQLException;

}
