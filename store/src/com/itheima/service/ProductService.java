package com.itheima.service;

import java.util.List;

import com.itheima.domain.PageBean;
import com.itheima.domain.Product;

public interface ProductService {

	PageBean<Product> findByBname(int pageNumber, int pageSize, String name) throws Exception;
	
	List<Product> findHot() throws Exception;

	List<Product> findNew() throws Exception;

	Product getById(String pid) throws Exception;

	PageBean<Product> findByPage(int pageNumber, int pageSize, String cid) throws Exception;

	List<Product> findAll() throws Exception;

	void save(Product p)throws Exception;

	void update(Product p) throws Exception;

	List<Product> findAllUp()throws Exception;

	List<Product> findAllDowm()throws Exception;

	void delete(String pid)throws Exception;

}
