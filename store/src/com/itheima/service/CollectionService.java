package com.itheima.service;


import com.itheima.domain.CollectionItem;
import com.itheima.domain.PageBean;
import com.itheima.domain.Product;

public interface CollectionService {
	PageBean<Product> findMyCollectionByPage(int pageNumber, int pageSize, String uid)throws Exception;

	void addByPid(CollectionItem collectionItem)throws Exception;

	void delete(CollectionItem collectionItem) throws Exception;
}
