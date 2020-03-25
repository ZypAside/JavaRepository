package com.itheima.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.itheima.dao.CollectionDao;
import com.itheima.domain.CollectionItem;
import com.itheima.domain.PageBean;
import com.itheima.domain.Product;
import com.itheima.utils.DataSourceUtils;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class CollectionDaoImpl implements CollectionDao {

	public int getTotalRecord(String uid) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select count(*) from collection where uid = ?";
		return ((Long)qr.query(sql, new ScalarHandler(), uid)).intValue();
	}

	@Override
	public List<Product> findMyCollectionByPage(PageBean<Product> pb, String uid) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		//查询所有收藏(基本信息)
		
		CollectionItem collectionItem=new CollectionItem();
		String sql=" select * from product where pid in(select pid from collection where uid=? )limit ?,?";

		List<Product> list = qr.query(sql, new BeanListHandler<>(Product.class), uid,pb.getStartIndex(),pb.getPageSize());
/*	for(Product product:list){
		
		collectionItem.getProduct().add(product);
		
	}*/
		
		
		
		
		return list;
	}

	public CollectionItem findById(CollectionItem collectionItem) throws Exception {
  QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
  String sql="select * from collection where uid=? and pid=?";
  CollectionItem cItem=qr.query(sql, new BeanHandler<>(CollectionItem.class),collectionItem.getUser().getUid(),collectionItem.getPid());
		return cItem;
	}

	public void addById(CollectionItem collectionItem) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="insert into collection values(?,?,?)";
		qr.update(sql, collectionItem.getCid(),collectionItem.getUser().getUid(),collectionItem.getPid());
	}

	@Override
	public void delete(CollectionItem collectionItem) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="delete from collection where uid=? and pid=?";
		qr.update(sql,collectionItem.getUser().getUid(),collectionItem.getPid());
	}
}
