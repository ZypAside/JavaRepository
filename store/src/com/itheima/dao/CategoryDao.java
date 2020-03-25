package com.itheima.dao;

import java.sql.SQLException;
import java.util.List;

import com.itheima.domain.Category;

public interface CategoryDao {

	List<Category> findAll() throws Exception;

	void save(Category c) throws Exception;

	void update(Category c) throws SQLException;

	void delete(String cid) throws SQLException;

}
