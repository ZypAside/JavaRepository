package com.itheima.service.impl;

import java.util.List;

import com.itheima.dao.CollectionDao;
import com.itheima.domain.CollectionItem;
import com.itheima.domain.PageBean;
import com.itheima.domain.Product;
import com.itheima.service.CollectionService;
import com.itheima.utils.BeanFactory;

public class CollectionServiceImpl implements CollectionService {
	/**
	 * 我的收藏
	 */
	public PageBean<Product> findMyCollectionByPage(int pageNumber, int pageSize, String uid) throws Exception {
		
			CollectionDao cd  = (CollectionDao) BeanFactory.getBean("CollectionDao");
			
			//1.创建pagebean
			PageBean<Product> pb = new PageBean<>(pageNumber, pageSize);
			
			//2.查询总条数  设置总条数 
			int totalRecord = cd.getTotalRecord(uid);
			pb.setTotalRecord(totalRecord);
			
			//3.查询当前页数据 设置当前页数据
			List<Product> data= cd.findMyCollectionByPage(pb,uid);
		
			pb.setData(data);
			return pb;
		}

	@Override
	public void addByPid(CollectionItem collectionItem) throws Exception {
		CollectionDao cd  = (CollectionDao) BeanFactory.getBean("CollectionDao");
	cd.addById(collectionItem);
	}

	@Override
	public void delete(CollectionItem collectionItem) throws Exception {
		CollectionDao cd  = (CollectionDao) BeanFactory.getBean("CollectionDao");
		cd.delete(collectionItem);
		}
	}


