package com.itheima.dao;

import java.util.List;

import com.itheima.domain.PageBean;
import com.itheima.domain.Product;

public interface ProductDao {

	List<Product> findHot() throws Exception;

	List<Product> findNew() throws Exception;

	Product getById(String pid) throws Exception;

	List<Product> findByPage(PageBean<Product> pb, String cid) throws Exception;
	
	List<Product> findByBname(PageBean<Product> pb, String name) throws Exception;

	int getTotalRecord(String cid) throws Exception;
	
	int getTotalRecordByBname(String name) throws Exception;

	List<Product> findAll() throws Exception;

	void save(Product p) throws Exception;

	void update(Product p)throws Exception;

	List<Product> findAllUp()throws Exception;

	List<Product> findAllDown()throws Exception;

	void delete(String pid)throws Exception;



}
