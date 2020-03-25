package com.itheima.dao;

import java.util.List;

import com.itheima.domain.CollectionItem;
import com.itheima.domain.PageBean;
import com.itheima.domain.Product;

public interface CollectionDao {

	int getTotalRecord(String uid) throws Exception;

	List<Product> findMyCollectionByPage(PageBean<Product> pb, String uid)throws Exception;

	CollectionItem findById(CollectionItem collectionItem)throws Exception;

	void addById(CollectionItem collectionItem)throws Exception;

	void delete(CollectionItem collectionItem) throws Exception;

}
